
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
<<<<<<< HEAD
  11:	e8 44 04 00 00       	call   45a <getpid>
  16:	a3 20 0c 00 00       	mov    %eax,0xc20

   int fork_pid = fork();
  1b:	e8 b2 03 00 00       	call   3d2 <fork>
=======
  11:	e8 2d 04 00 00       	call   443 <getpid>
  16:	a3 20 0c 00 00       	mov    %eax,0xc20

   int fork_pid = fork();
  1b:	e8 9b 03 00 00       	call   3bb <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
  2d:	e8 50 04 00 00       	call   482 <join>
=======
  2d:	e8 39 04 00 00       	call   46b <join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
<<<<<<< HEAD
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
=======
  40:	68 c8 07 00 00       	push   $0x7c8
  45:	68 d1 07 00 00       	push   $0x7d1
  4a:	6a 01                	push   $0x1
  4c:	e8 c7 04 00 00       	call   518 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 07 08 00 00       	push   $0x807
  59:	68 e6 07 00 00       	push   $0x7e6
  5e:	6a 01                	push   $0x1
  60:	e8 b3 04 00 00       	call   518 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 fa 07 00 00       	push   $0x7fa
  6d:	6a 01                	push   $0x1
  6f:	e8 a4 04 00 00       	call   518 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 20 0c 00 00    	push   0xc20
  7d:	e8 71 03 00 00       	call   3f3 <kill>
  82:	e8 3c 03 00 00       	call   3c3 <exit>
     exit();
  87:	e8 37 03 00 00       	call   3c3 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 c8 07 00 00       	push   $0x7c8
  93:	68 d1 07 00 00       	push   $0x7d1
  98:	6a 01                	push   $0x1
  9a:	e8 79 04 00 00       	call   518 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 d9 07 00 00       	push   $0x7d9
  a7:	68 e6 07 00 00       	push   $0x7e6
  ac:	6a 01                	push   $0x1
  ae:	e8 65 04 00 00       	call   518 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 fa 07 00 00       	push   $0x7fa
  bb:	6a 01                	push   $0x1
  bd:	e8 56 04 00 00       	call   518 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 20 0c 00 00    	push   0xc20
  cb:	e8 23 03 00 00       	call   3f3 <kill>
  d0:	e8 ee 02 00 00       	call   3c3 <exit>

   assert(wait() > 0);
  d5:	e8 f1 02 00 00       	call   3cb <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
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
=======
  e1:	68 21 08 00 00       	push   $0x821
  e6:	6a 01                	push   $0x1
  e8:	e8 2b 04 00 00       	call   518 <printf>
   exit();
  ed:	e8 d1 02 00 00       	call   3c3 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 c8 07 00 00       	push   $0x7c8
  f9:	68 d1 07 00 00       	push   $0x7d1
  fe:	6a 01                	push   $0x1
 100:	e8 13 04 00 00       	call   518 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 16 08 00 00       	push   $0x816
 10d:	68 e6 07 00 00       	push   $0x7e6
 112:	6a 01                	push   $0x1
 114:	e8 ff 03 00 00       	call   518 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 fa 07 00 00       	push   $0x7fa
 121:	6a 01                	push   $0x1
 123:	e8 f0 03 00 00       	call   518 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 20 0c 00 00    	push   0xc20
 131:	e8 bd 02 00 00       	call   3f3 <kill>
 136:	e8 88 02 00 00       	call   3c3 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000013b <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

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
<<<<<<< HEAD
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
=======
 158:	e8 e1 05 00 00       	call   73e <malloc>
  if(n_stack == 0){
 15d:	83 c4 10             	add    $0x10,%esp
 160:	85 c0                	test   %eax,%eax
 162:	74 57                	je     1bb <thread_create+0x6f>
 164:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 166:	b8 00 00 00 00       	mov    $0x0,%eax
 16b:	eb 03                	jmp    170 <thread_create+0x24>
 16d:	83 c0 01             	add    $0x1,%eax
 170:	83 f8 3f             	cmp    $0x3f,%eax
 173:	7f 2f                	jg     1a4 <thread_create+0x58>
    if(threads[i].flag==0){
 175:	8d 14 40             	lea    (%eax,%eax,2),%edx
 178:	83 3c 95 48 0c 00 00 	cmpl   $0x0,0xc48(,%edx,4)
 17f:	00 
 180:	75 eb                	jne    16d <thread_create+0x21>
      threads[i].maddr = n_stack;
 182:	8d 14 00             	lea    (%eax,%eax,1),%edx
 185:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 188:	c1 e3 02             	shl    $0x2,%ebx
 18b:	89 8b 40 0c 00 00    	mov    %ecx,0xc40(%ebx)
      threads[i].pg1addr = n_stack;
 191:	89 8b 44 0c 00 00    	mov    %ecx,0xc44(%ebx)
      threads[i].flag = 1;
 197:	01 c2                	add    %eax,%edx
 199:	c7 04 95 48 0c 00 00 	movl   $0x1,0xc48(,%edx,4)
 1a0:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 1a4:	51                   	push   %ecx
 1a5:	ff 75 10             	push   0x10(%ebp)
 1a8:	ff 75 0c             	push   0xc(%ebp)
 1ab:	ff 75 08             	push   0x8(%ebp)
 1ae:	e8 b0 02 00 00       	call   463 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

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
<<<<<<< HEAD
}
 1a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
    return -1;
 1a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1aa:	eb f4                	jmp    1a0 <thread_create+0x54>

000001ac <thread_join>:
=======
 1b3:	83 c4 10             	add    $0x10,%esp
}
 1b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b9:	c9                   	leave  
 1ba:	c3                   	ret    
    return -1;
 1bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c0:	eb f4                	jmp    1b6 <thread_create+0x6a>

000001c2 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
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
=======
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1c9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1cc:	50                   	push   %eax
 1cd:	e8 99 02 00 00       	call   46b <join>
 1d2:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 75 f4             	push   -0xc(%ebp)
 1da:	e8 9f 04 00 00       	call   67e <free>
  return pid;
}
 1df:	89 d8                	mov    %ebx,%eax
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	53                   	push   %ebx
 1ea:	83 ec 04             	sub    $0x4,%esp
 1ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	53                   	push   %ebx
 1f6:	e8 40 ff ff ff       	call   13b <test_and_set>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	83 f8 01             	cmp    $0x1,%eax
 201:	74 ed                	je     1f0 <lock_acquire+0xa>
    ;
}
 203:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <lock_release>:

void lock_release(lock_t *lock) {
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 214:	5d                   	pop    %ebp
 215:	c3                   	ret    

00000216 <lock_init>:

void lock_init(lock_t *lock) {
 216:	55                   	push   %ebp
 217:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 219:	8b 45 08             	mov    0x8(%ebp),%eax
 21c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	56                   	push   %esi
 23f:	53                   	push   %ebx
 240:	8b 75 08             	mov    0x8(%ebp),%esi
 243:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
 229:	8b 75 08             	mov    0x8(%ebp),%esi
 22c:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
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
=======
 22f:	89 f0                	mov    %esi,%eax
 231:	89 d1                	mov    %edx,%ecx
 233:	83 c2 01             	add    $0x1,%edx
 236:	89 c3                	mov    %eax,%ebx
 238:	83 c0 01             	add    $0x1,%eax
 23b:	0f b6 09             	movzbl (%ecx),%ecx
 23e:	88 0b                	mov    %cl,(%ebx)
 240:	84 c9                	test   %cl,%cl
 242:	75 ed                	jne    231 <strcpy+0xd>
    ;
  return os;
}
 244:	89 f0                	mov    %esi,%eax
 246:	5b                   	pop    %ebx
 247:	5e                   	pop    %esi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
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
=======
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 250:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 253:	eb 06                	jmp    25b <strcmp+0x11>
    p++, q++;
 255:	83 c1 01             	add    $0x1,%ecx
 258:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 25b:	0f b6 01             	movzbl (%ecx),%eax
 25e:	84 c0                	test   %al,%al
 260:	74 04                	je     266 <strcmp+0x1c>
 262:	3a 02                	cmp    (%edx),%al
 264:	74 ef                	je     255 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 266:	0f b6 c0             	movzbl %al,%eax
 269:	0f b6 12             	movzbl (%edx),%edx
 26c:	29 d0                	sub    %edx,%eax
}
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
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
=======
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 276:	b8 00 00 00 00       	mov    $0x0,%eax
 27b:	eb 03                	jmp    280 <strlen+0x10>
 27d:	83 c0 01             	add    $0x1,%eax
 280:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 284:	75 f7                	jne    27d <strlen+0xd>
    ;
  return n;
}
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    

00000288 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
 2a2:	57                   	push   %edi
 2a3:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	57                   	push   %edi
 28c:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
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
=======
 28f:	89 d7                	mov    %edx,%edi
 291:	8b 4d 10             	mov    0x10(%ebp),%ecx
 294:	8b 45 0c             	mov    0xc(%ebp),%eax
 297:	fc                   	cld    
 298:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 29a:	89 d0                	mov    %edx,%eax
 29c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
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
=======
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ab:	eb 03                	jmp    2b0 <strchr+0xf>
 2ad:	83 c0 01             	add    $0x1,%eax
 2b0:	0f b6 10             	movzbl (%eax),%edx
 2b3:	84 d2                	test   %dl,%dl
 2b5:	74 06                	je     2bd <strchr+0x1c>
    if(*s == c)
 2b7:	38 ca                	cmp    %cl,%dl
 2b9:	75 f2                	jne    2ad <strchr+0xc>
 2bb:	eb 05                	jmp    2c2 <strchr+0x21>
      return (char*)s;
  return 0;
 2bd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    

000002c4 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	57                   	push   %edi
 2df:	56                   	push   %esi
 2e0:	53                   	push   %ebx
 2e1:	83 ec 1c             	sub    $0x1c,%esp
 2e4:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	56                   	push   %esi
 2c9:	53                   	push   %ebx
 2ca:	83 ec 1c             	sub    $0x1c,%esp
 2cd:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
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
=======
 2d0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d5:	89 de                	mov    %ebx,%esi
 2d7:	83 c3 01             	add    $0x1,%ebx
 2da:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2dd:	7d 2e                	jge    30d <gets+0x49>
    cc = read(0, &c, 1);
 2df:	83 ec 04             	sub    $0x4,%esp
 2e2:	6a 01                	push   $0x1
 2e4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e7:	50                   	push   %eax
 2e8:	6a 00                	push   $0x0
 2ea:	e8 ec 00 00 00       	call   3db <read>
    if(cc < 1)
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	7e 17                	jle    30d <gets+0x49>
      break;
    buf[i++] = c;
 2f6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fa:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2fd:	3c 0a                	cmp    $0xa,%al
 2ff:	0f 94 c2             	sete   %dl
 302:	3c 0d                	cmp    $0xd,%al
 304:	0f 94 c0             	sete   %al
 307:	08 c2                	or     %al,%dl
 309:	74 ca                	je     2d5 <gets+0x11>
    buf[i++] = c;
 30b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 311:	89 f8                	mov    %edi,%eax
 313:	8d 65 f4             	lea    -0xc(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    

0000031b <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	56                   	push   %esi
 336:	53                   	push   %ebx
=======
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	56                   	push   %esi
 31f:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
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
=======
 320:	83 ec 08             	sub    $0x8,%esp
 323:	6a 00                	push   $0x0
 325:	ff 75 08             	push   0x8(%ebp)
 328:	e8 d6 00 00 00       	call   403 <open>
  if(fd < 0)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	78 24                	js     358 <stat+0x3d>
 334:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 336:	83 ec 08             	sub    $0x8,%esp
 339:	ff 75 0c             	push   0xc(%ebp)
 33c:	50                   	push   %eax
 33d:	e8 d9 00 00 00       	call   41b <fstat>
 342:	89 c6                	mov    %eax,%esi
  close(fd);
 344:	89 1c 24             	mov    %ebx,(%esp)
 347:	e8 9f 00 00 00       	call   3eb <close>
  return r;
 34c:	83 c4 10             	add    $0x10,%esp
}
 34f:	89 f0                	mov    %esi,%eax
 351:	8d 65 f8             	lea    -0x8(%ebp),%esp
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
    return -1;
 358:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35d:	eb f0                	jmp    34f <stat+0x34>

0000035f <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
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
=======
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	53                   	push   %ebx
 363:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 366:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 36b:	eb 10                	jmp    37d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 36d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 370:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 373:	83 c1 01             	add    $0x1,%ecx
 376:	0f be c0             	movsbl %al,%eax
 379:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 37d:	0f b6 01             	movzbl (%ecx),%eax
 380:	8d 58 d0             	lea    -0x30(%eax),%ebx
 383:	80 fb 09             	cmp    $0x9,%bl
 386:	76 e5                	jbe    36d <atoi+0xe>
  return n;
}
 388:	89 d0                	mov    %edx,%eax
 38a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38d:	c9                   	leave  
 38e:	c3                   	ret    

0000038f <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 3a6:	55                   	push   %ebp
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	56                   	push   %esi
 3aa:	53                   	push   %ebx
 3ab:	8b 75 08             	mov    0x8(%ebp),%esi
 3ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b1:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 38f:	55                   	push   %ebp
 390:	89 e5                	mov    %esp,%ebp
 392:	56                   	push   %esi
 393:	53                   	push   %ebx
 394:	8b 75 08             	mov    0x8(%ebp),%esi
 397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 39a:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
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
=======
 39d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 39f:	eb 0d                	jmp    3ae <memmove+0x1f>
    *dst++ = *src++;
 3a1:	0f b6 01             	movzbl (%ecx),%eax
 3a4:	88 02                	mov    %al,(%edx)
 3a6:	8d 49 01             	lea    0x1(%ecx),%ecx
 3a9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ac:	89 d8                	mov    %ebx,%eax
 3ae:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b1:	85 c0                	test   %eax,%eax
 3b3:	7f ec                	jg     3a1 <memmove+0x12>
  return vdst;
}
 3b5:	89 f0                	mov    %esi,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5e                   	pop    %esi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    

000003bb <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
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
=======
 3bb:	b8 01 00 00 00       	mov    $0x1,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <exit>:
SYSCALL(exit)
 3c3:	b8 02 00 00 00       	mov    $0x2,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <wait>:
SYSCALL(wait)
 3cb:	b8 03 00 00 00       	mov    $0x3,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <pipe>:
SYSCALL(pipe)
 3d3:	b8 04 00 00 00       	mov    $0x4,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <read>:
SYSCALL(read)
 3db:	b8 05 00 00 00       	mov    $0x5,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <write>:
SYSCALL(write)
 3e3:	b8 10 00 00 00       	mov    $0x10,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <close>:
SYSCALL(close)
 3eb:	b8 15 00 00 00       	mov    $0x15,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <kill>:
SYSCALL(kill)
 3f3:	b8 06 00 00 00       	mov    $0x6,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <exec>:
SYSCALL(exec)
 3fb:	b8 07 00 00 00       	mov    $0x7,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <open>:
SYSCALL(open)
 403:	b8 0f 00 00 00       	mov    $0xf,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <mknod>:
SYSCALL(mknod)
 40b:	b8 11 00 00 00       	mov    $0x11,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <unlink>:
SYSCALL(unlink)
 413:	b8 12 00 00 00       	mov    $0x12,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <fstat>:
SYSCALL(fstat)
 41b:	b8 08 00 00 00       	mov    $0x8,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <link>:
SYSCALL(link)
 423:	b8 13 00 00 00       	mov    $0x13,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mkdir>:
SYSCALL(mkdir)
 42b:	b8 14 00 00 00       	mov    $0x14,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <chdir>:
SYSCALL(chdir)
 433:	b8 09 00 00 00       	mov    $0x9,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <dup>:
SYSCALL(dup)
 43b:	b8 0a 00 00 00       	mov    $0xa,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <getpid>:
SYSCALL(getpid)
 443:	b8 0b 00 00 00       	mov    $0xb,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <sbrk>:
SYSCALL(sbrk)
 44b:	b8 0c 00 00 00       	mov    $0xc,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <sleep>:
SYSCALL(sleep)
 453:	b8 0d 00 00 00       	mov    $0xd,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <uptime>:
SYSCALL(uptime)
 45b:	b8 0e 00 00 00       	mov    $0xe,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <clone>:
SYSCALL(clone)
 463:	b8 16 00 00 00       	mov    $0x16,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <join>:
 46b:	b8 17 00 00 00       	mov    $0x17,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
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
=======
 473:	55                   	push   %ebp
 474:	89 e5                	mov    %esp,%ebp
 476:	83 ec 1c             	sub    $0x1c,%esp
 479:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 47c:	6a 01                	push   $0x1
 47e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 481:	52                   	push   %edx
 482:	50                   	push   %eax
 483:	e8 5b ff ff ff       	call   3e3 <write>
}
 488:	83 c4 10             	add    $0x10,%esp
 48b:	c9                   	leave  
 48c:	c3                   	ret    

0000048d <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	56                   	push   %esi
 4a9:	53                   	push   %ebx
 4aa:	83 ec 2c             	sub    $0x2c,%esp
 4ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b0:	89 d0                	mov    %edx,%eax
 4b2:	89 ce                	mov    %ecx,%esi
=======
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
 490:	57                   	push   %edi
 491:	56                   	push   %esi
 492:	53                   	push   %ebx
 493:	83 ec 2c             	sub    $0x2c,%esp
 496:	89 45 d0             	mov    %eax,-0x30(%ebp)
 499:	89 d0                	mov    %edx,%eax
 49b:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
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
=======
 49d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4a1:	0f 95 c1             	setne  %cl
 4a4:	c1 ea 1f             	shr    $0x1f,%edx
 4a7:	84 d1                	test   %dl,%cl
 4a9:	74 44                	je     4ef <printint+0x62>
    neg = 1;
    x = -xx;
 4ab:	f7 d8                	neg    %eax
 4ad:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4af:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
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
=======
 4b6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4bb:	89 c8                	mov    %ecx,%eax
 4bd:	ba 00 00 00 00       	mov    $0x0,%edx
 4c2:	f7 f6                	div    %esi
 4c4:	89 df                	mov    %ebx,%edi
 4c6:	83 c3 01             	add    $0x1,%ebx
 4c9:	0f b6 92 90 08 00 00 	movzbl 0x890(%edx),%edx
 4d0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4d4:	89 ca                	mov    %ecx,%edx
 4d6:	89 c1                	mov    %eax,%ecx
 4d8:	39 d6                	cmp    %edx,%esi
 4da:	76 df                	jbe    4bb <printint+0x2e>
  if(neg)
 4dc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4e0:	74 31                	je     513 <printint+0x86>
    buf[i++] = '-';
 4e2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4e7:	8d 5f 02             	lea    0x2(%edi),%ebx
 4ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ed:	eb 17                	jmp    506 <printint+0x79>
    x = xx;
 4ef:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4f1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4f8:	eb bc                	jmp    4b6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4fa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4ff:	89 f0                	mov    %esi,%eax
 501:	e8 6d ff ff ff       	call   473 <putc>
  while(--i >= 0)
 506:	83 eb 01             	sub    $0x1,%ebx
 509:	79 ef                	jns    4fa <printint+0x6d>
}
 50b:	83 c4 2c             	add    $0x2c,%esp
 50e:	5b                   	pop    %ebx
 50f:	5e                   	pop    %esi
 510:	5f                   	pop    %edi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    
 513:	8b 75 d0             	mov    -0x30(%ebp),%esi
 516:	eb ee                	jmp    506 <printint+0x79>

00000518 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 52f:	55                   	push   %ebp
 530:	89 e5                	mov    %esp,%ebp
 532:	57                   	push   %edi
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
 535:	83 ec 1c             	sub    $0x1c,%esp
=======
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	57                   	push   %edi
 51c:	56                   	push   %esi
 51d:	53                   	push   %ebx
 51e:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 538:	8d 45 10             	lea    0x10(%ebp),%eax
 53b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 53e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 543:	bb 00 00 00 00       	mov    $0x0,%ebx
 548:	eb 14                	jmp    55e <printf+0x2f>
=======
 521:	8d 45 10             	lea    0x10(%ebp),%eax
 524:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 527:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 52c:	bb 00 00 00 00       	mov    $0x0,%ebx
 531:	eb 14                	jmp    547 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
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
=======
 533:	89 fa                	mov    %edi,%edx
 535:	8b 45 08             	mov    0x8(%ebp),%eax
 538:	e8 36 ff ff ff       	call   473 <putc>
 53d:	eb 05                	jmp    544 <printf+0x2c>
      }
    } else if(state == '%'){
 53f:	83 fe 25             	cmp    $0x25,%esi
 542:	74 25                	je     569 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 544:	83 c3 01             	add    $0x1,%ebx
 547:	8b 45 0c             	mov    0xc(%ebp),%eax
 54a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 54e:	84 c0                	test   %al,%al
 550:	0f 84 20 01 00 00    	je     676 <printf+0x15e>
    c = fmt[i] & 0xff;
 556:	0f be f8             	movsbl %al,%edi
 559:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 55c:	85 f6                	test   %esi,%esi
 55e:	75 df                	jne    53f <printf+0x27>
      if(c == '%'){
 560:	83 f8 25             	cmp    $0x25,%eax
 563:	75 ce                	jne    533 <printf+0x1b>
        state = '%';
 565:	89 c6                	mov    %eax,%esi
 567:	eb db                	jmp    544 <printf+0x2c>
      if(c == 'd'){
 569:	83 f8 25             	cmp    $0x25,%eax
 56c:	0f 84 cf 00 00 00    	je     641 <printf+0x129>
 572:	0f 8c dd 00 00 00    	jl     655 <printf+0x13d>
 578:	83 f8 78             	cmp    $0x78,%eax
 57b:	0f 8f d4 00 00 00    	jg     655 <printf+0x13d>
 581:	83 f8 63             	cmp    $0x63,%eax
 584:	0f 8c cb 00 00 00    	jl     655 <printf+0x13d>
 58a:	83 e8 63             	sub    $0x63,%eax
 58d:	83 f8 15             	cmp    $0x15,%eax
 590:	0f 87 bf 00 00 00    	ja     655 <printf+0x13d>
 596:	ff 24 85 38 08 00 00 	jmp    *0x838(,%eax,4)
        printint(fd, *ap, 10, 1);
 59d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a0:	8b 17                	mov    (%edi),%edx
 5a2:	83 ec 0c             	sub    $0xc,%esp
 5a5:	6a 01                	push   $0x1
 5a7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	e8 d9 fe ff ff       	call   48d <printint>
        ap++;
 5b4:	83 c7 04             	add    $0x4,%edi
 5b7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5ba:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
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
=======
 5bd:	be 00 00 00 00       	mov    $0x0,%esi
 5c2:	eb 80                	jmp    544 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c7:	8b 17                	mov    (%edi),%edx
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	6a 00                	push   $0x0
 5ce:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	e8 b2 fe ff ff       	call   48d <printint>
        ap++;
 5db:	83 c7 04             	add    $0x4,%edi
 5de:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e4:	be 00 00 00 00       	mov    $0x0,%esi
 5e9:	e9 56 ff ff ff       	jmp    544 <printf+0x2c>
        s = (char*)*ap;
 5ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f1:	8b 30                	mov    (%eax),%esi
        ap++;
 5f3:	83 c0 04             	add    $0x4,%eax
 5f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5f9:	85 f6                	test   %esi,%esi
 5fb:	75 15                	jne    612 <printf+0xfa>
          s = "(null)";
 5fd:	be 2e 08 00 00       	mov    $0x82e,%esi
 602:	eb 0e                	jmp    612 <printf+0xfa>
          putc(fd, *s);
 604:	0f be d2             	movsbl %dl,%edx
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	e8 64 fe ff ff       	call   473 <putc>
          s++;
 60f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 612:	0f b6 16             	movzbl (%esi),%edx
 615:	84 d2                	test   %dl,%dl
 617:	75 eb                	jne    604 <printf+0xec>
      state = 0;
 619:	be 00 00 00 00       	mov    $0x0,%esi
 61e:	e9 21 ff ff ff       	jmp    544 <printf+0x2c>
        putc(fd, *ap);
 623:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 626:	0f be 17             	movsbl (%edi),%edx
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	e8 42 fe ff ff       	call   473 <putc>
        ap++;
 631:	83 c7 04             	add    $0x4,%edi
 634:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 637:	be 00 00 00 00       	mov    $0x0,%esi
 63c:	e9 03 ff ff ff       	jmp    544 <printf+0x2c>
        putc(fd, c);
 641:	89 fa                	mov    %edi,%edx
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	e8 28 fe ff ff       	call   473 <putc>
      state = 0;
 64b:	be 00 00 00 00       	mov    $0x0,%esi
 650:	e9 ef fe ff ff       	jmp    544 <printf+0x2c>
        putc(fd, '%');
 655:	ba 25 00 00 00       	mov    $0x25,%edx
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	e8 11 fe ff ff       	call   473 <putc>
        putc(fd, c);
 662:	89 fa                	mov    %edi,%edx
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	e8 07 fe ff ff       	call   473 <putc>
      state = 0;
 66c:	be 00 00 00 00       	mov    $0x0,%esi
 671:	e9 ce fe ff ff       	jmp    544 <printf+0x2c>
    }
  }
}
 676:	8d 65 f4             	lea    -0xc(%ebp),%esp
 679:	5b                   	pop    %ebx
 67a:	5e                   	pop    %esi
 67b:	5f                   	pop    %edi
 67c:	5d                   	pop    %ebp
 67d:	c3                   	ret    

0000067e <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
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
=======
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	57                   	push   %edi
 682:	56                   	push   %esi
 683:	53                   	push   %ebx
 684:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 687:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68a:	a1 40 0f 00 00       	mov    0xf40,%eax
 68f:	eb 02                	jmp    693 <free+0x15>
 691:	89 d0                	mov    %edx,%eax
 693:	39 c8                	cmp    %ecx,%eax
 695:	73 04                	jae    69b <free+0x1d>
 697:	39 08                	cmp    %ecx,(%eax)
 699:	77 12                	ja     6ad <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69b:	8b 10                	mov    (%eax),%edx
 69d:	39 c2                	cmp    %eax,%edx
 69f:	77 f0                	ja     691 <free+0x13>
 6a1:	39 c8                	cmp    %ecx,%eax
 6a3:	72 08                	jb     6ad <free+0x2f>
 6a5:	39 ca                	cmp    %ecx,%edx
 6a7:	77 04                	ja     6ad <free+0x2f>
 6a9:	89 d0                	mov    %edx,%eax
 6ab:	eb e6                	jmp    693 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ad:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6b0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6b3:	8b 10                	mov    (%eax),%edx
 6b5:	39 d7                	cmp    %edx,%edi
 6b7:	74 19                	je     6d2 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 6d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d3:	8b 50 04             	mov    0x4(%eax),%edx
 6d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d9:	39 ce                	cmp    %ecx,%esi
 6db:	74 1b                	je     6f8 <free+0x63>
=======
 6b9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bc:	8b 50 04             	mov    0x4(%eax),%edx
 6bf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c2:	39 ce                	cmp    %ecx,%esi
 6c4:	74 1b                	je     6e1 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
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
=======
 6c6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c8:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6d2:	03 72 04             	add    0x4(%edx),%esi
 6d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d8:	8b 10                	mov    (%eax),%edx
 6da:	8b 12                	mov    (%edx),%edx
 6dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6df:	eb db                	jmp    6bc <free+0x3e>
    p->s.size += bp->s.size;
 6e1:	03 53 fc             	add    -0x4(%ebx),%edx
 6e4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ea:	89 10                	mov    %edx,(%eax)
 6ec:	eb da                	jmp    6c8 <free+0x4a>

000006ee <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 705:	55                   	push   %ebp
 706:	89 e5                	mov    %esp,%ebp
 708:	53                   	push   %ebx
 709:	83 ec 04             	sub    $0x4,%esp
 70c:	89 c3                	mov    %eax,%ebx
=======
 6ee:	55                   	push   %ebp
 6ef:	89 e5                	mov    %esp,%ebp
 6f1:	53                   	push   %ebx
 6f2:	83 ec 04             	sub    $0x4,%esp
 6f5:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
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
=======
 6f7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6fc:	77 05                	ja     703 <morecore+0x15>
    nu = 4096;
 6fe:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 703:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 70a:	83 ec 0c             	sub    $0xc,%esp
 70d:	50                   	push   %eax
 70e:	e8 38 fd ff ff       	call   44b <sbrk>
  if(p == (char*)-1)
 713:	83 c4 10             	add    $0x10,%esp
 716:	83 f8 ff             	cmp    $0xffffffff,%eax
 719:	74 1c                	je     737 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 71b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71e:	83 c0 08             	add    $0x8,%eax
 721:	83 ec 0c             	sub    $0xc,%esp
 724:	50                   	push   %eax
 725:	e8 54 ff ff ff       	call   67e <free>
  return freep;
 72a:	a1 40 0f 00 00       	mov    0xf40,%eax
 72f:	83 c4 10             	add    $0x10,%esp
}
 732:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 735:	c9                   	leave  
 736:	c3                   	ret    
    return 0;
 737:	b8 00 00 00 00       	mov    $0x0,%eax
 73c:	eb f4                	jmp    732 <morecore+0x44>

0000073e <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 755:	55                   	push   %ebp
 756:	89 e5                	mov    %esp,%ebp
 758:	53                   	push   %ebx
 759:	83 ec 04             	sub    $0x4,%esp
=======
 73e:	55                   	push   %ebp
 73f:	89 e5                	mov    %esp,%ebp
 741:	53                   	push   %ebx
 742:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 75c:	8b 45 08             	mov    0x8(%ebp),%eax
 75f:	8d 58 07             	lea    0x7(%eax),%ebx
 762:	c1 eb 03             	shr    $0x3,%ebx
 765:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 768:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 76e:	85 c9                	test   %ecx,%ecx
 770:	74 04                	je     776 <malloc+0x21>
=======
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	8d 58 07             	lea    0x7(%eax),%ebx
 74b:	c1 eb 03             	shr    $0x3,%ebx
 74e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 751:	8b 0d 40 0f 00 00    	mov    0xf40,%ecx
 757:	85 c9                	test   %ecx,%ecx
 759:	74 04                	je     75f <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
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
=======
 75b:	8b 01                	mov    (%ecx),%eax
 75d:	eb 4a                	jmp    7a9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 75f:	c7 05 40 0f 00 00 44 	movl   $0xf44,0xf40
 766:	0f 00 00 
 769:	c7 05 44 0f 00 00 44 	movl   $0xf44,0xf44
 770:	0f 00 00 
    base.s.size = 0;
 773:	c7 05 48 0f 00 00 00 	movl   $0x0,0xf48
 77a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 77d:	b9 44 0f 00 00       	mov    $0xf44,%ecx
 782:	eb d7                	jmp    75b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 784:	74 19                	je     79f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 786:	29 da                	sub    %ebx,%edx
 788:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 78e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 791:	89 0d 40 0f 00 00    	mov    %ecx,0xf40
      return (void*)(p + 1);
 797:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
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
=======
 79a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 79d:	c9                   	leave  
 79e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 79f:	8b 10                	mov    (%eax),%edx
 7a1:	89 11                	mov    %edx,(%ecx)
 7a3:	eb ec                	jmp    791 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a5:	89 c1                	mov    %eax,%ecx
 7a7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7a9:	8b 50 04             	mov    0x4(%eax),%edx
 7ac:	39 da                	cmp    %ebx,%edx
 7ae:	73 d4                	jae    784 <malloc+0x46>
    if(p == freep)
 7b0:	39 05 40 0f 00 00    	cmp    %eax,0xf40
 7b6:	75 ed                	jne    7a5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7b8:	89 d8                	mov    %ebx,%eax
 7ba:	e8 2f ff ff ff       	call   6ee <morecore>
 7bf:	85 c0                	test   %eax,%eax
 7c1:	75 e2                	jne    7a5 <malloc+0x67>
 7c3:	eb d5                	jmp    79a <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
