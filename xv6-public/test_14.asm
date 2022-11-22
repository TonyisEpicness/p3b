
_test_14:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <worker+0x30>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <worker+0x79>
   assert(global == 1);
<<<<<<< HEAD
  18:	a1 90 0d 00 00       	mov    0xd90,%eax
=======
  18:	a1 74 0d 00 00       	mov    0xd74,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
<<<<<<< HEAD
  29:	a3 90 0d 00 00       	mov    %eax,0xd90
=======
  29:	a3 74 0d 00 00       	mov    %eax,0xd74
>>>>>>> c59b0f9 (fixed thread_join and join)
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
<<<<<<< HEAD
  32:	68 00 09 00 00       	push   $0x900
  37:	68 0a 09 00 00       	push   $0x90a
  3c:	6a 01                	push   $0x1
  3e:	e8 0d 06 00 00       	call   650 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 12 09 00 00       	push   $0x912
  4b:	68 1d 09 00 00       	push   $0x91d
  50:	6a 01                	push   $0x1
  52:	e8 f9 05 00 00       	call   650 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 31 09 00 00       	push   $0x931
  5f:	6a 01                	push   $0x1
  61:	e8 ea 05 00 00       	call   650 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 a0 0d 00 00    	push   0xda0
  6f:	e8 b7 04 00 00       	call   52b <kill>
  74:	e8 82 04 00 00       	call   4fb <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 00 09 00 00       	push   $0x900
  80:	68 0a 09 00 00       	push   $0x90a
  85:	6a 01                	push   $0x1
  87:	e8 c4 05 00 00       	call   650 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 3e 09 00 00       	push   $0x93e
  94:	68 1d 09 00 00       	push   $0x91d
  99:	6a 01                	push   $0x1
  9b:	e8 b0 05 00 00       	call   650 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 31 09 00 00       	push   $0x931
  a8:	6a 01                	push   $0x1
  aa:	e8 a1 05 00 00       	call   650 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 a0 0d 00 00    	push   0xda0
  b8:	e8 6e 04 00 00       	call   52b <kill>
  bd:	e8 39 04 00 00       	call   4fb <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 00 09 00 00       	push   $0x900
  c9:	68 0a 09 00 00       	push   $0x90a
  ce:	6a 01                	push   $0x1
  d0:	e8 7b 05 00 00       	call   650 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 49 09 00 00       	push   $0x949
  dd:	68 1d 09 00 00       	push   $0x91d
  e2:	6a 01                	push   $0x1
  e4:	e8 67 05 00 00       	call   650 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 31 09 00 00       	push   $0x931
  f1:	6a 01                	push   $0x1
  f3:	e8 58 05 00 00       	call   650 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 a0 0d 00 00    	push   0xda0
 101:	e8 25 04 00 00       	call   52b <kill>
 106:	e8 f0 03 00 00       	call   4fb <exit>
=======
  32:	68 e8 08 00 00       	push   $0x8e8
  37:	68 f2 08 00 00       	push   $0x8f2
  3c:	6a 01                	push   $0x1
  3e:	e8 f6 05 00 00       	call   639 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 fa 08 00 00       	push   $0x8fa
  4b:	68 05 09 00 00       	push   $0x905
  50:	6a 01                	push   $0x1
  52:	e8 e2 05 00 00       	call   639 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 19 09 00 00       	push   $0x919
  5f:	6a 01                	push   $0x1
  61:	e8 d3 05 00 00       	call   639 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 80 0d 00 00    	push   0xd80
  6f:	e8 a0 04 00 00       	call   514 <kill>
  74:	e8 6b 04 00 00       	call   4e4 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 e8 08 00 00       	push   $0x8e8
  80:	68 f2 08 00 00       	push   $0x8f2
  85:	6a 01                	push   $0x1
  87:	e8 ad 05 00 00       	call   639 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 26 09 00 00       	push   $0x926
  94:	68 05 09 00 00       	push   $0x905
  99:	6a 01                	push   $0x1
  9b:	e8 99 05 00 00       	call   639 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 19 09 00 00       	push   $0x919
  a8:	6a 01                	push   $0x1
  aa:	e8 8a 05 00 00       	call   639 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 80 0d 00 00    	push   0xd80
  b8:	e8 57 04 00 00       	call   514 <kill>
  bd:	e8 22 04 00 00       	call   4e4 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 e8 08 00 00       	push   $0x8e8
  c9:	68 f2 08 00 00       	push   $0x8f2
  ce:	6a 01                	push   $0x1
  d0:	e8 64 05 00 00       	call   639 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 31 09 00 00       	push   $0x931
  dd:	68 05 09 00 00       	push   $0x905
  e2:	6a 01                	push   $0x1
  e4:	e8 50 05 00 00       	call   639 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 19 09 00 00       	push   $0x919
  f1:	6a 01                	push   $0x1
  f3:	e8 41 05 00 00       	call   639 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 80 0d 00 00    	push   0xd80
 101:	e8 0e 04 00 00       	call   514 <kill>
 106:	e8 d9 03 00 00       	call   4e4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000010b <main>:
{
 10b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
 112:	ff 71 fc             	push   -0x4(%ecx)
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	51                   	push   %ecx
 11a:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
<<<<<<< HEAD
 11d:	e8 59 04 00 00       	call   57b <getpid>
 122:	a3 a0 0d 00 00       	mov    %eax,0xda0
=======
 11d:	e8 42 04 00 00       	call   564 <getpid>
 122:	a3 80 0d 00 00       	mov    %eax,0xd80
>>>>>>> c59b0f9 (fixed thread_join and join)
   int arg1 = 42, arg2 = 24;
 127:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 12e:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8d 45 f0             	lea    -0x10(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 13f:	50                   	push   %eax
 140:	68 00 00 00 00       	push   $0x0
 145:	e8 23 01 00 00       	call   26d <thread_create>
   assert(thread_pid > 0);
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	7e 65                	jle    1b6 <main+0xab>
 151:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
<<<<<<< HEAD
 153:	e8 75 01 00 00       	call   2cd <thread_join>
=======
 153:	e8 8b 01 00 00       	call   2e3 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
<<<<<<< HEAD
 160:	83 3d 90 0d 00 00 02 	cmpl   $0x2,0xd90
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 00 09 00 00       	push   $0x900
 174:	68 0a 09 00 00       	push   $0x90a
 179:	6a 01                	push   $0x1
 17b:	e8 d0 04 00 00       	call   650 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 7b 09 00 00       	push   $0x97b
 188:	68 1d 09 00 00       	push   $0x91d
 18d:	6a 01                	push   $0x1
 18f:	e8 bc 04 00 00       	call   650 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 31 09 00 00       	push   $0x931
 19c:	6a 01                	push   $0x1
 19e:	e8 ad 04 00 00       	call   650 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 a0 0d 00 00    	push   0xda0
 1ac:	e8 7a 03 00 00       	call   52b <kill>
 1b1:	e8 45 03 00 00       	call   4fb <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 00 09 00 00       	push   $0x900
 1bd:	68 0a 09 00 00       	push   $0x90a
 1c2:	6a 01                	push   $0x1
 1c4:	e8 87 04 00 00       	call   650 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 55 09 00 00       	push   $0x955
 1d1:	68 1d 09 00 00       	push   $0x91d
 1d6:	6a 01                	push   $0x1
 1d8:	e8 73 04 00 00       	call   650 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 31 09 00 00       	push   $0x931
 1e5:	6a 01                	push   $0x1
 1e7:	e8 64 04 00 00       	call   650 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 a0 0d 00 00    	push   0xda0
 1f5:	e8 31 03 00 00       	call   52b <kill>
 1fa:	e8 fc 02 00 00       	call   4fb <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 00 09 00 00       	push   $0x900
 206:	68 0a 09 00 00       	push   $0x90a
 20b:	6a 01                	push   $0x1
 20d:	e8 3e 04 00 00       	call   650 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 64 09 00 00       	push   $0x964
 21a:	68 1d 09 00 00       	push   $0x91d
 21f:	6a 01                	push   $0x1
 221:	e8 2a 04 00 00       	call   650 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 31 09 00 00       	push   $0x931
 22e:	6a 01                	push   $0x1
 230:	e8 1b 04 00 00       	call   650 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 a0 0d 00 00    	push   0xda0
 23e:	e8 e8 02 00 00       	call   52b <kill>
 243:	e8 b3 02 00 00       	call   4fb <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 87 09 00 00       	push   $0x987
 250:	6a 01                	push   $0x1
 252:	e8 f9 03 00 00       	call   650 <printf>
   exit();
 257:	e8 9f 02 00 00       	call   4fb <exit>
=======
 160:	83 3d 74 0d 00 00 02 	cmpl   $0x2,0xd74
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 e8 08 00 00       	push   $0x8e8
 174:	68 f2 08 00 00       	push   $0x8f2
 179:	6a 01                	push   $0x1
 17b:	e8 b9 04 00 00       	call   639 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 63 09 00 00       	push   $0x963
 188:	68 05 09 00 00       	push   $0x905
 18d:	6a 01                	push   $0x1
 18f:	e8 a5 04 00 00       	call   639 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 19 09 00 00       	push   $0x919
 19c:	6a 01                	push   $0x1
 19e:	e8 96 04 00 00       	call   639 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 80 0d 00 00    	push   0xd80
 1ac:	e8 63 03 00 00       	call   514 <kill>
 1b1:	e8 2e 03 00 00       	call   4e4 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 e8 08 00 00       	push   $0x8e8
 1bd:	68 f2 08 00 00       	push   $0x8f2
 1c2:	6a 01                	push   $0x1
 1c4:	e8 70 04 00 00       	call   639 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 3d 09 00 00       	push   $0x93d
 1d1:	68 05 09 00 00       	push   $0x905
 1d6:	6a 01                	push   $0x1
 1d8:	e8 5c 04 00 00       	call   639 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 19 09 00 00       	push   $0x919
 1e5:	6a 01                	push   $0x1
 1e7:	e8 4d 04 00 00       	call   639 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 80 0d 00 00    	push   0xd80
 1f5:	e8 1a 03 00 00       	call   514 <kill>
 1fa:	e8 e5 02 00 00       	call   4e4 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 e8 08 00 00       	push   $0x8e8
 206:	68 f2 08 00 00       	push   $0x8f2
 20b:	6a 01                	push   $0x1
 20d:	e8 27 04 00 00       	call   639 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 4c 09 00 00       	push   $0x94c
 21a:	68 05 09 00 00       	push   $0x905
 21f:	6a 01                	push   $0x1
 221:	e8 13 04 00 00       	call   639 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 19 09 00 00       	push   $0x919
 22e:	6a 01                	push   $0x1
 230:	e8 04 04 00 00       	call   639 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 80 0d 00 00    	push   0xd80
 23e:	e8 d1 02 00 00       	call   514 <kill>
 243:	e8 9c 02 00 00       	call   4e4 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 6f 09 00 00       	push   $0x96f
 250:	6a 01                	push   $0x1
 252:	e8 e2 03 00 00       	call   639 <printf>
   exit();
 257:	e8 88 02 00 00       	call   4e4 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000025c <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 262:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 264:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 267:	89 08                	mov    %ecx,(%eax)
  return old;
}
 269:	89 d0                	mov    %edx,%eax
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	53                   	push   %ebx
 271:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 274:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 279:	e8 f8 05 00 00       	call   876 <malloc>
  if(n_stack == 0){
 27e:	83 c4 10             	add    $0x10,%esp
 281:	85 c0                	test   %eax,%eax
 283:	74 41                	je     2c6 <thread_create+0x59>
 285:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 287:	50                   	push   %eax
 288:	ff 75 10             	push   0x10(%ebp)
 28b:	ff 75 0c             	push   0xc(%ebp)
 28e:	ff 75 08             	push   0x8(%ebp)
 291:	e8 05 03 00 00       	call   59b <clone>
=======
 279:	e8 e1 05 00 00       	call   85f <malloc>
  if(n_stack == 0){
 27e:	83 c4 10             	add    $0x10,%esp
 281:	85 c0                	test   %eax,%eax
 283:	74 57                	je     2dc <thread_create+0x6f>
 285:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 287:	b8 00 00 00 00       	mov    $0x0,%eax
 28c:	eb 03                	jmp    291 <thread_create+0x24>
 28e:	83 c0 01             	add    $0x1,%eax
 291:	83 f8 3f             	cmp    $0x3f,%eax
 294:	7f 2f                	jg     2c5 <thread_create+0x58>
    if(threads[i].flag==0){
 296:	8d 14 40             	lea    (%eax,%eax,2),%edx
 299:	83 3c 95 a8 0d 00 00 	cmpl   $0x0,0xda8(,%edx,4)
 2a0:	00 
 2a1:	75 eb                	jne    28e <thread_create+0x21>
      threads[i].maddr = n_stack;
 2a3:	8d 14 00             	lea    (%eax,%eax,1),%edx
 2a6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 2a9:	c1 e3 02             	shl    $0x2,%ebx
 2ac:	89 8b a0 0d 00 00    	mov    %ecx,0xda0(%ebx)
      threads[i].pg1addr = n_stack;
 2b2:	89 8b a4 0d 00 00    	mov    %ecx,0xda4(%ebx)
      threads[i].flag = 1;
 2b8:	01 c2                	add    %eax,%edx
 2ba:	c7 04 95 a8 0d 00 00 	movl   $0x1,0xda8(,%edx,4)
 2c1:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2c5:	51                   	push   %ecx
 2c6:	ff 75 10             	push   0x10(%ebp)
 2c9:	ff 75 0c             	push   0xc(%ebp)
 2cc:	ff 75 08             	push   0x8(%ebp)
 2cf:	e8 b0 02 00 00       	call   584 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 296:	83 c4 10             	add    $0x10,%esp
 299:	ba 00 00 00 00       	mov    $0x0,%edx
 29e:	eb 03                	jmp    2a3 <thread_create+0x36>
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	83 fa 3f             	cmp    $0x3f,%edx
 2a6:	7f 19                	jg     2c1 <thread_create+0x54>
    if(threads[i]->flag==0){
 2a8:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 2af:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2b3:	75 eb                	jne    2a0 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 2b5:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 2b7:	8b 14 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%edx
 2be:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 2c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    
    return -1;
 2c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cb:	eb f4                	jmp    2c1 <thread_create+0x54>

000002cd <thread_join>:
=======
 2d4:	83 c4 10             	add    $0x10,%esp
}
 2d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2da:	c9                   	leave  
 2db:	c3                   	ret    
    return -1;
 2dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e1:	eb f4                	jmp    2d7 <thread_create+0x6a>

000002e3 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2d8:	50                   	push   %eax
 2d9:	e8 c5 02 00 00       	call   5a3 <join>
 2de:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	bb 00 00 00 00       	mov    $0x0,%ebx
 2e8:	eb 03                	jmp    2ed <thread_join+0x20>
 2ea:	83 c3 01             	add    $0x1,%ebx
 2ed:	83 fb 3f             	cmp    $0x3f,%ebx
 2f0:	7f 23                	jg     315 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2f2:	8b 04 9d c0 0d 00 00 	mov    0xdc0(,%ebx,4),%eax
 2f9:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 2fd:	75 eb                	jne    2ea <thread_join+0x1d>
 2ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
 302:	39 50 04             	cmp    %edx,0x4(%eax)
 305:	75 e3                	jne    2ea <thread_join+0x1d>
      free(stk_addr);
 307:	83 ec 0c             	sub    $0xc,%esp
 30a:	52                   	push   %edx
 30b:	e8 a6 04 00 00       	call   7b6 <free>
 310:	83 c4 10             	add    $0x10,%esp
 313:	eb d5                	jmp    2ea <thread_join+0x1d>
    }
  }
  return pid;
}
 315:	89 f0                	mov    %esi,%eax
 317:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31a:	5b                   	pop    %ebx
 31b:	5e                   	pop    %esi
 31c:	5d                   	pop    %ebp
 31d:	c3                   	ret    

0000031e <lock_acquire>:

void lock_acquire(lock_t *lock){
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	53                   	push   %ebx
 322:	83 ec 04             	sub    $0x4,%esp
 325:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	6a 01                	push   $0x1
 32d:	53                   	push   %ebx
 32e:	e8 29 ff ff ff       	call   25c <test_and_set>
 333:	83 c4 10             	add    $0x10,%esp
 336:	83 f8 01             	cmp    $0x1,%eax
 339:	74 ed                	je     328 <lock_acquire+0xa>
    ;
}
 33b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33e:	c9                   	leave  
 33f:	c3                   	ret    

00000340 <lock_release>:

void lock_release(lock_t *lock) {
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 34c:	5d                   	pop    %ebp
 34d:	c3                   	ret    

0000034e <lock_init>:

void lock_init(lock_t *lock) {
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcpy>:
=======
 2e3:	55                   	push   %ebp
 2e4:	89 e5                	mov    %esp,%ebp
 2e6:	53                   	push   %ebx
 2e7:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2ea:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ed:	50                   	push   %eax
 2ee:	e8 99 02 00 00       	call   58c <join>
 2f3:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 2f5:	83 c4 04             	add    $0x4,%esp
 2f8:	ff 75 f4             	push   -0xc(%ebp)
 2fb:	e8 9f 04 00 00       	call   79f <free>
  return pid;
}
 300:	89 d8                	mov    %ebx,%eax
 302:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 305:	c9                   	leave  
 306:	c3                   	ret    

00000307 <lock_acquire>:

void lock_acquire(lock_t *lock){
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	53                   	push   %ebx
 30b:	83 ec 04             	sub    $0x4,%esp
 30e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 311:	83 ec 08             	sub    $0x8,%esp
 314:	6a 01                	push   $0x1
 316:	53                   	push   %ebx
 317:	e8 40 ff ff ff       	call   25c <test_and_set>
 31c:	83 c4 10             	add    $0x10,%esp
 31f:	83 f8 01             	cmp    $0x1,%eax
 322:	74 ed                	je     311 <lock_acquire+0xa>
    ;
}
 324:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 327:	c9                   	leave  
 328:	c3                   	ret    

00000329 <lock_release>:

void lock_release(lock_t *lock) {
 329:	55                   	push   %ebp
 32a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 32c:	8b 45 08             	mov    0x8(%ebp),%eax
 32f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 335:	5d                   	pop    %ebp
 336:	c3                   	ret    

00000337 <lock_init>:

void lock_init(lock_t *lock) {
 337:	55                   	push   %ebp
 338:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 343:	5d                   	pop    %ebp
 344:	c3                   	ret    

00000345 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	56                   	push   %esi
 360:	53                   	push   %ebx
 361:	8b 75 08             	mov    0x8(%ebp),%esi
 364:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 345:	55                   	push   %ebp
 346:	89 e5                	mov    %esp,%ebp
 348:	56                   	push   %esi
 349:	53                   	push   %ebx
 34a:	8b 75 08             	mov    0x8(%ebp),%esi
 34d:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 367:	89 f0                	mov    %esi,%eax
 369:	89 d1                	mov    %edx,%ecx
 36b:	83 c2 01             	add    $0x1,%edx
 36e:	89 c3                	mov    %eax,%ebx
 370:	83 c0 01             	add    $0x1,%eax
 373:	0f b6 09             	movzbl (%ecx),%ecx
 376:	88 0b                	mov    %cl,(%ebx)
 378:	84 c9                	test   %cl,%cl
 37a:	75 ed                	jne    369 <strcpy+0xd>
    ;
  return os;
}
 37c:	89 f0                	mov    %esi,%eax
 37e:	5b                   	pop    %ebx
 37f:	5e                   	pop    %esi
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <strcmp>:
=======
 350:	89 f0                	mov    %esi,%eax
 352:	89 d1                	mov    %edx,%ecx
 354:	83 c2 01             	add    $0x1,%edx
 357:	89 c3                	mov    %eax,%ebx
 359:	83 c0 01             	add    $0x1,%eax
 35c:	0f b6 09             	movzbl (%ecx),%ecx
 35f:	88 0b                	mov    %cl,(%ebx)
 361:	84 c9                	test   %cl,%cl
 363:	75 ed                	jne    352 <strcpy+0xd>
    ;
  return os;
}
 365:	89 f0                	mov    %esi,%eax
 367:	5b                   	pop    %ebx
 368:	5e                   	pop    %esi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    

0000036b <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	8b 4d 08             	mov    0x8(%ebp),%ecx
 388:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 38b:	eb 06                	jmp    393 <strcmp+0x11>
    p++, q++;
 38d:	83 c1 01             	add    $0x1,%ecx
 390:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 393:	0f b6 01             	movzbl (%ecx),%eax
 396:	84 c0                	test   %al,%al
 398:	74 04                	je     39e <strcmp+0x1c>
 39a:	3a 02                	cmp    (%edx),%al
 39c:	74 ef                	je     38d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 39e:	0f b6 c0             	movzbl %al,%eax
 3a1:	0f b6 12             	movzbl (%edx),%edx
 3a4:	29 d0                	sub    %edx,%eax
}
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    

000003a8 <strlen>:
=======
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 371:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 374:	eb 06                	jmp    37c <strcmp+0x11>
    p++, q++;
 376:	83 c1 01             	add    $0x1,%ecx
 379:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 37c:	0f b6 01             	movzbl (%ecx),%eax
 37f:	84 c0                	test   %al,%al
 381:	74 04                	je     387 <strcmp+0x1c>
 383:	3a 02                	cmp    (%edx),%al
 385:	74 ef                	je     376 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 387:	0f b6 c0             	movzbl %al,%eax
 38a:	0f b6 12             	movzbl (%edx),%edx
 38d:	29 d0                	sub    %edx,%eax
}
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    

00000391 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ae:	b8 00 00 00 00       	mov    $0x0,%eax
 3b3:	eb 03                	jmp    3b8 <strlen+0x10>
 3b5:	83 c0 01             	add    $0x1,%eax
 3b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3bc:	75 f7                	jne    3b5 <strlen+0xd>
    ;
  return n;
}
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <memset>:
=======
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 397:	b8 00 00 00 00       	mov    $0x0,%eax
 39c:	eb 03                	jmp    3a1 <strlen+0x10>
 39e:	83 c0 01             	add    $0x1,%eax
 3a1:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3a5:	75 f7                	jne    39e <strlen+0xd>
    ;
  return n;
}
 3a7:	5d                   	pop    %ebp
 3a8:	c3                   	ret    

000003a9 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 3a9:	55                   	push   %ebp
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	57                   	push   %edi
 3ad:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 3c7:	89 d7                	mov    %edx,%edi
 3c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cf:	fc                   	cld    
 3d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d2:	89 d0                	mov    %edx,%eax
 3d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    

000003d9 <strchr>:
=======
 3b0:	89 d7                	mov    %edx,%edi
 3b2:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b8:	fc                   	cld    
 3b9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3bb:	89 d0                	mov    %edx,%eax
 3bd:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3c0:	c9                   	leave  
 3c1:	c3                   	ret    

000003c2 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3e3:	eb 03                	jmp    3e8 <strchr+0xf>
 3e5:	83 c0 01             	add    $0x1,%eax
 3e8:	0f b6 10             	movzbl (%eax),%edx
 3eb:	84 d2                	test   %dl,%dl
 3ed:	74 06                	je     3f5 <strchr+0x1c>
    if(*s == c)
 3ef:	38 ca                	cmp    %cl,%dl
 3f1:	75 f2                	jne    3e5 <strchr+0xc>
 3f3:	eb 05                	jmp    3fa <strchr+0x21>
      return (char*)s;
  return 0;
 3f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    

000003fc <gets>:
=======
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	8b 45 08             	mov    0x8(%ebp),%eax
 3c8:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3cc:	eb 03                	jmp    3d1 <strchr+0xf>
 3ce:	83 c0 01             	add    $0x1,%eax
 3d1:	0f b6 10             	movzbl (%eax),%edx
 3d4:	84 d2                	test   %dl,%dl
 3d6:	74 06                	je     3de <strchr+0x1c>
    if(*s == c)
 3d8:	38 ca                	cmp    %cl,%dl
 3da:	75 f2                	jne    3ce <strchr+0xc>
 3dc:	eb 05                	jmp    3e3 <strchr+0x21>
      return (char*)s;
  return 0;
 3de:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	57                   	push   %edi
 400:	56                   	push   %esi
 401:	53                   	push   %ebx
 402:	83 ec 1c             	sub    $0x1c,%esp
 405:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	57                   	push   %edi
 3e9:	56                   	push   %esi
 3ea:	53                   	push   %ebx
 3eb:	83 ec 1c             	sub    $0x1c,%esp
 3ee:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 408:	bb 00 00 00 00       	mov    $0x0,%ebx
 40d:	89 de                	mov    %ebx,%esi
 40f:	83 c3 01             	add    $0x1,%ebx
 412:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 415:	7d 2e                	jge    445 <gets+0x49>
    cc = read(0, &c, 1);
 417:	83 ec 04             	sub    $0x4,%esp
 41a:	6a 01                	push   $0x1
 41c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 41f:	50                   	push   %eax
 420:	6a 00                	push   $0x0
 422:	e8 ec 00 00 00       	call   513 <read>
    if(cc < 1)
 427:	83 c4 10             	add    $0x10,%esp
 42a:	85 c0                	test   %eax,%eax
 42c:	7e 17                	jle    445 <gets+0x49>
      break;
    buf[i++] = c;
 42e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 432:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 435:	3c 0a                	cmp    $0xa,%al
 437:	0f 94 c2             	sete   %dl
 43a:	3c 0d                	cmp    $0xd,%al
 43c:	0f 94 c0             	sete   %al
 43f:	08 c2                	or     %al,%dl
 441:	74 ca                	je     40d <gets+0x11>
    buf[i++] = c;
 443:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 445:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 449:	89 f8                	mov    %edi,%eax
 44b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5f                   	pop    %edi
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    

00000453 <stat>:
=======
 3f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f6:	89 de                	mov    %ebx,%esi
 3f8:	83 c3 01             	add    $0x1,%ebx
 3fb:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3fe:	7d 2e                	jge    42e <gets+0x49>
    cc = read(0, &c, 1);
 400:	83 ec 04             	sub    $0x4,%esp
 403:	6a 01                	push   $0x1
 405:	8d 45 e7             	lea    -0x19(%ebp),%eax
 408:	50                   	push   %eax
 409:	6a 00                	push   $0x0
 40b:	e8 ec 00 00 00       	call   4fc <read>
    if(cc < 1)
 410:	83 c4 10             	add    $0x10,%esp
 413:	85 c0                	test   %eax,%eax
 415:	7e 17                	jle    42e <gets+0x49>
      break;
    buf[i++] = c;
 417:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 41b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 41e:	3c 0a                	cmp    $0xa,%al
 420:	0f 94 c2             	sete   %dl
 423:	3c 0d                	cmp    $0xd,%al
 425:	0f 94 c0             	sete   %al
 428:	08 c2                	or     %al,%dl
 42a:	74 ca                	je     3f6 <gets+0x11>
    buf[i++] = c;
 42c:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 42e:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 432:	89 f8                	mov    %edi,%eax
 434:	8d 65 f4             	lea    -0xc(%ebp),%esp
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    

0000043c <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
 456:	56                   	push   %esi
 457:	53                   	push   %ebx
=======
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	56                   	push   %esi
 440:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 458:	83 ec 08             	sub    $0x8,%esp
 45b:	6a 00                	push   $0x0
 45d:	ff 75 08             	push   0x8(%ebp)
 460:	e8 d6 00 00 00       	call   53b <open>
  if(fd < 0)
 465:	83 c4 10             	add    $0x10,%esp
 468:	85 c0                	test   %eax,%eax
 46a:	78 24                	js     490 <stat+0x3d>
 46c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 46e:	83 ec 08             	sub    $0x8,%esp
 471:	ff 75 0c             	push   0xc(%ebp)
 474:	50                   	push   %eax
 475:	e8 d9 00 00 00       	call   553 <fstat>
 47a:	89 c6                	mov    %eax,%esi
  close(fd);
 47c:	89 1c 24             	mov    %ebx,(%esp)
 47f:	e8 9f 00 00 00       	call   523 <close>
  return r;
 484:	83 c4 10             	add    $0x10,%esp
}
 487:	89 f0                	mov    %esi,%eax
 489:	8d 65 f8             	lea    -0x8(%ebp),%esp
 48c:	5b                   	pop    %ebx
 48d:	5e                   	pop    %esi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    
    return -1;
 490:	be ff ff ff ff       	mov    $0xffffffff,%esi
 495:	eb f0                	jmp    487 <stat+0x34>

00000497 <atoi>:
=======
 441:	83 ec 08             	sub    $0x8,%esp
 444:	6a 00                	push   $0x0
 446:	ff 75 08             	push   0x8(%ebp)
 449:	e8 d6 00 00 00       	call   524 <open>
  if(fd < 0)
 44e:	83 c4 10             	add    $0x10,%esp
 451:	85 c0                	test   %eax,%eax
 453:	78 24                	js     479 <stat+0x3d>
 455:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 457:	83 ec 08             	sub    $0x8,%esp
 45a:	ff 75 0c             	push   0xc(%ebp)
 45d:	50                   	push   %eax
 45e:	e8 d9 00 00 00       	call   53c <fstat>
 463:	89 c6                	mov    %eax,%esi
  close(fd);
 465:	89 1c 24             	mov    %ebx,(%esp)
 468:	e8 9f 00 00 00       	call   50c <close>
  return r;
 46d:	83 c4 10             	add    $0x10,%esp
}
 470:	89 f0                	mov    %esi,%eax
 472:	8d 65 f8             	lea    -0x8(%ebp),%esp
 475:	5b                   	pop    %ebx
 476:	5e                   	pop    %esi
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    
    return -1;
 479:	be ff ff ff ff       	mov    $0xffffffff,%esi
 47e:	eb f0                	jmp    470 <stat+0x34>

00000480 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	53                   	push   %ebx
 49b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 49e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4a3:	eb 10                	jmp    4b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ab:	83 c1 01             	add    $0x1,%ecx
 4ae:	0f be c0             	movsbl %al,%eax
 4b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4b5:	0f b6 01             	movzbl (%ecx),%eax
 4b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4bb:	80 fb 09             	cmp    $0x9,%bl
 4be:	76 e5                	jbe    4a5 <atoi+0xe>
  return n;
}
 4c0:	89 d0                	mov    %edx,%eax
 4c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c5:	c9                   	leave  
 4c6:	c3                   	ret    

000004c7 <memmove>:
=======
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 487:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 48c:	eb 10                	jmp    49e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 48e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 491:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 494:	83 c1 01             	add    $0x1,%ecx
 497:	0f be c0             	movsbl %al,%eax
 49a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 49e:	0f b6 01             	movzbl (%ecx),%eax
 4a1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a4:	80 fb 09             	cmp    $0x9,%bl
 4a7:	76 e5                	jbe    48e <atoi+0xe>
  return n;
}
 4a9:	89 d0                	mov    %edx,%eax
 4ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ae:	c9                   	leave  
 4af:	c3                   	ret    

000004b0 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	56                   	push   %esi
 4cb:	53                   	push   %ebx
 4cc:	8b 75 08             	mov    0x8(%ebp),%esi
 4cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d2:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	56                   	push   %esi
 4b4:	53                   	push   %ebx
 4b5:	8b 75 08             	mov    0x8(%ebp),%esi
 4b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4bb:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 4d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4d7:	eb 0d                	jmp    4e6 <memmove+0x1f>
    *dst++ = *src++;
 4d9:	0f b6 01             	movzbl (%ecx),%eax
 4dc:	88 02                	mov    %al,(%edx)
 4de:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4e4:	89 d8                	mov    %ebx,%eax
 4e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4e9:	85 c0                	test   %eax,%eax
 4eb:	7f ec                	jg     4d9 <memmove+0x12>
  return vdst;
}
 4ed:	89 f0                	mov    %esi,%eax
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    

000004f3 <fork>:
=======
 4be:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4c0:	eb 0d                	jmp    4cf <memmove+0x1f>
    *dst++ = *src++;
 4c2:	0f b6 01             	movzbl (%ecx),%eax
 4c5:	88 02                	mov    %al,(%edx)
 4c7:	8d 49 01             	lea    0x1(%ecx),%ecx
 4ca:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4cd:	89 d8                	mov    %ebx,%eax
 4cf:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4d2:	85 c0                	test   %eax,%eax
 4d4:	7f ec                	jg     4c2 <memmove+0x12>
  return vdst;
}
 4d6:	89 f0                	mov    %esi,%eax
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    

000004dc <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 4f3:	b8 01 00 00 00       	mov    $0x1,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <exit>:
SYSCALL(exit)
 4fb:	b8 02 00 00 00       	mov    $0x2,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <wait>:
SYSCALL(wait)
 503:	b8 03 00 00 00       	mov    $0x3,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <pipe>:
SYSCALL(pipe)
 50b:	b8 04 00 00 00       	mov    $0x4,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <read>:
SYSCALL(read)
 513:	b8 05 00 00 00       	mov    $0x5,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <write>:
SYSCALL(write)
 51b:	b8 10 00 00 00       	mov    $0x10,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <close>:
SYSCALL(close)
 523:	b8 15 00 00 00       	mov    $0x15,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <kill>:
SYSCALL(kill)
 52b:	b8 06 00 00 00       	mov    $0x6,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <exec>:
SYSCALL(exec)
 533:	b8 07 00 00 00       	mov    $0x7,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <open>:
SYSCALL(open)
 53b:	b8 0f 00 00 00       	mov    $0xf,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <mknod>:
SYSCALL(mknod)
 543:	b8 11 00 00 00       	mov    $0x11,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <unlink>:
SYSCALL(unlink)
 54b:	b8 12 00 00 00       	mov    $0x12,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <fstat>:
SYSCALL(fstat)
 553:	b8 08 00 00 00       	mov    $0x8,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <link>:
SYSCALL(link)
 55b:	b8 13 00 00 00       	mov    $0x13,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <mkdir>:
SYSCALL(mkdir)
 563:	b8 14 00 00 00       	mov    $0x14,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <chdir>:
SYSCALL(chdir)
 56b:	b8 09 00 00 00       	mov    $0x9,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <dup>:
SYSCALL(dup)
 573:	b8 0a 00 00 00       	mov    $0xa,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <getpid>:
SYSCALL(getpid)
 57b:	b8 0b 00 00 00       	mov    $0xb,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <sbrk>:
SYSCALL(sbrk)
 583:	b8 0c 00 00 00       	mov    $0xc,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <sleep>:
SYSCALL(sleep)
 58b:	b8 0d 00 00 00       	mov    $0xd,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <uptime>:
SYSCALL(uptime)
 593:	b8 0e 00 00 00       	mov    $0xe,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <clone>:
SYSCALL(clone)
 59b:	b8 16 00 00 00       	mov    $0x16,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <join>:
 5a3:	b8 17 00 00 00       	mov    $0x17,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <putc>:
=======
 4dc:	b8 01 00 00 00       	mov    $0x1,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <exit>:
SYSCALL(exit)
 4e4:	b8 02 00 00 00       	mov    $0x2,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <wait>:
SYSCALL(wait)
 4ec:	b8 03 00 00 00       	mov    $0x3,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <pipe>:
SYSCALL(pipe)
 4f4:	b8 04 00 00 00       	mov    $0x4,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <read>:
SYSCALL(read)
 4fc:	b8 05 00 00 00       	mov    $0x5,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <write>:
SYSCALL(write)
 504:	b8 10 00 00 00       	mov    $0x10,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <close>:
SYSCALL(close)
 50c:	b8 15 00 00 00       	mov    $0x15,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <kill>:
SYSCALL(kill)
 514:	b8 06 00 00 00       	mov    $0x6,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <exec>:
SYSCALL(exec)
 51c:	b8 07 00 00 00       	mov    $0x7,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <open>:
SYSCALL(open)
 524:	b8 0f 00 00 00       	mov    $0xf,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <mknod>:
SYSCALL(mknod)
 52c:	b8 11 00 00 00       	mov    $0x11,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <unlink>:
SYSCALL(unlink)
 534:	b8 12 00 00 00       	mov    $0x12,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <fstat>:
SYSCALL(fstat)
 53c:	b8 08 00 00 00       	mov    $0x8,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <link>:
SYSCALL(link)
 544:	b8 13 00 00 00       	mov    $0x13,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <mkdir>:
SYSCALL(mkdir)
 54c:	b8 14 00 00 00       	mov    $0x14,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <chdir>:
SYSCALL(chdir)
 554:	b8 09 00 00 00       	mov    $0x9,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <dup>:
SYSCALL(dup)
 55c:	b8 0a 00 00 00       	mov    $0xa,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <getpid>:
SYSCALL(getpid)
 564:	b8 0b 00 00 00       	mov    $0xb,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <sbrk>:
SYSCALL(sbrk)
 56c:	b8 0c 00 00 00       	mov    $0xc,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <sleep>:
SYSCALL(sleep)
 574:	b8 0d 00 00 00       	mov    $0xd,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <uptime>:
SYSCALL(uptime)
 57c:	b8 0e 00 00 00       	mov    $0xe,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <clone>:
SYSCALL(clone)
 584:	b8 16 00 00 00       	mov    $0x16,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <join>:
 58c:	b8 17 00 00 00       	mov    $0x17,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	83 ec 1c             	sub    $0x1c,%esp
 5b1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b4:	6a 01                	push   $0x1
 5b6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b9:	52                   	push   %edx
 5ba:	50                   	push   %eax
 5bb:	e8 5b ff ff ff       	call   51b <write>
}
 5c0:	83 c4 10             	add    $0x10,%esp
 5c3:	c9                   	leave  
 5c4:	c3                   	ret    

000005c5 <printint>:
=======
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	83 ec 1c             	sub    $0x1c,%esp
 59a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 59d:	6a 01                	push   $0x1
 59f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5a2:	52                   	push   %edx
 5a3:	50                   	push   %eax
 5a4:	e8 5b ff ff ff       	call   504 <write>
}
 5a9:	83 c4 10             	add    $0x10,%esp
 5ac:	c9                   	leave  
 5ad:	c3                   	ret    

000005ae <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 5c5:	55                   	push   %ebp
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	83 ec 2c             	sub    $0x2c,%esp
 5ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d1:	89 d0                	mov    %edx,%eax
 5d3:	89 ce                	mov    %ecx,%esi
=======
 5ae:	55                   	push   %ebp
 5af:	89 e5                	mov    %esp,%ebp
 5b1:	57                   	push   %edi
 5b2:	56                   	push   %esi
 5b3:	53                   	push   %ebx
 5b4:	83 ec 2c             	sub    $0x2c,%esp
 5b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ba:	89 d0                	mov    %edx,%eax
 5bc:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 5d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d9:	0f 95 c1             	setne  %cl
 5dc:	c1 ea 1f             	shr    $0x1f,%edx
 5df:	84 d1                	test   %dl,%cl
 5e1:	74 44                	je     627 <printint+0x62>
    neg = 1;
    x = -xx;
 5e3:	f7 d8                	neg    %eax
 5e5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5e7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 5be:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5c2:	0f 95 c1             	setne  %cl
 5c5:	c1 ea 1f             	shr    $0x1f,%edx
 5c8:	84 d1                	test   %dl,%cl
 5ca:	74 44                	je     610 <printint+0x62>
    neg = 1;
    x = -xx;
 5cc:	f7 d8                	neg    %eax
 5ce:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5d0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 5ee:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5f3:	89 c8                	mov    %ecx,%eax
 5f5:	ba 00 00 00 00       	mov    $0x0,%edx
 5fa:	f7 f6                	div    %esi
 5fc:	89 df                	mov    %ebx,%edi
 5fe:	83 c3 01             	add    $0x1,%ebx
 601:	0f b6 92 f4 09 00 00 	movzbl 0x9f4(%edx),%edx
 608:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 60c:	89 ca                	mov    %ecx,%edx
 60e:	89 c1                	mov    %eax,%ecx
 610:	39 d6                	cmp    %edx,%esi
 612:	76 df                	jbe    5f3 <printint+0x2e>
  if(neg)
 614:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 618:	74 31                	je     64b <printint+0x86>
    buf[i++] = '-';
 61a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 61f:	8d 5f 02             	lea    0x2(%edi),%ebx
 622:	8b 75 d0             	mov    -0x30(%ebp),%esi
 625:	eb 17                	jmp    63e <printint+0x79>
    x = xx;
 627:	89 c1                	mov    %eax,%ecx
  neg = 0;
 629:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 630:	eb bc                	jmp    5ee <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 632:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 637:	89 f0                	mov    %esi,%eax
 639:	e8 6d ff ff ff       	call   5ab <putc>
  while(--i >= 0)
 63e:	83 eb 01             	sub    $0x1,%ebx
 641:	79 ef                	jns    632 <printint+0x6d>
}
 643:	83 c4 2c             	add    $0x2c,%esp
 646:	5b                   	pop    %ebx
 647:	5e                   	pop    %esi
 648:	5f                   	pop    %edi
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    
 64b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64e:	eb ee                	jmp    63e <printint+0x79>

00000650 <printf>:
=======
 5d7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5dc:	89 c8                	mov    %ecx,%eax
 5de:	ba 00 00 00 00       	mov    $0x0,%edx
 5e3:	f7 f6                	div    %esi
 5e5:	89 df                	mov    %ebx,%edi
 5e7:	83 c3 01             	add    $0x1,%ebx
 5ea:	0f b6 92 dc 09 00 00 	movzbl 0x9dc(%edx),%edx
 5f1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5f5:	89 ca                	mov    %ecx,%edx
 5f7:	89 c1                	mov    %eax,%ecx
 5f9:	39 d6                	cmp    %edx,%esi
 5fb:	76 df                	jbe    5dc <printint+0x2e>
  if(neg)
 5fd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 601:	74 31                	je     634 <printint+0x86>
    buf[i++] = '-';
 603:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 608:	8d 5f 02             	lea    0x2(%edi),%ebx
 60b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 60e:	eb 17                	jmp    627 <printint+0x79>
    x = xx;
 610:	89 c1                	mov    %eax,%ecx
  neg = 0;
 612:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 619:	eb bc                	jmp    5d7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 61b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 620:	89 f0                	mov    %esi,%eax
 622:	e8 6d ff ff ff       	call   594 <putc>
  while(--i >= 0)
 627:	83 eb 01             	sub    $0x1,%ebx
 62a:	79 ef                	jns    61b <printint+0x6d>
}
 62c:	83 c4 2c             	add    $0x2c,%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8b 75 d0             	mov    -0x30(%ebp),%esi
 637:	eb ee                	jmp    627 <printint+0x79>

00000639 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 1c             	sub    $0x1c,%esp
=======
 639:	55                   	push   %ebp
 63a:	89 e5                	mov    %esp,%ebp
 63c:	57                   	push   %edi
 63d:	56                   	push   %esi
 63e:	53                   	push   %ebx
 63f:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 659:	8d 45 10             	lea    0x10(%ebp),%eax
 65c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 65f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 664:	bb 00 00 00 00       	mov    $0x0,%ebx
 669:	eb 14                	jmp    67f <printf+0x2f>
=======
 642:	8d 45 10             	lea    0x10(%ebp),%eax
 645:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 648:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 64d:	bb 00 00 00 00       	mov    $0x0,%ebx
 652:	eb 14                	jmp    668 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 66b:	89 fa                	mov    %edi,%edx
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	e8 36 ff ff ff       	call   5ab <putc>
 675:	eb 05                	jmp    67c <printf+0x2c>
      }
    } else if(state == '%'){
 677:	83 fe 25             	cmp    $0x25,%esi
 67a:	74 25                	je     6a1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 67c:	83 c3 01             	add    $0x1,%ebx
 67f:	8b 45 0c             	mov    0xc(%ebp),%eax
 682:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 686:	84 c0                	test   %al,%al
 688:	0f 84 20 01 00 00    	je     7ae <printf+0x15e>
    c = fmt[i] & 0xff;
 68e:	0f be f8             	movsbl %al,%edi
 691:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 694:	85 f6                	test   %esi,%esi
 696:	75 df                	jne    677 <printf+0x27>
      if(c == '%'){
 698:	83 f8 25             	cmp    $0x25,%eax
 69b:	75 ce                	jne    66b <printf+0x1b>
        state = '%';
 69d:	89 c6                	mov    %eax,%esi
 69f:	eb db                	jmp    67c <printf+0x2c>
      if(c == 'd'){
 6a1:	83 f8 25             	cmp    $0x25,%eax
 6a4:	0f 84 cf 00 00 00    	je     779 <printf+0x129>
 6aa:	0f 8c dd 00 00 00    	jl     78d <printf+0x13d>
 6b0:	83 f8 78             	cmp    $0x78,%eax
 6b3:	0f 8f d4 00 00 00    	jg     78d <printf+0x13d>
 6b9:	83 f8 63             	cmp    $0x63,%eax
 6bc:	0f 8c cb 00 00 00    	jl     78d <printf+0x13d>
 6c2:	83 e8 63             	sub    $0x63,%eax
 6c5:	83 f8 15             	cmp    $0x15,%eax
 6c8:	0f 87 bf 00 00 00    	ja     78d <printf+0x13d>
 6ce:	ff 24 85 9c 09 00 00 	jmp    *0x99c(,%eax,4)
        printint(fd, *ap, 10, 1);
 6d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d8:	8b 17                	mov    (%edi),%edx
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	6a 01                	push   $0x1
 6df:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	e8 d9 fe ff ff       	call   5c5 <printint>
        ap++;
 6ec:	83 c7 04             	add    $0x4,%edi
 6ef:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f2:	83 c4 10             	add    $0x10,%esp
=======
 654:	89 fa                	mov    %edi,%edx
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	e8 36 ff ff ff       	call   594 <putc>
 65e:	eb 05                	jmp    665 <printf+0x2c>
      }
    } else if(state == '%'){
 660:	83 fe 25             	cmp    $0x25,%esi
 663:	74 25                	je     68a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 665:	83 c3 01             	add    $0x1,%ebx
 668:	8b 45 0c             	mov    0xc(%ebp),%eax
 66b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 66f:	84 c0                	test   %al,%al
 671:	0f 84 20 01 00 00    	je     797 <printf+0x15e>
    c = fmt[i] & 0xff;
 677:	0f be f8             	movsbl %al,%edi
 67a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 67d:	85 f6                	test   %esi,%esi
 67f:	75 df                	jne    660 <printf+0x27>
      if(c == '%'){
 681:	83 f8 25             	cmp    $0x25,%eax
 684:	75 ce                	jne    654 <printf+0x1b>
        state = '%';
 686:	89 c6                	mov    %eax,%esi
 688:	eb db                	jmp    665 <printf+0x2c>
      if(c == 'd'){
 68a:	83 f8 25             	cmp    $0x25,%eax
 68d:	0f 84 cf 00 00 00    	je     762 <printf+0x129>
 693:	0f 8c dd 00 00 00    	jl     776 <printf+0x13d>
 699:	83 f8 78             	cmp    $0x78,%eax
 69c:	0f 8f d4 00 00 00    	jg     776 <printf+0x13d>
 6a2:	83 f8 63             	cmp    $0x63,%eax
 6a5:	0f 8c cb 00 00 00    	jl     776 <printf+0x13d>
 6ab:	83 e8 63             	sub    $0x63,%eax
 6ae:	83 f8 15             	cmp    $0x15,%eax
 6b1:	0f 87 bf 00 00 00    	ja     776 <printf+0x13d>
 6b7:	ff 24 85 84 09 00 00 	jmp    *0x984(,%eax,4)
        printint(fd, *ap, 10, 1);
 6be:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c1:	8b 17                	mov    (%edi),%edx
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	6a 01                	push   $0x1
 6c8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	e8 d9 fe ff ff       	call   5ae <printint>
        ap++;
 6d5:	83 c7 04             	add    $0x4,%edi
 6d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6db:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 6f5:	be 00 00 00 00       	mov    $0x0,%esi
 6fa:	eb 80                	jmp    67c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ff:	8b 17                	mov    (%edi),%edx
 701:	83 ec 0c             	sub    $0xc,%esp
 704:	6a 00                	push   $0x0
 706:	b9 10 00 00 00       	mov    $0x10,%ecx
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	e8 b2 fe ff ff       	call   5c5 <printint>
        ap++;
 713:	83 c7 04             	add    $0x4,%edi
 716:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 719:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 56 ff ff ff       	jmp    67c <printf+0x2c>
        s = (char*)*ap;
 726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 729:	8b 30                	mov    (%eax),%esi
        ap++;
 72b:	83 c0 04             	add    $0x4,%eax
 72e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 731:	85 f6                	test   %esi,%esi
 733:	75 15                	jne    74a <printf+0xfa>
          s = "(null)";
 735:	be 94 09 00 00       	mov    $0x994,%esi
 73a:	eb 0e                	jmp    74a <printf+0xfa>
          putc(fd, *s);
 73c:	0f be d2             	movsbl %dl,%edx
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	e8 64 fe ff ff       	call   5ab <putc>
          s++;
 747:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 74a:	0f b6 16             	movzbl (%esi),%edx
 74d:	84 d2                	test   %dl,%dl
 74f:	75 eb                	jne    73c <printf+0xec>
      state = 0;
 751:	be 00 00 00 00       	mov    $0x0,%esi
 756:	e9 21 ff ff ff       	jmp    67c <printf+0x2c>
        putc(fd, *ap);
 75b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75e:	0f be 17             	movsbl (%edi),%edx
 761:	8b 45 08             	mov    0x8(%ebp),%eax
 764:	e8 42 fe ff ff       	call   5ab <putc>
        ap++;
 769:	83 c7 04             	add    $0x4,%edi
 76c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 76f:	be 00 00 00 00       	mov    $0x0,%esi
 774:	e9 03 ff ff ff       	jmp    67c <printf+0x2c>
        putc(fd, c);
 779:	89 fa                	mov    %edi,%edx
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	e8 28 fe ff ff       	call   5ab <putc>
      state = 0;
 783:	be 00 00 00 00       	mov    $0x0,%esi
 788:	e9 ef fe ff ff       	jmp    67c <printf+0x2c>
        putc(fd, '%');
 78d:	ba 25 00 00 00       	mov    $0x25,%edx
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	e8 11 fe ff ff       	call   5ab <putc>
        putc(fd, c);
 79a:	89 fa                	mov    %edi,%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	e8 07 fe ff ff       	call   5ab <putc>
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 ce fe ff ff       	jmp    67c <printf+0x2c>
    }
  }
}
 7ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b1:	5b                   	pop    %ebx
 7b2:	5e                   	pop    %esi
 7b3:	5f                   	pop    %edi
 7b4:	5d                   	pop    %ebp
 7b5:	c3                   	ret    

000007b6 <free>:
=======
 6de:	be 00 00 00 00       	mov    $0x0,%esi
 6e3:	eb 80                	jmp    665 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e8:	8b 17                	mov    (%edi),%edx
 6ea:	83 ec 0c             	sub    $0xc,%esp
 6ed:	6a 00                	push   $0x0
 6ef:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 b2 fe ff ff       	call   5ae <printint>
        ap++;
 6fc:	83 c7 04             	add    $0x4,%edi
 6ff:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 702:	83 c4 10             	add    $0x10,%esp
      state = 0;
 705:	be 00 00 00 00       	mov    $0x0,%esi
 70a:	e9 56 ff ff ff       	jmp    665 <printf+0x2c>
        s = (char*)*ap;
 70f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 712:	8b 30                	mov    (%eax),%esi
        ap++;
 714:	83 c0 04             	add    $0x4,%eax
 717:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 71a:	85 f6                	test   %esi,%esi
 71c:	75 15                	jne    733 <printf+0xfa>
          s = "(null)";
 71e:	be 7c 09 00 00       	mov    $0x97c,%esi
 723:	eb 0e                	jmp    733 <printf+0xfa>
          putc(fd, *s);
 725:	0f be d2             	movsbl %dl,%edx
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	e8 64 fe ff ff       	call   594 <putc>
          s++;
 730:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 733:	0f b6 16             	movzbl (%esi),%edx
 736:	84 d2                	test   %dl,%dl
 738:	75 eb                	jne    725 <printf+0xec>
      state = 0;
 73a:	be 00 00 00 00       	mov    $0x0,%esi
 73f:	e9 21 ff ff ff       	jmp    665 <printf+0x2c>
        putc(fd, *ap);
 744:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 747:	0f be 17             	movsbl (%edi),%edx
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	e8 42 fe ff ff       	call   594 <putc>
        ap++;
 752:	83 c7 04             	add    $0x4,%edi
 755:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 758:	be 00 00 00 00       	mov    $0x0,%esi
 75d:	e9 03 ff ff ff       	jmp    665 <printf+0x2c>
        putc(fd, c);
 762:	89 fa                	mov    %edi,%edx
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	e8 28 fe ff ff       	call   594 <putc>
      state = 0;
 76c:	be 00 00 00 00       	mov    $0x0,%esi
 771:	e9 ef fe ff ff       	jmp    665 <printf+0x2c>
        putc(fd, '%');
 776:	ba 25 00 00 00       	mov    $0x25,%edx
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	e8 11 fe ff ff       	call   594 <putc>
        putc(fd, c);
 783:	89 fa                	mov    %edi,%edx
 785:	8b 45 08             	mov    0x8(%ebp),%eax
 788:	e8 07 fe ff ff       	call   594 <putc>
      state = 0;
 78d:	be 00 00 00 00       	mov    $0x0,%esi
 792:	e9 ce fe ff ff       	jmp    665 <printf+0x2c>
    }
  }
}
 797:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79a:	5b                   	pop    %ebx
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret    

0000079f <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 7b6:	55                   	push   %ebp
 7b7:	89 e5                	mov    %esp,%ebp
 7b9:	57                   	push   %edi
 7ba:	56                   	push   %esi
 7bb:	53                   	push   %ebx
 7bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7bf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c2:	a1 c0 0e 00 00       	mov    0xec0,%eax
 7c7:	eb 02                	jmp    7cb <free+0x15>
 7c9:	89 d0                	mov    %edx,%eax
 7cb:	39 c8                	cmp    %ecx,%eax
 7cd:	73 04                	jae    7d3 <free+0x1d>
 7cf:	39 08                	cmp    %ecx,(%eax)
 7d1:	77 12                	ja     7e5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d3:	8b 10                	mov    (%eax),%edx
 7d5:	39 c2                	cmp    %eax,%edx
 7d7:	77 f0                	ja     7c9 <free+0x13>
 7d9:	39 c8                	cmp    %ecx,%eax
 7db:	72 08                	jb     7e5 <free+0x2f>
 7dd:	39 ca                	cmp    %ecx,%edx
 7df:	77 04                	ja     7e5 <free+0x2f>
 7e1:	89 d0                	mov    %edx,%eax
 7e3:	eb e6                	jmp    7cb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7eb:	8b 10                	mov    (%eax),%edx
 7ed:	39 d7                	cmp    %edx,%edi
 7ef:	74 19                	je     80a <free+0x54>
=======
 79f:	55                   	push   %ebp
 7a0:	89 e5                	mov    %esp,%ebp
 7a2:	57                   	push   %edi
 7a3:	56                   	push   %esi
 7a4:	53                   	push   %ebx
 7a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ab:	a1 a0 10 00 00       	mov    0x10a0,%eax
 7b0:	eb 02                	jmp    7b4 <free+0x15>
 7b2:	89 d0                	mov    %edx,%eax
 7b4:	39 c8                	cmp    %ecx,%eax
 7b6:	73 04                	jae    7bc <free+0x1d>
 7b8:	39 08                	cmp    %ecx,(%eax)
 7ba:	77 12                	ja     7ce <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7bc:	8b 10                	mov    (%eax),%edx
 7be:	39 c2                	cmp    %eax,%edx
 7c0:	77 f0                	ja     7b2 <free+0x13>
 7c2:	39 c8                	cmp    %ecx,%eax
 7c4:	72 08                	jb     7ce <free+0x2f>
 7c6:	39 ca                	cmp    %ecx,%edx
 7c8:	77 04                	ja     7ce <free+0x2f>
 7ca:	89 d0                	mov    %edx,%eax
 7cc:	eb e6                	jmp    7b4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ce:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d4:	8b 10                	mov    (%eax),%edx
 7d6:	39 d7                	cmp    %edx,%edi
 7d8:	74 19                	je     7f3 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 7f1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f4:	8b 50 04             	mov    0x4(%eax),%edx
 7f7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7fa:	39 ce                	cmp    %ecx,%esi
 7fc:	74 1b                	je     819 <free+0x63>
=======
 7da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 50 04             	mov    0x4(%eax),%edx
 7e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e3:	39 ce                	cmp    %ecx,%esi
 7e5:	74 1b                	je     802 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 7fe:	89 08                	mov    %ecx,(%eax)
  freep = p;
 800:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 80a:	03 72 04             	add    0x4(%edx),%esi
 80d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 810:	8b 10                	mov    (%eax),%edx
 812:	8b 12                	mov    (%edx),%edx
 814:	89 53 f8             	mov    %edx,-0x8(%ebx)
 817:	eb db                	jmp    7f4 <free+0x3e>
    p->s.size += bp->s.size;
 819:	03 53 fc             	add    -0x4(%ebx),%edx
 81c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 822:	89 10                	mov    %edx,(%eax)
 824:	eb da                	jmp    800 <free+0x4a>

00000826 <morecore>:
=======
 7e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7e9:	a3 a0 10 00 00       	mov    %eax,0x10a0
}
 7ee:	5b                   	pop    %ebx
 7ef:	5e                   	pop    %esi
 7f0:	5f                   	pop    %edi
 7f1:	5d                   	pop    %ebp
 7f2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7f3:	03 72 04             	add    0x4(%edx),%esi
 7f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	8b 12                	mov    (%edx),%edx
 7fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 800:	eb db                	jmp    7dd <free+0x3e>
    p->s.size += bp->s.size;
 802:	03 53 fc             	add    -0x4(%ebx),%edx
 805:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 808:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80b:	89 10                	mov    %edx,(%eax)
 80d:	eb da                	jmp    7e9 <free+0x4a>

0000080f <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 826:	55                   	push   %ebp
 827:	89 e5                	mov    %esp,%ebp
 829:	53                   	push   %ebx
 82a:	83 ec 04             	sub    $0x4,%esp
 82d:	89 c3                	mov    %eax,%ebx
=======
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	53                   	push   %ebx
 813:	83 ec 04             	sub    $0x4,%esp
 816:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 82f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 834:	77 05                	ja     83b <morecore+0x15>
    nu = 4096;
 836:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 83b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 842:	83 ec 0c             	sub    $0xc,%esp
 845:	50                   	push   %eax
 846:	e8 38 fd ff ff       	call   583 <sbrk>
  if(p == (char*)-1)
 84b:	83 c4 10             	add    $0x10,%esp
 84e:	83 f8 ff             	cmp    $0xffffffff,%eax
 851:	74 1c                	je     86f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 853:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 856:	83 c0 08             	add    $0x8,%eax
 859:	83 ec 0c             	sub    $0xc,%esp
 85c:	50                   	push   %eax
 85d:	e8 54 ff ff ff       	call   7b6 <free>
  return freep;
 862:	a1 c0 0e 00 00       	mov    0xec0,%eax
 867:	83 c4 10             	add    $0x10,%esp
}
 86a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 86d:	c9                   	leave  
 86e:	c3                   	ret    
    return 0;
 86f:	b8 00 00 00 00       	mov    $0x0,%eax
 874:	eb f4                	jmp    86a <morecore+0x44>

00000876 <malloc>:
=======
 818:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 81d:	77 05                	ja     824 <morecore+0x15>
    nu = 4096;
 81f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 824:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82b:	83 ec 0c             	sub    $0xc,%esp
 82e:	50                   	push   %eax
 82f:	e8 38 fd ff ff       	call   56c <sbrk>
  if(p == (char*)-1)
 834:	83 c4 10             	add    $0x10,%esp
 837:	83 f8 ff             	cmp    $0xffffffff,%eax
 83a:	74 1c                	je     858 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 83c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 83f:	83 c0 08             	add    $0x8,%eax
 842:	83 ec 0c             	sub    $0xc,%esp
 845:	50                   	push   %eax
 846:	e8 54 ff ff ff       	call   79f <free>
  return freep;
 84b:	a1 a0 10 00 00       	mov    0x10a0,%eax
 850:	83 c4 10             	add    $0x10,%esp
}
 853:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 856:	c9                   	leave  
 857:	c3                   	ret    
    return 0;
 858:	b8 00 00 00 00       	mov    $0x0,%eax
 85d:	eb f4                	jmp    853 <morecore+0x44>

0000085f <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 876:	55                   	push   %ebp
 877:	89 e5                	mov    %esp,%ebp
 879:	53                   	push   %ebx
 87a:	83 ec 04             	sub    $0x4,%esp
=======
 85f:	55                   	push   %ebp
 860:	89 e5                	mov    %esp,%ebp
 862:	53                   	push   %ebx
 863:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	8d 58 07             	lea    0x7(%eax),%ebx
 883:	c1 eb 03             	shr    $0x3,%ebx
 886:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 889:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 88f:	85 c9                	test   %ecx,%ecx
 891:	74 04                	je     897 <malloc+0x21>
=======
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	8d 58 07             	lea    0x7(%eax),%ebx
 86c:	c1 eb 03             	shr    $0x3,%ebx
 86f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 872:	8b 0d a0 10 00 00    	mov    0x10a0,%ecx
 878:	85 c9                	test   %ecx,%ecx
 87a:	74 04                	je     880 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 893:	8b 01                	mov    (%ecx),%eax
 895:	eb 4a                	jmp    8e1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 897:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 89e:	0e 00 00 
 8a1:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8a8:	0e 00 00 
    base.s.size = 0;
 8ab:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8b2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8b5:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 8ba:	eb d7                	jmp    893 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8bc:	74 19                	je     8d7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8be:	29 da                	sub    %ebx,%edx
 8c0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8c6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c9:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 8cf:	83 c0 08             	add    $0x8,%eax
=======
 87c:	8b 01                	mov    (%ecx),%eax
 87e:	eb 4a                	jmp    8ca <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 a0 10 00 00 a4 	movl   $0x10a4,0x10a0
 887:	10 00 00 
 88a:	c7 05 a4 10 00 00 a4 	movl   $0x10a4,0x10a4
 891:	10 00 00 
    base.s.size = 0;
 894:	c7 05 a8 10 00 00 00 	movl   $0x0,0x10a8
 89b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 89e:	b9 a4 10 00 00       	mov    $0x10a4,%ecx
 8a3:	eb d7                	jmp    87c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8a5:	74 19                	je     8c0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8a7:	29 da                	sub    %ebx,%edx
 8a9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ac:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8af:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b2:	89 0d a0 10 00 00    	mov    %ecx,0x10a0
      return (void*)(p + 1);
 8b8:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 8d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d5:	c9                   	leave  
 8d6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8d7:	8b 10                	mov    (%eax),%edx
 8d9:	89 11                	mov    %edx,(%ecx)
 8db:	eb ec                	jmp    8c9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8dd:	89 c1                	mov    %eax,%ecx
 8df:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e1:	8b 50 04             	mov    0x4(%eax),%edx
 8e4:	39 da                	cmp    %ebx,%edx
 8e6:	73 d4                	jae    8bc <malloc+0x46>
    if(p == freep)
 8e8:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 8ee:	75 ed                	jne    8dd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f0:	89 d8                	mov    %ebx,%eax
 8f2:	e8 2f ff ff ff       	call   826 <morecore>
 8f7:	85 c0                	test   %eax,%eax
 8f9:	75 e2                	jne    8dd <malloc+0x67>
 8fb:	eb d5                	jmp    8d2 <malloc+0x5c>
=======
 8bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8be:	c9                   	leave  
 8bf:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 10                	mov    (%eax),%edx
 8c2:	89 11                	mov    %edx,(%ecx)
 8c4:	eb ec                	jmp    8b2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c6:	89 c1                	mov    %eax,%ecx
 8c8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ca:	8b 50 04             	mov    0x4(%eax),%edx
 8cd:	39 da                	cmp    %ebx,%edx
 8cf:	73 d4                	jae    8a5 <malloc+0x46>
    if(p == freep)
 8d1:	39 05 a0 10 00 00    	cmp    %eax,0x10a0
 8d7:	75 ed                	jne    8c6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8d9:	89 d8                	mov    %ebx,%eax
 8db:	e8 2f ff ff ff       	call   80f <morecore>
 8e0:	85 c0                	test   %eax,%eax
 8e2:	75 e2                	jne    8c6 <malloc+0x67>
 8e4:	eb d5                	jmp    8bb <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
