
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
<<<<<<< HEAD
  1c:	a1 68 0f 00 00       	mov    0xf68,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 8c 0a 00 00       	push   $0xa8c
  31:	68 96 0a 00 00       	push   $0xa96
  36:	6a 01                	push   $0x1
  38:	e8 a1 07 00 00       	call   7de <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 dd 0a 00 00       	push   $0xadd
  45:	68 ad 0a 00 00       	push   $0xaad
  4a:	6a 01                	push   $0x1
  4c:	e8 8d 07 00 00       	call   7de <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 c1 0a 00 00       	push   $0xac1
  59:	6a 01                	push   $0x1
  5b:	e8 7e 07 00 00       	call   7de <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 80 0f 00 00    	push   0xf80
  69:	e8 4b 06 00 00       	call   6b9 <kill>
  6e:	e8 16 06 00 00       	call   689 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 8c 0a 00 00       	push   $0xa8c
  7a:	68 96 0a 00 00       	push   $0xa96
  7f:	6a 01                	push   $0x1
  81:	e8 58 07 00 00       	call   7de <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 9e 0a 00 00       	push   $0xa9e
  8e:	68 ad 0a 00 00       	push   $0xaad
  93:	6a 01                	push   $0x1
  95:	e8 44 07 00 00       	call   7de <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 c1 0a 00 00       	push   $0xac1
  a2:	6a 01                	push   $0x1
  a4:	e8 35 07 00 00       	call   7de <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 80 0f 00 00    	push   0xf80
  b2:	e8 02 06 00 00       	call   6b9 <kill>
  b7:	e8 cd 05 00 00       	call   689 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 8c 0a 00 00       	push   $0xa8c
  c3:	68 96 0a 00 00       	push   $0xa96
  c8:	6a 01                	push   $0x1
  ca:	e8 0f 07 00 00       	call   7de <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 ce 0a 00 00       	push   $0xace
  d7:	68 ad 0a 00 00       	push   $0xaad
  dc:	6a 01                	push   $0x1
  de:	e8 fb 06 00 00       	call   7de <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 c1 0a 00 00       	push   $0xac1
  eb:	6a 01                	push   $0x1
  ed:	e8 ec 06 00 00       	call   7de <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 80 0f 00 00    	push   0xf80
  fb:	e8 b9 05 00 00       	call   6b9 <kill>
 100:	e8 84 05 00 00       	call   689 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 68 0f 00 00       	mov    %eax,0xf68
   exit();
 10d:	e8 77 05 00 00       	call   689 <exit>
=======
  1c:	a1 4c 0f 00 00       	mov    0xf4c,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 74 0a 00 00       	push   $0xa74
  31:	68 7e 0a 00 00       	push   $0xa7e
  36:	6a 01                	push   $0x1
  38:	e8 8a 07 00 00       	call   7c7 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 c5 0a 00 00       	push   $0xac5
  45:	68 95 0a 00 00       	push   $0xa95
  4a:	6a 01                	push   $0x1
  4c:	e8 76 07 00 00       	call   7c7 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 a9 0a 00 00       	push   $0xaa9
  59:	6a 01                	push   $0x1
  5b:	e8 67 07 00 00       	call   7c7 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 60 0f 00 00    	push   0xf60
  69:	e8 34 06 00 00       	call   6a2 <kill>
  6e:	e8 ff 05 00 00       	call   672 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 74 0a 00 00       	push   $0xa74
  7a:	68 7e 0a 00 00       	push   $0xa7e
  7f:	6a 01                	push   $0x1
  81:	e8 41 07 00 00       	call   7c7 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 86 0a 00 00       	push   $0xa86
  8e:	68 95 0a 00 00       	push   $0xa95
  93:	6a 01                	push   $0x1
  95:	e8 2d 07 00 00       	call   7c7 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 a9 0a 00 00       	push   $0xaa9
  a2:	6a 01                	push   $0x1
  a4:	e8 1e 07 00 00       	call   7c7 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 60 0f 00 00    	push   0xf60
  b2:	e8 eb 05 00 00       	call   6a2 <kill>
  b7:	e8 b6 05 00 00       	call   672 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 74 0a 00 00       	push   $0xa74
  c3:	68 7e 0a 00 00       	push   $0xa7e
  c8:	6a 01                	push   $0x1
  ca:	e8 f8 06 00 00       	call   7c7 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 b6 0a 00 00       	push   $0xab6
  d7:	68 95 0a 00 00       	push   $0xa95
  dc:	6a 01                	push   $0x1
  de:	e8 e4 06 00 00       	call   7c7 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 a9 0a 00 00       	push   $0xaa9
  eb:	6a 01                	push   $0x1
  ed:	e8 d5 06 00 00       	call   7c7 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 60 0f 00 00    	push   0xf60
  fb:	e8 a2 05 00 00       	call   6a2 <kill>
 100:	e8 6d 05 00 00       	call   672 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 4c 0f 00 00       	mov    %eax,0xf4c
   exit();
 10d:	e8 60 05 00 00       	call   672 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
<<<<<<< HEAD
 137:	a1 68 0f 00 00       	mov    0xf68,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 8c 0a 00 00       	push   $0xa8c
 14c:	68 96 0a 00 00       	push   $0xa96
 151:	6a 01                	push   $0x1
 153:	e8 86 06 00 00       	call   7de <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 e9 0a 00 00       	push   $0xae9
 160:	68 ad 0a 00 00       	push   $0xaad
 165:	6a 01                	push   $0x1
 167:	e8 72 06 00 00       	call   7de <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 c1 0a 00 00       	push   $0xac1
 174:	6a 01                	push   $0x1
 176:	e8 63 06 00 00       	call   7de <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 80 0f 00 00    	push   0xf80
 184:	e8 30 05 00 00       	call   6b9 <kill>
 189:	e8 fb 04 00 00       	call   689 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 8c 0a 00 00       	push   $0xa8c
 195:	68 96 0a 00 00       	push   $0xa96
 19a:	6a 01                	push   $0x1
 19c:	e8 3d 06 00 00       	call   7de <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 9e 0a 00 00       	push   $0xa9e
 1a9:	68 ad 0a 00 00       	push   $0xaad
 1ae:	6a 01                	push   $0x1
 1b0:	e8 29 06 00 00       	call   7de <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 c1 0a 00 00       	push   $0xac1
 1bd:	6a 01                	push   $0x1
 1bf:	e8 1a 06 00 00       	call   7de <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 80 0f 00 00    	push   0xf80
 1cd:	e8 e7 04 00 00       	call   6b9 <kill>
 1d2:	e8 b2 04 00 00       	call   689 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 8c 0a 00 00       	push   $0xa8c
 1de:	68 96 0a 00 00       	push   $0xa96
 1e3:	6a 01                	push   $0x1
 1e5:	e8 f4 05 00 00       	call   7de <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 ce 0a 00 00       	push   $0xace
 1f2:	68 ad 0a 00 00       	push   $0xaad
 1f7:	6a 01                	push   $0x1
 1f9:	e8 e0 05 00 00       	call   7de <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 c1 0a 00 00       	push   $0xac1
 206:	6a 01                	push   $0x1
 208:	e8 d1 05 00 00       	call   7de <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 80 0f 00 00    	push   0xf80
 216:	e8 9e 04 00 00       	call   6b9 <kill>
 21b:	e8 69 04 00 00       	call   689 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 68 0f 00 00       	mov    %eax,0xf68
=======
 137:	a1 4c 0f 00 00       	mov    0xf4c,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 74 0a 00 00       	push   $0xa74
 14c:	68 7e 0a 00 00       	push   $0xa7e
 151:	6a 01                	push   $0x1
 153:	e8 6f 06 00 00       	call   7c7 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 d1 0a 00 00       	push   $0xad1
 160:	68 95 0a 00 00       	push   $0xa95
 165:	6a 01                	push   $0x1
 167:	e8 5b 06 00 00       	call   7c7 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 a9 0a 00 00       	push   $0xaa9
 174:	6a 01                	push   $0x1
 176:	e8 4c 06 00 00       	call   7c7 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 60 0f 00 00    	push   0xf60
 184:	e8 19 05 00 00       	call   6a2 <kill>
 189:	e8 e4 04 00 00       	call   672 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 74 0a 00 00       	push   $0xa74
 195:	68 7e 0a 00 00       	push   $0xa7e
 19a:	6a 01                	push   $0x1
 19c:	e8 26 06 00 00       	call   7c7 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 86 0a 00 00       	push   $0xa86
 1a9:	68 95 0a 00 00       	push   $0xa95
 1ae:	6a 01                	push   $0x1
 1b0:	e8 12 06 00 00       	call   7c7 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 a9 0a 00 00       	push   $0xaa9
 1bd:	6a 01                	push   $0x1
 1bf:	e8 03 06 00 00       	call   7c7 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 60 0f 00 00    	push   0xf60
 1cd:	e8 d0 04 00 00       	call   6a2 <kill>
 1d2:	e8 9b 04 00 00       	call   672 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 74 0a 00 00       	push   $0xa74
 1de:	68 7e 0a 00 00       	push   $0xa7e
 1e3:	6a 01                	push   $0x1
 1e5:	e8 dd 05 00 00       	call   7c7 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 b6 0a 00 00       	push   $0xab6
 1f2:	68 95 0a 00 00       	push   $0xa95
 1f7:	6a 01                	push   $0x1
 1f9:	e8 c9 05 00 00       	call   7c7 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 a9 0a 00 00       	push   $0xaa9
 206:	6a 01                	push   $0x1
 208:	e8 ba 05 00 00       	call   7c7 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 60 0f 00 00    	push   0xf60
 216:	e8 87 04 00 00       	call   6a2 <kill>
 21b:	e8 52 04 00 00       	call   672 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 4c 0f 00 00       	mov    %eax,0xf4c
>>>>>>> c59b0f9 (fixed thread_join and join)
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 be 01 00 00       	call   3fb <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
<<<<<<< HEAD
 23f:	e8 17 02 00 00       	call   45b <thread_join>
=======
 23f:	e8 2d 02 00 00       	call   471 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
<<<<<<< HEAD
 24d:	68 8c 0a 00 00       	push   $0xa8c
 252:	68 96 0a 00 00       	push   $0xa96
 257:	6a 01                	push   $0x1
 259:	e8 80 05 00 00       	call   7de <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 34 0b 00 00       	push   $0xb34
 266:	68 ad 0a 00 00       	push   $0xaad
 26b:	6a 01                	push   $0x1
 26d:	e8 6c 05 00 00       	call   7de <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 c1 0a 00 00       	push   $0xac1
 27a:	6a 01                	push   $0x1
 27c:	e8 5d 05 00 00       	call   7de <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 80 0f 00 00    	push   0xf80
 28a:	e8 2a 04 00 00       	call   6b9 <kill>
 28f:	e8 f5 03 00 00       	call   689 <exit>
   exit();
 294:	e8 f0 03 00 00       	call   689 <exit>
=======
 24d:	68 74 0a 00 00       	push   $0xa74
 252:	68 7e 0a 00 00       	push   $0xa7e
 257:	6a 01                	push   $0x1
 259:	e8 69 05 00 00       	call   7c7 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 1c 0b 00 00       	push   $0xb1c
 266:	68 95 0a 00 00       	push   $0xa95
 26b:	6a 01                	push   $0x1
 26d:	e8 55 05 00 00       	call   7c7 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 a9 0a 00 00       	push   $0xaa9
 27a:	6a 01                	push   $0x1
 27c:	e8 46 05 00 00       	call   7c7 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 60 0f 00 00    	push   0xf60
 28a:	e8 13 04 00 00       	call   6a2 <kill>
 28f:	e8 de 03 00 00       	call   672 <exit>
   exit();
 294:	e8 d9 03 00 00       	call   672 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
<<<<<<< HEAD
 2ab:	e8 59 04 00 00       	call   709 <getpid>
 2b0:	a3 80 0f 00 00       	mov    %eax,0xf80
=======
 2ab:	e8 42 04 00 00       	call   6f2 <getpid>
 2b0:	a3 60 0f 00 00       	mov    %eax,0xf60
>>>>>>> c59b0f9 (fixed thread_join and join)
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 23 01 00 00       	call   3fb <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
<<<<<<< HEAD
 2e1:	e8 75 01 00 00       	call   45b <thread_join>
=======
 2e1:	e8 8b 01 00 00       	call   471 <thread_join>
>>>>>>> c59b0f9 (fixed thread_join and join)
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
<<<<<<< HEAD
 2ee:	83 3d 68 0f 00 00 03 	cmpl   $0x3,0xf68
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 8c 0a 00 00       	push   $0xa8c
 302:	68 96 0a 00 00       	push   $0xa96
 307:	6a 01                	push   $0x1
 309:	e8 d0 04 00 00       	call   7de <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 1b 0b 00 00       	push   $0xb1b
 316:	68 ad 0a 00 00       	push   $0xaad
 31b:	6a 01                	push   $0x1
 31d:	e8 bc 04 00 00       	call   7de <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 c1 0a 00 00       	push   $0xac1
 32a:	6a 01                	push   $0x1
 32c:	e8 ad 04 00 00       	call   7de <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 80 0f 00 00    	push   0xf80
 33a:	e8 7a 03 00 00       	call   6b9 <kill>
 33f:	e8 45 03 00 00       	call   689 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 8c 0a 00 00       	push   $0xa8c
 34b:	68 96 0a 00 00       	push   $0xa96
 350:	6a 01                	push   $0x1
 352:	e8 87 04 00 00       	call   7de <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 f5 0a 00 00       	push   $0xaf5
 35f:	68 ad 0a 00 00       	push   $0xaad
 364:	6a 01                	push   $0x1
 366:	e8 73 04 00 00       	call   7de <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 c1 0a 00 00       	push   $0xac1
 373:	6a 01                	push   $0x1
 375:	e8 64 04 00 00       	call   7de <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 80 0f 00 00    	push   0xf80
 383:	e8 31 03 00 00       	call   6b9 <kill>
 388:	e8 fc 02 00 00       	call   689 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 8c 0a 00 00       	push   $0xa8c
 394:	68 96 0a 00 00       	push   $0xa96
 399:	6a 01                	push   $0x1
 39b:	e8 3e 04 00 00       	call   7de <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 04 0b 00 00       	push   $0xb04
 3a8:	68 ad 0a 00 00       	push   $0xaad
 3ad:	6a 01                	push   $0x1
 3af:	e8 2a 04 00 00       	call   7de <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 c1 0a 00 00       	push   $0xac1
 3bc:	6a 01                	push   $0x1
 3be:	e8 1b 04 00 00       	call   7de <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 80 0f 00 00    	push   0xf80
 3cc:	e8 e8 02 00 00       	call   6b9 <kill>
 3d1:	e8 b3 02 00 00       	call   689 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 27 0b 00 00       	push   $0xb27
 3de:	6a 01                	push   $0x1
 3e0:	e8 f9 03 00 00       	call   7de <printf>
   exit();
 3e5:	e8 9f 02 00 00       	call   689 <exit>
=======
 2ee:	83 3d 4c 0f 00 00 03 	cmpl   $0x3,0xf4c
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 74 0a 00 00       	push   $0xa74
 302:	68 7e 0a 00 00       	push   $0xa7e
 307:	6a 01                	push   $0x1
 309:	e8 b9 04 00 00       	call   7c7 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 03 0b 00 00       	push   $0xb03
 316:	68 95 0a 00 00       	push   $0xa95
 31b:	6a 01                	push   $0x1
 31d:	e8 a5 04 00 00       	call   7c7 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 a9 0a 00 00       	push   $0xaa9
 32a:	6a 01                	push   $0x1
 32c:	e8 96 04 00 00       	call   7c7 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 60 0f 00 00    	push   0xf60
 33a:	e8 63 03 00 00       	call   6a2 <kill>
 33f:	e8 2e 03 00 00       	call   672 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 74 0a 00 00       	push   $0xa74
 34b:	68 7e 0a 00 00       	push   $0xa7e
 350:	6a 01                	push   $0x1
 352:	e8 70 04 00 00       	call   7c7 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 dd 0a 00 00       	push   $0xadd
 35f:	68 95 0a 00 00       	push   $0xa95
 364:	6a 01                	push   $0x1
 366:	e8 5c 04 00 00       	call   7c7 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 a9 0a 00 00       	push   $0xaa9
 373:	6a 01                	push   $0x1
 375:	e8 4d 04 00 00       	call   7c7 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 60 0f 00 00    	push   0xf60
 383:	e8 1a 03 00 00       	call   6a2 <kill>
 388:	e8 e5 02 00 00       	call   672 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 74 0a 00 00       	push   $0xa74
 394:	68 7e 0a 00 00       	push   $0xa7e
 399:	6a 01                	push   $0x1
 39b:	e8 27 04 00 00       	call   7c7 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 ec 0a 00 00       	push   $0xaec
 3a8:	68 95 0a 00 00       	push   $0xa95
 3ad:	6a 01                	push   $0x1
 3af:	e8 13 04 00 00       	call   7c7 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 a9 0a 00 00       	push   $0xaa9
 3bc:	6a 01                	push   $0x1
 3be:	e8 04 04 00 00       	call   7c7 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 60 0f 00 00    	push   0xf60
 3cc:	e8 d1 02 00 00       	call   6a2 <kill>
 3d1:	e8 9c 02 00 00       	call   672 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 0f 0b 00 00       	push   $0xb0f
 3de:	6a 01                	push   $0x1
 3e0:	e8 e2 03 00 00       	call   7c7 <printf>
   exit();
 3e5:	e8 88 02 00 00       	call   672 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000003ea <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3f0:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3f2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3f5:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3f7:	89 d0                	mov    %edx,%eax
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3fb:	55                   	push   %ebp
 3fc:	89 e5                	mov    %esp,%ebp
 3fe:	53                   	push   %ebx
 3ff:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 402:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 407:	e8 f8 05 00 00       	call   a04 <malloc>
  if(n_stack == 0){
 40c:	83 c4 10             	add    $0x10,%esp
 40f:	85 c0                	test   %eax,%eax
 411:	74 41                	je     454 <thread_create+0x59>
 413:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 415:	50                   	push   %eax
 416:	ff 75 10             	push   0x10(%ebp)
 419:	ff 75 0c             	push   0xc(%ebp)
 41c:	ff 75 08             	push   0x8(%ebp)
 41f:	e8 05 03 00 00       	call   729 <clone>
=======
 407:	e8 e1 05 00 00       	call   9ed <malloc>
  if(n_stack == 0){
 40c:	83 c4 10             	add    $0x10,%esp
 40f:	85 c0                	test   %eax,%eax
 411:	74 57                	je     46a <thread_create+0x6f>
 413:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 415:	b8 00 00 00 00       	mov    $0x0,%eax
 41a:	eb 03                	jmp    41f <thread_create+0x24>
 41c:	83 c0 01             	add    $0x1,%eax
 41f:	83 f8 3f             	cmp    $0x3f,%eax
 422:	7f 2f                	jg     453 <thread_create+0x58>
    if(threads[i].flag==0){
 424:	8d 14 40             	lea    (%eax,%eax,2),%edx
 427:	83 3c 95 88 0f 00 00 	cmpl   $0x0,0xf88(,%edx,4)
 42e:	00 
 42f:	75 eb                	jne    41c <thread_create+0x21>
      threads[i].maddr = n_stack;
 431:	8d 14 00             	lea    (%eax,%eax,1),%edx
 434:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 437:	c1 e3 02             	shl    $0x2,%ebx
 43a:	89 8b 80 0f 00 00    	mov    %ecx,0xf80(%ebx)
      threads[i].pg1addr = n_stack;
 440:	89 8b 84 0f 00 00    	mov    %ecx,0xf84(%ebx)
      threads[i].flag = 1;
 446:	01 c2                	add    %eax,%edx
 448:	c7 04 95 88 0f 00 00 	movl   $0x1,0xf88(,%edx,4)
 44f:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 453:	51                   	push   %ecx
 454:	ff 75 10             	push   0x10(%ebp)
 457:	ff 75 0c             	push   0xc(%ebp)
 45a:	ff 75 08             	push   0x8(%ebp)
 45d:	e8 b0 02 00 00       	call   712 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 424:	83 c4 10             	add    $0x10,%esp
 427:	ba 00 00 00 00       	mov    $0x0,%edx
 42c:	eb 03                	jmp    431 <thread_create+0x36>
 42e:	83 c2 01             	add    $0x1,%edx
 431:	83 fa 3f             	cmp    $0x3f,%edx
 434:	7f 19                	jg     44f <thread_create+0x54>
    if(threads[i]->flag==0){
 436:	8b 0c 95 a0 0f 00 00 	mov    0xfa0(,%edx,4),%ecx
 43d:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 441:	75 eb                	jne    42e <thread_create+0x33>
      threads[i]->maddr = n_stack;
 443:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 445:	8b 14 95 a0 0f 00 00 	mov    0xfa0(,%edx,4),%edx
 44c:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 44f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 452:	c9                   	leave  
 453:	c3                   	ret    
    return -1;
 454:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 459:	eb f4                	jmp    44f <thread_create+0x54>

0000045b <thread_join>:
=======
 462:	83 c4 10             	add    $0x10,%esp
}
 465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 468:	c9                   	leave  
 469:	c3                   	ret    
    return -1;
 46a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 46f:	eb f4                	jmp    465 <thread_create+0x6a>

00000471 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 45b:	55                   	push   %ebp
 45c:	89 e5                	mov    %esp,%ebp
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
 460:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 463:	8d 45 f4             	lea    -0xc(%ebp),%eax
 466:	50                   	push   %eax
 467:	e8 c5 02 00 00       	call   731 <join>
 46c:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 46e:	83 c4 10             	add    $0x10,%esp
 471:	bb 00 00 00 00       	mov    $0x0,%ebx
 476:	eb 03                	jmp    47b <thread_join+0x20>
 478:	83 c3 01             	add    $0x1,%ebx
 47b:	83 fb 3f             	cmp    $0x3f,%ebx
 47e:	7f 23                	jg     4a3 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 480:	8b 04 9d a0 0f 00 00 	mov    0xfa0(,%ebx,4),%eax
 487:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 48b:	75 eb                	jne    478 <thread_join+0x1d>
 48d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 490:	39 50 04             	cmp    %edx,0x4(%eax)
 493:	75 e3                	jne    478 <thread_join+0x1d>
      free(stk_addr);
 495:	83 ec 0c             	sub    $0xc,%esp
 498:	52                   	push   %edx
 499:	e8 a6 04 00 00       	call   944 <free>
 49e:	83 c4 10             	add    $0x10,%esp
 4a1:	eb d5                	jmp    478 <thread_join+0x1d>
    }
  }
  return pid;
}
 4a3:	89 f0                	mov    %esi,%eax
 4a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a8:	5b                   	pop    %ebx
 4a9:	5e                   	pop    %esi
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    

000004ac <lock_acquire>:

void lock_acquire(lock_t *lock){
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	53                   	push   %ebx
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	6a 01                	push   $0x1
 4bb:	53                   	push   %ebx
 4bc:	e8 29 ff ff ff       	call   3ea <test_and_set>
 4c1:	83 c4 10             	add    $0x10,%esp
 4c4:	83 f8 01             	cmp    $0x1,%eax
 4c7:	74 ed                	je     4b6 <lock_acquire+0xa>
    ;
}
 4c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    

000004ce <lock_release>:

void lock_release(lock_t *lock) {
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    

000004dc <lock_init>:

void lock_init(lock_t *lock) {
 4dc:	55                   	push   %ebp
 4dd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4df:	8b 45 08             	mov    0x8(%ebp),%eax
 4e2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <strcpy>:
=======
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	53                   	push   %ebx
 475:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 478:	8d 45 f4             	lea    -0xc(%ebp),%eax
 47b:	50                   	push   %eax
 47c:	e8 99 02 00 00       	call   71a <join>
 481:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 483:	83 c4 04             	add    $0x4,%esp
 486:	ff 75 f4             	push   -0xc(%ebp)
 489:	e8 9f 04 00 00       	call   92d <free>
  return pid;
}
 48e:	89 d8                	mov    %ebx,%eax
 490:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 493:	c9                   	leave  
 494:	c3                   	ret    

00000495 <lock_acquire>:

void lock_acquire(lock_t *lock){
 495:	55                   	push   %ebp
 496:	89 e5                	mov    %esp,%ebp
 498:	53                   	push   %ebx
 499:	83 ec 04             	sub    $0x4,%esp
 49c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 49f:	83 ec 08             	sub    $0x8,%esp
 4a2:	6a 01                	push   $0x1
 4a4:	53                   	push   %ebx
 4a5:	e8 40 ff ff ff       	call   3ea <test_and_set>
 4aa:	83 c4 10             	add    $0x10,%esp
 4ad:	83 f8 01             	cmp    $0x1,%eax
 4b0:	74 ed                	je     49f <lock_acquire+0xa>
    ;
}
 4b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b5:	c9                   	leave  
 4b6:	c3                   	ret    

000004b7 <lock_release>:

void lock_release(lock_t *lock) {
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4ba:	8b 45 08             	mov    0x8(%ebp),%eax
 4bd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    

000004c5 <lock_init>:

void lock_init(lock_t *lock) {
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4d1:	5d                   	pop    %ebp
 4d2:	c3                   	ret    

000004d3 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	56                   	push   %esi
 4ee:	53                   	push   %ebx
 4ef:	8b 75 08             	mov    0x8(%ebp),%esi
 4f2:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 4d3:	55                   	push   %ebp
 4d4:	89 e5                	mov    %esp,%ebp
 4d6:	56                   	push   %esi
 4d7:	53                   	push   %ebx
 4d8:	8b 75 08             	mov    0x8(%ebp),%esi
 4db:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 4f5:	89 f0                	mov    %esi,%eax
 4f7:	89 d1                	mov    %edx,%ecx
 4f9:	83 c2 01             	add    $0x1,%edx
 4fc:	89 c3                	mov    %eax,%ebx
 4fe:	83 c0 01             	add    $0x1,%eax
 501:	0f b6 09             	movzbl (%ecx),%ecx
 504:	88 0b                	mov    %cl,(%ebx)
 506:	84 c9                	test   %cl,%cl
 508:	75 ed                	jne    4f7 <strcpy+0xd>
    ;
  return os;
}
 50a:	89 f0                	mov    %esi,%eax
 50c:	5b                   	pop    %ebx
 50d:	5e                   	pop    %esi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    

00000510 <strcmp>:
=======
 4de:	89 f0                	mov    %esi,%eax
 4e0:	89 d1                	mov    %edx,%ecx
 4e2:	83 c2 01             	add    $0x1,%edx
 4e5:	89 c3                	mov    %eax,%ebx
 4e7:	83 c0 01             	add    $0x1,%eax
 4ea:	0f b6 09             	movzbl (%ecx),%ecx
 4ed:	88 0b                	mov    %cl,(%ebx)
 4ef:	84 c9                	test   %cl,%cl
 4f1:	75 ed                	jne    4e0 <strcpy+0xd>
    ;
  return os;
}
 4f3:	89 f0                	mov    %esi,%eax
 4f5:	5b                   	pop    %ebx
 4f6:	5e                   	pop    %esi
 4f7:	5d                   	pop    %ebp
 4f8:	c3                   	ret    

000004f9 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	8b 4d 08             	mov    0x8(%ebp),%ecx
 516:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 519:	eb 06                	jmp    521 <strcmp+0x11>
    p++, q++;
 51b:	83 c1 01             	add    $0x1,%ecx
 51e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 521:	0f b6 01             	movzbl (%ecx),%eax
 524:	84 c0                	test   %al,%al
 526:	74 04                	je     52c <strcmp+0x1c>
 528:	3a 02                	cmp    (%edx),%al
 52a:	74 ef                	je     51b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 52c:	0f b6 c0             	movzbl %al,%eax
 52f:	0f b6 12             	movzbl (%edx),%edx
 532:	29 d0                	sub    %edx,%eax
}
 534:	5d                   	pop    %ebp
 535:	c3                   	ret    

00000536 <strlen>:
=======
 4f9:	55                   	push   %ebp
 4fa:	89 e5                	mov    %esp,%ebp
 4fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4ff:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 502:	eb 06                	jmp    50a <strcmp+0x11>
    p++, q++;
 504:	83 c1 01             	add    $0x1,%ecx
 507:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 50a:	0f b6 01             	movzbl (%ecx),%eax
 50d:	84 c0                	test   %al,%al
 50f:	74 04                	je     515 <strcmp+0x1c>
 511:	3a 02                	cmp    (%edx),%al
 513:	74 ef                	je     504 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 515:	0f b6 c0             	movzbl %al,%eax
 518:	0f b6 12             	movzbl (%edx),%edx
 51b:	29 d0                	sub    %edx,%eax
}
 51d:	5d                   	pop    %ebp
 51e:	c3                   	ret    

0000051f <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 53c:	b8 00 00 00 00       	mov    $0x0,%eax
 541:	eb 03                	jmp    546 <strlen+0x10>
 543:	83 c0 01             	add    $0x1,%eax
 546:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 54a:	75 f7                	jne    543 <strlen+0xd>
    ;
  return n;
}
 54c:	5d                   	pop    %ebp
 54d:	c3                   	ret    

0000054e <memset>:
=======
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 525:	b8 00 00 00 00       	mov    $0x0,%eax
 52a:	eb 03                	jmp    52f <strlen+0x10>
 52c:	83 c0 01             	add    $0x1,%eax
 52f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 533:	75 f7                	jne    52c <strlen+0xd>
    ;
  return n;
}
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    

00000537 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 54e:	55                   	push   %ebp
 54f:	89 e5                	mov    %esp,%ebp
 551:	57                   	push   %edi
 552:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 537:	55                   	push   %ebp
 538:	89 e5                	mov    %esp,%ebp
 53a:	57                   	push   %edi
 53b:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 555:	89 d7                	mov    %edx,%edi
 557:	8b 4d 10             	mov    0x10(%ebp),%ecx
 55a:	8b 45 0c             	mov    0xc(%ebp),%eax
 55d:	fc                   	cld    
 55e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 560:	89 d0                	mov    %edx,%eax
 562:	8b 7d fc             	mov    -0x4(%ebp),%edi
 565:	c9                   	leave  
 566:	c3                   	ret    

00000567 <strchr>:
=======
 53e:	89 d7                	mov    %edx,%edi
 540:	8b 4d 10             	mov    0x10(%ebp),%ecx
 543:	8b 45 0c             	mov    0xc(%ebp),%eax
 546:	fc                   	cld    
 547:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 549:	89 d0                	mov    %edx,%eax
 54b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 54e:	c9                   	leave  
 54f:	c3                   	ret    

00000550 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 571:	eb 03                	jmp    576 <strchr+0xf>
 573:	83 c0 01             	add    $0x1,%eax
 576:	0f b6 10             	movzbl (%eax),%edx
 579:	84 d2                	test   %dl,%dl
 57b:	74 06                	je     583 <strchr+0x1c>
    if(*s == c)
 57d:	38 ca                	cmp    %cl,%dl
 57f:	75 f2                	jne    573 <strchr+0xc>
 581:	eb 05                	jmp    588 <strchr+0x21>
      return (char*)s;
  return 0;
 583:	b8 00 00 00 00       	mov    $0x0,%eax
}
 588:	5d                   	pop    %ebp
 589:	c3                   	ret    

0000058a <gets>:
=======
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 55a:	eb 03                	jmp    55f <strchr+0xf>
 55c:	83 c0 01             	add    $0x1,%eax
 55f:	0f b6 10             	movzbl (%eax),%edx
 562:	84 d2                	test   %dl,%dl
 564:	74 06                	je     56c <strchr+0x1c>
    if(*s == c)
 566:	38 ca                	cmp    %cl,%dl
 568:	75 f2                	jne    55c <strchr+0xc>
 56a:	eb 05                	jmp    571 <strchr+0x21>
      return (char*)s;
  return 0;
 56c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 571:	5d                   	pop    %ebp
 572:	c3                   	ret    

00000573 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 58a:	55                   	push   %ebp
 58b:	89 e5                	mov    %esp,%ebp
 58d:	57                   	push   %edi
 58e:	56                   	push   %esi
 58f:	53                   	push   %ebx
 590:	83 ec 1c             	sub    $0x1c,%esp
 593:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 573:	55                   	push   %ebp
 574:	89 e5                	mov    %esp,%ebp
 576:	57                   	push   %edi
 577:	56                   	push   %esi
 578:	53                   	push   %ebx
 579:	83 ec 1c             	sub    $0x1c,%esp
 57c:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 596:	bb 00 00 00 00       	mov    $0x0,%ebx
 59b:	89 de                	mov    %ebx,%esi
 59d:	83 c3 01             	add    $0x1,%ebx
 5a0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5a3:	7d 2e                	jge    5d3 <gets+0x49>
    cc = read(0, &c, 1);
 5a5:	83 ec 04             	sub    $0x4,%esp
 5a8:	6a 01                	push   $0x1
 5aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ad:	50                   	push   %eax
 5ae:	6a 00                	push   $0x0
 5b0:	e8 ec 00 00 00       	call   6a1 <read>
    if(cc < 1)
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	85 c0                	test   %eax,%eax
 5ba:	7e 17                	jle    5d3 <gets+0x49>
      break;
    buf[i++] = c;
 5bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5c0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5c3:	3c 0a                	cmp    $0xa,%al
 5c5:	0f 94 c2             	sete   %dl
 5c8:	3c 0d                	cmp    $0xd,%al
 5ca:	0f 94 c0             	sete   %al
 5cd:	08 c2                	or     %al,%dl
 5cf:	74 ca                	je     59b <gets+0x11>
    buf[i++] = c;
 5d1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5d3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5d7:	89 f8                	mov    %edi,%eax
 5d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5dc:	5b                   	pop    %ebx
 5dd:	5e                   	pop    %esi
 5de:	5f                   	pop    %edi
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    

000005e1 <stat>:
=======
 57f:	bb 00 00 00 00       	mov    $0x0,%ebx
 584:	89 de                	mov    %ebx,%esi
 586:	83 c3 01             	add    $0x1,%ebx
 589:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 58c:	7d 2e                	jge    5bc <gets+0x49>
    cc = read(0, &c, 1);
 58e:	83 ec 04             	sub    $0x4,%esp
 591:	6a 01                	push   $0x1
 593:	8d 45 e7             	lea    -0x19(%ebp),%eax
 596:	50                   	push   %eax
 597:	6a 00                	push   $0x0
 599:	e8 ec 00 00 00       	call   68a <read>
    if(cc < 1)
 59e:	83 c4 10             	add    $0x10,%esp
 5a1:	85 c0                	test   %eax,%eax
 5a3:	7e 17                	jle    5bc <gets+0x49>
      break;
    buf[i++] = c;
 5a5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5a9:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5ac:	3c 0a                	cmp    $0xa,%al
 5ae:	0f 94 c2             	sete   %dl
 5b1:	3c 0d                	cmp    $0xd,%al
 5b3:	0f 94 c0             	sete   %al
 5b6:	08 c2                	or     %al,%dl
 5b8:	74 ca                	je     584 <gets+0x11>
    buf[i++] = c;
 5ba:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5bc:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5c0:	89 f8                	mov    %edi,%eax
 5c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c5:	5b                   	pop    %ebx
 5c6:	5e                   	pop    %esi
 5c7:	5f                   	pop    %edi
 5c8:	5d                   	pop    %ebp
 5c9:	c3                   	ret    

000005ca <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 5e1:	55                   	push   %ebp
 5e2:	89 e5                	mov    %esp,%ebp
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
=======
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	56                   	push   %esi
 5ce:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 5e6:	83 ec 08             	sub    $0x8,%esp
 5e9:	6a 00                	push   $0x0
 5eb:	ff 75 08             	push   0x8(%ebp)
 5ee:	e8 d6 00 00 00       	call   6c9 <open>
  if(fd < 0)
 5f3:	83 c4 10             	add    $0x10,%esp
 5f6:	85 c0                	test   %eax,%eax
 5f8:	78 24                	js     61e <stat+0x3d>
 5fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5fc:	83 ec 08             	sub    $0x8,%esp
 5ff:	ff 75 0c             	push   0xc(%ebp)
 602:	50                   	push   %eax
 603:	e8 d9 00 00 00       	call   6e1 <fstat>
 608:	89 c6                	mov    %eax,%esi
  close(fd);
 60a:	89 1c 24             	mov    %ebx,(%esp)
 60d:	e8 9f 00 00 00       	call   6b1 <close>
  return r;
 612:	83 c4 10             	add    $0x10,%esp
}
 615:	89 f0                	mov    %esi,%eax
 617:	8d 65 f8             	lea    -0x8(%ebp),%esp
 61a:	5b                   	pop    %ebx
 61b:	5e                   	pop    %esi
 61c:	5d                   	pop    %ebp
 61d:	c3                   	ret    
    return -1;
 61e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 623:	eb f0                	jmp    615 <stat+0x34>

00000625 <atoi>:
=======
 5cf:	83 ec 08             	sub    $0x8,%esp
 5d2:	6a 00                	push   $0x0
 5d4:	ff 75 08             	push   0x8(%ebp)
 5d7:	e8 d6 00 00 00       	call   6b2 <open>
  if(fd < 0)
 5dc:	83 c4 10             	add    $0x10,%esp
 5df:	85 c0                	test   %eax,%eax
 5e1:	78 24                	js     607 <stat+0x3d>
 5e3:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5e5:	83 ec 08             	sub    $0x8,%esp
 5e8:	ff 75 0c             	push   0xc(%ebp)
 5eb:	50                   	push   %eax
 5ec:	e8 d9 00 00 00       	call   6ca <fstat>
 5f1:	89 c6                	mov    %eax,%esi
  close(fd);
 5f3:	89 1c 24             	mov    %ebx,(%esp)
 5f6:	e8 9f 00 00 00       	call   69a <close>
  return r;
 5fb:	83 c4 10             	add    $0x10,%esp
}
 5fe:	89 f0                	mov    %esi,%eax
 600:	8d 65 f8             	lea    -0x8(%ebp),%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    
    return -1;
 607:	be ff ff ff ff       	mov    $0xffffffff,%esi
 60c:	eb f0                	jmp    5fe <stat+0x34>

0000060e <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 625:	55                   	push   %ebp
 626:	89 e5                	mov    %esp,%ebp
 628:	53                   	push   %ebx
 629:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 62c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 631:	eb 10                	jmp    643 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 633:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 636:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 639:	83 c1 01             	add    $0x1,%ecx
 63c:	0f be c0             	movsbl %al,%eax
 63f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 643:	0f b6 01             	movzbl (%ecx),%eax
 646:	8d 58 d0             	lea    -0x30(%eax),%ebx
 649:	80 fb 09             	cmp    $0x9,%bl
 64c:	76 e5                	jbe    633 <atoi+0xe>
  return n;
}
 64e:	89 d0                	mov    %edx,%eax
 650:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 653:	c9                   	leave  
 654:	c3                   	ret    

00000655 <memmove>:
=======
 60e:	55                   	push   %ebp
 60f:	89 e5                	mov    %esp,%ebp
 611:	53                   	push   %ebx
 612:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 615:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 61a:	eb 10                	jmp    62c <atoi+0x1e>
    n = n*10 + *s++ - '0';
 61c:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 61f:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 622:	83 c1 01             	add    $0x1,%ecx
 625:	0f be c0             	movsbl %al,%eax
 628:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 62c:	0f b6 01             	movzbl (%ecx),%eax
 62f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 632:	80 fb 09             	cmp    $0x9,%bl
 635:	76 e5                	jbe    61c <atoi+0xe>
  return n;
}
 637:	89 d0                	mov    %edx,%eax
 639:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 63c:	c9                   	leave  
 63d:	c3                   	ret    

0000063e <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 655:	55                   	push   %ebp
 656:	89 e5                	mov    %esp,%ebp
 658:	56                   	push   %esi
 659:	53                   	push   %ebx
 65a:	8b 75 08             	mov    0x8(%ebp),%esi
 65d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 660:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 63e:	55                   	push   %ebp
 63f:	89 e5                	mov    %esp,%ebp
 641:	56                   	push   %esi
 642:	53                   	push   %ebx
 643:	8b 75 08             	mov    0x8(%ebp),%esi
 646:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 649:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 663:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 665:	eb 0d                	jmp    674 <memmove+0x1f>
    *dst++ = *src++;
 667:	0f b6 01             	movzbl (%ecx),%eax
 66a:	88 02                	mov    %al,(%edx)
 66c:	8d 49 01             	lea    0x1(%ecx),%ecx
 66f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 672:	89 d8                	mov    %ebx,%eax
 674:	8d 58 ff             	lea    -0x1(%eax),%ebx
 677:	85 c0                	test   %eax,%eax
 679:	7f ec                	jg     667 <memmove+0x12>
  return vdst;
}
 67b:	89 f0                	mov    %esi,%eax
 67d:	5b                   	pop    %ebx
 67e:	5e                   	pop    %esi
 67f:	5d                   	pop    %ebp
 680:	c3                   	ret    

00000681 <fork>:
=======
 64c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 64e:	eb 0d                	jmp    65d <memmove+0x1f>
    *dst++ = *src++;
 650:	0f b6 01             	movzbl (%ecx),%eax
 653:	88 02                	mov    %al,(%edx)
 655:	8d 49 01             	lea    0x1(%ecx),%ecx
 658:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 65b:	89 d8                	mov    %ebx,%eax
 65d:	8d 58 ff             	lea    -0x1(%eax),%ebx
 660:	85 c0                	test   %eax,%eax
 662:	7f ec                	jg     650 <memmove+0x12>
  return vdst;
}
 664:	89 f0                	mov    %esi,%eax
 666:	5b                   	pop    %ebx
 667:	5e                   	pop    %esi
 668:	5d                   	pop    %ebp
 669:	c3                   	ret    

0000066a <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 681:	b8 01 00 00 00       	mov    $0x1,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <exit>:
SYSCALL(exit)
 689:	b8 02 00 00 00       	mov    $0x2,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <wait>:
SYSCALL(wait)
 691:	b8 03 00 00 00       	mov    $0x3,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <pipe>:
SYSCALL(pipe)
 699:	b8 04 00 00 00       	mov    $0x4,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <read>:
SYSCALL(read)
 6a1:	b8 05 00 00 00       	mov    $0x5,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <write>:
SYSCALL(write)
 6a9:	b8 10 00 00 00       	mov    $0x10,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <close>:
SYSCALL(close)
 6b1:	b8 15 00 00 00       	mov    $0x15,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <kill>:
SYSCALL(kill)
 6b9:	b8 06 00 00 00       	mov    $0x6,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <exec>:
SYSCALL(exec)
 6c1:	b8 07 00 00 00       	mov    $0x7,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <open>:
SYSCALL(open)
 6c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <mknod>:
SYSCALL(mknod)
 6d1:	b8 11 00 00 00       	mov    $0x11,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <unlink>:
SYSCALL(unlink)
 6d9:	b8 12 00 00 00       	mov    $0x12,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <fstat>:
SYSCALL(fstat)
 6e1:	b8 08 00 00 00       	mov    $0x8,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <link>:
SYSCALL(link)
 6e9:	b8 13 00 00 00       	mov    $0x13,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <mkdir>:
SYSCALL(mkdir)
 6f1:	b8 14 00 00 00       	mov    $0x14,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <chdir>:
SYSCALL(chdir)
 6f9:	b8 09 00 00 00       	mov    $0x9,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <dup>:
SYSCALL(dup)
 701:	b8 0a 00 00 00       	mov    $0xa,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <getpid>:
SYSCALL(getpid)
 709:	b8 0b 00 00 00       	mov    $0xb,%eax
 70e:	cd 40                	int    $0x40
 710:	c3                   	ret    

00000711 <sbrk>:
SYSCALL(sbrk)
 711:	b8 0c 00 00 00       	mov    $0xc,%eax
 716:	cd 40                	int    $0x40
 718:	c3                   	ret    

00000719 <sleep>:
SYSCALL(sleep)
 719:	b8 0d 00 00 00       	mov    $0xd,%eax
 71e:	cd 40                	int    $0x40
 720:	c3                   	ret    

00000721 <uptime>:
SYSCALL(uptime)
 721:	b8 0e 00 00 00       	mov    $0xe,%eax
 726:	cd 40                	int    $0x40
 728:	c3                   	ret    

00000729 <clone>:
SYSCALL(clone)
 729:	b8 16 00 00 00       	mov    $0x16,%eax
 72e:	cd 40                	int    $0x40
 730:	c3                   	ret    

00000731 <join>:
 731:	b8 17 00 00 00       	mov    $0x17,%eax
 736:	cd 40                	int    $0x40
 738:	c3                   	ret    

00000739 <putc>:
=======
 66a:	b8 01 00 00 00       	mov    $0x1,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <exit>:
SYSCALL(exit)
 672:	b8 02 00 00 00       	mov    $0x2,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <wait>:
SYSCALL(wait)
 67a:	b8 03 00 00 00       	mov    $0x3,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <pipe>:
SYSCALL(pipe)
 682:	b8 04 00 00 00       	mov    $0x4,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <read>:
SYSCALL(read)
 68a:	b8 05 00 00 00       	mov    $0x5,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <write>:
SYSCALL(write)
 692:	b8 10 00 00 00       	mov    $0x10,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <close>:
SYSCALL(close)
 69a:	b8 15 00 00 00       	mov    $0x15,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <kill>:
SYSCALL(kill)
 6a2:	b8 06 00 00 00       	mov    $0x6,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <exec>:
SYSCALL(exec)
 6aa:	b8 07 00 00 00       	mov    $0x7,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <open>:
SYSCALL(open)
 6b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <mknod>:
SYSCALL(mknod)
 6ba:	b8 11 00 00 00       	mov    $0x11,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <unlink>:
SYSCALL(unlink)
 6c2:	b8 12 00 00 00       	mov    $0x12,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <fstat>:
SYSCALL(fstat)
 6ca:	b8 08 00 00 00       	mov    $0x8,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <link>:
SYSCALL(link)
 6d2:	b8 13 00 00 00       	mov    $0x13,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <mkdir>:
SYSCALL(mkdir)
 6da:	b8 14 00 00 00       	mov    $0x14,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <chdir>:
SYSCALL(chdir)
 6e2:	b8 09 00 00 00       	mov    $0x9,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <dup>:
SYSCALL(dup)
 6ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <getpid>:
SYSCALL(getpid)
 6f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <sbrk>:
SYSCALL(sbrk)
 6fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <sleep>:
SYSCALL(sleep)
 702:	b8 0d 00 00 00       	mov    $0xd,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <uptime>:
SYSCALL(uptime)
 70a:	b8 0e 00 00 00       	mov    $0xe,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <clone>:
SYSCALL(clone)
 712:	b8 16 00 00 00       	mov    $0x16,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <join>:
 71a:	b8 17 00 00 00       	mov    $0x17,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 739:	55                   	push   %ebp
 73a:	89 e5                	mov    %esp,%ebp
 73c:	83 ec 1c             	sub    $0x1c,%esp
 73f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 742:	6a 01                	push   $0x1
 744:	8d 55 f4             	lea    -0xc(%ebp),%edx
 747:	52                   	push   %edx
 748:	50                   	push   %eax
 749:	e8 5b ff ff ff       	call   6a9 <write>
}
 74e:	83 c4 10             	add    $0x10,%esp
 751:	c9                   	leave  
 752:	c3                   	ret    

00000753 <printint>:
=======
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	83 ec 1c             	sub    $0x1c,%esp
 728:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 72b:	6a 01                	push   $0x1
 72d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 730:	52                   	push   %edx
 731:	50                   	push   %eax
 732:	e8 5b ff ff ff       	call   692 <write>
}
 737:	83 c4 10             	add    $0x10,%esp
 73a:	c9                   	leave  
 73b:	c3                   	ret    

0000073c <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 753:	55                   	push   %ebp
 754:	89 e5                	mov    %esp,%ebp
 756:	57                   	push   %edi
 757:	56                   	push   %esi
 758:	53                   	push   %ebx
 759:	83 ec 2c             	sub    $0x2c,%esp
 75c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 75f:	89 d0                	mov    %edx,%eax
 761:	89 ce                	mov    %ecx,%esi
=======
 73c:	55                   	push   %ebp
 73d:	89 e5                	mov    %esp,%ebp
 73f:	57                   	push   %edi
 740:	56                   	push   %esi
 741:	53                   	push   %ebx
 742:	83 ec 2c             	sub    $0x2c,%esp
 745:	89 45 d0             	mov    %eax,-0x30(%ebp)
 748:	89 d0                	mov    %edx,%eax
 74a:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 763:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 767:	0f 95 c1             	setne  %cl
 76a:	c1 ea 1f             	shr    $0x1f,%edx
 76d:	84 d1                	test   %dl,%cl
 76f:	74 44                	je     7b5 <printint+0x62>
    neg = 1;
    x = -xx;
 771:	f7 d8                	neg    %eax
 773:	89 c1                	mov    %eax,%ecx
    neg = 1;
 775:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 74c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 750:	0f 95 c1             	setne  %cl
 753:	c1 ea 1f             	shr    $0x1f,%edx
 756:	84 d1                	test   %dl,%cl
 758:	74 44                	je     79e <printint+0x62>
    neg = 1;
    x = -xx;
 75a:	f7 d8                	neg    %eax
 75c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 75e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 77c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 781:	89 c8                	mov    %ecx,%eax
 783:	ba 00 00 00 00       	mov    $0x0,%edx
 788:	f7 f6                	div    %esi
 78a:	89 df                	mov    %ebx,%edi
 78c:	83 c3 01             	add    $0x1,%ebx
 78f:	0f b6 92 b8 0b 00 00 	movzbl 0xbb8(%edx),%edx
 796:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 79a:	89 ca                	mov    %ecx,%edx
 79c:	89 c1                	mov    %eax,%ecx
 79e:	39 d6                	cmp    %edx,%esi
 7a0:	76 df                	jbe    781 <printint+0x2e>
  if(neg)
 7a2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7a6:	74 31                	je     7d9 <printint+0x86>
    buf[i++] = '-';
 7a8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7ad:	8d 5f 02             	lea    0x2(%edi),%ebx
 7b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b3:	eb 17                	jmp    7cc <printint+0x79>
    x = xx;
 7b5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7b7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7be:	eb bc                	jmp    77c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7c0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7c5:	89 f0                	mov    %esi,%eax
 7c7:	e8 6d ff ff ff       	call   739 <putc>
  while(--i >= 0)
 7cc:	83 eb 01             	sub    $0x1,%ebx
 7cf:	79 ef                	jns    7c0 <printint+0x6d>
}
 7d1:	83 c4 2c             	add    $0x2c,%esp
 7d4:	5b                   	pop    %ebx
 7d5:	5e                   	pop    %esi
 7d6:	5f                   	pop    %edi
 7d7:	5d                   	pop    %ebp
 7d8:	c3                   	ret    
 7d9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7dc:	eb ee                	jmp    7cc <printint+0x79>

000007de <printf>:
=======
 765:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 76a:	89 c8                	mov    %ecx,%eax
 76c:	ba 00 00 00 00       	mov    $0x0,%edx
 771:	f7 f6                	div    %esi
 773:	89 df                	mov    %ebx,%edi
 775:	83 c3 01             	add    $0x1,%ebx
 778:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
 77f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 783:	89 ca                	mov    %ecx,%edx
 785:	89 c1                	mov    %eax,%ecx
 787:	39 d6                	cmp    %edx,%esi
 789:	76 df                	jbe    76a <printint+0x2e>
  if(neg)
 78b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 78f:	74 31                	je     7c2 <printint+0x86>
    buf[i++] = '-';
 791:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 796:	8d 5f 02             	lea    0x2(%edi),%ebx
 799:	8b 75 d0             	mov    -0x30(%ebp),%esi
 79c:	eb 17                	jmp    7b5 <printint+0x79>
    x = xx;
 79e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7a0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7a7:	eb bc                	jmp    765 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7a9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7ae:	89 f0                	mov    %esi,%eax
 7b0:	e8 6d ff ff ff       	call   722 <putc>
  while(--i >= 0)
 7b5:	83 eb 01             	sub    $0x1,%ebx
 7b8:	79 ef                	jns    7a9 <printint+0x6d>
}
 7ba:	83 c4 2c             	add    $0x2c,%esp
 7bd:	5b                   	pop    %ebx
 7be:	5e                   	pop    %esi
 7bf:	5f                   	pop    %edi
 7c0:	5d                   	pop    %ebp
 7c1:	c3                   	ret    
 7c2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7c5:	eb ee                	jmp    7b5 <printint+0x79>

000007c7 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 7de:	55                   	push   %ebp
 7df:	89 e5                	mov    %esp,%ebp
 7e1:	57                   	push   %edi
 7e2:	56                   	push   %esi
 7e3:	53                   	push   %ebx
 7e4:	83 ec 1c             	sub    $0x1c,%esp
=======
 7c7:	55                   	push   %ebp
 7c8:	89 e5                	mov    %esp,%ebp
 7ca:	57                   	push   %edi
 7cb:	56                   	push   %esi
 7cc:	53                   	push   %ebx
 7cd:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 7e7:	8d 45 10             	lea    0x10(%ebp),%eax
 7ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7ed:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 7f7:	eb 14                	jmp    80d <printf+0x2f>
=======
 7d0:	8d 45 10             	lea    0x10(%ebp),%eax
 7d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7d6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7db:	bb 00 00 00 00       	mov    $0x0,%ebx
 7e0:	eb 14                	jmp    7f6 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 7f9:	89 fa                	mov    %edi,%edx
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	e8 36 ff ff ff       	call   739 <putc>
 803:	eb 05                	jmp    80a <printf+0x2c>
      }
    } else if(state == '%'){
 805:	83 fe 25             	cmp    $0x25,%esi
 808:	74 25                	je     82f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 80a:	83 c3 01             	add    $0x1,%ebx
 80d:	8b 45 0c             	mov    0xc(%ebp),%eax
 810:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 814:	84 c0                	test   %al,%al
 816:	0f 84 20 01 00 00    	je     93c <printf+0x15e>
    c = fmt[i] & 0xff;
 81c:	0f be f8             	movsbl %al,%edi
 81f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 822:	85 f6                	test   %esi,%esi
 824:	75 df                	jne    805 <printf+0x27>
      if(c == '%'){
 826:	83 f8 25             	cmp    $0x25,%eax
 829:	75 ce                	jne    7f9 <printf+0x1b>
        state = '%';
 82b:	89 c6                	mov    %eax,%esi
 82d:	eb db                	jmp    80a <printf+0x2c>
      if(c == 'd'){
 82f:	83 f8 25             	cmp    $0x25,%eax
 832:	0f 84 cf 00 00 00    	je     907 <printf+0x129>
 838:	0f 8c dd 00 00 00    	jl     91b <printf+0x13d>
 83e:	83 f8 78             	cmp    $0x78,%eax
 841:	0f 8f d4 00 00 00    	jg     91b <printf+0x13d>
 847:	83 f8 63             	cmp    $0x63,%eax
 84a:	0f 8c cb 00 00 00    	jl     91b <printf+0x13d>
 850:	83 e8 63             	sub    $0x63,%eax
 853:	83 f8 15             	cmp    $0x15,%eax
 856:	0f 87 bf 00 00 00    	ja     91b <printf+0x13d>
 85c:	ff 24 85 60 0b 00 00 	jmp    *0xb60(,%eax,4)
        printint(fd, *ap, 10, 1);
 863:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 866:	8b 17                	mov    (%edi),%edx
 868:	83 ec 0c             	sub    $0xc,%esp
 86b:	6a 01                	push   $0x1
 86d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	e8 d9 fe ff ff       	call   753 <printint>
        ap++;
 87a:	83 c7 04             	add    $0x4,%edi
 87d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 880:	83 c4 10             	add    $0x10,%esp
=======
 7e2:	89 fa                	mov    %edi,%edx
 7e4:	8b 45 08             	mov    0x8(%ebp),%eax
 7e7:	e8 36 ff ff ff       	call   722 <putc>
 7ec:	eb 05                	jmp    7f3 <printf+0x2c>
      }
    } else if(state == '%'){
 7ee:	83 fe 25             	cmp    $0x25,%esi
 7f1:	74 25                	je     818 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7f3:	83 c3 01             	add    $0x1,%ebx
 7f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7fd:	84 c0                	test   %al,%al
 7ff:	0f 84 20 01 00 00    	je     925 <printf+0x15e>
    c = fmt[i] & 0xff;
 805:	0f be f8             	movsbl %al,%edi
 808:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 80b:	85 f6                	test   %esi,%esi
 80d:	75 df                	jne    7ee <printf+0x27>
      if(c == '%'){
 80f:	83 f8 25             	cmp    $0x25,%eax
 812:	75 ce                	jne    7e2 <printf+0x1b>
        state = '%';
 814:	89 c6                	mov    %eax,%esi
 816:	eb db                	jmp    7f3 <printf+0x2c>
      if(c == 'd'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	0f 84 cf 00 00 00    	je     8f0 <printf+0x129>
 821:	0f 8c dd 00 00 00    	jl     904 <printf+0x13d>
 827:	83 f8 78             	cmp    $0x78,%eax
 82a:	0f 8f d4 00 00 00    	jg     904 <printf+0x13d>
 830:	83 f8 63             	cmp    $0x63,%eax
 833:	0f 8c cb 00 00 00    	jl     904 <printf+0x13d>
 839:	83 e8 63             	sub    $0x63,%eax
 83c:	83 f8 15             	cmp    $0x15,%eax
 83f:	0f 87 bf 00 00 00    	ja     904 <printf+0x13d>
 845:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
        printint(fd, *ap, 10, 1);
 84c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 84f:	8b 17                	mov    (%edi),%edx
 851:	83 ec 0c             	sub    $0xc,%esp
 854:	6a 01                	push   $0x1
 856:	b9 0a 00 00 00       	mov    $0xa,%ecx
 85b:	8b 45 08             	mov    0x8(%ebp),%eax
 85e:	e8 d9 fe ff ff       	call   73c <printint>
        ap++;
 863:	83 c7 04             	add    $0x4,%edi
 866:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 869:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 883:	be 00 00 00 00       	mov    $0x0,%esi
 888:	eb 80                	jmp    80a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 88a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 88d:	8b 17                	mov    (%edi),%edx
 88f:	83 ec 0c             	sub    $0xc,%esp
 892:	6a 00                	push   $0x0
 894:	b9 10 00 00 00       	mov    $0x10,%ecx
 899:	8b 45 08             	mov    0x8(%ebp),%eax
 89c:	e8 b2 fe ff ff       	call   753 <printint>
        ap++;
 8a1:	83 c7 04             	add    $0x4,%edi
 8a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8aa:	be 00 00 00 00       	mov    $0x0,%esi
 8af:	e9 56 ff ff ff       	jmp    80a <printf+0x2c>
        s = (char*)*ap;
 8b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8b7:	8b 30                	mov    (%eax),%esi
        ap++;
 8b9:	83 c0 04             	add    $0x4,%eax
 8bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8bf:	85 f6                	test   %esi,%esi
 8c1:	75 15                	jne    8d8 <printf+0xfa>
          s = "(null)";
 8c3:	be 59 0b 00 00       	mov    $0xb59,%esi
 8c8:	eb 0e                	jmp    8d8 <printf+0xfa>
          putc(fd, *s);
 8ca:	0f be d2             	movsbl %dl,%edx
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	e8 64 fe ff ff       	call   739 <putc>
          s++;
 8d5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8d8:	0f b6 16             	movzbl (%esi),%edx
 8db:	84 d2                	test   %dl,%dl
 8dd:	75 eb                	jne    8ca <printf+0xec>
      state = 0;
 8df:	be 00 00 00 00       	mov    $0x0,%esi
 8e4:	e9 21 ff ff ff       	jmp    80a <printf+0x2c>
        putc(fd, *ap);
 8e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8ec:	0f be 17             	movsbl (%edi),%edx
 8ef:	8b 45 08             	mov    0x8(%ebp),%eax
 8f2:	e8 42 fe ff ff       	call   739 <putc>
        ap++;
 8f7:	83 c7 04             	add    $0x4,%edi
 8fa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8fd:	be 00 00 00 00       	mov    $0x0,%esi
 902:	e9 03 ff ff ff       	jmp    80a <printf+0x2c>
        putc(fd, c);
 907:	89 fa                	mov    %edi,%edx
 909:	8b 45 08             	mov    0x8(%ebp),%eax
 90c:	e8 28 fe ff ff       	call   739 <putc>
      state = 0;
 911:	be 00 00 00 00       	mov    $0x0,%esi
 916:	e9 ef fe ff ff       	jmp    80a <printf+0x2c>
        putc(fd, '%');
 91b:	ba 25 00 00 00       	mov    $0x25,%edx
 920:	8b 45 08             	mov    0x8(%ebp),%eax
 923:	e8 11 fe ff ff       	call   739 <putc>
        putc(fd, c);
 928:	89 fa                	mov    %edi,%edx
 92a:	8b 45 08             	mov    0x8(%ebp),%eax
 92d:	e8 07 fe ff ff       	call   739 <putc>
      state = 0;
 932:	be 00 00 00 00       	mov    $0x0,%esi
 937:	e9 ce fe ff ff       	jmp    80a <printf+0x2c>
    }
  }
}
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 93f:	5b                   	pop    %ebx
 940:	5e                   	pop    %esi
 941:	5f                   	pop    %edi
 942:	5d                   	pop    %ebp
 943:	c3                   	ret    

00000944 <free>:
=======
 86c:	be 00 00 00 00       	mov    $0x0,%esi
 871:	eb 80                	jmp    7f3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 873:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 876:	8b 17                	mov    (%edi),%edx
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	6a 00                	push   $0x0
 87d:	b9 10 00 00 00       	mov    $0x10,%ecx
 882:	8b 45 08             	mov    0x8(%ebp),%eax
 885:	e8 b2 fe ff ff       	call   73c <printint>
        ap++;
 88a:	83 c7 04             	add    $0x4,%edi
 88d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 890:	83 c4 10             	add    $0x10,%esp
      state = 0;
 893:	be 00 00 00 00       	mov    $0x0,%esi
 898:	e9 56 ff ff ff       	jmp    7f3 <printf+0x2c>
        s = (char*)*ap;
 89d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a0:	8b 30                	mov    (%eax),%esi
        ap++;
 8a2:	83 c0 04             	add    $0x4,%eax
 8a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8a8:	85 f6                	test   %esi,%esi
 8aa:	75 15                	jne    8c1 <printf+0xfa>
          s = "(null)";
 8ac:	be 41 0b 00 00       	mov    $0xb41,%esi
 8b1:	eb 0e                	jmp    8c1 <printf+0xfa>
          putc(fd, *s);
 8b3:	0f be d2             	movsbl %dl,%edx
 8b6:	8b 45 08             	mov    0x8(%ebp),%eax
 8b9:	e8 64 fe ff ff       	call   722 <putc>
          s++;
 8be:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8c1:	0f b6 16             	movzbl (%esi),%edx
 8c4:	84 d2                	test   %dl,%dl
 8c6:	75 eb                	jne    8b3 <printf+0xec>
      state = 0;
 8c8:	be 00 00 00 00       	mov    $0x0,%esi
 8cd:	e9 21 ff ff ff       	jmp    7f3 <printf+0x2c>
        putc(fd, *ap);
 8d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8d5:	0f be 17             	movsbl (%edi),%edx
 8d8:	8b 45 08             	mov    0x8(%ebp),%eax
 8db:	e8 42 fe ff ff       	call   722 <putc>
        ap++;
 8e0:	83 c7 04             	add    $0x4,%edi
 8e3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8e6:	be 00 00 00 00       	mov    $0x0,%esi
 8eb:	e9 03 ff ff ff       	jmp    7f3 <printf+0x2c>
        putc(fd, c);
 8f0:	89 fa                	mov    %edi,%edx
 8f2:	8b 45 08             	mov    0x8(%ebp),%eax
 8f5:	e8 28 fe ff ff       	call   722 <putc>
      state = 0;
 8fa:	be 00 00 00 00       	mov    $0x0,%esi
 8ff:	e9 ef fe ff ff       	jmp    7f3 <printf+0x2c>
        putc(fd, '%');
 904:	ba 25 00 00 00       	mov    $0x25,%edx
 909:	8b 45 08             	mov    0x8(%ebp),%eax
 90c:	e8 11 fe ff ff       	call   722 <putc>
        putc(fd, c);
 911:	89 fa                	mov    %edi,%edx
 913:	8b 45 08             	mov    0x8(%ebp),%eax
 916:	e8 07 fe ff ff       	call   722 <putc>
      state = 0;
 91b:	be 00 00 00 00       	mov    $0x0,%esi
 920:	e9 ce fe ff ff       	jmp    7f3 <printf+0x2c>
    }
  }
}
 925:	8d 65 f4             	lea    -0xc(%ebp),%esp
 928:	5b                   	pop    %ebx
 929:	5e                   	pop    %esi
 92a:	5f                   	pop    %edi
 92b:	5d                   	pop    %ebp
 92c:	c3                   	ret    

0000092d <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 944:	55                   	push   %ebp
 945:	89 e5                	mov    %esp,%ebp
 947:	57                   	push   %edi
 948:	56                   	push   %esi
 949:	53                   	push   %ebx
 94a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 94d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 950:	a1 a0 10 00 00       	mov    0x10a0,%eax
 955:	eb 02                	jmp    959 <free+0x15>
 957:	89 d0                	mov    %edx,%eax
 959:	39 c8                	cmp    %ecx,%eax
 95b:	73 04                	jae    961 <free+0x1d>
 95d:	39 08                	cmp    %ecx,(%eax)
 95f:	77 12                	ja     973 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 961:	8b 10                	mov    (%eax),%edx
 963:	39 c2                	cmp    %eax,%edx
 965:	77 f0                	ja     957 <free+0x13>
 967:	39 c8                	cmp    %ecx,%eax
 969:	72 08                	jb     973 <free+0x2f>
 96b:	39 ca                	cmp    %ecx,%edx
 96d:	77 04                	ja     973 <free+0x2f>
 96f:	89 d0                	mov    %edx,%eax
 971:	eb e6                	jmp    959 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 973:	8b 73 fc             	mov    -0x4(%ebx),%esi
 976:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 979:	8b 10                	mov    (%eax),%edx
 97b:	39 d7                	cmp    %edx,%edi
 97d:	74 19                	je     998 <free+0x54>
=======
 92d:	55                   	push   %ebp
 92e:	89 e5                	mov    %esp,%ebp
 930:	57                   	push   %edi
 931:	56                   	push   %esi
 932:	53                   	push   %ebx
 933:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 936:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 939:	a1 80 12 00 00       	mov    0x1280,%eax
 93e:	eb 02                	jmp    942 <free+0x15>
 940:	89 d0                	mov    %edx,%eax
 942:	39 c8                	cmp    %ecx,%eax
 944:	73 04                	jae    94a <free+0x1d>
 946:	39 08                	cmp    %ecx,(%eax)
 948:	77 12                	ja     95c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94a:	8b 10                	mov    (%eax),%edx
 94c:	39 c2                	cmp    %eax,%edx
 94e:	77 f0                	ja     940 <free+0x13>
 950:	39 c8                	cmp    %ecx,%eax
 952:	72 08                	jb     95c <free+0x2f>
 954:	39 ca                	cmp    %ecx,%edx
 956:	77 04                	ja     95c <free+0x2f>
 958:	89 d0                	mov    %edx,%eax
 95a:	eb e6                	jmp    942 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 95c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 95f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 962:	8b 10                	mov    (%eax),%edx
 964:	39 d7                	cmp    %edx,%edi
 966:	74 19                	je     981 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 97f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 982:	8b 50 04             	mov    0x4(%eax),%edx
 985:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 988:	39 ce                	cmp    %ecx,%esi
 98a:	74 1b                	je     9a7 <free+0x63>
=======
 968:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 96b:	8b 50 04             	mov    0x4(%eax),%edx
 96e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 971:	39 ce                	cmp    %ecx,%esi
 973:	74 1b                	je     990 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 98c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 98e:	a3 a0 10 00 00       	mov    %eax,0x10a0
}
 993:	5b                   	pop    %ebx
 994:	5e                   	pop    %esi
 995:	5f                   	pop    %edi
 996:	5d                   	pop    %ebp
 997:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 998:	03 72 04             	add    0x4(%edx),%esi
 99b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 99e:	8b 10                	mov    (%eax),%edx
 9a0:	8b 12                	mov    (%edx),%edx
 9a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9a5:	eb db                	jmp    982 <free+0x3e>
    p->s.size += bp->s.size;
 9a7:	03 53 fc             	add    -0x4(%ebx),%edx
 9aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ad:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9b0:	89 10                	mov    %edx,(%eax)
 9b2:	eb da                	jmp    98e <free+0x4a>

000009b4 <morecore>:
=======
 975:	89 08                	mov    %ecx,(%eax)
  freep = p;
 977:	a3 80 12 00 00       	mov    %eax,0x1280
}
 97c:	5b                   	pop    %ebx
 97d:	5e                   	pop    %esi
 97e:	5f                   	pop    %edi
 97f:	5d                   	pop    %ebp
 980:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 981:	03 72 04             	add    0x4(%edx),%esi
 984:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 987:	8b 10                	mov    (%eax),%edx
 989:	8b 12                	mov    (%edx),%edx
 98b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 98e:	eb db                	jmp    96b <free+0x3e>
    p->s.size += bp->s.size;
 990:	03 53 fc             	add    -0x4(%ebx),%edx
 993:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 996:	8b 53 f8             	mov    -0x8(%ebx),%edx
 999:	89 10                	mov    %edx,(%eax)
 99b:	eb da                	jmp    977 <free+0x4a>

0000099d <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 9b4:	55                   	push   %ebp
 9b5:	89 e5                	mov    %esp,%ebp
 9b7:	53                   	push   %ebx
 9b8:	83 ec 04             	sub    $0x4,%esp
 9bb:	89 c3                	mov    %eax,%ebx
=======
 99d:	55                   	push   %ebp
 99e:	89 e5                	mov    %esp,%ebp
 9a0:	53                   	push   %ebx
 9a1:	83 ec 04             	sub    $0x4,%esp
 9a4:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 9bd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9c2:	77 05                	ja     9c9 <morecore+0x15>
    nu = 4096;
 9c4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9c9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	50                   	push   %eax
 9d4:	e8 38 fd ff ff       	call   711 <sbrk>
  if(p == (char*)-1)
 9d9:	83 c4 10             	add    $0x10,%esp
 9dc:	83 f8 ff             	cmp    $0xffffffff,%eax
 9df:	74 1c                	je     9fd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9e1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9e4:	83 c0 08             	add    $0x8,%eax
 9e7:	83 ec 0c             	sub    $0xc,%esp
 9ea:	50                   	push   %eax
 9eb:	e8 54 ff ff ff       	call   944 <free>
  return freep;
 9f0:	a1 a0 10 00 00       	mov    0x10a0,%eax
 9f5:	83 c4 10             	add    $0x10,%esp
}
 9f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9fb:	c9                   	leave  
 9fc:	c3                   	ret    
    return 0;
 9fd:	b8 00 00 00 00       	mov    $0x0,%eax
 a02:	eb f4                	jmp    9f8 <morecore+0x44>

00000a04 <malloc>:
=======
 9a6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9ab:	77 05                	ja     9b2 <morecore+0x15>
    nu = 4096;
 9ad:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9b2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9b9:	83 ec 0c             	sub    $0xc,%esp
 9bc:	50                   	push   %eax
 9bd:	e8 38 fd ff ff       	call   6fa <sbrk>
  if(p == (char*)-1)
 9c2:	83 c4 10             	add    $0x10,%esp
 9c5:	83 f8 ff             	cmp    $0xffffffff,%eax
 9c8:	74 1c                	je     9e6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ca:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9cd:	83 c0 08             	add    $0x8,%eax
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	50                   	push   %eax
 9d4:	e8 54 ff ff ff       	call   92d <free>
  return freep;
 9d9:	a1 80 12 00 00       	mov    0x1280,%eax
 9de:	83 c4 10             	add    $0x10,%esp
}
 9e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9e4:	c9                   	leave  
 9e5:	c3                   	ret    
    return 0;
 9e6:	b8 00 00 00 00       	mov    $0x0,%eax
 9eb:	eb f4                	jmp    9e1 <morecore+0x44>

000009ed <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 a04:	55                   	push   %ebp
 a05:	89 e5                	mov    %esp,%ebp
 a07:	53                   	push   %ebx
 a08:	83 ec 04             	sub    $0x4,%esp
=======
 9ed:	55                   	push   %ebp
 9ee:	89 e5                	mov    %esp,%ebp
 9f0:	53                   	push   %ebx
 9f1:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 a0b:	8b 45 08             	mov    0x8(%ebp),%eax
 a0e:	8d 58 07             	lea    0x7(%eax),%ebx
 a11:	c1 eb 03             	shr    $0x3,%ebx
 a14:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a17:	8b 0d a0 10 00 00    	mov    0x10a0,%ecx
 a1d:	85 c9                	test   %ecx,%ecx
 a1f:	74 04                	je     a25 <malloc+0x21>
=======
 9f4:	8b 45 08             	mov    0x8(%ebp),%eax
 9f7:	8d 58 07             	lea    0x7(%eax),%ebx
 9fa:	c1 eb 03             	shr    $0x3,%ebx
 9fd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a00:	8b 0d 80 12 00 00    	mov    0x1280,%ecx
 a06:	85 c9                	test   %ecx,%ecx
 a08:	74 04                	je     a0e <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 a21:	8b 01                	mov    (%ecx),%eax
 a23:	eb 4a                	jmp    a6f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a25:	c7 05 a0 10 00 00 a4 	movl   $0x10a4,0x10a0
 a2c:	10 00 00 
 a2f:	c7 05 a4 10 00 00 a4 	movl   $0x10a4,0x10a4
 a36:	10 00 00 
    base.s.size = 0;
 a39:	c7 05 a8 10 00 00 00 	movl   $0x0,0x10a8
 a40:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a43:	b9 a4 10 00 00       	mov    $0x10a4,%ecx
 a48:	eb d7                	jmp    a21 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a4a:	74 19                	je     a65 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a4c:	29 da                	sub    %ebx,%edx
 a4e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a51:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a54:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a57:	89 0d a0 10 00 00    	mov    %ecx,0x10a0
      return (void*)(p + 1);
 a5d:	83 c0 08             	add    $0x8,%eax
=======
 a0a:	8b 01                	mov    (%ecx),%eax
 a0c:	eb 4a                	jmp    a58 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a0e:	c7 05 80 12 00 00 84 	movl   $0x1284,0x1280
 a15:	12 00 00 
 a18:	c7 05 84 12 00 00 84 	movl   $0x1284,0x1284
 a1f:	12 00 00 
    base.s.size = 0;
 a22:	c7 05 88 12 00 00 00 	movl   $0x0,0x1288
 a29:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a2c:	b9 84 12 00 00       	mov    $0x1284,%ecx
 a31:	eb d7                	jmp    a0a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a33:	74 19                	je     a4e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a35:	29 da                	sub    %ebx,%edx
 a37:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a3a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a3d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a40:	89 0d 80 12 00 00    	mov    %ecx,0x1280
      return (void*)(p + 1);
 a46:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a63:	c9                   	leave  
 a64:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a65:	8b 10                	mov    (%eax),%edx
 a67:	89 11                	mov    %edx,(%ecx)
 a69:	eb ec                	jmp    a57 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6b:	89 c1                	mov    %eax,%ecx
 a6d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a6f:	8b 50 04             	mov    0x4(%eax),%edx
 a72:	39 da                	cmp    %ebx,%edx
 a74:	73 d4                	jae    a4a <malloc+0x46>
    if(p == freep)
 a76:	39 05 a0 10 00 00    	cmp    %eax,0x10a0
 a7c:	75 ed                	jne    a6b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a7e:	89 d8                	mov    %ebx,%eax
 a80:	e8 2f ff ff ff       	call   9b4 <morecore>
 a85:	85 c0                	test   %eax,%eax
 a87:	75 e2                	jne    a6b <malloc+0x67>
 a89:	eb d5                	jmp    a60 <malloc+0x5c>
=======
 a49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a4c:	c9                   	leave  
 a4d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a4e:	8b 10                	mov    (%eax),%edx
 a50:	89 11                	mov    %edx,(%ecx)
 a52:	eb ec                	jmp    a40 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a54:	89 c1                	mov    %eax,%ecx
 a56:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a58:	8b 50 04             	mov    0x4(%eax),%edx
 a5b:	39 da                	cmp    %ebx,%edx
 a5d:	73 d4                	jae    a33 <malloc+0x46>
    if(p == freep)
 a5f:	39 05 80 12 00 00    	cmp    %eax,0x1280
 a65:	75 ed                	jne    a54 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a67:	89 d8                	mov    %ebx,%eax
 a69:	e8 2f ff ff ff       	call   99d <morecore>
 a6e:	85 c0                	test   %eax,%eax
 a70:	75 e2                	jne    a54 <malloc+0x67>
 a72:	eb d5                	jmp    a49 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
