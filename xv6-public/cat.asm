
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 e0 0b 00 00       	push   $0xbe0
  15:	56                   	push   %esi
<<<<<<< HEAD
  16:	e8 94 03 00 00       	call   3af <read>
=======
  16:	e8 7d 03 00 00       	call   398 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 e0 0b 00 00       	push   $0xbe0
  2d:	6a 01                	push   $0x1
<<<<<<< HEAD
  2f:	e8 83 03 00 00       	call   3b7 <write>
=======
  2f:	e8 6c 03 00 00       	call   3a0 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  3e:	68 9c 07 00 00       	push   $0x79c
  43:	6a 01                	push   $0x1
  45:	e8 a2 04 00 00       	call   4ec <printf>
      exit();
  4a:	e8 48 03 00 00       	call   397 <exit>
=======
  3e:	68 84 07 00 00       	push   $0x784
  43:	6a 01                	push   $0x1
  45:	e8 8b 04 00 00       	call   4d5 <printf>
      exit();
  4a:	e8 31 03 00 00       	call   380 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  5b:	68 ae 07 00 00       	push   $0x7ae
  60:	6a 01                	push   $0x1
  62:	e8 85 04 00 00       	call   4ec <printf>
    exit();
  67:	e8 2b 03 00 00       	call   397 <exit>
=======
  5b:	68 96 07 00 00       	push   $0x796
  60:	6a 01                	push   $0x1
  62:	e8 6e 04 00 00       	call   4d5 <printf>
    exit();
  67:	e8 14 03 00 00       	call   380 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
<<<<<<< HEAD
  a1:	e8 f1 02 00 00       	call   397 <exit>
=======
  a1:	e8 da 02 00 00       	call   380 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
<<<<<<< HEAD
  b2:	e8 08 03 00 00       	call   3bf <close>
=======
  b2:	e8 f1 02 00 00       	call   3a8 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
<<<<<<< HEAD
  cf:	e8 03 03 00 00       	call   3d7 <open>
=======
  cf:	e8 ec 02 00 00       	call   3c0 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
<<<<<<< HEAD
  e2:	68 bf 07 00 00       	push   $0x7bf
  e7:	6a 01                	push   $0x1
  e9:	e8 fe 03 00 00       	call   4ec <printf>
      exit();
  ee:	e8 a4 02 00 00       	call   397 <exit>
  }
  exit();
  f3:	e8 9f 02 00 00       	call   397 <exit>
=======
  e2:	68 a7 07 00 00       	push   $0x7a7
  e7:	6a 01                	push   $0x1
  e9:	e8 e7 03 00 00       	call   4d5 <printf>
      exit();
  ee:	e8 8d 02 00 00       	call   380 <exit>
  }
  exit();
  f3:	e8 88 02 00 00       	call   380 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000000f8 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  fe:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 100:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 103:	89 08                	mov    %ecx,(%eax)
  return old;
}
 105:	89 d0                	mov    %edx,%eax
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	53                   	push   %ebx
 10d:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 110:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 115:	e8 f8 05 00 00       	call   712 <malloc>
  if(n_stack == 0){
 11a:	83 c4 10             	add    $0x10,%esp
 11d:	85 c0                	test   %eax,%eax
 11f:	74 41                	je     162 <thread_create+0x59>
 121:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 123:	50                   	push   %eax
 124:	ff 75 10             	push   0x10(%ebp)
 127:	ff 75 0c             	push   0xc(%ebp)
 12a:	ff 75 08             	push   0x8(%ebp)
 12d:	e8 05 03 00 00       	call   437 <clone>
=======
 115:	e8 e1 05 00 00       	call   6fb <malloc>
  if(n_stack == 0){
 11a:	83 c4 10             	add    $0x10,%esp
 11d:	85 c0                	test   %eax,%eax
 11f:	74 57                	je     178 <thread_create+0x6f>
 121:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 123:	b8 00 00 00 00       	mov    $0x0,%eax
 128:	eb 03                	jmp    12d <thread_create+0x24>
 12a:	83 c0 01             	add    $0x1,%eax
 12d:	83 f8 3f             	cmp    $0x3f,%eax
 130:	7f 2f                	jg     161 <thread_create+0x58>
    if(threads[i].flag==0){
 132:	8d 14 40             	lea    (%eax,%eax,2),%edx
 135:	83 3c 95 e8 0d 00 00 	cmpl   $0x0,0xde8(,%edx,4)
 13c:	00 
 13d:	75 eb                	jne    12a <thread_create+0x21>
      threads[i].maddr = n_stack;
 13f:	8d 14 00             	lea    (%eax,%eax,1),%edx
 142:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 145:	c1 e3 02             	shl    $0x2,%ebx
 148:	89 8b e0 0d 00 00    	mov    %ecx,0xde0(%ebx)
      threads[i].pg1addr = n_stack;
 14e:	89 8b e4 0d 00 00    	mov    %ecx,0xde4(%ebx)
      threads[i].flag = 1;
 154:	01 c2                	add    %eax,%edx
 156:	c7 04 95 e8 0d 00 00 	movl   $0x1,0xde8(,%edx,4)
 15d:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 161:	51                   	push   %ecx
 162:	ff 75 10             	push   0x10(%ebp)
 165:	ff 75 0c             	push   0xc(%ebp)
 168:	ff 75 08             	push   0x8(%ebp)
 16b:	e8 b0 02 00 00       	call   420 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 132:	83 c4 10             	add    $0x10,%esp
 135:	ba 00 00 00 00       	mov    $0x0,%edx
 13a:	eb 03                	jmp    13f <thread_create+0x36>
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	83 fa 3f             	cmp    $0x3f,%edx
 142:	7f 19                	jg     15d <thread_create+0x54>
    if(threads[i]->flag==0){
 144:	8b 0c 95 e0 0d 00 00 	mov    0xde0(,%edx,4),%ecx
 14b:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 14f:	75 eb                	jne    13c <thread_create+0x33>
      threads[i]->maddr = n_stack;
 151:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 153:	8b 14 95 e0 0d 00 00 	mov    0xde0(,%edx,4),%edx
 15a:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 15d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 160:	c9                   	leave  
 161:	c3                   	ret    
    return -1;
 162:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 167:	eb f4                	jmp    15d <thread_create+0x54>

00000169 <thread_join>:
=======
 170:	83 c4 10             	add    $0x10,%esp
}
 173:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 176:	c9                   	leave  
 177:	c3                   	ret    
    return -1;
 178:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 17d:	eb f4                	jmp    173 <thread_create+0x6a>

0000017f <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	56                   	push   %esi
 16d:	53                   	push   %ebx
 16e:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 171:	8d 45 f4             	lea    -0xc(%ebp),%eax
 174:	50                   	push   %eax
 175:	e8 c5 02 00 00       	call   43f <join>
 17a:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	bb 00 00 00 00       	mov    $0x0,%ebx
 184:	eb 03                	jmp    189 <thread_join+0x20>
 186:	83 c3 01             	add    $0x1,%ebx
 189:	83 fb 3f             	cmp    $0x3f,%ebx
 18c:	7f 23                	jg     1b1 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 18e:	8b 04 9d e0 0d 00 00 	mov    0xde0(,%ebx,4),%eax
 195:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 199:	75 eb                	jne    186 <thread_join+0x1d>
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	39 50 04             	cmp    %edx,0x4(%eax)
 1a1:	75 e3                	jne    186 <thread_join+0x1d>
      free(stk_addr);
 1a3:	83 ec 0c             	sub    $0xc,%esp
 1a6:	52                   	push   %edx
 1a7:	e8 a6 04 00 00       	call   652 <free>
 1ac:	83 c4 10             	add    $0x10,%esp
 1af:	eb d5                	jmp    186 <thread_join+0x1d>
    }
  }
  return pid;
}
 1b1:	89 f0                	mov    %esi,%eax
 1b3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    

000001ba <lock_acquire>:

void lock_acquire(lock_t *lock){
 1ba:	55                   	push   %ebp
 1bb:	89 e5                	mov    %esp,%ebp
 1bd:	53                   	push   %ebx
 1be:	83 ec 04             	sub    $0x4,%esp
 1c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1c4:	83 ec 08             	sub    $0x8,%esp
 1c7:	6a 01                	push   $0x1
 1c9:	53                   	push   %ebx
 1ca:	e8 29 ff ff ff       	call   f8 <test_and_set>
 1cf:	83 c4 10             	add    $0x10,%esp
 1d2:	83 f8 01             	cmp    $0x1,%eax
 1d5:	74 ed                	je     1c4 <lock_acquire+0xa>
    ;
}
 1d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1da:	c9                   	leave  
 1db:	c3                   	ret    

000001dc <lock_release>:

void lock_release(lock_t *lock) {
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e8:	5d                   	pop    %ebp
 1e9:	c3                   	ret    

000001ea <lock_init>:

void lock_init(lock_t *lock) {
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1f6:	5d                   	pop    %ebp
 1f7:	c3                   	ret    

000001f8 <strcpy>:
=======
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	53                   	push   %ebx
 183:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 186:	8d 45 f4             	lea    -0xc(%ebp),%eax
 189:	50                   	push   %eax
 18a:	e8 99 02 00 00       	call   428 <join>
 18f:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 191:	83 c4 04             	add    $0x4,%esp
 194:	ff 75 f4             	push   -0xc(%ebp)
 197:	e8 9f 04 00 00       	call   63b <free>
  return pid;
}
 19c:	89 d8                	mov    %ebx,%eax
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	c9                   	leave  
 1a2:	c3                   	ret    

000001a3 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	53                   	push   %ebx
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1ad:	83 ec 08             	sub    $0x8,%esp
 1b0:	6a 01                	push   $0x1
 1b2:	53                   	push   %ebx
 1b3:	e8 40 ff ff ff       	call   f8 <test_and_set>
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	83 f8 01             	cmp    $0x1,%eax
 1be:	74 ed                	je     1ad <lock_acquire+0xa>
    ;
}
 1c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c3:	c9                   	leave  
 1c4:	c3                   	ret    

000001c5 <lock_release>:

void lock_release(lock_t *lock) {
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1d1:	5d                   	pop    %ebp
 1d2:	c3                   	ret    

000001d3 <lock_init>:

void lock_init(lock_t *lock) {
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
 1d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    

000001e1 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	8b 75 08             	mov    0x8(%ebp),%esi
 200:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 1e1:	55                   	push   %ebp
 1e2:	89 e5                	mov    %esp,%ebp
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	8b 75 08             	mov    0x8(%ebp),%esi
 1e9:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 203:	89 f0                	mov    %esi,%eax
 205:	89 d1                	mov    %edx,%ecx
 207:	83 c2 01             	add    $0x1,%edx
 20a:	89 c3                	mov    %eax,%ebx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	0f b6 09             	movzbl (%ecx),%ecx
 212:	88 0b                	mov    %cl,(%ebx)
 214:	84 c9                	test   %cl,%cl
 216:	75 ed                	jne    205 <strcpy+0xd>
    ;
  return os;
}
 218:	89 f0                	mov    %esi,%eax
 21a:	5b                   	pop    %ebx
 21b:	5e                   	pop    %esi
 21c:	5d                   	pop    %ebp
 21d:	c3                   	ret    

0000021e <strcmp>:
=======
 1ec:	89 f0                	mov    %esi,%eax
 1ee:	89 d1                	mov    %edx,%ecx
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	89 c3                	mov    %eax,%ebx
 1f5:	83 c0 01             	add    $0x1,%eax
 1f8:	0f b6 09             	movzbl (%ecx),%ecx
 1fb:	88 0b                	mov    %cl,(%ebx)
 1fd:	84 c9                	test   %cl,%cl
 1ff:	75 ed                	jne    1ee <strcpy+0xd>
    ;
  return os;
}
 201:	89 f0                	mov    %esi,%eax
 203:	5b                   	pop    %ebx
 204:	5e                   	pop    %esi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    

00000207 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
 221:	8b 4d 08             	mov    0x8(%ebp),%ecx
 224:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 227:	eb 06                	jmp    22f <strcmp+0x11>
    p++, q++;
 229:	83 c1 01             	add    $0x1,%ecx
 22c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 22f:	0f b6 01             	movzbl (%ecx),%eax
 232:	84 c0                	test   %al,%al
 234:	74 04                	je     23a <strcmp+0x1c>
 236:	3a 02                	cmp    (%edx),%al
 238:	74 ef                	je     229 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 23a:	0f b6 c0             	movzbl %al,%eax
 23d:	0f b6 12             	movzbl (%edx),%edx
 240:	29 d0                	sub    %edx,%eax
}
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    

00000244 <strlen>:
=======
 207:	55                   	push   %ebp
 208:	89 e5                	mov    %esp,%ebp
 20a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 20d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 210:	eb 06                	jmp    218 <strcmp+0x11>
    p++, q++;
 212:	83 c1 01             	add    $0x1,%ecx
 215:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 218:	0f b6 01             	movzbl (%ecx),%eax
 21b:	84 c0                	test   %al,%al
 21d:	74 04                	je     223 <strcmp+0x1c>
 21f:	3a 02                	cmp    (%edx),%al
 221:	74 ef                	je     212 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 223:	0f b6 c0             	movzbl %al,%eax
 226:	0f b6 12             	movzbl (%edx),%edx
 229:	29 d0                	sub    %edx,%eax
}
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    

0000022d <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 24a:	b8 00 00 00 00       	mov    $0x0,%eax
 24f:	eb 03                	jmp    254 <strlen+0x10>
 251:	83 c0 01             	add    $0x1,%eax
 254:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 258:	75 f7                	jne    251 <strlen+0xd>
    ;
  return n;
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    

0000025c <memset>:
=======
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
 230:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 233:	b8 00 00 00 00       	mov    $0x0,%eax
 238:	eb 03                	jmp    23d <strlen+0x10>
 23a:	83 c0 01             	add    $0x1,%eax
 23d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 241:	75 f7                	jne    23a <strlen+0xd>
    ;
  return n;
}
 243:	5d                   	pop    %ebp
 244:	c3                   	ret    

00000245 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	57                   	push   %edi
 260:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
 248:	57                   	push   %edi
 249:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 263:	89 d7                	mov    %edx,%edi
 265:	8b 4d 10             	mov    0x10(%ebp),%ecx
 268:	8b 45 0c             	mov    0xc(%ebp),%eax
 26b:	fc                   	cld    
 26c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 26e:	89 d0                	mov    %edx,%eax
 270:	8b 7d fc             	mov    -0x4(%ebp),%edi
 273:	c9                   	leave  
 274:	c3                   	ret    

00000275 <strchr>:
=======
 24c:	89 d7                	mov    %edx,%edi
 24e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 251:	8b 45 0c             	mov    0xc(%ebp),%eax
 254:	fc                   	cld    
 255:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 257:	89 d0                	mov    %edx,%eax
 259:	8b 7d fc             	mov    -0x4(%ebp),%edi
 25c:	c9                   	leave  
 25d:	c3                   	ret    

0000025e <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 275:	55                   	push   %ebp
 276:	89 e5                	mov    %esp,%ebp
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27f:	eb 03                	jmp    284 <strchr+0xf>
 281:	83 c0 01             	add    $0x1,%eax
 284:	0f b6 10             	movzbl (%eax),%edx
 287:	84 d2                	test   %dl,%dl
 289:	74 06                	je     291 <strchr+0x1c>
    if(*s == c)
 28b:	38 ca                	cmp    %cl,%dl
 28d:	75 f2                	jne    281 <strchr+0xc>
 28f:	eb 05                	jmp    296 <strchr+0x21>
      return (char*)s;
  return 0;
 291:	b8 00 00 00 00       	mov    $0x0,%eax
}
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    

00000298 <gets>:
=======
 25e:	55                   	push   %ebp
 25f:	89 e5                	mov    %esp,%ebp
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 268:	eb 03                	jmp    26d <strchr+0xf>
 26a:	83 c0 01             	add    $0x1,%eax
 26d:	0f b6 10             	movzbl (%eax),%edx
 270:	84 d2                	test   %dl,%dl
 272:	74 06                	je     27a <strchr+0x1c>
    if(*s == c)
 274:	38 ca                	cmp    %cl,%dl
 276:	75 f2                	jne    26a <strchr+0xc>
 278:	eb 05                	jmp    27f <strchr+0x21>
      return (char*)s;
  return 0;
 27a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    

00000281 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	57                   	push   %edi
 29c:	56                   	push   %esi
 29d:	53                   	push   %ebx
 29e:	83 ec 1c             	sub    $0x1c,%esp
 2a1:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 281:	55                   	push   %ebp
 282:	89 e5                	mov    %esp,%ebp
 284:	57                   	push   %edi
 285:	56                   	push   %esi
 286:	53                   	push   %ebx
 287:	83 ec 1c             	sub    $0x1c,%esp
 28a:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 2a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 2a9:	89 de                	mov    %ebx,%esi
 2ab:	83 c3 01             	add    $0x1,%ebx
 2ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b1:	7d 2e                	jge    2e1 <gets+0x49>
    cc = read(0, &c, 1);
 2b3:	83 ec 04             	sub    $0x4,%esp
 2b6:	6a 01                	push   $0x1
 2b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2bb:	50                   	push   %eax
 2bc:	6a 00                	push   $0x0
 2be:	e8 ec 00 00 00       	call   3af <read>
    if(cc < 1)
 2c3:	83 c4 10             	add    $0x10,%esp
 2c6:	85 c0                	test   %eax,%eax
 2c8:	7e 17                	jle    2e1 <gets+0x49>
      break;
    buf[i++] = c;
 2ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ce:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2d1:	3c 0a                	cmp    $0xa,%al
 2d3:	0f 94 c2             	sete   %dl
 2d6:	3c 0d                	cmp    $0xd,%al
 2d8:	0f 94 c0             	sete   %al
 2db:	08 c2                	or     %al,%dl
 2dd:	74 ca                	je     2a9 <gets+0x11>
    buf[i++] = c;
 2df:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2e1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2e5:	89 f8                	mov    %edi,%eax
 2e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ea:	5b                   	pop    %ebx
 2eb:	5e                   	pop    %esi
 2ec:	5f                   	pop    %edi
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    

000002ef <stat>:
=======
 28d:	bb 00 00 00 00       	mov    $0x0,%ebx
 292:	89 de                	mov    %ebx,%esi
 294:	83 c3 01             	add    $0x1,%ebx
 297:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29a:	7d 2e                	jge    2ca <gets+0x49>
    cc = read(0, &c, 1);
 29c:	83 ec 04             	sub    $0x4,%esp
 29f:	6a 01                	push   $0x1
 2a1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a4:	50                   	push   %eax
 2a5:	6a 00                	push   $0x0
 2a7:	e8 ec 00 00 00       	call   398 <read>
    if(cc < 1)
 2ac:	83 c4 10             	add    $0x10,%esp
 2af:	85 c0                	test   %eax,%eax
 2b1:	7e 17                	jle    2ca <gets+0x49>
      break;
    buf[i++] = c;
 2b3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b7:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2ba:	3c 0a                	cmp    $0xa,%al
 2bc:	0f 94 c2             	sete   %dl
 2bf:	3c 0d                	cmp    $0xd,%al
 2c1:	0f 94 c0             	sete   %al
 2c4:	08 c2                	or     %al,%dl
 2c6:	74 ca                	je     292 <gets+0x11>
    buf[i++] = c;
 2c8:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2ca:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ce:	89 f8                	mov    %edi,%eax
 2d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d3:	5b                   	pop    %ebx
 2d4:	5e                   	pop    %esi
 2d5:	5f                   	pop    %edi
 2d6:	5d                   	pop    %ebp
 2d7:	c3                   	ret    

000002d8 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	56                   	push   %esi
 2f3:	53                   	push   %ebx
=======
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	56                   	push   %esi
 2dc:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 2f4:	83 ec 08             	sub    $0x8,%esp
 2f7:	6a 00                	push   $0x0
 2f9:	ff 75 08             	push   0x8(%ebp)
 2fc:	e8 d6 00 00 00       	call   3d7 <open>
  if(fd < 0)
 301:	83 c4 10             	add    $0x10,%esp
 304:	85 c0                	test   %eax,%eax
 306:	78 24                	js     32c <stat+0x3d>
 308:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 30a:	83 ec 08             	sub    $0x8,%esp
 30d:	ff 75 0c             	push   0xc(%ebp)
 310:	50                   	push   %eax
 311:	e8 d9 00 00 00       	call   3ef <fstat>
 316:	89 c6                	mov    %eax,%esi
  close(fd);
 318:	89 1c 24             	mov    %ebx,(%esp)
 31b:	e8 9f 00 00 00       	call   3bf <close>
  return r;
 320:	83 c4 10             	add    $0x10,%esp
}
 323:	89 f0                	mov    %esi,%eax
 325:	8d 65 f8             	lea    -0x8(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5d                   	pop    %ebp
 32b:	c3                   	ret    
    return -1;
 32c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 331:	eb f0                	jmp    323 <stat+0x34>

00000333 <atoi>:
=======
 2dd:	83 ec 08             	sub    $0x8,%esp
 2e0:	6a 00                	push   $0x0
 2e2:	ff 75 08             	push   0x8(%ebp)
 2e5:	e8 d6 00 00 00       	call   3c0 <open>
  if(fd < 0)
 2ea:	83 c4 10             	add    $0x10,%esp
 2ed:	85 c0                	test   %eax,%eax
 2ef:	78 24                	js     315 <stat+0x3d>
 2f1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2f3:	83 ec 08             	sub    $0x8,%esp
 2f6:	ff 75 0c             	push   0xc(%ebp)
 2f9:	50                   	push   %eax
 2fa:	e8 d9 00 00 00       	call   3d8 <fstat>
 2ff:	89 c6                	mov    %eax,%esi
  close(fd);
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 9f 00 00 00       	call   3a8 <close>
  return r;
 309:	83 c4 10             	add    $0x10,%esp
}
 30c:	89 f0                	mov    %esi,%eax
 30e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 311:	5b                   	pop    %ebx
 312:	5e                   	pop    %esi
 313:	5d                   	pop    %ebp
 314:	c3                   	ret    
    return -1;
 315:	be ff ff ff ff       	mov    $0xffffffff,%esi
 31a:	eb f0                	jmp    30c <stat+0x34>

0000031c <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	53                   	push   %ebx
 337:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 33a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 33f:	eb 10                	jmp    351 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 341:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 344:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 347:	83 c1 01             	add    $0x1,%ecx
 34a:	0f be c0             	movsbl %al,%eax
 34d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 351:	0f b6 01             	movzbl (%ecx),%eax
 354:	8d 58 d0             	lea    -0x30(%eax),%ebx
 357:	80 fb 09             	cmp    $0x9,%bl
 35a:	76 e5                	jbe    341 <atoi+0xe>
  return n;
}
 35c:	89 d0                	mov    %edx,%eax
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	c9                   	leave  
 362:	c3                   	ret    

00000363 <memmove>:
=======
 31c:	55                   	push   %ebp
 31d:	89 e5                	mov    %esp,%ebp
 31f:	53                   	push   %ebx
 320:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 323:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 328:	eb 10                	jmp    33a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 32a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 32d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 330:	83 c1 01             	add    $0x1,%ecx
 333:	0f be c0             	movsbl %al,%eax
 336:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 33a:	0f b6 01             	movzbl (%ecx),%eax
 33d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 340:	80 fb 09             	cmp    $0x9,%bl
 343:	76 e5                	jbe    32a <atoi+0xe>
  return n;
}
 345:	89 d0                	mov    %edx,%eax
 347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34a:	c9                   	leave  
 34b:	c3                   	ret    

0000034c <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	56                   	push   %esi
 367:	53                   	push   %ebx
 368:	8b 75 08             	mov    0x8(%ebp),%esi
 36b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 36e:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 34c:	55                   	push   %ebp
 34d:	89 e5                	mov    %esp,%ebp
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	8b 75 08             	mov    0x8(%ebp),%esi
 354:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 357:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 371:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 373:	eb 0d                	jmp    382 <memmove+0x1f>
    *dst++ = *src++;
 375:	0f b6 01             	movzbl (%ecx),%eax
 378:	88 02                	mov    %al,(%edx)
 37a:	8d 49 01             	lea    0x1(%ecx),%ecx
 37d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 380:	89 d8                	mov    %ebx,%eax
 382:	8d 58 ff             	lea    -0x1(%eax),%ebx
 385:	85 c0                	test   %eax,%eax
 387:	7f ec                	jg     375 <memmove+0x12>
  return vdst;
}
 389:	89 f0                	mov    %esi,%eax
 38b:	5b                   	pop    %ebx
 38c:	5e                   	pop    %esi
 38d:	5d                   	pop    %ebp
 38e:	c3                   	ret    

0000038f <fork>:
=======
 35a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 35c:	eb 0d                	jmp    36b <memmove+0x1f>
    *dst++ = *src++;
 35e:	0f b6 01             	movzbl (%ecx),%eax
 361:	88 02                	mov    %al,(%edx)
 363:	8d 49 01             	lea    0x1(%ecx),%ecx
 366:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 369:	89 d8                	mov    %ebx,%eax
 36b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 36e:	85 c0                	test   %eax,%eax
 370:	7f ec                	jg     35e <memmove+0x12>
  return vdst;
}
 372:	89 f0                	mov    %esi,%eax
 374:	5b                   	pop    %ebx
 375:	5e                   	pop    %esi
 376:	5d                   	pop    %ebp
 377:	c3                   	ret    

00000378 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 38f:	b8 01 00 00 00       	mov    $0x1,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <exit>:
SYSCALL(exit)
 397:	b8 02 00 00 00       	mov    $0x2,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <wait>:
SYSCALL(wait)
 39f:	b8 03 00 00 00       	mov    $0x3,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <pipe>:
SYSCALL(pipe)
 3a7:	b8 04 00 00 00       	mov    $0x4,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <read>:
SYSCALL(read)
 3af:	b8 05 00 00 00       	mov    $0x5,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <write>:
SYSCALL(write)
 3b7:	b8 10 00 00 00       	mov    $0x10,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <close>:
SYSCALL(close)
 3bf:	b8 15 00 00 00       	mov    $0x15,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <kill>:
SYSCALL(kill)
 3c7:	b8 06 00 00 00       	mov    $0x6,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <exec>:
SYSCALL(exec)
 3cf:	b8 07 00 00 00       	mov    $0x7,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <open>:
SYSCALL(open)
 3d7:	b8 0f 00 00 00       	mov    $0xf,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <mknod>:
SYSCALL(mknod)
 3df:	b8 11 00 00 00       	mov    $0x11,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <unlink>:
SYSCALL(unlink)
 3e7:	b8 12 00 00 00       	mov    $0x12,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <fstat>:
SYSCALL(fstat)
 3ef:	b8 08 00 00 00       	mov    $0x8,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <link>:
SYSCALL(link)
 3f7:	b8 13 00 00 00       	mov    $0x13,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <mkdir>:
SYSCALL(mkdir)
 3ff:	b8 14 00 00 00       	mov    $0x14,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <chdir>:
SYSCALL(chdir)
 407:	b8 09 00 00 00       	mov    $0x9,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <dup>:
SYSCALL(dup)
 40f:	b8 0a 00 00 00       	mov    $0xa,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <getpid>:
SYSCALL(getpid)
 417:	b8 0b 00 00 00       	mov    $0xb,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <sbrk>:
SYSCALL(sbrk)
 41f:	b8 0c 00 00 00       	mov    $0xc,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <sleep>:
SYSCALL(sleep)
 427:	b8 0d 00 00 00       	mov    $0xd,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <uptime>:
SYSCALL(uptime)
 42f:	b8 0e 00 00 00       	mov    $0xe,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <clone>:
SYSCALL(clone)
 437:	b8 16 00 00 00       	mov    $0x16,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <join>:
 43f:	b8 17 00 00 00       	mov    $0x17,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <putc>:
=======
 378:	b8 01 00 00 00       	mov    $0x1,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <exit>:
SYSCALL(exit)
 380:	b8 02 00 00 00       	mov    $0x2,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <wait>:
SYSCALL(wait)
 388:	b8 03 00 00 00       	mov    $0x3,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <pipe>:
SYSCALL(pipe)
 390:	b8 04 00 00 00       	mov    $0x4,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <read>:
SYSCALL(read)
 398:	b8 05 00 00 00       	mov    $0x5,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <write>:
SYSCALL(write)
 3a0:	b8 10 00 00 00       	mov    $0x10,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <close>:
SYSCALL(close)
 3a8:	b8 15 00 00 00       	mov    $0x15,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <kill>:
SYSCALL(kill)
 3b0:	b8 06 00 00 00       	mov    $0x6,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <exec>:
SYSCALL(exec)
 3b8:	b8 07 00 00 00       	mov    $0x7,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <open>:
SYSCALL(open)
 3c0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <mknod>:
SYSCALL(mknod)
 3c8:	b8 11 00 00 00       	mov    $0x11,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <unlink>:
SYSCALL(unlink)
 3d0:	b8 12 00 00 00       	mov    $0x12,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <fstat>:
SYSCALL(fstat)
 3d8:	b8 08 00 00 00       	mov    $0x8,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <link>:
SYSCALL(link)
 3e0:	b8 13 00 00 00       	mov    $0x13,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <mkdir>:
SYSCALL(mkdir)
 3e8:	b8 14 00 00 00       	mov    $0x14,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <chdir>:
SYSCALL(chdir)
 3f0:	b8 09 00 00 00       	mov    $0x9,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <dup>:
SYSCALL(dup)
 3f8:	b8 0a 00 00 00       	mov    $0xa,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <getpid>:
SYSCALL(getpid)
 400:	b8 0b 00 00 00       	mov    $0xb,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <sbrk>:
SYSCALL(sbrk)
 408:	b8 0c 00 00 00       	mov    $0xc,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <sleep>:
SYSCALL(sleep)
 410:	b8 0d 00 00 00       	mov    $0xd,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <uptime>:
SYSCALL(uptime)
 418:	b8 0e 00 00 00       	mov    $0xe,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <clone>:
SYSCALL(clone)
 420:	b8 16 00 00 00       	mov    $0x16,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <join>:
 428:	b8 17 00 00 00       	mov    $0x17,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 447:	55                   	push   %ebp
 448:	89 e5                	mov    %esp,%ebp
 44a:	83 ec 1c             	sub    $0x1c,%esp
 44d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 450:	6a 01                	push   $0x1
 452:	8d 55 f4             	lea    -0xc(%ebp),%edx
 455:	52                   	push   %edx
 456:	50                   	push   %eax
 457:	e8 5b ff ff ff       	call   3b7 <write>
}
 45c:	83 c4 10             	add    $0x10,%esp
 45f:	c9                   	leave  
 460:	c3                   	ret    

00000461 <printint>:
=======
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	83 ec 1c             	sub    $0x1c,%esp
 436:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 439:	6a 01                	push   $0x1
 43b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 43e:	52                   	push   %edx
 43f:	50                   	push   %eax
 440:	e8 5b ff ff ff       	call   3a0 <write>
}
 445:	83 c4 10             	add    $0x10,%esp
 448:	c9                   	leave  
 449:	c3                   	ret    

0000044a <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	57                   	push   %edi
 465:	56                   	push   %esi
 466:	53                   	push   %ebx
 467:	83 ec 2c             	sub    $0x2c,%esp
 46a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 46d:	89 d0                	mov    %edx,%eax
 46f:	89 ce                	mov    %ecx,%esi
=======
 44a:	55                   	push   %ebp
 44b:	89 e5                	mov    %esp,%ebp
 44d:	57                   	push   %edi
 44e:	56                   	push   %esi
 44f:	53                   	push   %ebx
 450:	83 ec 2c             	sub    $0x2c,%esp
 453:	89 45 d0             	mov    %eax,-0x30(%ebp)
 456:	89 d0                	mov    %edx,%eax
 458:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 471:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 475:	0f 95 c1             	setne  %cl
 478:	c1 ea 1f             	shr    $0x1f,%edx
 47b:	84 d1                	test   %dl,%cl
 47d:	74 44                	je     4c3 <printint+0x62>
    neg = 1;
    x = -xx;
 47f:	f7 d8                	neg    %eax
 481:	89 c1                	mov    %eax,%ecx
    neg = 1;
 483:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 45a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 45e:	0f 95 c1             	setne  %cl
 461:	c1 ea 1f             	shr    $0x1f,%edx
 464:	84 d1                	test   %dl,%cl
 466:	74 44                	je     4ac <printint+0x62>
    neg = 1;
    x = -xx;
 468:	f7 d8                	neg    %eax
 46a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 46c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 48a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 48f:	89 c8                	mov    %ecx,%eax
 491:	ba 00 00 00 00       	mov    $0x0,%edx
 496:	f7 f6                	div    %esi
 498:	89 df                	mov    %ebx,%edi
 49a:	83 c3 01             	add    $0x1,%ebx
 49d:	0f b6 92 34 08 00 00 	movzbl 0x834(%edx),%edx
 4a4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4a8:	89 ca                	mov    %ecx,%edx
 4aa:	89 c1                	mov    %eax,%ecx
 4ac:	39 d6                	cmp    %edx,%esi
 4ae:	76 df                	jbe    48f <printint+0x2e>
  if(neg)
 4b0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4b4:	74 31                	je     4e7 <printint+0x86>
    buf[i++] = '-';
 4b6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4bb:	8d 5f 02             	lea    0x2(%edi),%ebx
 4be:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4c1:	eb 17                	jmp    4da <printint+0x79>
    x = xx;
 4c3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4c5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4cc:	eb bc                	jmp    48a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4ce:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4d3:	89 f0                	mov    %esi,%eax
 4d5:	e8 6d ff ff ff       	call   447 <putc>
  while(--i >= 0)
 4da:	83 eb 01             	sub    $0x1,%ebx
 4dd:	79 ef                	jns    4ce <printint+0x6d>
}
 4df:	83 c4 2c             	add    $0x2c,%esp
 4e2:	5b                   	pop    %ebx
 4e3:	5e                   	pop    %esi
 4e4:	5f                   	pop    %edi
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    
 4e7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ea:	eb ee                	jmp    4da <printint+0x79>

000004ec <printf>:
=======
 473:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 478:	89 c8                	mov    %ecx,%eax
 47a:	ba 00 00 00 00       	mov    $0x0,%edx
 47f:	f7 f6                	div    %esi
 481:	89 df                	mov    %ebx,%edi
 483:	83 c3 01             	add    $0x1,%ebx
 486:	0f b6 92 1c 08 00 00 	movzbl 0x81c(%edx),%edx
 48d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 491:	89 ca                	mov    %ecx,%edx
 493:	89 c1                	mov    %eax,%ecx
 495:	39 d6                	cmp    %edx,%esi
 497:	76 df                	jbe    478 <printint+0x2e>
  if(neg)
 499:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 49d:	74 31                	je     4d0 <printint+0x86>
    buf[i++] = '-';
 49f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4a4:	8d 5f 02             	lea    0x2(%edi),%ebx
 4a7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4aa:	eb 17                	jmp    4c3 <printint+0x79>
    x = xx;
 4ac:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4ae:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4b5:	eb bc                	jmp    473 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4b7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4bc:	89 f0                	mov    %esi,%eax
 4be:	e8 6d ff ff ff       	call   430 <putc>
  while(--i >= 0)
 4c3:	83 eb 01             	sub    $0x1,%ebx
 4c6:	79 ef                	jns    4b7 <printint+0x6d>
}
 4c8:	83 c4 2c             	add    $0x2c,%esp
 4cb:	5b                   	pop    %ebx
 4cc:	5e                   	pop    %esi
 4cd:	5f                   	pop    %edi
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret    
 4d0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4d3:	eb ee                	jmp    4c3 <printint+0x79>

000004d5 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	57                   	push   %edi
 4f0:	56                   	push   %esi
 4f1:	53                   	push   %ebx
 4f2:	83 ec 1c             	sub    $0x1c,%esp
=======
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	57                   	push   %edi
 4d9:	56                   	push   %esi
 4da:	53                   	push   %ebx
 4db:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 4f5:	8d 45 10             	lea    0x10(%ebp),%eax
 4f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4fb:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 500:	bb 00 00 00 00       	mov    $0x0,%ebx
 505:	eb 14                	jmp    51b <printf+0x2f>
=======
 4de:	8d 45 10             	lea    0x10(%ebp),%eax
 4e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4e4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4e9:	bb 00 00 00 00       	mov    $0x0,%ebx
 4ee:	eb 14                	jmp    504 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 507:	89 fa                	mov    %edi,%edx
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	e8 36 ff ff ff       	call   447 <putc>
 511:	eb 05                	jmp    518 <printf+0x2c>
      }
    } else if(state == '%'){
 513:	83 fe 25             	cmp    $0x25,%esi
 516:	74 25                	je     53d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 518:	83 c3 01             	add    $0x1,%ebx
 51b:	8b 45 0c             	mov    0xc(%ebp),%eax
 51e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 522:	84 c0                	test   %al,%al
 524:	0f 84 20 01 00 00    	je     64a <printf+0x15e>
    c = fmt[i] & 0xff;
 52a:	0f be f8             	movsbl %al,%edi
 52d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 530:	85 f6                	test   %esi,%esi
 532:	75 df                	jne    513 <printf+0x27>
      if(c == '%'){
 534:	83 f8 25             	cmp    $0x25,%eax
 537:	75 ce                	jne    507 <printf+0x1b>
        state = '%';
 539:	89 c6                	mov    %eax,%esi
 53b:	eb db                	jmp    518 <printf+0x2c>
      if(c == 'd'){
 53d:	83 f8 25             	cmp    $0x25,%eax
 540:	0f 84 cf 00 00 00    	je     615 <printf+0x129>
 546:	0f 8c dd 00 00 00    	jl     629 <printf+0x13d>
 54c:	83 f8 78             	cmp    $0x78,%eax
 54f:	0f 8f d4 00 00 00    	jg     629 <printf+0x13d>
 555:	83 f8 63             	cmp    $0x63,%eax
 558:	0f 8c cb 00 00 00    	jl     629 <printf+0x13d>
 55e:	83 e8 63             	sub    $0x63,%eax
 561:	83 f8 15             	cmp    $0x15,%eax
 564:	0f 87 bf 00 00 00    	ja     629 <printf+0x13d>
 56a:	ff 24 85 dc 07 00 00 	jmp    *0x7dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 571:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 574:	8b 17                	mov    (%edi),%edx
 576:	83 ec 0c             	sub    $0xc,%esp
 579:	6a 01                	push   $0x1
 57b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	e8 d9 fe ff ff       	call   461 <printint>
        ap++;
 588:	83 c7 04             	add    $0x4,%edi
 58b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 58e:	83 c4 10             	add    $0x10,%esp
=======
 4f0:	89 fa                	mov    %edi,%edx
 4f2:	8b 45 08             	mov    0x8(%ebp),%eax
 4f5:	e8 36 ff ff ff       	call   430 <putc>
 4fa:	eb 05                	jmp    501 <printf+0x2c>
      }
    } else if(state == '%'){
 4fc:	83 fe 25             	cmp    $0x25,%esi
 4ff:	74 25                	je     526 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 501:	83 c3 01             	add    $0x1,%ebx
 504:	8b 45 0c             	mov    0xc(%ebp),%eax
 507:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 50b:	84 c0                	test   %al,%al
 50d:	0f 84 20 01 00 00    	je     633 <printf+0x15e>
    c = fmt[i] & 0xff;
 513:	0f be f8             	movsbl %al,%edi
 516:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 519:	85 f6                	test   %esi,%esi
 51b:	75 df                	jne    4fc <printf+0x27>
      if(c == '%'){
 51d:	83 f8 25             	cmp    $0x25,%eax
 520:	75 ce                	jne    4f0 <printf+0x1b>
        state = '%';
 522:	89 c6                	mov    %eax,%esi
 524:	eb db                	jmp    501 <printf+0x2c>
      if(c == 'd'){
 526:	83 f8 25             	cmp    $0x25,%eax
 529:	0f 84 cf 00 00 00    	je     5fe <printf+0x129>
 52f:	0f 8c dd 00 00 00    	jl     612 <printf+0x13d>
 535:	83 f8 78             	cmp    $0x78,%eax
 538:	0f 8f d4 00 00 00    	jg     612 <printf+0x13d>
 53e:	83 f8 63             	cmp    $0x63,%eax
 541:	0f 8c cb 00 00 00    	jl     612 <printf+0x13d>
 547:	83 e8 63             	sub    $0x63,%eax
 54a:	83 f8 15             	cmp    $0x15,%eax
 54d:	0f 87 bf 00 00 00    	ja     612 <printf+0x13d>
 553:	ff 24 85 c4 07 00 00 	jmp    *0x7c4(,%eax,4)
        printint(fd, *ap, 10, 1);
 55a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55d:	8b 17                	mov    (%edi),%edx
 55f:	83 ec 0c             	sub    $0xc,%esp
 562:	6a 01                	push   $0x1
 564:	b9 0a 00 00 00       	mov    $0xa,%ecx
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	e8 d9 fe ff ff       	call   44a <printint>
        ap++;
 571:	83 c7 04             	add    $0x4,%edi
 574:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 577:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 591:	be 00 00 00 00       	mov    $0x0,%esi
 596:	eb 80                	jmp    518 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 598:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 59b:	8b 17                	mov    (%edi),%edx
 59d:	83 ec 0c             	sub    $0xc,%esp
 5a0:	6a 00                	push   $0x0
 5a2:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a7:	8b 45 08             	mov    0x8(%ebp),%eax
 5aa:	e8 b2 fe ff ff       	call   461 <printint>
        ap++;
 5af:	83 c7 04             	add    $0x4,%edi
 5b2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5b8:	be 00 00 00 00       	mov    $0x0,%esi
 5bd:	e9 56 ff ff ff       	jmp    518 <printf+0x2c>
        s = (char*)*ap;
 5c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c5:	8b 30                	mov    (%eax),%esi
        ap++;
 5c7:	83 c0 04             	add    $0x4,%eax
 5ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5cd:	85 f6                	test   %esi,%esi
 5cf:	75 15                	jne    5e6 <printf+0xfa>
          s = "(null)";
 5d1:	be d4 07 00 00       	mov    $0x7d4,%esi
 5d6:	eb 0e                	jmp    5e6 <printf+0xfa>
          putc(fd, *s);
 5d8:	0f be d2             	movsbl %dl,%edx
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	e8 64 fe ff ff       	call   447 <putc>
          s++;
 5e3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5e6:	0f b6 16             	movzbl (%esi),%edx
 5e9:	84 d2                	test   %dl,%dl
 5eb:	75 eb                	jne    5d8 <printf+0xec>
      state = 0;
 5ed:	be 00 00 00 00       	mov    $0x0,%esi
 5f2:	e9 21 ff ff ff       	jmp    518 <printf+0x2c>
        putc(fd, *ap);
 5f7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5fa:	0f be 17             	movsbl (%edi),%edx
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	e8 42 fe ff ff       	call   447 <putc>
        ap++;
 605:	83 c7 04             	add    $0x4,%edi
 608:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 60b:	be 00 00 00 00       	mov    $0x0,%esi
 610:	e9 03 ff ff ff       	jmp    518 <printf+0x2c>
        putc(fd, c);
 615:	89 fa                	mov    %edi,%edx
 617:	8b 45 08             	mov    0x8(%ebp),%eax
 61a:	e8 28 fe ff ff       	call   447 <putc>
      state = 0;
 61f:	be 00 00 00 00       	mov    $0x0,%esi
 624:	e9 ef fe ff ff       	jmp    518 <printf+0x2c>
        putc(fd, '%');
 629:	ba 25 00 00 00       	mov    $0x25,%edx
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	e8 11 fe ff ff       	call   447 <putc>
        putc(fd, c);
 636:	89 fa                	mov    %edi,%edx
 638:	8b 45 08             	mov    0x8(%ebp),%eax
 63b:	e8 07 fe ff ff       	call   447 <putc>
      state = 0;
 640:	be 00 00 00 00       	mov    $0x0,%esi
 645:	e9 ce fe ff ff       	jmp    518 <printf+0x2c>
    }
  }
}
 64a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5f                   	pop    %edi
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    

00000652 <free>:
=======
 57a:	be 00 00 00 00       	mov    $0x0,%esi
 57f:	eb 80                	jmp    501 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 581:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 584:	8b 17                	mov    (%edi),%edx
 586:	83 ec 0c             	sub    $0xc,%esp
 589:	6a 00                	push   $0x0
 58b:	b9 10 00 00 00       	mov    $0x10,%ecx
 590:	8b 45 08             	mov    0x8(%ebp),%eax
 593:	e8 b2 fe ff ff       	call   44a <printint>
        ap++;
 598:	83 c7 04             	add    $0x4,%edi
 59b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 59e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a1:	be 00 00 00 00       	mov    $0x0,%esi
 5a6:	e9 56 ff ff ff       	jmp    501 <printf+0x2c>
        s = (char*)*ap;
 5ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ae:	8b 30                	mov    (%eax),%esi
        ap++;
 5b0:	83 c0 04             	add    $0x4,%eax
 5b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5b6:	85 f6                	test   %esi,%esi
 5b8:	75 15                	jne    5cf <printf+0xfa>
          s = "(null)";
 5ba:	be bc 07 00 00       	mov    $0x7bc,%esi
 5bf:	eb 0e                	jmp    5cf <printf+0xfa>
          putc(fd, *s);
 5c1:	0f be d2             	movsbl %dl,%edx
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
 5c7:	e8 64 fe ff ff       	call   430 <putc>
          s++;
 5cc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5cf:	0f b6 16             	movzbl (%esi),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	75 eb                	jne    5c1 <printf+0xec>
      state = 0;
 5d6:	be 00 00 00 00       	mov    $0x0,%esi
 5db:	e9 21 ff ff ff       	jmp    501 <printf+0x2c>
        putc(fd, *ap);
 5e0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e3:	0f be 17             	movsbl (%edi),%edx
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	e8 42 fe ff ff       	call   430 <putc>
        ap++;
 5ee:	83 c7 04             	add    $0x4,%edi
 5f1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5f4:	be 00 00 00 00       	mov    $0x0,%esi
 5f9:	e9 03 ff ff ff       	jmp    501 <printf+0x2c>
        putc(fd, c);
 5fe:	89 fa                	mov    %edi,%edx
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	e8 28 fe ff ff       	call   430 <putc>
      state = 0;
 608:	be 00 00 00 00       	mov    $0x0,%esi
 60d:	e9 ef fe ff ff       	jmp    501 <printf+0x2c>
        putc(fd, '%');
 612:	ba 25 00 00 00       	mov    $0x25,%edx
 617:	8b 45 08             	mov    0x8(%ebp),%eax
 61a:	e8 11 fe ff ff       	call   430 <putc>
        putc(fd, c);
 61f:	89 fa                	mov    %edi,%edx
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	e8 07 fe ff ff       	call   430 <putc>
      state = 0;
 629:	be 00 00 00 00       	mov    $0x0,%esi
 62e:	e9 ce fe ff ff       	jmp    501 <printf+0x2c>
    }
  }
}
 633:	8d 65 f4             	lea    -0xc(%ebp),%esp
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5f                   	pop    %edi
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    

0000063b <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	57                   	push   %edi
 656:	56                   	push   %esi
 657:	53                   	push   %ebx
 658:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 65b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65e:	a1 e0 0e 00 00       	mov    0xee0,%eax
 663:	eb 02                	jmp    667 <free+0x15>
 665:	89 d0                	mov    %edx,%eax
 667:	39 c8                	cmp    %ecx,%eax
 669:	73 04                	jae    66f <free+0x1d>
 66b:	39 08                	cmp    %ecx,(%eax)
 66d:	77 12                	ja     681 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66f:	8b 10                	mov    (%eax),%edx
 671:	39 c2                	cmp    %eax,%edx
 673:	77 f0                	ja     665 <free+0x13>
 675:	39 c8                	cmp    %ecx,%eax
 677:	72 08                	jb     681 <free+0x2f>
 679:	39 ca                	cmp    %ecx,%edx
 67b:	77 04                	ja     681 <free+0x2f>
 67d:	89 d0                	mov    %edx,%eax
 67f:	eb e6                	jmp    667 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 681:	8b 73 fc             	mov    -0x4(%ebx),%esi
 684:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 687:	8b 10                	mov    (%eax),%edx
 689:	39 d7                	cmp    %edx,%edi
 68b:	74 19                	je     6a6 <free+0x54>
=======
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	57                   	push   %edi
 63f:	56                   	push   %esi
 640:	53                   	push   %ebx
 641:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 644:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 647:	a1 e0 10 00 00       	mov    0x10e0,%eax
 64c:	eb 02                	jmp    650 <free+0x15>
 64e:	89 d0                	mov    %edx,%eax
 650:	39 c8                	cmp    %ecx,%eax
 652:	73 04                	jae    658 <free+0x1d>
 654:	39 08                	cmp    %ecx,(%eax)
 656:	77 12                	ja     66a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 658:	8b 10                	mov    (%eax),%edx
 65a:	39 c2                	cmp    %eax,%edx
 65c:	77 f0                	ja     64e <free+0x13>
 65e:	39 c8                	cmp    %ecx,%eax
 660:	72 08                	jb     66a <free+0x2f>
 662:	39 ca                	cmp    %ecx,%edx
 664:	77 04                	ja     66a <free+0x2f>
 666:	89 d0                	mov    %edx,%eax
 668:	eb e6                	jmp    650 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 66a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 670:	8b 10                	mov    (%eax),%edx
 672:	39 d7                	cmp    %edx,%edi
 674:	74 19                	je     68f <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 68d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 690:	8b 50 04             	mov    0x4(%eax),%edx
 693:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 696:	39 ce                	cmp    %ecx,%esi
 698:	74 1b                	je     6b5 <free+0x63>
=======
 676:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 679:	8b 50 04             	mov    0x4(%eax),%edx
 67c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67f:	39 ce                	cmp    %ecx,%esi
 681:	74 1b                	je     69e <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 69a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 69c:	a3 e0 0e 00 00       	mov    %eax,0xee0
}
 6a1:	5b                   	pop    %ebx
 6a2:	5e                   	pop    %esi
 6a3:	5f                   	pop    %edi
 6a4:	5d                   	pop    %ebp
 6a5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6a6:	03 72 04             	add    0x4(%edx),%esi
 6a9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ac:	8b 10                	mov    (%eax),%edx
 6ae:	8b 12                	mov    (%edx),%edx
 6b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6b3:	eb db                	jmp    690 <free+0x3e>
    p->s.size += bp->s.size;
 6b5:	03 53 fc             	add    -0x4(%ebx),%edx
 6b8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6bb:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6be:	89 10                	mov    %edx,(%eax)
 6c0:	eb da                	jmp    69c <free+0x4a>

000006c2 <morecore>:
=======
 683:	89 08                	mov    %ecx,(%eax)
  freep = p;
 685:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 68a:	5b                   	pop    %ebx
 68b:	5e                   	pop    %esi
 68c:	5f                   	pop    %edi
 68d:	5d                   	pop    %ebp
 68e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 68f:	03 72 04             	add    0x4(%edx),%esi
 692:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 695:	8b 10                	mov    (%eax),%edx
 697:	8b 12                	mov    (%edx),%edx
 699:	89 53 f8             	mov    %edx,-0x8(%ebx)
 69c:	eb db                	jmp    679 <free+0x3e>
    p->s.size += bp->s.size;
 69e:	03 53 fc             	add    -0x4(%ebx),%edx
 6a1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a7:	89 10                	mov    %edx,(%eax)
 6a9:	eb da                	jmp    685 <free+0x4a>

000006ab <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 6c2:	55                   	push   %ebp
 6c3:	89 e5                	mov    %esp,%ebp
 6c5:	53                   	push   %ebx
 6c6:	83 ec 04             	sub    $0x4,%esp
 6c9:	89 c3                	mov    %eax,%ebx
=======
 6ab:	55                   	push   %ebp
 6ac:	89 e5                	mov    %esp,%ebp
 6ae:	53                   	push   %ebx
 6af:	83 ec 04             	sub    $0x4,%esp
 6b2:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 6cb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6d0:	77 05                	ja     6d7 <morecore+0x15>
    nu = 4096;
 6d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6d7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6de:	83 ec 0c             	sub    $0xc,%esp
 6e1:	50                   	push   %eax
 6e2:	e8 38 fd ff ff       	call   41f <sbrk>
  if(p == (char*)-1)
 6e7:	83 c4 10             	add    $0x10,%esp
 6ea:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ed:	74 1c                	je     70b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6ef:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6f2:	83 c0 08             	add    $0x8,%eax
 6f5:	83 ec 0c             	sub    $0xc,%esp
 6f8:	50                   	push   %eax
 6f9:	e8 54 ff ff ff       	call   652 <free>
  return freep;
 6fe:	a1 e0 0e 00 00       	mov    0xee0,%eax
 703:	83 c4 10             	add    $0x10,%esp
}
 706:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 709:	c9                   	leave  
 70a:	c3                   	ret    
    return 0;
 70b:	b8 00 00 00 00       	mov    $0x0,%eax
 710:	eb f4                	jmp    706 <morecore+0x44>

00000712 <malloc>:
=======
 6b4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6b9:	77 05                	ja     6c0 <morecore+0x15>
    nu = 4096;
 6bb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6c0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6c7:	83 ec 0c             	sub    $0xc,%esp
 6ca:	50                   	push   %eax
 6cb:	e8 38 fd ff ff       	call   408 <sbrk>
  if(p == (char*)-1)
 6d0:	83 c4 10             	add    $0x10,%esp
 6d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d6:	74 1c                	je     6f4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6db:	83 c0 08             	add    $0x8,%eax
 6de:	83 ec 0c             	sub    $0xc,%esp
 6e1:	50                   	push   %eax
 6e2:	e8 54 ff ff ff       	call   63b <free>
  return freep;
 6e7:	a1 e0 10 00 00       	mov    0x10e0,%eax
 6ec:	83 c4 10             	add    $0x10,%esp
}
 6ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f2:	c9                   	leave  
 6f3:	c3                   	ret    
    return 0;
 6f4:	b8 00 00 00 00       	mov    $0x0,%eax
 6f9:	eb f4                	jmp    6ef <morecore+0x44>

000006fb <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 712:	55                   	push   %ebp
 713:	89 e5                	mov    %esp,%ebp
 715:	53                   	push   %ebx
 716:	83 ec 04             	sub    $0x4,%esp
=======
 6fb:	55                   	push   %ebp
 6fc:	89 e5                	mov    %esp,%ebp
 6fe:	53                   	push   %ebx
 6ff:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	8d 58 07             	lea    0x7(%eax),%ebx
 71f:	c1 eb 03             	shr    $0x3,%ebx
 722:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 725:	8b 0d e0 0e 00 00    	mov    0xee0,%ecx
 72b:	85 c9                	test   %ecx,%ecx
 72d:	74 04                	je     733 <malloc+0x21>
=======
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	8d 58 07             	lea    0x7(%eax),%ebx
 708:	c1 eb 03             	shr    $0x3,%ebx
 70b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 70e:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 714:	85 c9                	test   %ecx,%ecx
 716:	74 04                	je     71c <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 72f:	8b 01                	mov    (%ecx),%eax
 731:	eb 4a                	jmp    77d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 733:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 73a:	0e 00 00 
 73d:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 744:	0e 00 00 
    base.s.size = 0;
 747:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 74e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 751:	b9 e4 0e 00 00       	mov    $0xee4,%ecx
 756:	eb d7                	jmp    72f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 758:	74 19                	je     773 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 75a:	29 da                	sub    %ebx,%edx
 75c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 75f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 762:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 765:	89 0d e0 0e 00 00    	mov    %ecx,0xee0
      return (void*)(p + 1);
 76b:	83 c0 08             	add    $0x8,%eax
=======
 718:	8b 01                	mov    (%ecx),%eax
 71a:	eb 4a                	jmp    766 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 71c:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 723:	10 00 00 
 726:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 72d:	10 00 00 
    base.s.size = 0;
 730:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 737:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 73a:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 73f:	eb d7                	jmp    718 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 741:	74 19                	je     75c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 743:	29 da                	sub    %ebx,%edx
 745:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 748:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 74b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 74e:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 754:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 76e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 771:	c9                   	leave  
 772:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 773:	8b 10                	mov    (%eax),%edx
 775:	89 11                	mov    %edx,(%ecx)
 777:	eb ec                	jmp    765 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 779:	89 c1                	mov    %eax,%ecx
 77b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	39 da                	cmp    %ebx,%edx
 782:	73 d4                	jae    758 <malloc+0x46>
    if(p == freep)
 784:	39 05 e0 0e 00 00    	cmp    %eax,0xee0
 78a:	75 ed                	jne    779 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 78c:	89 d8                	mov    %ebx,%eax
 78e:	e8 2f ff ff ff       	call   6c2 <morecore>
 793:	85 c0                	test   %eax,%eax
 795:	75 e2                	jne    779 <malloc+0x67>
 797:	eb d5                	jmp    76e <malloc+0x5c>
=======
 757:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 75a:	c9                   	leave  
 75b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 75c:	8b 10                	mov    (%eax),%edx
 75e:	89 11                	mov    %edx,(%ecx)
 760:	eb ec                	jmp    74e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 762:	89 c1                	mov    %eax,%ecx
 764:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 766:	8b 50 04             	mov    0x4(%eax),%edx
 769:	39 da                	cmp    %ebx,%edx
 76b:	73 d4                	jae    741 <malloc+0x46>
    if(p == freep)
 76d:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 773:	75 ed                	jne    762 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 775:	89 d8                	mov    %ebx,%eax
 777:	e8 2f ff ff ff       	call   6ab <morecore>
 77c:	85 c0                	test   %eax,%eax
 77e:	75 e2                	jne    762 <malloc+0x67>
 780:	eb d5                	jmp    757 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
