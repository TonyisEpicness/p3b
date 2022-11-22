
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
<<<<<<< HEAD
       6:	68 b0 3c 00 00       	push   $0x3cb0
       b:	ff 35 78 5d 00 00    	push   0x5d78
      11:	e8 57 39 00 00       	call   396d <printf>

  if(mkdir("iputdir") < 0){
      16:	c7 04 24 43 3c 00 00 	movl   $0x3c43,(%esp)
      1d:	e8 5e 38 00 00       	call   3880 <mkdir>
=======
       6:	68 98 3c 00 00       	push   $0x3c98
       b:	ff 35 5c 5d 00 00    	push   0x5d5c
      11:	e8 40 39 00 00       	call   3956 <printf>

  if(mkdir("iputdir") < 0){
      16:	c7 04 24 2b 3c 00 00 	movl   $0x3c2b,(%esp)
      1d:	e8 47 38 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
      22:	83 c4 10             	add    $0x10,%esp
      25:	85 c0                	test   %eax,%eax
      27:	78 54                	js     7d <iputtest+0x7d>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
      29:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
      2c:	68 43 3c 00 00       	push   $0x3c43
      31:	e8 52 38 00 00       	call   3888 <chdir>
=======
      2c:	68 2b 3c 00 00       	push   $0x3c2b
      31:	e8 3b 38 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
      36:	83 c4 10             	add    $0x10,%esp
      39:	85 c0                	test   %eax,%eax
      3b:	78 58                	js     95 <iputtest+0x95>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
      3d:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
      40:	68 40 3c 00 00       	push   $0x3c40
      45:	e8 1e 38 00 00       	call   3868 <unlink>
=======
      40:	68 28 3c 00 00       	push   $0x3c28
      45:	e8 07 38 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
      4a:	83 c4 10             	add    $0x10,%esp
      4d:	85 c0                	test   %eax,%eax
      4f:	78 5c                	js     ad <iputtest+0xad>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
      51:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
      54:	68 65 3c 00 00       	push   $0x3c65
      59:	e8 2a 38 00 00       	call   3888 <chdir>
=======
      54:	68 4d 3c 00 00       	push   $0x3c4d
      59:	e8 13 38 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
      5e:	83 c4 10             	add    $0x10,%esp
      61:	85 c0                	test   %eax,%eax
      63:	78 60                	js     c5 <iputtest+0xc5>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
      65:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
      68:	68 e8 3c 00 00       	push   $0x3ce8
      6d:	ff 35 78 5d 00 00    	push   0x5d78
      73:	e8 f5 38 00 00       	call   396d <printf>
=======
      68:	68 d0 3c 00 00       	push   $0x3cd0
      6d:	ff 35 5c 5d 00 00    	push   0x5d5c
      73:	e8 de 38 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
      78:	83 c4 10             	add    $0x10,%esp
      7b:	c9                   	leave  
      7c:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
      7d:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
      80:	68 1c 3c 00 00       	push   $0x3c1c
      85:	ff 35 78 5d 00 00    	push   0x5d78
      8b:	e8 dd 38 00 00       	call   396d <printf>
    exit();
      90:	e8 83 37 00 00       	call   3818 <exit>
    printf(stdout, "chdir iputdir failed\n");
      95:	83 ec 08             	sub    $0x8,%esp
      98:	68 2a 3c 00 00       	push   $0x3c2a
      9d:	ff 35 78 5d 00 00    	push   0x5d78
      a3:	e8 c5 38 00 00       	call   396d <printf>
    exit();
      a8:	e8 6b 37 00 00       	call   3818 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
      ad:	83 ec 08             	sub    $0x8,%esp
      b0:	68 4b 3c 00 00       	push   $0x3c4b
      b5:	ff 35 78 5d 00 00    	push   0x5d78
      bb:	e8 ad 38 00 00       	call   396d <printf>
    exit();
      c0:	e8 53 37 00 00       	call   3818 <exit>
    printf(stdout, "chdir / failed\n");
      c5:	83 ec 08             	sub    $0x8,%esp
      c8:	68 67 3c 00 00       	push   $0x3c67
      cd:	ff 35 78 5d 00 00    	push   0x5d78
      d3:	e8 95 38 00 00       	call   396d <printf>
    exit();
      d8:	e8 3b 37 00 00       	call   3818 <exit>
=======
      80:	68 04 3c 00 00       	push   $0x3c04
      85:	ff 35 5c 5d 00 00    	push   0x5d5c
      8b:	e8 c6 38 00 00       	call   3956 <printf>
    exit();
      90:	e8 6c 37 00 00       	call   3801 <exit>
    printf(stdout, "chdir iputdir failed\n");
      95:	83 ec 08             	sub    $0x8,%esp
      98:	68 12 3c 00 00       	push   $0x3c12
      9d:	ff 35 5c 5d 00 00    	push   0x5d5c
      a3:	e8 ae 38 00 00       	call   3956 <printf>
    exit();
      a8:	e8 54 37 00 00       	call   3801 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
      ad:	83 ec 08             	sub    $0x8,%esp
      b0:	68 33 3c 00 00       	push   $0x3c33
      b5:	ff 35 5c 5d 00 00    	push   0x5d5c
      bb:	e8 96 38 00 00       	call   3956 <printf>
    exit();
      c0:	e8 3c 37 00 00       	call   3801 <exit>
    printf(stdout, "chdir / failed\n");
      c5:	83 ec 08             	sub    $0x8,%esp
      c8:	68 4f 3c 00 00       	push   $0x3c4f
      cd:	ff 35 5c 5d 00 00    	push   0x5d5c
      d3:	e8 7e 38 00 00       	call   3956 <printf>
    exit();
      d8:	e8 24 37 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000000dd <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      dd:	55                   	push   %ebp
      de:	89 e5                	mov    %esp,%ebp
      e0:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
<<<<<<< HEAD
      e3:	68 77 3c 00 00       	push   $0x3c77
      e8:	ff 35 78 5d 00 00    	push   0x5d78
      ee:	e8 7a 38 00 00       	call   396d <printf>

  pid = fork();
      f3:	e8 18 37 00 00       	call   3810 <fork>
=======
      e3:	68 5f 3c 00 00       	push   $0x3c5f
      e8:	ff 35 5c 5d 00 00    	push   0x5d5c
      ee:	e8 63 38 00 00       	call   3956 <printf>

  pid = fork();
      f3:	e8 01 37 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(pid < 0){
      f8:	83 c4 10             	add    $0x10,%esp
      fb:	85 c0                	test   %eax,%eax
      fd:	78 47                	js     146 <exitiputtest+0x69>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
      ff:	0f 85 a1 00 00 00    	jne    1a6 <exitiputtest+0xc9>
    if(mkdir("iputdir") < 0){
     105:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
     108:	68 43 3c 00 00       	push   $0x3c43
     10d:	e8 6e 37 00 00       	call   3880 <mkdir>
=======
     108:	68 2b 3c 00 00       	push   $0x3c2b
     10d:	e8 57 37 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
     112:	83 c4 10             	add    $0x10,%esp
     115:	85 c0                	test   %eax,%eax
     117:	78 45                	js     15e <exitiputtest+0x81>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     119:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
     11c:	68 43 3c 00 00       	push   $0x3c43
     121:	e8 62 37 00 00       	call   3888 <chdir>
=======
     11c:	68 2b 3c 00 00       	push   $0x3c2b
     121:	e8 4b 37 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
     126:	83 c4 10             	add    $0x10,%esp
     129:	85 c0                	test   %eax,%eax
     12b:	78 49                	js     176 <exitiputtest+0x99>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     12d:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
     130:	68 40 3c 00 00       	push   $0x3c40
     135:	e8 2e 37 00 00       	call   3868 <unlink>
=======
     130:	68 28 3c 00 00       	push   $0x3c28
     135:	e8 17 37 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
     13a:	83 c4 10             	add    $0x10,%esp
     13d:	85 c0                	test   %eax,%eax
     13f:	78 4d                	js     18e <exitiputtest+0xb1>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
<<<<<<< HEAD
     141:	e8 d2 36 00 00       	call   3818 <exit>
    printf(stdout, "fork failed\n");
     146:	83 ec 08             	sub    $0x8,%esp
     149:	68 5d 4b 00 00       	push   $0x4b5d
     14e:	ff 35 78 5d 00 00    	push   0x5d78
     154:	e8 14 38 00 00       	call   396d <printf>
    exit();
     159:	e8 ba 36 00 00       	call   3818 <exit>
      printf(stdout, "mkdir failed\n");
     15e:	83 ec 08             	sub    $0x8,%esp
     161:	68 1c 3c 00 00       	push   $0x3c1c
     166:	ff 35 78 5d 00 00    	push   0x5d78
     16c:	e8 fc 37 00 00       	call   396d <printf>
      exit();
     171:	e8 a2 36 00 00       	call   3818 <exit>
      printf(stdout, "child chdir failed\n");
     176:	83 ec 08             	sub    $0x8,%esp
     179:	68 86 3c 00 00       	push   $0x3c86
     17e:	ff 35 78 5d 00 00    	push   0x5d78
     184:	e8 e4 37 00 00       	call   396d <printf>
      exit();
     189:	e8 8a 36 00 00       	call   3818 <exit>
      printf(stdout, "unlink ../iputdir failed\n");
     18e:	83 ec 08             	sub    $0x8,%esp
     191:	68 4b 3c 00 00       	push   $0x3c4b
     196:	ff 35 78 5d 00 00    	push   0x5d78
     19c:	e8 cc 37 00 00       	call   396d <printf>
      exit();
     1a1:	e8 72 36 00 00       	call   3818 <exit>
  }
  wait();
     1a6:	e8 75 36 00 00       	call   3820 <wait>
  printf(stdout, "exitiput test ok\n");
     1ab:	83 ec 08             	sub    $0x8,%esp
     1ae:	68 9a 3c 00 00       	push   $0x3c9a
     1b3:	ff 35 78 5d 00 00    	push   0x5d78
     1b9:	e8 af 37 00 00       	call   396d <printf>
=======
     141:	e8 bb 36 00 00       	call   3801 <exit>
    printf(stdout, "fork failed\n");
     146:	83 ec 08             	sub    $0x8,%esp
     149:	68 45 4b 00 00       	push   $0x4b45
     14e:	ff 35 5c 5d 00 00    	push   0x5d5c
     154:	e8 fd 37 00 00       	call   3956 <printf>
    exit();
     159:	e8 a3 36 00 00       	call   3801 <exit>
      printf(stdout, "mkdir failed\n");
     15e:	83 ec 08             	sub    $0x8,%esp
     161:	68 04 3c 00 00       	push   $0x3c04
     166:	ff 35 5c 5d 00 00    	push   0x5d5c
     16c:	e8 e5 37 00 00       	call   3956 <printf>
      exit();
     171:	e8 8b 36 00 00       	call   3801 <exit>
      printf(stdout, "child chdir failed\n");
     176:	83 ec 08             	sub    $0x8,%esp
     179:	68 6e 3c 00 00       	push   $0x3c6e
     17e:	ff 35 5c 5d 00 00    	push   0x5d5c
     184:	e8 cd 37 00 00       	call   3956 <printf>
      exit();
     189:	e8 73 36 00 00       	call   3801 <exit>
      printf(stdout, "unlink ../iputdir failed\n");
     18e:	83 ec 08             	sub    $0x8,%esp
     191:	68 33 3c 00 00       	push   $0x3c33
     196:	ff 35 5c 5d 00 00    	push   0x5d5c
     19c:	e8 b5 37 00 00       	call   3956 <printf>
      exit();
     1a1:	e8 5b 36 00 00       	call   3801 <exit>
  }
  wait();
     1a6:	e8 5e 36 00 00       	call   3809 <wait>
  printf(stdout, "exitiput test ok\n");
     1ab:	83 ec 08             	sub    $0x8,%esp
     1ae:	68 82 3c 00 00       	push   $0x3c82
     1b3:	ff 35 5c 5d 00 00    	push   0x5d5c
     1b9:	e8 98 37 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     1be:	83 c4 10             	add    $0x10,%esp
     1c1:	c9                   	leave  
     1c2:	c3                   	ret    

000001c3 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1c3:	55                   	push   %ebp
     1c4:	89 e5                	mov    %esp,%ebp
     1c6:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
<<<<<<< HEAD
     1c9:	68 ac 3c 00 00       	push   $0x3cac
     1ce:	ff 35 78 5d 00 00    	push   0x5d78
     1d4:	e8 94 37 00 00       	call   396d <printf>
  if(mkdir("oidir") < 0){
     1d9:	c7 04 24 bb 3c 00 00 	movl   $0x3cbb,(%esp)
     1e0:	e8 9b 36 00 00       	call   3880 <mkdir>
=======
     1c9:	68 94 3c 00 00       	push   $0x3c94
     1ce:	ff 35 5c 5d 00 00    	push   0x5d5c
     1d4:	e8 7d 37 00 00       	call   3956 <printf>
  if(mkdir("oidir") < 0){
     1d9:	c7 04 24 a3 3c 00 00 	movl   $0x3ca3,(%esp)
     1e0:	e8 84 36 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
     1e5:	83 c4 10             	add    $0x10,%esp
     1e8:	85 c0                	test   %eax,%eax
     1ea:	78 39                	js     225 <openiputtest+0x62>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
<<<<<<< HEAD
     1ec:	e8 1f 36 00 00       	call   3810 <fork>
=======
     1ec:	e8 08 36 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(pid < 0){
     1f1:	85 c0                	test   %eax,%eax
     1f3:	78 48                	js     23d <openiputtest+0x7a>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     1f5:	75 63                	jne    25a <openiputtest+0x97>
    int fd = open("oidir", O_RDWR);
     1f7:	83 ec 08             	sub    $0x8,%esp
     1fa:	6a 02                	push   $0x2
<<<<<<< HEAD
     1fc:	68 bb 3c 00 00       	push   $0x3cbb
     201:	e8 52 36 00 00       	call   3858 <open>
=======
     1fc:	68 a3 3c 00 00       	push   $0x3ca3
     201:	e8 3b 36 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(fd >= 0){
     206:	83 c4 10             	add    $0x10,%esp
     209:	85 c0                	test   %eax,%eax
     20b:	78 48                	js     255 <openiputtest+0x92>
      printf(stdout, "open directory for write succeeded\n");
     20d:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     210:	68 40 4c 00 00       	push   $0x4c40
     215:	ff 35 78 5d 00 00    	push   0x5d78
     21b:	e8 4d 37 00 00       	call   396d <printf>
      exit();
     220:	e8 f3 35 00 00       	call   3818 <exit>
    printf(stdout, "mkdir oidir failed\n");
     225:	83 ec 08             	sub    $0x8,%esp
     228:	68 c1 3c 00 00       	push   $0x3cc1
     22d:	ff 35 78 5d 00 00    	push   0x5d78
     233:	e8 35 37 00 00       	call   396d <printf>
    exit();
     238:	e8 db 35 00 00       	call   3818 <exit>
    printf(stdout, "fork failed\n");
     23d:	83 ec 08             	sub    $0x8,%esp
     240:	68 5d 4b 00 00       	push   $0x4b5d
     245:	ff 35 78 5d 00 00    	push   0x5d78
     24b:	e8 1d 37 00 00       	call   396d <printf>
    exit();
     250:	e8 c3 35 00 00       	call   3818 <exit>
    }
    exit();
     255:	e8 be 35 00 00       	call   3818 <exit>
=======
     210:	68 28 4c 00 00       	push   $0x4c28
     215:	ff 35 5c 5d 00 00    	push   0x5d5c
     21b:	e8 36 37 00 00       	call   3956 <printf>
      exit();
     220:	e8 dc 35 00 00       	call   3801 <exit>
    printf(stdout, "mkdir oidir failed\n");
     225:	83 ec 08             	sub    $0x8,%esp
     228:	68 a9 3c 00 00       	push   $0x3ca9
     22d:	ff 35 5c 5d 00 00    	push   0x5d5c
     233:	e8 1e 37 00 00       	call   3956 <printf>
    exit();
     238:	e8 c4 35 00 00       	call   3801 <exit>
    printf(stdout, "fork failed\n");
     23d:	83 ec 08             	sub    $0x8,%esp
     240:	68 45 4b 00 00       	push   $0x4b45
     245:	ff 35 5c 5d 00 00    	push   0x5d5c
     24b:	e8 06 37 00 00       	call   3956 <printf>
    exit();
     250:	e8 ac 35 00 00       	call   3801 <exit>
    }
    exit();
     255:	e8 a7 35 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }
  sleep(1);
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	6a 01                	push   $0x1
<<<<<<< HEAD
     25f:	e8 44 36 00 00       	call   38a8 <sleep>
  if(unlink("oidir") != 0){
     264:	c7 04 24 bb 3c 00 00 	movl   $0x3cbb,(%esp)
     26b:	e8 f8 35 00 00       	call   3868 <unlink>
=======
     25f:	e8 2d 36 00 00       	call   3891 <sleep>
  if(unlink("oidir") != 0){
     264:	c7 04 24 a3 3c 00 00 	movl   $0x3ca3,(%esp)
     26b:	e8 e1 35 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
     270:	83 c4 10             	add    $0x10,%esp
     273:	85 c0                	test   %eax,%eax
     275:	75 1d                	jne    294 <openiputtest+0xd1>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
<<<<<<< HEAD
     277:	e8 a4 35 00 00       	call   3820 <wait>
  printf(stdout, "openiput test ok\n");
     27c:	83 ec 08             	sub    $0x8,%esp
     27f:	68 e4 3c 00 00       	push   $0x3ce4
     284:	ff 35 78 5d 00 00    	push   0x5d78
     28a:	e8 de 36 00 00       	call   396d <printf>
=======
     277:	e8 8d 35 00 00       	call   3809 <wait>
  printf(stdout, "openiput test ok\n");
     27c:	83 ec 08             	sub    $0x8,%esp
     27f:	68 cc 3c 00 00       	push   $0x3ccc
     284:	ff 35 5c 5d 00 00    	push   0x5d5c
     28a:	e8 c7 36 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     28f:	83 c4 10             	add    $0x10,%esp
     292:	c9                   	leave  
     293:	c3                   	ret    
    printf(stdout, "unlink failed\n");
     294:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     297:	68 d5 3c 00 00       	push   $0x3cd5
     29c:	ff 35 78 5d 00 00    	push   0x5d78
     2a2:	e8 c6 36 00 00       	call   396d <printf>
    exit();
     2a7:	e8 6c 35 00 00       	call   3818 <exit>
=======
     297:	68 bd 3c 00 00       	push   $0x3cbd
     29c:	ff 35 5c 5d 00 00    	push   0x5d5c
     2a2:	e8 af 36 00 00       	call   3956 <printf>
    exit();
     2a7:	e8 55 35 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002ac <opentest>:

// simple file system tests

void
opentest(void)
{
     2ac:	55                   	push   %ebp
     2ad:	89 e5                	mov    %esp,%ebp
     2af:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
<<<<<<< HEAD
     2b2:	68 f6 3c 00 00       	push   $0x3cf6
     2b7:	ff 35 78 5d 00 00    	push   0x5d78
     2bd:	e8 ab 36 00 00       	call   396d <printf>
  fd = open("echo", 0);
     2c2:	83 c4 08             	add    $0x8,%esp
     2c5:	6a 00                	push   $0x0
     2c7:	68 01 3d 00 00       	push   $0x3d01
     2cc:	e8 87 35 00 00       	call   3858 <open>
=======
     2b2:	68 de 3c 00 00       	push   $0x3cde
     2b7:	ff 35 5c 5d 00 00    	push   0x5d5c
     2bd:	e8 94 36 00 00       	call   3956 <printf>
  fd = open("echo", 0);
     2c2:	83 c4 08             	add    $0x8,%esp
     2c5:	6a 00                	push   $0x0
     2c7:	68 e9 3c 00 00       	push   $0x3ce9
     2cc:	e8 70 35 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
     2d1:	83 c4 10             	add    $0x10,%esp
     2d4:	85 c0                	test   %eax,%eax
     2d6:	78 37                	js     30f <opentest+0x63>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     2d8:	83 ec 0c             	sub    $0xc,%esp
     2db:	50                   	push   %eax
<<<<<<< HEAD
     2dc:	e8 5f 35 00 00       	call   3840 <close>
  fd = open("doesnotexist", 0);
     2e1:	83 c4 08             	add    $0x8,%esp
     2e4:	6a 00                	push   $0x0
     2e6:	68 19 3d 00 00       	push   $0x3d19
     2eb:	e8 68 35 00 00       	call   3858 <open>
=======
     2dc:	e8 48 35 00 00       	call   3829 <close>
  fd = open("doesnotexist", 0);
     2e1:	83 c4 08             	add    $0x8,%esp
     2e4:	6a 00                	push   $0x0
     2e6:	68 01 3d 00 00       	push   $0x3d01
     2eb:	e8 51 35 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd >= 0){
     2f0:	83 c4 10             	add    $0x10,%esp
     2f3:	85 c0                	test   %eax,%eax
     2f5:	79 30                	jns    327 <opentest+0x7b>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     2f7:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     2fa:	68 44 3d 00 00       	push   $0x3d44
     2ff:	ff 35 78 5d 00 00    	push   0x5d78
     305:	e8 63 36 00 00       	call   396d <printf>
=======
     2fa:	68 2c 3d 00 00       	push   $0x3d2c
     2ff:	ff 35 5c 5d 00 00    	push   0x5d5c
     305:	e8 4c 36 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     30a:	83 c4 10             	add    $0x10,%esp
     30d:	c9                   	leave  
     30e:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     30f:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     312:	68 06 3d 00 00       	push   $0x3d06
     317:	ff 35 78 5d 00 00    	push   0x5d78
     31d:	e8 4b 36 00 00       	call   396d <printf>
    exit();
     322:	e8 f1 34 00 00       	call   3818 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     327:	83 ec 08             	sub    $0x8,%esp
     32a:	68 26 3d 00 00       	push   $0x3d26
     32f:	ff 35 78 5d 00 00    	push   0x5d78
     335:	e8 33 36 00 00       	call   396d <printf>
    exit();
     33a:	e8 d9 34 00 00       	call   3818 <exit>
=======
     312:	68 ee 3c 00 00       	push   $0x3cee
     317:	ff 35 5c 5d 00 00    	push   0x5d5c
     31d:	e8 34 36 00 00       	call   3956 <printf>
    exit();
     322:	e8 da 34 00 00       	call   3801 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     327:	83 ec 08             	sub    $0x8,%esp
     32a:	68 0e 3d 00 00       	push   $0x3d0e
     32f:	ff 35 5c 5d 00 00    	push   0x5d5c
     335:	e8 1c 36 00 00       	call   3956 <printf>
    exit();
     33a:	e8 c2 34 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000033f <writetest>:

void
writetest(void)
{
     33f:	55                   	push   %ebp
     340:	89 e5                	mov    %esp,%ebp
     342:	56                   	push   %esi
     343:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     344:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     347:	68 52 3d 00 00       	push   $0x3d52
     34c:	ff 35 78 5d 00 00    	push   0x5d78
     352:	e8 16 36 00 00       	call   396d <printf>
  fd = open("small", O_CREATE|O_RDWR);
     357:	83 c4 08             	add    $0x8,%esp
     35a:	68 02 02 00 00       	push   $0x202
     35f:	68 63 3d 00 00       	push   $0x3d63
     364:	e8 ef 34 00 00       	call   3858 <open>
=======
     347:	68 3a 3d 00 00       	push   $0x3d3a
     34c:	ff 35 5c 5d 00 00    	push   0x5d5c
     352:	e8 ff 35 00 00       	call   3956 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     357:	83 c4 08             	add    $0x8,%esp
     35a:	68 02 02 00 00       	push   $0x202
     35f:	68 4b 3d 00 00       	push   $0x3d4b
     364:	e8 d8 34 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd >= 0){
     369:	83 c4 10             	add    $0x10,%esp
     36c:	85 c0                	test   %eax,%eax
     36e:	78 57                	js     3c7 <writetest+0x88>
     370:	89 c6                	mov    %eax,%esi
    printf(stdout, "creat small succeeded; ok\n");
     372:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     375:	68 69 3d 00 00       	push   $0x3d69
     37a:	ff 35 78 5d 00 00    	push   0x5d78
     380:	e8 e8 35 00 00       	call   396d <printf>
=======
     375:	68 51 3d 00 00       	push   $0x3d51
     37a:	ff 35 5c 5d 00 00    	push   0x5d5c
     380:	e8 d1 35 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     385:	83 c4 10             	add    $0x10,%esp
     388:	bb 00 00 00 00       	mov    $0x0,%ebx
     38d:	83 fb 63             	cmp    $0x63,%ebx
     390:	7f 7f                	jg     411 <writetest+0xd2>
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     392:	83 ec 04             	sub    $0x4,%esp
     395:	6a 0a                	push   $0xa
<<<<<<< HEAD
     397:	68 a0 3d 00 00       	push   $0x3da0
     39c:	56                   	push   %esi
     39d:	e8 96 34 00 00       	call   3838 <write>
=======
     397:	68 88 3d 00 00       	push   $0x3d88
     39c:	56                   	push   %esi
     39d:	e8 7f 34 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     3a2:	83 c4 10             	add    $0x10,%esp
     3a5:	83 f8 0a             	cmp    $0xa,%eax
     3a8:	75 35                	jne    3df <writetest+0xa0>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     3aa:	83 ec 04             	sub    $0x4,%esp
     3ad:	6a 0a                	push   $0xa
<<<<<<< HEAD
     3af:	68 ab 3d 00 00       	push   $0x3dab
     3b4:	56                   	push   %esi
     3b5:	e8 7e 34 00 00       	call   3838 <write>
=======
     3af:	68 93 3d 00 00       	push   $0x3d93
     3b4:	56                   	push   %esi
     3b5:	e8 67 34 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     3ba:	83 c4 10             	add    $0x10,%esp
     3bd:	83 f8 0a             	cmp    $0xa,%eax
     3c0:	75 36                	jne    3f8 <writetest+0xb9>
  for(i = 0; i < 100; i++){
     3c2:	83 c3 01             	add    $0x1,%ebx
     3c5:	eb c6                	jmp    38d <writetest+0x4e>
    printf(stdout, "error: creat small failed!\n");
     3c7:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     3ca:	68 84 3d 00 00       	push   $0x3d84
     3cf:	ff 35 78 5d 00 00    	push   0x5d78
     3d5:	e8 93 35 00 00       	call   396d <printf>
    exit();
     3da:	e8 39 34 00 00       	call   3818 <exit>
      printf(stdout, "error: write aa %d new file failed\n", i);
     3df:	83 ec 04             	sub    $0x4,%esp
     3e2:	53                   	push   %ebx
     3e3:	68 64 4c 00 00       	push   $0x4c64
     3e8:	ff 35 78 5d 00 00    	push   0x5d78
     3ee:	e8 7a 35 00 00       	call   396d <printf>
      exit();
     3f3:	e8 20 34 00 00       	call   3818 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     3f8:	83 ec 04             	sub    $0x4,%esp
     3fb:	53                   	push   %ebx
     3fc:	68 88 4c 00 00       	push   $0x4c88
     401:	ff 35 78 5d 00 00    	push   0x5d78
     407:	e8 61 35 00 00       	call   396d <printf>
      exit();
     40c:	e8 07 34 00 00       	call   3818 <exit>
=======
     3ca:	68 6c 3d 00 00       	push   $0x3d6c
     3cf:	ff 35 5c 5d 00 00    	push   0x5d5c
     3d5:	e8 7c 35 00 00       	call   3956 <printf>
    exit();
     3da:	e8 22 34 00 00       	call   3801 <exit>
      printf(stdout, "error: write aa %d new file failed\n", i);
     3df:	83 ec 04             	sub    $0x4,%esp
     3e2:	53                   	push   %ebx
     3e3:	68 4c 4c 00 00       	push   $0x4c4c
     3e8:	ff 35 5c 5d 00 00    	push   0x5d5c
     3ee:	e8 63 35 00 00       	call   3956 <printf>
      exit();
     3f3:	e8 09 34 00 00       	call   3801 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     3f8:	83 ec 04             	sub    $0x4,%esp
     3fb:	53                   	push   %ebx
     3fc:	68 70 4c 00 00       	push   $0x4c70
     401:	ff 35 5c 5d 00 00    	push   0x5d5c
     407:	e8 4a 35 00 00       	call   3956 <printf>
      exit();
     40c:	e8 f0 33 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }
  printf(stdout, "writes ok\n");
     411:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     414:	68 b6 3d 00 00       	push   $0x3db6
     419:	ff 35 78 5d 00 00    	push   0x5d78
     41f:	e8 49 35 00 00       	call   396d <printf>
  close(fd);
     424:	89 34 24             	mov    %esi,(%esp)
     427:	e8 14 34 00 00       	call   3840 <close>
  fd = open("small", O_RDONLY);
     42c:	83 c4 08             	add    $0x8,%esp
     42f:	6a 00                	push   $0x0
     431:	68 63 3d 00 00       	push   $0x3d63
     436:	e8 1d 34 00 00       	call   3858 <open>
=======
     414:	68 9e 3d 00 00       	push   $0x3d9e
     419:	ff 35 5c 5d 00 00    	push   0x5d5c
     41f:	e8 32 35 00 00       	call   3956 <printf>
  close(fd);
     424:	89 34 24             	mov    %esi,(%esp)
     427:	e8 fd 33 00 00       	call   3829 <close>
  fd = open("small", O_RDONLY);
     42c:	83 c4 08             	add    $0x8,%esp
     42f:	6a 00                	push   $0x0
     431:	68 4b 3d 00 00       	push   $0x3d4b
     436:	e8 06 34 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
     43b:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     43d:	83 c4 10             	add    $0x10,%esp
     440:	85 c0                	test   %eax,%eax
     442:	78 7b                	js     4bf <writetest+0x180>
    printf(stdout, "open small succeeded ok\n");
     444:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     447:	68 c1 3d 00 00       	push   $0x3dc1
     44c:	ff 35 78 5d 00 00    	push   0x5d78
     452:	e8 16 35 00 00       	call   396d <printf>
=======
     447:	68 a9 3d 00 00       	push   $0x3da9
     44c:	ff 35 5c 5d 00 00    	push   0x5d5c
     452:	e8 ff 34 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     457:	83 c4 0c             	add    $0xc,%esp
     45a:	68 d0 07 00 00       	push   $0x7d0
<<<<<<< HEAD
     45f:	68 c0 84 00 00       	push   $0x84c0
     464:	53                   	push   %ebx
     465:	e8 c6 33 00 00       	call   3830 <read>
=======
     45f:	68 a0 84 00 00       	push   $0x84a0
     464:	53                   	push   %ebx
     465:	e8 af 33 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(i == 2000){
     46a:	83 c4 10             	add    $0x10,%esp
     46d:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     472:	75 63                	jne    4d7 <writetest+0x198>
    printf(stdout, "read succeeded ok\n");
     474:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     477:	68 f5 3d 00 00       	push   $0x3df5
     47c:	ff 35 78 5d 00 00    	push   0x5d78
     482:	e8 e6 34 00 00       	call   396d <printf>
=======
     477:	68 dd 3d 00 00       	push   $0x3ddd
     47c:	ff 35 5c 5d 00 00    	push   0x5d5c
     482:	e8 cf 34 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     487:	89 1c 24             	mov    %ebx,(%esp)
<<<<<<< HEAD
     48a:	e8 b1 33 00 00       	call   3840 <close>

  if(unlink("small") < 0){
     48f:	c7 04 24 63 3d 00 00 	movl   $0x3d63,(%esp)
     496:	e8 cd 33 00 00       	call   3868 <unlink>
=======
     48a:	e8 9a 33 00 00       	call   3829 <close>

  if(unlink("small") < 0){
     48f:	c7 04 24 4b 3d 00 00 	movl   $0x3d4b,(%esp)
     496:	e8 b6 33 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
     49b:	83 c4 10             	add    $0x10,%esp
     49e:	85 c0                	test   %eax,%eax
     4a0:	78 4d                	js     4ef <writetest+0x1b0>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     4a2:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     4a5:	68 1d 3e 00 00       	push   $0x3e1d
     4aa:	ff 35 78 5d 00 00    	push   0x5d78
     4b0:	e8 b8 34 00 00       	call   396d <printf>
=======
     4a5:	68 05 3e 00 00       	push   $0x3e05
     4aa:	ff 35 5c 5d 00 00    	push   0x5d5c
     4b0:	e8 a1 34 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     4b5:	83 c4 10             	add    $0x10,%esp
     4b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4bb:	5b                   	pop    %ebx
     4bc:	5e                   	pop    %esi
     4bd:	5d                   	pop    %ebp
     4be:	c3                   	ret    
    printf(stdout, "error: open small failed!\n");
     4bf:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     4c2:	68 da 3d 00 00       	push   $0x3dda
     4c7:	ff 35 78 5d 00 00    	push   0x5d78
     4cd:	e8 9b 34 00 00       	call   396d <printf>
    exit();
     4d2:	e8 41 33 00 00       	call   3818 <exit>
    printf(stdout, "read failed\n");
     4d7:	83 ec 08             	sub    $0x8,%esp
     4da:	68 21 41 00 00       	push   $0x4121
     4df:	ff 35 78 5d 00 00    	push   0x5d78
     4e5:	e8 83 34 00 00       	call   396d <printf>
    exit();
     4ea:	e8 29 33 00 00       	call   3818 <exit>
    printf(stdout, "unlink small failed\n");
     4ef:	83 ec 08             	sub    $0x8,%esp
     4f2:	68 08 3e 00 00       	push   $0x3e08
     4f7:	ff 35 78 5d 00 00    	push   0x5d78
     4fd:	e8 6b 34 00 00       	call   396d <printf>
    exit();
     502:	e8 11 33 00 00       	call   3818 <exit>
=======
     4c2:	68 c2 3d 00 00       	push   $0x3dc2
     4c7:	ff 35 5c 5d 00 00    	push   0x5d5c
     4cd:	e8 84 34 00 00       	call   3956 <printf>
    exit();
     4d2:	e8 2a 33 00 00       	call   3801 <exit>
    printf(stdout, "read failed\n");
     4d7:	83 ec 08             	sub    $0x8,%esp
     4da:	68 09 41 00 00       	push   $0x4109
     4df:	ff 35 5c 5d 00 00    	push   0x5d5c
     4e5:	e8 6c 34 00 00       	call   3956 <printf>
    exit();
     4ea:	e8 12 33 00 00       	call   3801 <exit>
    printf(stdout, "unlink small failed\n");
     4ef:	83 ec 08             	sub    $0x8,%esp
     4f2:	68 f0 3d 00 00       	push   $0x3df0
     4f7:	ff 35 5c 5d 00 00    	push   0x5d5c
     4fd:	e8 54 34 00 00       	call   3956 <printf>
    exit();
     502:	e8 fa 32 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000507 <writetest1>:

void
writetest1(void)
{
     507:	55                   	push   %ebp
     508:	89 e5                	mov    %esp,%ebp
     50a:	56                   	push   %esi
     50b:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     50c:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     50f:	68 31 3e 00 00       	push   $0x3e31
     514:	ff 35 78 5d 00 00    	push   0x5d78
     51a:	e8 4e 34 00 00       	call   396d <printf>
=======
     50f:	68 19 3e 00 00       	push   $0x3e19
     514:	ff 35 5c 5d 00 00    	push   0x5d5c
     51a:	e8 37 34 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("big", O_CREATE|O_RDWR);
     51f:	83 c4 08             	add    $0x8,%esp
     522:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
     527:	68 ab 3e 00 00       	push   $0x3eab
     52c:	e8 27 33 00 00       	call   3858 <open>
=======
     527:	68 93 3e 00 00       	push   $0x3e93
     52c:	e8 10 33 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
     531:	83 c4 10             	add    $0x10,%esp
     534:	85 c0                	test   %eax,%eax
     536:	78 37                	js     56f <writetest1+0x68>
     538:	89 c6                	mov    %eax,%esi
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     53a:	bb 00 00 00 00       	mov    $0x0,%ebx
     53f:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     545:	77 59                	ja     5a0 <writetest1+0x99>
    ((int*)buf)[0] = i;
<<<<<<< HEAD
     547:	89 1d c0 84 00 00    	mov    %ebx,0x84c0
    if(write(fd, buf, 512) != 512){
     54d:	83 ec 04             	sub    $0x4,%esp
     550:	68 00 02 00 00       	push   $0x200
     555:	68 c0 84 00 00       	push   $0x84c0
     55a:	56                   	push   %esi
     55b:	e8 d8 32 00 00       	call   3838 <write>
=======
     547:	89 1d a0 84 00 00    	mov    %ebx,0x84a0
    if(write(fd, buf, 512) != 512){
     54d:	83 ec 04             	sub    $0x4,%esp
     550:	68 00 02 00 00       	push   $0x200
     555:	68 a0 84 00 00       	push   $0x84a0
     55a:	56                   	push   %esi
     55b:	e8 c1 32 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     560:	83 c4 10             	add    $0x10,%esp
     563:	3d 00 02 00 00       	cmp    $0x200,%eax
     568:	75 1d                	jne    587 <writetest1+0x80>
  for(i = 0; i < MAXFILE; i++){
     56a:	83 c3 01             	add    $0x1,%ebx
     56d:	eb d0                	jmp    53f <writetest1+0x38>
    printf(stdout, "error: creat big failed!\n");
     56f:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     572:	68 41 3e 00 00       	push   $0x3e41
     577:	ff 35 78 5d 00 00    	push   0x5d78
     57d:	e8 eb 33 00 00       	call   396d <printf>
    exit();
     582:	e8 91 32 00 00       	call   3818 <exit>
      printf(stdout, "error: write big file failed\n", i);
     587:	83 ec 04             	sub    $0x4,%esp
     58a:	53                   	push   %ebx
     58b:	68 5b 3e 00 00       	push   $0x3e5b
     590:	ff 35 78 5d 00 00    	push   0x5d78
     596:	e8 d2 33 00 00       	call   396d <printf>
      exit();
     59b:	e8 78 32 00 00       	call   3818 <exit>
=======
     572:	68 29 3e 00 00       	push   $0x3e29
     577:	ff 35 5c 5d 00 00    	push   0x5d5c
     57d:	e8 d4 33 00 00       	call   3956 <printf>
    exit();
     582:	e8 7a 32 00 00       	call   3801 <exit>
      printf(stdout, "error: write big file failed\n", i);
     587:	83 ec 04             	sub    $0x4,%esp
     58a:	53                   	push   %ebx
     58b:	68 43 3e 00 00       	push   $0x3e43
     590:	ff 35 5c 5d 00 00    	push   0x5d5c
     596:	e8 bb 33 00 00       	call   3956 <printf>
      exit();
     59b:	e8 61 32 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  close(fd);
     5a0:	83 ec 0c             	sub    $0xc,%esp
     5a3:	56                   	push   %esi
<<<<<<< HEAD
     5a4:	e8 97 32 00 00       	call   3840 <close>
=======
     5a4:	e8 80 32 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("big", O_RDONLY);
     5a9:	83 c4 08             	add    $0x8,%esp
     5ac:	6a 00                	push   $0x0
<<<<<<< HEAD
     5ae:	68 ab 3e 00 00       	push   $0x3eab
     5b3:	e8 a0 32 00 00       	call   3858 <open>
=======
     5ae:	68 93 3e 00 00       	push   $0x3e93
     5b3:	e8 89 32 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
     5b8:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     5ba:	83 c4 10             	add    $0x10,%esp
     5bd:	85 c0                	test   %eax,%eax
     5bf:	78 3c                	js     5fd <writetest1+0xf6>
    printf(stdout, "error: open big failed!\n");
    exit();
  }

  n = 0;
     5c1:	bb 00 00 00 00       	mov    $0x0,%ebx
  for(;;){
    i = read(fd, buf, 512);
     5c6:	83 ec 04             	sub    $0x4,%esp
     5c9:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
     5ce:	68 c0 84 00 00       	push   $0x84c0
     5d3:	56                   	push   %esi
     5d4:	e8 57 32 00 00       	call   3830 <read>
=======
     5ce:	68 a0 84 00 00       	push   $0x84a0
     5d3:	56                   	push   %esi
     5d4:	e8 40 32 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(i == 0){
     5d9:	83 c4 10             	add    $0x10,%esp
     5dc:	85 c0                	test   %eax,%eax
     5de:	74 35                	je     615 <writetest1+0x10e>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     5e0:	3d 00 02 00 00       	cmp    $0x200,%eax
     5e5:	0f 85 84 00 00 00    	jne    66f <writetest1+0x168>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
<<<<<<< HEAD
     5eb:	a1 c0 84 00 00       	mov    0x84c0,%eax
=======
     5eb:	a1 a0 84 00 00       	mov    0x84a0,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
     5f0:	39 d8                	cmp    %ebx,%eax
     5f2:	0f 85 90 00 00 00    	jne    688 <writetest1+0x181>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     5f8:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     5fb:	eb c9                	jmp    5c6 <writetest1+0xbf>
    printf(stdout, "error: open big failed!\n");
     5fd:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     600:	68 79 3e 00 00       	push   $0x3e79
     605:	ff 35 78 5d 00 00    	push   0x5d78
     60b:	e8 5d 33 00 00       	call   396d <printf>
    exit();
     610:	e8 03 32 00 00       	call   3818 <exit>
=======
     600:	68 61 3e 00 00       	push   $0x3e61
     605:	ff 35 5c 5d 00 00    	push   0x5d5c
     60b:	e8 46 33 00 00       	call   3956 <printf>
    exit();
     610:	e8 ec 31 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      if(n == MAXFILE - 1){
     615:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     61b:	74 39                	je     656 <writetest1+0x14f>
  }
  close(fd);
     61d:	83 ec 0c             	sub    $0xc,%esp
     620:	56                   	push   %esi
<<<<<<< HEAD
     621:	e8 1a 32 00 00       	call   3840 <close>
  if(unlink("big") < 0){
     626:	c7 04 24 ab 3e 00 00 	movl   $0x3eab,(%esp)
     62d:	e8 36 32 00 00       	call   3868 <unlink>
=======
     621:	e8 03 32 00 00       	call   3829 <close>
  if(unlink("big") < 0){
     626:	c7 04 24 93 3e 00 00 	movl   $0x3e93,(%esp)
     62d:	e8 1f 32 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
     632:	83 c4 10             	add    $0x10,%esp
     635:	85 c0                	test   %eax,%eax
     637:	78 66                	js     69f <writetest1+0x198>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     639:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     63c:	68 d2 3e 00 00       	push   $0x3ed2
     641:	ff 35 78 5d 00 00    	push   0x5d78
     647:	e8 21 33 00 00       	call   396d <printf>
=======
     63c:	68 ba 3e 00 00       	push   $0x3eba
     641:	ff 35 5c 5d 00 00    	push   0x5d5c
     647:	e8 0a 33 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     64c:	83 c4 10             	add    $0x10,%esp
     64f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     652:	5b                   	pop    %ebx
     653:	5e                   	pop    %esi
     654:	5d                   	pop    %ebp
     655:	c3                   	ret    
        printf(stdout, "read only %d blocks from big", n);
     656:	83 ec 04             	sub    $0x4,%esp
     659:	53                   	push   %ebx
<<<<<<< HEAD
     65a:	68 92 3e 00 00       	push   $0x3e92
     65f:	ff 35 78 5d 00 00    	push   0x5d78
     665:	e8 03 33 00 00       	call   396d <printf>
        exit();
     66a:	e8 a9 31 00 00       	call   3818 <exit>
      printf(stdout, "read failed %d\n", i);
     66f:	83 ec 04             	sub    $0x4,%esp
     672:	50                   	push   %eax
     673:	68 af 3e 00 00       	push   $0x3eaf
     678:	ff 35 78 5d 00 00    	push   0x5d78
     67e:	e8 ea 32 00 00       	call   396d <printf>
      exit();
     683:	e8 90 31 00 00       	call   3818 <exit>
      printf(stdout, "read content of block %d is %d\n",
     688:	50                   	push   %eax
     689:	53                   	push   %ebx
     68a:	68 ac 4c 00 00       	push   $0x4cac
     68f:	ff 35 78 5d 00 00    	push   0x5d78
     695:	e8 d3 32 00 00       	call   396d <printf>
      exit();
     69a:	e8 79 31 00 00       	call   3818 <exit>
    printf(stdout, "unlink big failed\n");
     69f:	83 ec 08             	sub    $0x8,%esp
     6a2:	68 bf 3e 00 00       	push   $0x3ebf
     6a7:	ff 35 78 5d 00 00    	push   0x5d78
     6ad:	e8 bb 32 00 00       	call   396d <printf>
    exit();
     6b2:	e8 61 31 00 00       	call   3818 <exit>
=======
     65a:	68 7a 3e 00 00       	push   $0x3e7a
     65f:	ff 35 5c 5d 00 00    	push   0x5d5c
     665:	e8 ec 32 00 00       	call   3956 <printf>
        exit();
     66a:	e8 92 31 00 00       	call   3801 <exit>
      printf(stdout, "read failed %d\n", i);
     66f:	83 ec 04             	sub    $0x4,%esp
     672:	50                   	push   %eax
     673:	68 97 3e 00 00       	push   $0x3e97
     678:	ff 35 5c 5d 00 00    	push   0x5d5c
     67e:	e8 d3 32 00 00       	call   3956 <printf>
      exit();
     683:	e8 79 31 00 00       	call   3801 <exit>
      printf(stdout, "read content of block %d is %d\n",
     688:	50                   	push   %eax
     689:	53                   	push   %ebx
     68a:	68 94 4c 00 00       	push   $0x4c94
     68f:	ff 35 5c 5d 00 00    	push   0x5d5c
     695:	e8 bc 32 00 00       	call   3956 <printf>
      exit();
     69a:	e8 62 31 00 00       	call   3801 <exit>
    printf(stdout, "unlink big failed\n");
     69f:	83 ec 08             	sub    $0x8,%esp
     6a2:	68 a7 3e 00 00       	push   $0x3ea7
     6a7:	ff 35 5c 5d 00 00    	push   0x5d5c
     6ad:	e8 a4 32 00 00       	call   3956 <printf>
    exit();
     6b2:	e8 4a 31 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000006b7 <createtest>:

void
createtest(void)
{
     6b7:	55                   	push   %ebp
     6b8:	89 e5                	mov    %esp,%ebp
     6ba:	53                   	push   %ebx
     6bb:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
<<<<<<< HEAD
     6be:	68 cc 4c 00 00       	push   $0x4ccc
     6c3:	ff 35 78 5d 00 00    	push   0x5d78
     6c9:	e8 9f 32 00 00       	call   396d <printf>

  name[0] = 'a';
     6ce:	c6 05 b0 84 00 00 61 	movb   $0x61,0x84b0
  name[2] = '\0';
     6d5:	c6 05 b2 84 00 00 00 	movb   $0x0,0x84b2
=======
     6be:	68 b4 4c 00 00       	push   $0x4cb4
     6c3:	ff 35 5c 5d 00 00    	push   0x5d5c
     6c9:	e8 88 32 00 00       	call   3956 <printf>

  name[0] = 'a';
     6ce:	c6 05 90 84 00 00 61 	movb   $0x61,0x8490
  name[2] = '\0';
     6d5:	c6 05 92 84 00 00 00 	movb   $0x0,0x8492
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 52; i++){
     6dc:	83 c4 10             	add    $0x10,%esp
     6df:	bb 00 00 00 00       	mov    $0x0,%ebx
     6e4:	eb 28                	jmp    70e <createtest+0x57>
    name[1] = '0' + i;
     6e6:	8d 43 30             	lea    0x30(%ebx),%eax
<<<<<<< HEAD
     6e9:	a2 b1 84 00 00       	mov    %al,0x84b1
    fd = open(name, O_CREATE|O_RDWR);
     6ee:	83 ec 08             	sub    $0x8,%esp
     6f1:	68 02 02 00 00       	push   $0x202
     6f6:	68 b0 84 00 00       	push   $0x84b0
     6fb:	e8 58 31 00 00       	call   3858 <open>
    close(fd);
     700:	89 04 24             	mov    %eax,(%esp)
     703:	e8 38 31 00 00       	call   3840 <close>
=======
     6e9:	a2 91 84 00 00       	mov    %al,0x8491
    fd = open(name, O_CREATE|O_RDWR);
     6ee:	83 ec 08             	sub    $0x8,%esp
     6f1:	68 02 02 00 00       	push   $0x202
     6f6:	68 90 84 00 00       	push   $0x8490
     6fb:	e8 41 31 00 00       	call   3841 <open>
    close(fd);
     700:	89 04 24             	mov    %eax,(%esp)
     703:	e8 21 31 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 52; i++){
     708:	83 c3 01             	add    $0x1,%ebx
     70b:	83 c4 10             	add    $0x10,%esp
     70e:	83 fb 33             	cmp    $0x33,%ebx
     711:	7e d3                	jle    6e6 <createtest+0x2f>
  }
  name[0] = 'a';
<<<<<<< HEAD
     713:	c6 05 b0 84 00 00 61 	movb   $0x61,0x84b0
  name[2] = '\0';
     71a:	c6 05 b2 84 00 00 00 	movb   $0x0,0x84b2
=======
     713:	c6 05 90 84 00 00 61 	movb   $0x61,0x8490
  name[2] = '\0';
     71a:	c6 05 92 84 00 00 00 	movb   $0x0,0x8492
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 52; i++){
     721:	bb 00 00 00 00       	mov    $0x0,%ebx
     726:	eb 1b                	jmp    743 <createtest+0x8c>
    name[1] = '0' + i;
     728:	8d 43 30             	lea    0x30(%ebx),%eax
<<<<<<< HEAD
     72b:	a2 b1 84 00 00       	mov    %al,0x84b1
    unlink(name);
     730:	83 ec 0c             	sub    $0xc,%esp
     733:	68 b0 84 00 00       	push   $0x84b0
     738:	e8 2b 31 00 00       	call   3868 <unlink>
=======
     72b:	a2 91 84 00 00       	mov    %al,0x8491
    unlink(name);
     730:	83 ec 0c             	sub    $0xc,%esp
     733:	68 90 84 00 00       	push   $0x8490
     738:	e8 14 31 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 52; i++){
     73d:	83 c3 01             	add    $0x1,%ebx
     740:	83 c4 10             	add    $0x10,%esp
     743:	83 fb 33             	cmp    $0x33,%ebx
     746:	7e e0                	jle    728 <createtest+0x71>
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     748:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     74b:	68 f4 4c 00 00       	push   $0x4cf4
     750:	ff 35 78 5d 00 00    	push   0x5d78
     756:	e8 12 32 00 00       	call   396d <printf>
=======
     74b:	68 dc 4c 00 00       	push   $0x4cdc
     750:	ff 35 5c 5d 00 00    	push   0x5d5c
     756:	e8 fb 31 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     761:	c9                   	leave  
     762:	c3                   	ret    

00000763 <dirtest>:

void dirtest(void)
{
     763:	55                   	push   %ebp
     764:	89 e5                	mov    %esp,%ebp
     766:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
<<<<<<< HEAD
     769:	68 e0 3e 00 00       	push   $0x3ee0
     76e:	ff 35 78 5d 00 00    	push   0x5d78
     774:	e8 f4 31 00 00       	call   396d <printf>

  if(mkdir("dir0") < 0){
     779:	c7 04 24 ec 3e 00 00 	movl   $0x3eec,(%esp)
     780:	e8 fb 30 00 00       	call   3880 <mkdir>
=======
     769:	68 c8 3e 00 00       	push   $0x3ec8
     76e:	ff 35 5c 5d 00 00    	push   0x5d5c
     774:	e8 dd 31 00 00       	call   3956 <printf>

  if(mkdir("dir0") < 0){
     779:	c7 04 24 d4 3e 00 00 	movl   $0x3ed4,(%esp)
     780:	e8 e4 30 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
     785:	83 c4 10             	add    $0x10,%esp
     788:	85 c0                	test   %eax,%eax
     78a:	78 54                	js     7e0 <dirtest+0x7d>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     78c:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
     78f:	68 ec 3e 00 00       	push   $0x3eec
     794:	e8 ef 30 00 00       	call   3888 <chdir>
=======
     78f:	68 d4 3e 00 00       	push   $0x3ed4
     794:	e8 d8 30 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
     799:	83 c4 10             	add    $0x10,%esp
     79c:	85 c0                	test   %eax,%eax
     79e:	78 58                	js     7f8 <dirtest+0x95>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     7a0:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
     7a3:	68 91 44 00 00       	push   $0x4491
     7a8:	e8 db 30 00 00       	call   3888 <chdir>
=======
     7a3:	68 79 44 00 00       	push   $0x4479
     7a8:	e8 c4 30 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
     7ad:	83 c4 10             	add    $0x10,%esp
     7b0:	85 c0                	test   %eax,%eax
     7b2:	78 5c                	js     810 <dirtest+0xad>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     7b4:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
     7b7:	68 ec 3e 00 00       	push   $0x3eec
     7bc:	e8 a7 30 00 00       	call   3868 <unlink>
=======
     7b7:	68 d4 3e 00 00       	push   $0x3ed4
     7bc:	e8 90 30 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
     7c1:	83 c4 10             	add    $0x10,%esp
     7c4:	85 c0                	test   %eax,%eax
     7c6:	78 60                	js     828 <dirtest+0xc5>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     7c8:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     7cb:	68 29 3f 00 00       	push   $0x3f29
     7d0:	ff 35 78 5d 00 00    	push   0x5d78
     7d6:	e8 92 31 00 00       	call   396d <printf>
=======
     7cb:	68 11 3f 00 00       	push   $0x3f11
     7d0:	ff 35 5c 5d 00 00    	push   0x5d5c
     7d6:	e8 7b 31 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
     7db:	83 c4 10             	add    $0x10,%esp
     7de:	c9                   	leave  
     7df:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     7e3:	68 1c 3c 00 00       	push   $0x3c1c
     7e8:	ff 35 78 5d 00 00    	push   0x5d78
     7ee:	e8 7a 31 00 00       	call   396d <printf>
    exit();
     7f3:	e8 20 30 00 00       	call   3818 <exit>
    printf(stdout, "chdir dir0 failed\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 f1 3e 00 00       	push   $0x3ef1
     800:	ff 35 78 5d 00 00    	push   0x5d78
     806:	e8 62 31 00 00       	call   396d <printf>
    exit();
     80b:	e8 08 30 00 00       	call   3818 <exit>
    printf(stdout, "chdir .. failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 04 3f 00 00       	push   $0x3f04
     818:	ff 35 78 5d 00 00    	push   0x5d78
     81e:	e8 4a 31 00 00       	call   396d <printf>
    exit();
     823:	e8 f0 2f 00 00       	call   3818 <exit>
    printf(stdout, "unlink dir0 failed\n");
     828:	83 ec 08             	sub    $0x8,%esp
     82b:	68 15 3f 00 00       	push   $0x3f15
     830:	ff 35 78 5d 00 00    	push   0x5d78
     836:	e8 32 31 00 00       	call   396d <printf>
    exit();
     83b:	e8 d8 2f 00 00       	call   3818 <exit>
=======
     7e3:	68 04 3c 00 00       	push   $0x3c04
     7e8:	ff 35 5c 5d 00 00    	push   0x5d5c
     7ee:	e8 63 31 00 00       	call   3956 <printf>
    exit();
     7f3:	e8 09 30 00 00       	call   3801 <exit>
    printf(stdout, "chdir dir0 failed\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 d9 3e 00 00       	push   $0x3ed9
     800:	ff 35 5c 5d 00 00    	push   0x5d5c
     806:	e8 4b 31 00 00       	call   3956 <printf>
    exit();
     80b:	e8 f1 2f 00 00       	call   3801 <exit>
    printf(stdout, "chdir .. failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 ec 3e 00 00       	push   $0x3eec
     818:	ff 35 5c 5d 00 00    	push   0x5d5c
     81e:	e8 33 31 00 00       	call   3956 <printf>
    exit();
     823:	e8 d9 2f 00 00       	call   3801 <exit>
    printf(stdout, "unlink dir0 failed\n");
     828:	83 ec 08             	sub    $0x8,%esp
     82b:	68 fd 3e 00 00       	push   $0x3efd
     830:	ff 35 5c 5d 00 00    	push   0x5d5c
     836:	e8 1b 31 00 00       	call   3956 <printf>
    exit();
     83b:	e8 c1 2f 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000840 <exectest>:

void
exectest(void)
{
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
<<<<<<< HEAD
     846:	68 38 3f 00 00       	push   $0x3f38
     84b:	ff 35 78 5d 00 00    	push   0x5d78
     851:	e8 17 31 00 00       	call   396d <printf>
  if(exec("echo", echoargv) < 0){
     856:	83 c4 08             	add    $0x8,%esp
     859:	68 7c 5d 00 00       	push   $0x5d7c
     85e:	68 01 3d 00 00       	push   $0x3d01
     863:	e8 e8 2f 00 00       	call   3850 <exec>
=======
     846:	68 20 3f 00 00       	push   $0x3f20
     84b:	ff 35 5c 5d 00 00    	push   0x5d5c
     851:	e8 00 31 00 00       	call   3956 <printf>
  if(exec("echo", echoargv) < 0){
     856:	83 c4 08             	add    $0x8,%esp
     859:	68 60 5d 00 00       	push   $0x5d60
     85e:	68 e9 3c 00 00       	push   $0x3ce9
     863:	e8 d1 2f 00 00       	call   3839 <exec>
>>>>>>> c59b0f9 (fixed thread_join and join)
     868:	83 c4 10             	add    $0x10,%esp
     86b:	85 c0                	test   %eax,%eax
     86d:	78 02                	js     871 <exectest+0x31>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     86f:	c9                   	leave  
     870:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     871:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     874:	68 43 3f 00 00       	push   $0x3f43
     879:	ff 35 78 5d 00 00    	push   0x5d78
     87f:	e8 e9 30 00 00       	call   396d <printf>
    exit();
     884:	e8 8f 2f 00 00       	call   3818 <exit>
=======
     874:	68 2b 3f 00 00       	push   $0x3f2b
     879:	ff 35 5c 5d 00 00    	push   0x5d5c
     87f:	e8 d2 30 00 00       	call   3956 <printf>
    exit();
     884:	e8 78 2f 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000889 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     889:	55                   	push   %ebp
     88a:	89 e5                	mov    %esp,%ebp
     88c:	57                   	push   %edi
     88d:	56                   	push   %esi
     88e:	53                   	push   %ebx
     88f:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     892:	8d 45 e0             	lea    -0x20(%ebp),%eax
     895:	50                   	push   %eax
<<<<<<< HEAD
     896:	e8 8d 2f 00 00       	call   3828 <pipe>
=======
     896:	e8 76 2f 00 00       	call   3811 <pipe>
>>>>>>> c59b0f9 (fixed thread_join and join)
     89b:	83 c4 10             	add    $0x10,%esp
     89e:	85 c0                	test   %eax,%eax
     8a0:	75 74                	jne    916 <pipe1+0x8d>
     8a2:	89 c6                	mov    %eax,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
<<<<<<< HEAD
     8a4:	e8 67 2f 00 00       	call   3810 <fork>
=======
     8a4:	e8 50 2f 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
     8a9:	89 c7                	mov    %eax,%edi
  seq = 0;
  if(pid == 0){
     8ab:	85 c0                	test   %eax,%eax
     8ad:	74 7b                	je     92a <pipe1+0xa1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     8af:	0f 8e 60 01 00 00    	jle    a15 <pipe1+0x18c>
    close(fds[1]);
     8b5:	83 ec 0c             	sub    $0xc,%esp
     8b8:	ff 75 e4             	push   -0x1c(%ebp)
<<<<<<< HEAD
     8bb:	e8 80 2f 00 00       	call   3840 <close>
=======
     8bb:	e8 69 2f 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     8c0:	83 c4 10             	add    $0x10,%esp
    total = 0;
     8c3:	89 75 d0             	mov    %esi,-0x30(%ebp)
  seq = 0;
     8c6:	89 f3                	mov    %esi,%ebx
    cc = 1;
     8c8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     8cf:	83 ec 04             	sub    $0x4,%esp
     8d2:	ff 75 d4             	push   -0x2c(%ebp)
<<<<<<< HEAD
     8d5:	68 c0 84 00 00       	push   $0x84c0
     8da:	ff 75 e0             	push   -0x20(%ebp)
     8dd:	e8 4e 2f 00 00       	call   3830 <read>
=======
     8d5:	68 a0 84 00 00       	push   $0x84a0
     8da:	ff 75 e0             	push   -0x20(%ebp)
     8dd:	e8 37 2f 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
     8e2:	89 c7                	mov    %eax,%edi
     8e4:	83 c4 10             	add    $0x10,%esp
     8e7:	85 c0                	test   %eax,%eax
     8e9:	0f 8e e2 00 00 00    	jle    9d1 <pipe1+0x148>
      for(i = 0; i < n; i++){
     8ef:	89 f0                	mov    %esi,%eax
     8f1:	89 d9                	mov    %ebx,%ecx
     8f3:	39 f8                	cmp    %edi,%eax
     8f5:	0f 8d b4 00 00 00    	jge    9af <pipe1+0x126>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
<<<<<<< HEAD
     8fb:	0f be 98 c0 84 00 00 	movsbl 0x84c0(%eax),%ebx
=======
     8fb:	0f be 98 a0 84 00 00 	movsbl 0x84a0(%eax),%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
     902:	8d 51 01             	lea    0x1(%ecx),%edx
     905:	31 cb                	xor    %ecx,%ebx
     907:	84 db                	test   %bl,%bl
     909:	0f 85 86 00 00 00    	jne    995 <pipe1+0x10c>
      for(i = 0; i < n; i++){
     90f:	83 c0 01             	add    $0x1,%eax
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     912:	89 d1                	mov    %edx,%ecx
     914:	eb dd                	jmp    8f3 <pipe1+0x6a>
    printf(1, "pipe() failed\n");
     916:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     919:	68 55 3f 00 00       	push   $0x3f55
     91e:	6a 01                	push   $0x1
     920:	e8 48 30 00 00       	call   396d <printf>
    exit();
     925:	e8 ee 2e 00 00       	call   3818 <exit>
    close(fds[0]);
     92a:	83 ec 0c             	sub    $0xc,%esp
     92d:	ff 75 e0             	push   -0x20(%ebp)
     930:	e8 0b 2f 00 00       	call   3840 <close>
=======
     919:	68 3d 3f 00 00       	push   $0x3f3d
     91e:	6a 01                	push   $0x1
     920:	e8 31 30 00 00       	call   3956 <printf>
    exit();
     925:	e8 d7 2e 00 00       	call   3801 <exit>
    close(fds[0]);
     92a:	83 ec 0c             	sub    $0xc,%esp
     92d:	ff 75 e0             	push   -0x20(%ebp)
     930:	e8 f4 2e 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    for(n = 0; n < 5; n++){
     935:	83 c4 10             	add    $0x10,%esp
     938:	89 fe                	mov    %edi,%esi
  seq = 0;
     93a:	89 fb                	mov    %edi,%ebx
    for(n = 0; n < 5; n++){
     93c:	eb 35                	jmp    973 <pipe1+0xea>
        buf[i] = seq++;
<<<<<<< HEAD
     93e:	88 98 c0 84 00 00    	mov    %bl,0x84c0(%eax)
=======
     93e:	88 98 a0 84 00 00    	mov    %bl,0x84a0(%eax)
>>>>>>> c59b0f9 (fixed thread_join and join)
      for(i = 0; i < 1033; i++)
     944:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     947:	8d 5b 01             	lea    0x1(%ebx),%ebx
      for(i = 0; i < 1033; i++)
     94a:	3d 08 04 00 00       	cmp    $0x408,%eax
     94f:	7e ed                	jle    93e <pipe1+0xb5>
      if(write(fds[1], buf, 1033) != 1033){
     951:	83 ec 04             	sub    $0x4,%esp
     954:	68 09 04 00 00       	push   $0x409
<<<<<<< HEAD
     959:	68 c0 84 00 00       	push   $0x84c0
     95e:	ff 75 e4             	push   -0x1c(%ebp)
     961:	e8 d2 2e 00 00       	call   3838 <write>
=======
     959:	68 a0 84 00 00       	push   $0x84a0
     95e:	ff 75 e4             	push   -0x1c(%ebp)
     961:	e8 bb 2e 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     966:	83 c4 10             	add    $0x10,%esp
     969:	3d 09 04 00 00       	cmp    $0x409,%eax
     96e:	75 0c                	jne    97c <pipe1+0xf3>
    for(n = 0; n < 5; n++){
     970:	83 c6 01             	add    $0x1,%esi
     973:	83 fe 04             	cmp    $0x4,%esi
     976:	7f 18                	jg     990 <pipe1+0x107>
      for(i = 0; i < 1033; i++)
     978:	89 f8                	mov    %edi,%eax
     97a:	eb ce                	jmp    94a <pipe1+0xc1>
        printf(1, "pipe1 oops 1\n");
     97c:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     97f:	68 64 3f 00 00       	push   $0x3f64
     984:	6a 01                	push   $0x1
     986:	e8 e2 2f 00 00       	call   396d <printf>
        exit();
     98b:	e8 88 2e 00 00       	call   3818 <exit>
    exit();
     990:	e8 83 2e 00 00       	call   3818 <exit>
          printf(1, "pipe1 oops 2\n");
     995:	83 ec 08             	sub    $0x8,%esp
     998:	68 72 3f 00 00       	push   $0x3f72
     99d:	6a 01                	push   $0x1
     99f:	e8 c9 2f 00 00       	call   396d <printf>
=======
     97f:	68 4c 3f 00 00       	push   $0x3f4c
     984:	6a 01                	push   $0x1
     986:	e8 cb 2f 00 00       	call   3956 <printf>
        exit();
     98b:	e8 71 2e 00 00       	call   3801 <exit>
    exit();
     990:	e8 6c 2e 00 00       	call   3801 <exit>
          printf(1, "pipe1 oops 2\n");
     995:	83 ec 08             	sub    $0x8,%esp
     998:	68 5a 3f 00 00       	push   $0x3f5a
     99d:	6a 01                	push   $0x1
     99f:	e8 b2 2f 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
          return;
     9a4:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     9a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9aa:	5b                   	pop    %ebx
     9ab:	5e                   	pop    %esi
     9ac:	5f                   	pop    %edi
     9ad:	5d                   	pop    %ebp
     9ae:	c3                   	ret    
      total += n;
     9af:	89 cb                	mov    %ecx,%ebx
     9b1:	01 7d d0             	add    %edi,-0x30(%ebp)
      cc = cc * 2;
     9b4:	d1 65 d4             	shll   -0x2c(%ebp)
     9b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      if(cc > sizeof(buf))
     9ba:	3d 00 20 00 00       	cmp    $0x2000,%eax
     9bf:	0f 86 0a ff ff ff    	jbe    8cf <pipe1+0x46>
        cc = sizeof(buf);
     9c5:	c7 45 d4 00 20 00 00 	movl   $0x2000,-0x2c(%ebp)
     9cc:	e9 fe fe ff ff       	jmp    8cf <pipe1+0x46>
    if(total != 5 * 1033){
     9d1:	81 7d d0 2d 14 00 00 	cmpl   $0x142d,-0x30(%ebp)
     9d8:	75 24                	jne    9fe <pipe1+0x175>
    close(fds[0]);
     9da:	83 ec 0c             	sub    $0xc,%esp
     9dd:	ff 75 e0             	push   -0x20(%ebp)
<<<<<<< HEAD
     9e0:	e8 5b 2e 00 00       	call   3840 <close>
    wait();
     9e5:	e8 36 2e 00 00       	call   3820 <wait>
  printf(1, "pipe1 ok\n");
     9ea:	83 c4 08             	add    $0x8,%esp
     9ed:	68 97 3f 00 00       	push   $0x3f97
     9f2:	6a 01                	push   $0x1
     9f4:	e8 74 2f 00 00       	call   396d <printf>
=======
     9e0:	e8 44 2e 00 00       	call   3829 <close>
    wait();
     9e5:	e8 1f 2e 00 00       	call   3809 <wait>
  printf(1, "pipe1 ok\n");
     9ea:	83 c4 08             	add    $0x8,%esp
     9ed:	68 7f 3f 00 00       	push   $0x3f7f
     9f2:	6a 01                	push   $0x1
     9f4:	e8 5d 2f 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
     9f9:	83 c4 10             	add    $0x10,%esp
     9fc:	eb a9                	jmp    9a7 <pipe1+0x11e>
      printf(1, "pipe1 oops 3 total %d\n", total);
     9fe:	83 ec 04             	sub    $0x4,%esp
     a01:	ff 75 d0             	push   -0x30(%ebp)
<<<<<<< HEAD
     a04:	68 80 3f 00 00       	push   $0x3f80
     a09:	6a 01                	push   $0x1
     a0b:	e8 5d 2f 00 00       	call   396d <printf>
      exit();
     a10:	e8 03 2e 00 00       	call   3818 <exit>
    printf(1, "fork() failed\n");
     a15:	83 ec 08             	sub    $0x8,%esp
     a18:	68 a1 3f 00 00       	push   $0x3fa1
     a1d:	6a 01                	push   $0x1
     a1f:	e8 49 2f 00 00       	call   396d <printf>
    exit();
     a24:	e8 ef 2d 00 00       	call   3818 <exit>
=======
     a04:	68 68 3f 00 00       	push   $0x3f68
     a09:	6a 01                	push   $0x1
     a0b:	e8 46 2f 00 00       	call   3956 <printf>
      exit();
     a10:	e8 ec 2d 00 00       	call   3801 <exit>
    printf(1, "fork() failed\n");
     a15:	83 ec 08             	sub    $0x8,%esp
     a18:	68 89 3f 00 00       	push   $0x3f89
     a1d:	6a 01                	push   $0x1
     a1f:	e8 32 2f 00 00       	call   3956 <printf>
    exit();
     a24:	e8 d8 2d 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000a29 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     a29:	55                   	push   %ebp
     a2a:	89 e5                	mov    %esp,%ebp
     a2c:	57                   	push   %edi
     a2d:	56                   	push   %esi
     a2e:	53                   	push   %ebx
     a2f:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
<<<<<<< HEAD
     a32:	68 b0 3f 00 00       	push   $0x3fb0
     a37:	6a 01                	push   $0x1
     a39:	e8 2f 2f 00 00       	call   396d <printf>
  pid1 = fork();
     a3e:	e8 cd 2d 00 00       	call   3810 <fork>
=======
     a32:	68 98 3f 00 00       	push   $0x3f98
     a37:	6a 01                	push   $0x1
     a39:	e8 18 2f 00 00       	call   3956 <printf>
  pid1 = fork();
     a3e:	e8 b6 2d 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(pid1 == 0)
     a43:	83 c4 10             	add    $0x10,%esp
     a46:	85 c0                	test   %eax,%eax
     a48:	75 02                	jne    a4c <preempt+0x23>
    for(;;)
     a4a:	eb fe                	jmp    a4a <preempt+0x21>
     a4c:	89 c3                	mov    %eax,%ebx
      ;

  pid2 = fork();
<<<<<<< HEAD
     a4e:	e8 bd 2d 00 00       	call   3810 <fork>
=======
     a4e:	e8 a6 2d 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
     a53:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     a55:	85 c0                	test   %eax,%eax
     a57:	75 02                	jne    a5b <preempt+0x32>
    for(;;)
     a59:	eb fe                	jmp    a59 <preempt+0x30>
      ;

  pipe(pfds);
     a5b:	83 ec 0c             	sub    $0xc,%esp
     a5e:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a61:	50                   	push   %eax
<<<<<<< HEAD
     a62:	e8 c1 2d 00 00       	call   3828 <pipe>
  pid3 = fork();
     a67:	e8 a4 2d 00 00       	call   3810 <fork>
=======
     a62:	e8 aa 2d 00 00       	call   3811 <pipe>
  pid3 = fork();
     a67:	e8 8d 2d 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
     a6c:	89 c7                	mov    %eax,%edi
  if(pid3 == 0){
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	75 49                	jne    abe <preempt+0x95>
    close(pfds[0]);
     a75:	83 ec 0c             	sub    $0xc,%esp
     a78:	ff 75 e0             	push   -0x20(%ebp)
<<<<<<< HEAD
     a7b:	e8 c0 2d 00 00       	call   3840 <close>
    if(write(pfds[1], "x", 1) != 1)
     a80:	83 c4 0c             	add    $0xc,%esp
     a83:	6a 01                	push   $0x1
     a85:	68 75 45 00 00       	push   $0x4575
     a8a:	ff 75 e4             	push   -0x1c(%ebp)
     a8d:	e8 a6 2d 00 00       	call   3838 <write>
=======
     a7b:	e8 a9 2d 00 00       	call   3829 <close>
    if(write(pfds[1], "x", 1) != 1)
     a80:	83 c4 0c             	add    $0xc,%esp
     a83:	6a 01                	push   $0x1
     a85:	68 5d 45 00 00       	push   $0x455d
     a8a:	ff 75 e4             	push   -0x1c(%ebp)
     a8d:	e8 8f 2d 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     a92:	83 c4 10             	add    $0x10,%esp
     a95:	83 f8 01             	cmp    $0x1,%eax
     a98:	75 10                	jne    aaa <preempt+0x81>
      printf(1, "preempt write error");
    close(pfds[1]);
     a9a:	83 ec 0c             	sub    $0xc,%esp
     a9d:	ff 75 e4             	push   -0x1c(%ebp)
<<<<<<< HEAD
     aa0:	e8 9b 2d 00 00       	call   3840 <close>
=======
     aa0:	e8 84 2d 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
     aa5:	83 c4 10             	add    $0x10,%esp
    for(;;)
     aa8:	eb fe                	jmp    aa8 <preempt+0x7f>
      printf(1, "preempt write error");
     aaa:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     aad:	68 ba 3f 00 00       	push   $0x3fba
     ab2:	6a 01                	push   $0x1
     ab4:	e8 b4 2e 00 00       	call   396d <printf>
=======
     aad:	68 a2 3f 00 00       	push   $0x3fa2
     ab2:	6a 01                	push   $0x1
     ab4:	e8 9d 2e 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
     ab9:	83 c4 10             	add    $0x10,%esp
     abc:	eb dc                	jmp    a9a <preempt+0x71>
      ;
  }

  close(pfds[1]);
     abe:	83 ec 0c             	sub    $0xc,%esp
     ac1:	ff 75 e4             	push   -0x1c(%ebp)
<<<<<<< HEAD
     ac4:	e8 77 2d 00 00       	call   3840 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     ac9:	83 c4 0c             	add    $0xc,%esp
     acc:	68 00 20 00 00       	push   $0x2000
     ad1:	68 c0 84 00 00       	push   $0x84c0
     ad6:	ff 75 e0             	push   -0x20(%ebp)
     ad9:	e8 52 2d 00 00       	call   3830 <read>
=======
     ac4:	e8 60 2d 00 00       	call   3829 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     ac9:	83 c4 0c             	add    $0xc,%esp
     acc:	68 00 20 00 00       	push   $0x2000
     ad1:	68 a0 84 00 00       	push   $0x84a0
     ad6:	ff 75 e0             	push   -0x20(%ebp)
     ad9:	e8 3b 2d 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
     ade:	83 c4 10             	add    $0x10,%esp
     ae1:	83 f8 01             	cmp    $0x1,%eax
     ae4:	74 1a                	je     b00 <preempt+0xd7>
    printf(1, "preempt read error");
     ae6:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     ae9:	68 ce 3f 00 00       	push   $0x3fce
     aee:	6a 01                	push   $0x1
     af0:	e8 78 2e 00 00       	call   396d <printf>
=======
     ae9:	68 b6 3f 00 00       	push   $0x3fb6
     aee:	6a 01                	push   $0x1
     af0:	e8 61 2e 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
    return;
     af5:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     af8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     afb:	5b                   	pop    %ebx
     afc:	5e                   	pop    %esi
     afd:	5f                   	pop    %edi
     afe:	5d                   	pop    %ebp
     aff:	c3                   	ret    
  close(pfds[0]);
     b00:	83 ec 0c             	sub    $0xc,%esp
     b03:	ff 75 e0             	push   -0x20(%ebp)
<<<<<<< HEAD
     b06:	e8 35 2d 00 00       	call   3840 <close>
  printf(1, "kill... ");
     b0b:	83 c4 08             	add    $0x8,%esp
     b0e:	68 e1 3f 00 00       	push   $0x3fe1
     b13:	6a 01                	push   $0x1
     b15:	e8 53 2e 00 00       	call   396d <printf>
  kill(pid1);
     b1a:	89 1c 24             	mov    %ebx,(%esp)
     b1d:	e8 26 2d 00 00       	call   3848 <kill>
  kill(pid2);
     b22:	89 34 24             	mov    %esi,(%esp)
     b25:	e8 1e 2d 00 00       	call   3848 <kill>
  kill(pid3);
     b2a:	89 3c 24             	mov    %edi,(%esp)
     b2d:	e8 16 2d 00 00       	call   3848 <kill>
  printf(1, "wait... ");
     b32:	83 c4 08             	add    $0x8,%esp
     b35:	68 ea 3f 00 00       	push   $0x3fea
     b3a:	6a 01                	push   $0x1
     b3c:	e8 2c 2e 00 00       	call   396d <printf>
  wait();
     b41:	e8 da 2c 00 00       	call   3820 <wait>
  wait();
     b46:	e8 d5 2c 00 00       	call   3820 <wait>
  wait();
     b4b:	e8 d0 2c 00 00       	call   3820 <wait>
  printf(1, "preempt ok\n");
     b50:	83 c4 08             	add    $0x8,%esp
     b53:	68 f3 3f 00 00       	push   $0x3ff3
     b58:	6a 01                	push   $0x1
     b5a:	e8 0e 2e 00 00       	call   396d <printf>
=======
     b06:	e8 1e 2d 00 00       	call   3829 <close>
  printf(1, "kill... ");
     b0b:	83 c4 08             	add    $0x8,%esp
     b0e:	68 c9 3f 00 00       	push   $0x3fc9
     b13:	6a 01                	push   $0x1
     b15:	e8 3c 2e 00 00       	call   3956 <printf>
  kill(pid1);
     b1a:	89 1c 24             	mov    %ebx,(%esp)
     b1d:	e8 0f 2d 00 00       	call   3831 <kill>
  kill(pid2);
     b22:	89 34 24             	mov    %esi,(%esp)
     b25:	e8 07 2d 00 00       	call   3831 <kill>
  kill(pid3);
     b2a:	89 3c 24             	mov    %edi,(%esp)
     b2d:	e8 ff 2c 00 00       	call   3831 <kill>
  printf(1, "wait... ");
     b32:	83 c4 08             	add    $0x8,%esp
     b35:	68 d2 3f 00 00       	push   $0x3fd2
     b3a:	6a 01                	push   $0x1
     b3c:	e8 15 2e 00 00       	call   3956 <printf>
  wait();
     b41:	e8 c3 2c 00 00       	call   3809 <wait>
  wait();
     b46:	e8 be 2c 00 00       	call   3809 <wait>
  wait();
     b4b:	e8 b9 2c 00 00       	call   3809 <wait>
  printf(1, "preempt ok\n");
     b50:	83 c4 08             	add    $0x8,%esp
     b53:	68 db 3f 00 00       	push   $0x3fdb
     b58:	6a 01                	push   $0x1
     b5a:	e8 f7 2d 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
     b5f:	83 c4 10             	add    $0x10,%esp
     b62:	eb 94                	jmp    af8 <preempt+0xcf>

00000b64 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     b64:	55                   	push   %ebp
     b65:	89 e5                	mov    %esp,%ebp
     b67:	56                   	push   %esi
     b68:	53                   	push   %ebx
  int i, pid;

  for(i = 0; i < 100; i++){
     b69:	be 00 00 00 00       	mov    $0x0,%esi
     b6e:	83 fe 63             	cmp    $0x63,%esi
     b71:	7f 4d                	jg     bc0 <exitwait+0x5c>
    pid = fork();
<<<<<<< HEAD
     b73:	e8 98 2c 00 00       	call   3810 <fork>
=======
     b73:	e8 81 2c 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
     b78:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     b7a:	85 c0                	test   %eax,%eax
     b7c:	78 10                	js     b8e <exitwait+0x2a>
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     b7e:	74 3b                	je     bbb <exitwait+0x57>
      if(wait() != pid){
<<<<<<< HEAD
     b80:	e8 9b 2c 00 00       	call   3820 <wait>
=======
     b80:	e8 84 2c 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
     b85:	39 d8                	cmp    %ebx,%eax
     b87:	75 1e                	jne    ba7 <exitwait+0x43>
  for(i = 0; i < 100; i++){
     b89:	83 c6 01             	add    $0x1,%esi
     b8c:	eb e0                	jmp    b6e <exitwait+0xa>
      printf(1, "fork failed\n");
     b8e:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     b91:	68 5d 4b 00 00       	push   $0x4b5d
     b96:	6a 01                	push   $0x1
     b98:	e8 d0 2d 00 00       	call   396d <printf>
=======
     b91:	68 45 4b 00 00       	push   $0x4b45
     b96:	6a 01                	push   $0x1
     b98:	e8 b9 2d 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
      return;
     b9d:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     ba0:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ba3:	5b                   	pop    %ebx
     ba4:	5e                   	pop    %esi
     ba5:	5d                   	pop    %ebp
     ba6:	c3                   	ret    
        printf(1, "wait wrong pid\n");
     ba7:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     baa:	68 ff 3f 00 00       	push   $0x3fff
     baf:	6a 01                	push   $0x1
     bb1:	e8 b7 2d 00 00       	call   396d <printf>
=======
     baa:	68 e7 3f 00 00       	push   $0x3fe7
     baf:	6a 01                	push   $0x1
     bb1:	e8 a0 2d 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
        return;
     bb6:	83 c4 10             	add    $0x10,%esp
     bb9:	eb e5                	jmp    ba0 <exitwait+0x3c>
      exit();
<<<<<<< HEAD
     bbb:	e8 58 2c 00 00       	call   3818 <exit>
  printf(1, "exitwait ok\n");
     bc0:	83 ec 08             	sub    $0x8,%esp
     bc3:	68 0f 40 00 00       	push   $0x400f
     bc8:	6a 01                	push   $0x1
     bca:	e8 9e 2d 00 00       	call   396d <printf>
=======
     bbb:	e8 41 2c 00 00       	call   3801 <exit>
  printf(1, "exitwait ok\n");
     bc0:	83 ec 08             	sub    $0x8,%esp
     bc3:	68 f7 3f 00 00       	push   $0x3ff7
     bc8:	6a 01                	push   $0x1
     bca:	e8 87 2d 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
     bcf:	83 c4 10             	add    $0x10,%esp
     bd2:	eb cc                	jmp    ba0 <exitwait+0x3c>

00000bd4 <mem>:

void
mem(void)
{
     bd4:	55                   	push   %ebp
     bd5:	89 e5                	mov    %esp,%ebp
     bd7:	57                   	push   %edi
     bd8:	56                   	push   %esi
     bd9:	53                   	push   %ebx
     bda:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
<<<<<<< HEAD
     bdd:	68 1c 40 00 00       	push   $0x401c
     be2:	6a 01                	push   $0x1
     be4:	e8 84 2d 00 00       	call   396d <printf>
  ppid = getpid();
     be9:	e8 aa 2c 00 00       	call   3898 <getpid>
     bee:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     bf0:	e8 1b 2c 00 00       	call   3810 <fork>
=======
     bdd:	68 04 40 00 00       	push   $0x4004
     be2:	6a 01                	push   $0x1
     be4:	e8 6d 2d 00 00       	call   3956 <printf>
  ppid = getpid();
     be9:	e8 93 2c 00 00       	call   3881 <getpid>
     bee:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     bf0:	e8 04 2c 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
     bf5:	83 c4 10             	add    $0x10,%esp
     bf8:	85 c0                	test   %eax,%eax
     bfa:	0f 85 82 00 00 00    	jne    c82 <mem+0xae>
    m1 = 0;
     c00:	bb 00 00 00 00       	mov    $0x0,%ebx
     c05:	eb 04                	jmp    c0b <mem+0x37>
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     c07:	89 18                	mov    %ebx,(%eax)
      m1 = m2;
     c09:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     c0b:	83 ec 0c             	sub    $0xc,%esp
     c0e:	68 11 27 00 00       	push   $0x2711
<<<<<<< HEAD
     c13:	e8 7b 2f 00 00       	call   3b93 <malloc>
=======
     c13:	e8 64 2f 00 00       	call   3b7c <malloc>
>>>>>>> c59b0f9 (fixed thread_join and join)
     c18:	83 c4 10             	add    $0x10,%esp
     c1b:	85 c0                	test   %eax,%eax
     c1d:	75 e8                	jne    c07 <mem+0x33>
     c1f:	eb 10                	jmp    c31 <mem+0x5d>
    }
    while(m1){
      m2 = *(char**)m1;
     c21:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	53                   	push   %ebx
<<<<<<< HEAD
     c27:	e8 a7 2e 00 00       	call   3ad3 <free>
=======
     c27:	e8 90 2e 00 00       	call   3abc <free>
>>>>>>> c59b0f9 (fixed thread_join and join)
     c2c:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     c2f:	89 fb                	mov    %edi,%ebx
    while(m1){
     c31:	85 db                	test   %ebx,%ebx
     c33:	75 ec                	jne    c21 <mem+0x4d>
    }
    m1 = malloc(1024*20);
     c35:	83 ec 0c             	sub    $0xc,%esp
     c38:	68 00 50 00 00       	push   $0x5000
<<<<<<< HEAD
     c3d:	e8 51 2f 00 00       	call   3b93 <malloc>
=======
     c3d:	e8 3a 2f 00 00       	call   3b7c <malloc>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(m1 == 0){
     c42:	83 c4 10             	add    $0x10,%esp
     c45:	85 c0                	test   %eax,%eax
     c47:	74 1d                	je     c66 <mem+0x92>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     c49:	83 ec 0c             	sub    $0xc,%esp
     c4c:	50                   	push   %eax
<<<<<<< HEAD
     c4d:	e8 81 2e 00 00       	call   3ad3 <free>
    printf(1, "mem ok\n");
     c52:	83 c4 08             	add    $0x8,%esp
     c55:	68 40 40 00 00       	push   $0x4040
     c5a:	6a 01                	push   $0x1
     c5c:	e8 0c 2d 00 00       	call   396d <printf>
    exit();
     c61:	e8 b2 2b 00 00       	call   3818 <exit>
      printf(1, "couldn't allocate mem?!!\n");
     c66:	83 ec 08             	sub    $0x8,%esp
     c69:	68 26 40 00 00       	push   $0x4026
     c6e:	6a 01                	push   $0x1
     c70:	e8 f8 2c 00 00       	call   396d <printf>
      kill(ppid);
     c75:	89 34 24             	mov    %esi,(%esp)
     c78:	e8 cb 2b 00 00       	call   3848 <kill>
      exit();
     c7d:	e8 96 2b 00 00       	call   3818 <exit>
  } else {
    wait();
     c82:	e8 99 2b 00 00       	call   3820 <wait>
=======
     c4d:	e8 6a 2e 00 00       	call   3abc <free>
    printf(1, "mem ok\n");
     c52:	83 c4 08             	add    $0x8,%esp
     c55:	68 28 40 00 00       	push   $0x4028
     c5a:	6a 01                	push   $0x1
     c5c:	e8 f5 2c 00 00       	call   3956 <printf>
    exit();
     c61:	e8 9b 2b 00 00       	call   3801 <exit>
      printf(1, "couldn't allocate mem?!!\n");
     c66:	83 ec 08             	sub    $0x8,%esp
     c69:	68 0e 40 00 00       	push   $0x400e
     c6e:	6a 01                	push   $0x1
     c70:	e8 e1 2c 00 00       	call   3956 <printf>
      kill(ppid);
     c75:	89 34 24             	mov    %esi,(%esp)
     c78:	e8 b4 2b 00 00       	call   3831 <kill>
      exit();
     c7d:	e8 7f 2b 00 00       	call   3801 <exit>
  } else {
    wait();
     c82:	e8 82 2b 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }
}
     c87:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c8a:	5b                   	pop    %ebx
     c8b:	5e                   	pop    %esi
     c8c:	5f                   	pop    %edi
     c8d:	5d                   	pop    %ebp
     c8e:	c3                   	ret    

00000c8f <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     c8f:	55                   	push   %ebp
     c90:	89 e5                	mov    %esp,%ebp
     c92:	57                   	push   %edi
     c93:	56                   	push   %esi
     c94:	53                   	push   %ebx
     c95:	83 ec 24             	sub    $0x24,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
<<<<<<< HEAD
     c98:	68 48 40 00 00       	push   $0x4048
     c9d:	6a 01                	push   $0x1
     c9f:	e8 c9 2c 00 00       	call   396d <printf>

  unlink("sharedfd");
     ca4:	c7 04 24 57 40 00 00 	movl   $0x4057,(%esp)
     cab:	e8 b8 2b 00 00       	call   3868 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     cb0:	83 c4 08             	add    $0x8,%esp
     cb3:	68 02 02 00 00       	push   $0x202
     cb8:	68 57 40 00 00       	push   $0x4057
     cbd:	e8 96 2b 00 00       	call   3858 <open>
=======
     c98:	68 30 40 00 00       	push   $0x4030
     c9d:	6a 01                	push   $0x1
     c9f:	e8 b2 2c 00 00       	call   3956 <printf>

  unlink("sharedfd");
     ca4:	c7 04 24 3f 40 00 00 	movl   $0x403f,(%esp)
     cab:	e8 a1 2b 00 00       	call   3851 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     cb0:	83 c4 08             	add    $0x8,%esp
     cb3:	68 02 02 00 00       	push   $0x202
     cb8:	68 3f 40 00 00       	push   $0x403f
     cbd:	e8 7f 2b 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
     cc2:	83 c4 10             	add    $0x10,%esp
     cc5:	85 c0                	test   %eax,%eax
     cc7:	78 4d                	js     d16 <sharedfd+0x87>
     cc9:	89 c6                	mov    %eax,%esi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
<<<<<<< HEAD
     ccb:	e8 40 2b 00 00       	call   3810 <fork>
=======
     ccb:	e8 29 2b 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
     cd0:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     cd2:	85 c0                	test   %eax,%eax
     cd4:	75 57                	jne    d2d <sharedfd+0x9e>
     cd6:	b8 63 00 00 00       	mov    $0x63,%eax
     cdb:	83 ec 04             	sub    $0x4,%esp
     cde:	6a 0a                	push   $0xa
     ce0:	50                   	push   %eax
     ce1:	8d 45 de             	lea    -0x22(%ebp),%eax
     ce4:	50                   	push   %eax
<<<<<<< HEAD
     ce5:	e8 f3 29 00 00       	call   36dd <memset>
=======
     ce5:	e8 dc 29 00 00       	call   36c6 <memset>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 1000; i++){
     cea:	83 c4 10             	add    $0x10,%esp
     ced:	bb 00 00 00 00       	mov    $0x0,%ebx
     cf2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
     cf8:	7f 4c                	jg     d46 <sharedfd+0xb7>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     cfa:	83 ec 04             	sub    $0x4,%esp
     cfd:	6a 0a                	push   $0xa
     cff:	8d 45 de             	lea    -0x22(%ebp),%eax
     d02:	50                   	push   %eax
     d03:	56                   	push   %esi
<<<<<<< HEAD
     d04:	e8 2f 2b 00 00       	call   3838 <write>
=======
     d04:	e8 18 2b 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     d09:	83 c4 10             	add    $0x10,%esp
     d0c:	83 f8 0a             	cmp    $0xa,%eax
     d0f:	75 23                	jne    d34 <sharedfd+0xa5>
  for(i = 0; i < 1000; i++){
     d11:	83 c3 01             	add    $0x1,%ebx
     d14:	eb dc                	jmp    cf2 <sharedfd+0x63>
    printf(1, "fstests: cannot open sharedfd for writing");
     d16:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     d19:	68 1c 4d 00 00       	push   $0x4d1c
     d1e:	6a 01                	push   $0x1
     d20:	e8 48 2c 00 00       	call   396d <printf>
=======
     d19:	68 04 4d 00 00       	push   $0x4d04
     d1e:	6a 01                	push   $0x1
     d20:	e8 31 2c 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
    return;
     d25:	83 c4 10             	add    $0x10,%esp
     d28:	e9 e4 00 00 00       	jmp    e11 <sharedfd+0x182>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d2d:	b8 70 00 00 00       	mov    $0x70,%eax
     d32:	eb a7                	jmp    cdb <sharedfd+0x4c>
      printf(1, "fstests: write sharedfd failed\n");
     d34:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     d37:	68 48 4d 00 00       	push   $0x4d48
     d3c:	6a 01                	push   $0x1
     d3e:	e8 2a 2c 00 00       	call   396d <printf>
=======
     d37:	68 30 4d 00 00       	push   $0x4d30
     d3c:	6a 01                	push   $0x1
     d3e:	e8 13 2c 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
      break;
     d43:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     d46:	85 ff                	test   %edi,%edi
     d48:	74 4d                	je     d97 <sharedfd+0x108>
    exit();
  else
    wait();
<<<<<<< HEAD
     d4a:	e8 d1 2a 00 00       	call   3820 <wait>
  close(fd);
     d4f:	83 ec 0c             	sub    $0xc,%esp
     d52:	56                   	push   %esi
     d53:	e8 e8 2a 00 00       	call   3840 <close>
  fd = open("sharedfd", 0);
     d58:	83 c4 08             	add    $0x8,%esp
     d5b:	6a 00                	push   $0x0
     d5d:	68 57 40 00 00       	push   $0x4057
     d62:	e8 f1 2a 00 00       	call   3858 <open>
=======
     d4a:	e8 ba 2a 00 00       	call   3809 <wait>
  close(fd);
     d4f:	83 ec 0c             	sub    $0xc,%esp
     d52:	56                   	push   %esi
     d53:	e8 d1 2a 00 00       	call   3829 <close>
  fd = open("sharedfd", 0);
     d58:	83 c4 08             	add    $0x8,%esp
     d5b:	6a 00                	push   $0x0
     d5d:	68 3f 40 00 00       	push   $0x403f
     d62:	e8 da 2a 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
     d67:	89 c7                	mov    %eax,%edi
  if(fd < 0){
     d69:	83 c4 10             	add    $0x10,%esp
     d6c:	85 c0                	test   %eax,%eax
     d6e:	78 2c                	js     d9c <sharedfd+0x10d>
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
     d70:	be 00 00 00 00       	mov    $0x0,%esi
     d75:	bb 00 00 00 00       	mov    $0x0,%ebx
  while((n = read(fd, buf, sizeof(buf))) > 0){
     d7a:	83 ec 04             	sub    $0x4,%esp
     d7d:	6a 0a                	push   $0xa
     d7f:	8d 45 de             	lea    -0x22(%ebp),%eax
     d82:	50                   	push   %eax
     d83:	57                   	push   %edi
<<<<<<< HEAD
     d84:	e8 a7 2a 00 00       	call   3830 <read>
=======
     d84:	e8 90 2a 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
     d89:	83 c4 10             	add    $0x10,%esp
     d8c:	85 c0                	test   %eax,%eax
     d8e:	7e 41                	jle    dd1 <sharedfd+0x142>
    for(i = 0; i < sizeof(buf); i++){
     d90:	b8 00 00 00 00       	mov    $0x0,%eax
     d95:	eb 21                	jmp    db8 <sharedfd+0x129>
    exit();
<<<<<<< HEAD
     d97:	e8 7c 2a 00 00       	call   3818 <exit>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     d9c:	83 ec 08             	sub    $0x8,%esp
     d9f:	68 68 4d 00 00       	push   $0x4d68
     da4:	6a 01                	push   $0x1
     da6:	e8 c2 2b 00 00       	call   396d <printf>
=======
     d97:	e8 65 2a 00 00       	call   3801 <exit>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     d9c:	83 ec 08             	sub    $0x8,%esp
     d9f:	68 50 4d 00 00       	push   $0x4d50
     da4:	6a 01                	push   $0x1
     da6:	e8 ab 2b 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
    return;
     dab:	83 c4 10             	add    $0x10,%esp
     dae:	eb 61                	jmp    e11 <sharedfd+0x182>
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
     db0:	80 fa 70             	cmp    $0x70,%dl
     db3:	74 17                	je     dcc <sharedfd+0x13d>
    for(i = 0; i < sizeof(buf); i++){
     db5:	83 c0 01             	add    $0x1,%eax
     db8:	83 f8 09             	cmp    $0x9,%eax
     dbb:	77 bd                	ja     d7a <sharedfd+0xeb>
      if(buf[i] == 'c')
     dbd:	0f b6 54 05 de       	movzbl -0x22(%ebp,%eax,1),%edx
     dc2:	80 fa 63             	cmp    $0x63,%dl
     dc5:	75 e9                	jne    db0 <sharedfd+0x121>
        nc++;
     dc7:	83 c3 01             	add    $0x1,%ebx
     dca:	eb e4                	jmp    db0 <sharedfd+0x121>
        np++;
     dcc:	83 c6 01             	add    $0x1,%esi
     dcf:	eb e4                	jmp    db5 <sharedfd+0x126>
    }
  }
  close(fd);
     dd1:	83 ec 0c             	sub    $0xc,%esp
     dd4:	57                   	push   %edi
<<<<<<< HEAD
     dd5:	e8 66 2a 00 00       	call   3840 <close>
  unlink("sharedfd");
     dda:	c7 04 24 57 40 00 00 	movl   $0x4057,(%esp)
     de1:	e8 82 2a 00 00       	call   3868 <unlink>
=======
     dd5:	e8 4f 2a 00 00       	call   3829 <close>
  unlink("sharedfd");
     dda:	c7 04 24 3f 40 00 00 	movl   $0x403f,(%esp)
     de1:	e8 6b 2a 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(nc == 10000 && np == 10000){
     de6:	83 c4 10             	add    $0x10,%esp
     de9:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     def:	0f 94 c2             	sete   %dl
     df2:	81 fe 10 27 00 00    	cmp    $0x2710,%esi
     df8:	0f 94 c0             	sete   %al
     dfb:	84 c2                	test   %al,%dl
     dfd:	74 1a                	je     e19 <sharedfd+0x18a>
    printf(1, "sharedfd ok\n");
     dff:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     e02:	68 60 40 00 00       	push   $0x4060
     e07:	6a 01                	push   $0x1
     e09:	e8 5f 2b 00 00       	call   396d <printf>
=======
     e02:	68 48 40 00 00       	push   $0x4048
     e07:	6a 01                	push   $0x1
     e09:	e8 48 2b 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
     e0e:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     e11:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e14:	5b                   	pop    %ebx
     e15:	5e                   	pop    %esi
     e16:	5f                   	pop    %edi
     e17:	5d                   	pop    %ebp
     e18:	c3                   	ret    
    printf(1, "sharedfd oops %d %d\n", nc, np);
     e19:	56                   	push   %esi
     e1a:	53                   	push   %ebx
<<<<<<< HEAD
     e1b:	68 6d 40 00 00       	push   $0x406d
     e20:	6a 01                	push   $0x1
     e22:	e8 46 2b 00 00       	call   396d <printf>
    exit();
     e27:	e8 ec 29 00 00       	call   3818 <exit>
=======
     e1b:	68 55 40 00 00       	push   $0x4055
     e20:	6a 01                	push   $0x1
     e22:	e8 2f 2b 00 00       	call   3956 <printf>
    exit();
     e27:	e8 d5 29 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000e2c <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
     e2c:	55                   	push   %ebp
     e2d:	89 e5                	mov    %esp,%ebp
     e2f:	57                   	push   %edi
     e30:	56                   	push   %esi
     e31:	53                   	push   %ebx
     e32:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
<<<<<<< HEAD
     e35:	c7 45 d8 82 40 00 00 	movl   $0x4082,-0x28(%ebp)
     e3c:	c7 45 dc cb 41 00 00 	movl   $0x41cb,-0x24(%ebp)
     e43:	c7 45 e0 cf 41 00 00 	movl   $0x41cf,-0x20(%ebp)
     e4a:	c7 45 e4 85 40 00 00 	movl   $0x4085,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
     e51:	68 88 40 00 00       	push   $0x4088
     e56:	6a 01                	push   $0x1
     e58:	e8 10 2b 00 00       	call   396d <printf>
=======
     e35:	c7 45 d8 6a 40 00 00 	movl   $0x406a,-0x28(%ebp)
     e3c:	c7 45 dc b3 41 00 00 	movl   $0x41b3,-0x24(%ebp)
     e43:	c7 45 e0 b7 41 00 00 	movl   $0x41b7,-0x20(%ebp)
     e4a:	c7 45 e4 6d 40 00 00 	movl   $0x406d,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
     e51:	68 70 40 00 00       	push   $0x4070
     e56:	6a 01                	push   $0x1
     e58:	e8 f9 2a 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(pi = 0; pi < 4; pi++){
     e5d:	83 c4 10             	add    $0x10,%esp
     e60:	be 00 00 00 00       	mov    $0x0,%esi
     e65:	eb 45                	jmp    eac <fourfiles+0x80>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
     e67:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     e6a:	68 5d 4b 00 00       	push   $0x4b5d
     e6f:	6a 01                	push   $0x1
     e71:	e8 f7 2a 00 00       	call   396d <printf>
      exit();
     e76:	e8 9d 29 00 00       	call   3818 <exit>
=======
     e6a:	68 45 4b 00 00       	push   $0x4b45
     e6f:	6a 01                	push   $0x1
     e71:	e8 e0 2a 00 00       	call   3956 <printf>
      exit();
     e76:	e8 86 29 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
     e7b:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     e7e:	68 23 43 00 00       	push   $0x4323
     e83:	6a 01                	push   $0x1
     e85:	e8 e3 2a 00 00       	call   396d <printf>
        exit();
     e8a:	e8 89 29 00 00       	call   3818 <exit>
=======
     e7e:	68 0b 43 00 00       	push   $0x430b
     e83:	6a 01                	push   $0x1
     e85:	e8 cc 2a 00 00       	call   3956 <printf>
        exit();
     e8a:	e8 72 29 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
     e8f:	83 ec 04             	sub    $0x4,%esp
     e92:	50                   	push   %eax
<<<<<<< HEAD
     e93:	68 98 40 00 00       	push   $0x4098
     e98:	6a 01                	push   $0x1
     e9a:	e8 ce 2a 00 00       	call   396d <printf>
          exit();
     e9f:	e8 74 29 00 00       	call   3818 <exit>
        }
      }
      exit();
     ea4:	e8 6f 29 00 00       	call   3818 <exit>
=======
     e93:	68 80 40 00 00       	push   $0x4080
     e98:	6a 01                	push   $0x1
     e9a:	e8 b7 2a 00 00       	call   3956 <printf>
          exit();
     e9f:	e8 5d 29 00 00       	call   3801 <exit>
        }
      }
      exit();
     ea4:	e8 58 29 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(pi = 0; pi < 4; pi++){
     ea9:	83 c6 01             	add    $0x1,%esi
     eac:	83 fe 03             	cmp    $0x3,%esi
     eaf:	7f 78                	jg     f29 <fourfiles+0xfd>
    fname = names[pi];
     eb1:	8b 7c b5 d8          	mov    -0x28(%ebp,%esi,4),%edi
    unlink(fname);
     eb5:	83 ec 0c             	sub    $0xc,%esp
     eb8:	57                   	push   %edi
<<<<<<< HEAD
     eb9:	e8 aa 29 00 00       	call   3868 <unlink>
    pid = fork();
     ebe:	e8 4d 29 00 00       	call   3810 <fork>
=======
     eb9:	e8 93 29 00 00       	call   3851 <unlink>
    pid = fork();
     ebe:	e8 36 29 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(pid < 0){
     ec3:	83 c4 10             	add    $0x10,%esp
     ec6:	85 c0                	test   %eax,%eax
     ec8:	78 9d                	js     e67 <fourfiles+0x3b>
    if(pid == 0){
     eca:	75 dd                	jne    ea9 <fourfiles+0x7d>
      fd = open(fname, O_CREATE | O_RDWR);
     ecc:	89 c3                	mov    %eax,%ebx
     ece:	83 ec 08             	sub    $0x8,%esp
     ed1:	68 02 02 00 00       	push   $0x202
     ed6:	57                   	push   %edi
<<<<<<< HEAD
     ed7:	e8 7c 29 00 00       	call   3858 <open>
=======
     ed7:	e8 65 29 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
     edc:	89 c7                	mov    %eax,%edi
      if(fd < 0){
     ede:	83 c4 10             	add    $0x10,%esp
     ee1:	85 c0                	test   %eax,%eax
     ee3:	78 96                	js     e7b <fourfiles+0x4f>
      memset(buf, '0'+pi, 512);
     ee5:	83 ec 04             	sub    $0x4,%esp
     ee8:	68 00 02 00 00       	push   $0x200
     eed:	83 c6 30             	add    $0x30,%esi
     ef0:	56                   	push   %esi
<<<<<<< HEAD
     ef1:	68 c0 84 00 00       	push   $0x84c0
     ef6:	e8 e2 27 00 00       	call   36dd <memset>
=======
     ef1:	68 a0 84 00 00       	push   $0x84a0
     ef6:	e8 cb 27 00 00       	call   36c6 <memset>
>>>>>>> c59b0f9 (fixed thread_join and join)
      for(i = 0; i < 12; i++){
     efb:	83 c4 10             	add    $0x10,%esp
     efe:	83 fb 0b             	cmp    $0xb,%ebx
     f01:	7f a1                	jg     ea4 <fourfiles+0x78>
        if((n = write(fd, buf, 500)) != 500){
     f03:	83 ec 04             	sub    $0x4,%esp
     f06:	68 f4 01 00 00       	push   $0x1f4
<<<<<<< HEAD
     f0b:	68 c0 84 00 00       	push   $0x84c0
     f10:	57                   	push   %edi
     f11:	e8 22 29 00 00       	call   3838 <write>
=======
     f0b:	68 a0 84 00 00       	push   $0x84a0
     f10:	57                   	push   %edi
     f11:	e8 0b 29 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
     f16:	83 c4 10             	add    $0x10,%esp
     f19:	3d f4 01 00 00       	cmp    $0x1f4,%eax
     f1e:	0f 85 6b ff ff ff    	jne    e8f <fourfiles+0x63>
      for(i = 0; i < 12; i++){
     f24:	83 c3 01             	add    $0x1,%ebx
     f27:	eb d5                	jmp    efe <fourfiles+0xd2>
    }
  }

  for(pi = 0; pi < 4; pi++){
     f29:	bb 00 00 00 00       	mov    $0x0,%ebx
     f2e:	eb 08                	jmp    f38 <fourfiles+0x10c>
    wait();
<<<<<<< HEAD
     f30:	e8 eb 28 00 00       	call   3820 <wait>
=======
     f30:	e8 d4 28 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(pi = 0; pi < 4; pi++){
     f35:	83 c3 01             	add    $0x1,%ebx
     f38:	83 fb 03             	cmp    $0x3,%ebx
     f3b:	7e f3                	jle    f30 <fourfiles+0x104>
  }

  for(i = 0; i < 2; i++){
     f3d:	bb 00 00 00 00       	mov    $0x0,%ebx
     f42:	eb 75                	jmp    fb9 <fourfiles+0x18d>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
     f44:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     f47:	68 a9 40 00 00       	push   $0x40a9
     f4c:	6a 01                	push   $0x1
     f4e:	e8 1a 2a 00 00       	call   396d <printf>
          exit();
     f53:	e8 c0 28 00 00       	call   3818 <exit>
=======
     f47:	68 91 40 00 00       	push   $0x4091
     f4c:	6a 01                	push   $0x1
     f4e:	e8 03 2a 00 00       	call   3956 <printf>
          exit();
     f53:	e8 a9 28 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
        }
      }
      total += n;
     f58:	01 7d d4             	add    %edi,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f5b:	83 ec 04             	sub    $0x4,%esp
     f5e:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
     f63:	68 c0 84 00 00       	push   $0x84c0
     f68:	56                   	push   %esi
     f69:	e8 c2 28 00 00       	call   3830 <read>
=======
     f63:	68 a0 84 00 00       	push   $0x84a0
     f68:	56                   	push   %esi
     f69:	e8 ab 28 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
     f6e:	89 c7                	mov    %eax,%edi
     f70:	83 c4 10             	add    $0x10,%esp
     f73:	85 c0                	test   %eax,%eax
     f75:	7e 1c                	jle    f93 <fourfiles+0x167>
      for(j = 0; j < n; j++){
     f77:	b8 00 00 00 00       	mov    $0x0,%eax
     f7c:	39 f8                	cmp    %edi,%eax
     f7e:	7d d8                	jge    f58 <fourfiles+0x12c>
        if(buf[j] != '0'+i){
<<<<<<< HEAD
     f80:	0f be 88 c0 84 00 00 	movsbl 0x84c0(%eax),%ecx
=======
     f80:	0f be 88 a0 84 00 00 	movsbl 0x84a0(%eax),%ecx
>>>>>>> c59b0f9 (fixed thread_join and join)
     f87:	8d 53 30             	lea    0x30(%ebx),%edx
     f8a:	39 d1                	cmp    %edx,%ecx
     f8c:	75 b6                	jne    f44 <fourfiles+0x118>
      for(j = 0; j < n; j++){
     f8e:	83 c0 01             	add    $0x1,%eax
     f91:	eb e9                	jmp    f7c <fourfiles+0x150>
    }
    close(fd);
     f93:	83 ec 0c             	sub    $0xc,%esp
     f96:	56                   	push   %esi
<<<<<<< HEAD
     f97:	e8 a4 28 00 00       	call   3840 <close>
=======
     f97:	e8 8d 28 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(total != 12*500){
     f9c:	83 c4 10             	add    $0x10,%esp
     f9f:	81 7d d4 70 17 00 00 	cmpl   $0x1770,-0x2c(%ebp)
     fa6:	75 39                	jne    fe1 <fourfiles+0x1b5>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
     fa8:	83 ec 0c             	sub    $0xc,%esp
     fab:	ff 75 d0             	push   -0x30(%ebp)
<<<<<<< HEAD
     fae:	e8 b5 28 00 00       	call   3868 <unlink>
=======
     fae:	e8 9e 28 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 2; i++){
     fb3:	83 c3 01             	add    $0x1,%ebx
     fb6:	83 c4 10             	add    $0x10,%esp
     fb9:	83 fb 01             	cmp    $0x1,%ebx
     fbc:	7f 3a                	jg     ff8 <fourfiles+0x1cc>
    fname = names[i];
     fbe:	8b 44 9d d8          	mov    -0x28(%ebp,%ebx,4),%eax
     fc2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
     fc5:	83 ec 08             	sub    $0x8,%esp
     fc8:	6a 00                	push   $0x0
     fca:	50                   	push   %eax
<<<<<<< HEAD
     fcb:	e8 88 28 00 00       	call   3858 <open>
=======
     fcb:	e8 71 28 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
     fd0:	89 c6                	mov    %eax,%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fd2:	83 c4 10             	add    $0x10,%esp
    total = 0;
     fd5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fdc:	e9 7a ff ff ff       	jmp    f5b <fourfiles+0x12f>
      printf(1, "wrong length %d\n", total);
     fe1:	83 ec 04             	sub    $0x4,%esp
     fe4:	ff 75 d4             	push   -0x2c(%ebp)
<<<<<<< HEAD
     fe7:	68 b5 40 00 00       	push   $0x40b5
     fec:	6a 01                	push   $0x1
     fee:	e8 7a 29 00 00       	call   396d <printf>
      exit();
     ff3:	e8 20 28 00 00       	call   3818 <exit>
=======
     fe7:	68 9d 40 00 00       	push   $0x409d
     fec:	6a 01                	push   $0x1
     fee:	e8 63 29 00 00       	call   3956 <printf>
      exit();
     ff3:	e8 09 28 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }

  printf(1, "fourfiles ok\n");
     ff8:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
     ffb:	68 c6 40 00 00       	push   $0x40c6
    1000:	6a 01                	push   $0x1
    1002:	e8 66 29 00 00       	call   396d <printf>
=======
     ffb:	68 ae 40 00 00       	push   $0x40ae
    1000:	6a 01                	push   $0x1
    1002:	e8 4f 29 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    1007:	83 c4 10             	add    $0x10,%esp
    100a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    100d:	5b                   	pop    %ebx
    100e:	5e                   	pop    %esi
    100f:	5f                   	pop    %edi
    1010:	5d                   	pop    %ebp
    1011:	c3                   	ret    

00001012 <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1012:	55                   	push   %ebp
    1013:	89 e5                	mov    %esp,%ebp
    1015:	56                   	push   %esi
    1016:	53                   	push   %ebx
    1017:	83 ec 28             	sub    $0x28,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
<<<<<<< HEAD
    101a:	68 d4 40 00 00       	push   $0x40d4
    101f:	6a 01                	push   $0x1
    1021:	e8 47 29 00 00       	call   396d <printf>
=======
    101a:	68 bc 40 00 00       	push   $0x40bc
    101f:	6a 01                	push   $0x1
    1021:	e8 30 29 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(pi = 0; pi < 4; pi++){
    1026:	83 c4 10             	add    $0x10,%esp
    1029:	be 00 00 00 00       	mov    $0x0,%esi
    102e:	83 fe 03             	cmp    $0x3,%esi
    1031:	0f 8f bc 00 00 00    	jg     10f3 <createdelete+0xe1>
    pid = fork();
<<<<<<< HEAD
    1037:	e8 d4 27 00 00       	call   3810 <fork>
=======
    1037:	e8 bd 27 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    103c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    103e:	85 c0                	test   %eax,%eax
    1040:	78 07                	js     1049 <createdelete+0x37>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1042:	74 19                	je     105d <createdelete+0x4b>
  for(pi = 0; pi < 4; pi++){
    1044:	83 c6 01             	add    $0x1,%esi
    1047:	eb e5                	jmp    102e <createdelete+0x1c>
      printf(1, "fork failed\n");
    1049:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    104c:	68 5d 4b 00 00       	push   $0x4b5d
    1051:	6a 01                	push   $0x1
    1053:	e8 15 29 00 00       	call   396d <printf>
      exit();
    1058:	e8 bb 27 00 00       	call   3818 <exit>
=======
    104c:	68 45 4b 00 00       	push   $0x4b45
    1051:	6a 01                	push   $0x1
    1053:	e8 fe 28 00 00       	call   3956 <printf>
      exit();
    1058:	e8 a4 27 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      name[0] = 'p' + pi;
    105d:	8d 46 70             	lea    0x70(%esi),%eax
    1060:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[2] = '\0';
    1063:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
      for(i = 0; i < N; i++){
    1067:	eb 17                	jmp    1080 <createdelete+0x6e>
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    1069:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    106c:	68 23 43 00 00       	push   $0x4323
    1071:	6a 01                	push   $0x1
    1073:	e8 f5 28 00 00       	call   396d <printf>
          exit();
    1078:	e8 9b 27 00 00       	call   3818 <exit>
=======
    106c:	68 0b 43 00 00       	push   $0x430b
    1071:	6a 01                	push   $0x1
    1073:	e8 de 28 00 00       	call   3956 <printf>
          exit();
    1078:	e8 84 27 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      for(i = 0; i < N; i++){
    107d:	83 c3 01             	add    $0x1,%ebx
    1080:	83 fb 13             	cmp    $0x13,%ebx
    1083:	7f 69                	jg     10ee <createdelete+0xdc>
        name[1] = '0' + i;
    1085:	8d 43 30             	lea    0x30(%ebx),%eax
    1088:	88 45 d9             	mov    %al,-0x27(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    108b:	83 ec 08             	sub    $0x8,%esp
    108e:	68 02 02 00 00       	push   $0x202
    1093:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1096:	50                   	push   %eax
<<<<<<< HEAD
    1097:	e8 bc 27 00 00       	call   3858 <open>
=======
    1097:	e8 a5 27 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
        if(fd < 0){
    109c:	83 c4 10             	add    $0x10,%esp
    109f:	85 c0                	test   %eax,%eax
    10a1:	78 c6                	js     1069 <createdelete+0x57>
        }
        close(fd);
    10a3:	83 ec 0c             	sub    $0xc,%esp
    10a6:	50                   	push   %eax
<<<<<<< HEAD
    10a7:	e8 94 27 00 00       	call   3840 <close>
=======
    10a7:	e8 7d 27 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
        if(i > 0 && (i % 2 ) == 0){
    10ac:	83 c4 10             	add    $0x10,%esp
    10af:	85 db                	test   %ebx,%ebx
    10b1:	7e ca                	jle    107d <createdelete+0x6b>
    10b3:	f6 c3 01             	test   $0x1,%bl
    10b6:	75 c5                	jne    107d <createdelete+0x6b>
          name[1] = '0' + (i / 2);
    10b8:	89 d8                	mov    %ebx,%eax
    10ba:	c1 e8 1f             	shr    $0x1f,%eax
    10bd:	01 d8                	add    %ebx,%eax
    10bf:	d1 f8                	sar    %eax
    10c1:	83 c0 30             	add    $0x30,%eax
    10c4:	88 45 d9             	mov    %al,-0x27(%ebp)
          if(unlink(name) < 0){
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	8d 45 d8             	lea    -0x28(%ebp),%eax
    10cd:	50                   	push   %eax
<<<<<<< HEAD
    10ce:	e8 95 27 00 00       	call   3868 <unlink>
=======
    10ce:	e8 7e 27 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    10d3:	83 c4 10             	add    $0x10,%esp
    10d6:	85 c0                	test   %eax,%eax
    10d8:	79 a3                	jns    107d <createdelete+0x6b>
            printf(1, "unlink failed\n");
    10da:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    10dd:	68 d5 3c 00 00       	push   $0x3cd5
    10e2:	6a 01                	push   $0x1
    10e4:	e8 84 28 00 00       	call   396d <printf>
            exit();
    10e9:	e8 2a 27 00 00       	call   3818 <exit>
=======
    10dd:	68 bd 3c 00 00       	push   $0x3cbd
    10e2:	6a 01                	push   $0x1
    10e4:	e8 6d 28 00 00       	call   3956 <printf>
            exit();
    10e9:	e8 13 27 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
          }
        }
      }
      exit();
<<<<<<< HEAD
    10ee:	e8 25 27 00 00       	call   3818 <exit>
=======
    10ee:	e8 0e 27 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  for(pi = 0; pi < 4; pi++){
    10f3:	bb 00 00 00 00       	mov    $0x0,%ebx
    10f8:	eb 08                	jmp    1102 <createdelete+0xf0>
    wait();
<<<<<<< HEAD
    10fa:	e8 21 27 00 00       	call   3820 <wait>
=======
    10fa:	e8 0a 27 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(pi = 0; pi < 4; pi++){
    10ff:	83 c3 01             	add    $0x1,%ebx
    1102:	83 fb 03             	cmp    $0x3,%ebx
    1105:	7e f3                	jle    10fa <createdelete+0xe8>
  }

  name[0] = name[1] = name[2] = 0;
    1107:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    110b:	c6 45 d9 00          	movb   $0x0,-0x27(%ebp)
    110f:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
  for(i = 0; i < N; i++){
    1113:	bb 00 00 00 00       	mov    $0x0,%ebx
    1118:	e9 89 00 00 00       	jmp    11a6 <createdelete+0x194>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    111d:	8d 53 ff             	lea    -0x1(%ebx),%edx
    1120:	83 fa 08             	cmp    $0x8,%edx
    1123:	76 54                	jbe    1179 <createdelete+0x167>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    1125:	85 c0                	test   %eax,%eax
    1127:	79 6c                	jns    1195 <createdelete+0x183>
    for(pi = 0; pi < 4; pi++){
    1129:	83 c6 01             	add    $0x1,%esi
    112c:	83 fe 03             	cmp    $0x3,%esi
    112f:	7f 72                	jg     11a3 <createdelete+0x191>
      name[0] = 'p' + pi;
    1131:	8d 46 70             	lea    0x70(%esi),%eax
    1134:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[1] = '0' + i;
    1137:	8d 43 30             	lea    0x30(%ebx),%eax
    113a:	88 45 d9             	mov    %al,-0x27(%ebp)
      fd = open(name, 0);
    113d:	83 ec 08             	sub    $0x8,%esp
    1140:	6a 00                	push   $0x0
    1142:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1145:	50                   	push   %eax
<<<<<<< HEAD
    1146:	e8 0d 27 00 00       	call   3858 <open>
=======
    1146:	e8 f6 26 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
      if((i == 0 || i >= N/2) && fd < 0){
    114b:	83 c4 10             	add    $0x10,%esp
    114e:	85 db                	test   %ebx,%ebx
    1150:	0f 94 c2             	sete   %dl
    1153:	83 fb 09             	cmp    $0x9,%ebx
    1156:	0f 9f c1             	setg   %cl
    1159:	08 ca                	or     %cl,%dl
    115b:	74 c0                	je     111d <createdelete+0x10b>
    115d:	85 c0                	test   %eax,%eax
    115f:	79 bc                	jns    111d <createdelete+0x10b>
        printf(1, "oops createdelete %s didn't exist\n", name);
    1161:	83 ec 04             	sub    $0x4,%esp
    1164:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1167:	50                   	push   %eax
<<<<<<< HEAD
    1168:	68 94 4d 00 00       	push   $0x4d94
    116d:	6a 01                	push   $0x1
    116f:	e8 f9 27 00 00       	call   396d <printf>
        exit();
    1174:	e8 9f 26 00 00       	call   3818 <exit>
=======
    1168:	68 7c 4d 00 00       	push   $0x4d7c
    116d:	6a 01                	push   $0x1
    116f:	e8 e2 27 00 00       	call   3956 <printf>
        exit();
    1174:	e8 88 26 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1179:	85 c0                	test   %eax,%eax
    117b:	78 a8                	js     1125 <createdelete+0x113>
        printf(1, "oops createdelete %s did exist\n", name);
    117d:	83 ec 04             	sub    $0x4,%esp
    1180:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1183:	50                   	push   %eax
<<<<<<< HEAD
    1184:	68 b8 4d 00 00       	push   $0x4db8
    1189:	6a 01                	push   $0x1
    118b:	e8 dd 27 00 00       	call   396d <printf>
        exit();
    1190:	e8 83 26 00 00       	call   3818 <exit>
        close(fd);
    1195:	83 ec 0c             	sub    $0xc,%esp
    1198:	50                   	push   %eax
    1199:	e8 a2 26 00 00       	call   3840 <close>
=======
    1184:	68 a0 4d 00 00       	push   $0x4da0
    1189:	6a 01                	push   $0x1
    118b:	e8 c6 27 00 00       	call   3956 <printf>
        exit();
    1190:	e8 6c 26 00 00       	call   3801 <exit>
        close(fd);
    1195:	83 ec 0c             	sub    $0xc,%esp
    1198:	50                   	push   %eax
    1199:	e8 8b 26 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    119e:	83 c4 10             	add    $0x10,%esp
    11a1:	eb 86                	jmp    1129 <createdelete+0x117>
  for(i = 0; i < N; i++){
    11a3:	83 c3 01             	add    $0x1,%ebx
    11a6:	83 fb 13             	cmp    $0x13,%ebx
    11a9:	7f 0a                	jg     11b5 <createdelete+0x1a3>
    for(pi = 0; pi < 4; pi++){
    11ab:	be 00 00 00 00       	mov    $0x0,%esi
    11b0:	e9 77 ff ff ff       	jmp    112c <createdelete+0x11a>
    }
  }

  for(i = 0; i < N; i++){
    11b5:	be 00 00 00 00       	mov    $0x0,%esi
    11ba:	eb 26                	jmp    11e2 <createdelete+0x1d0>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    11bc:	8d 46 70             	lea    0x70(%esi),%eax
    11bf:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[1] = '0' + i;
    11c2:	8d 46 30             	lea    0x30(%esi),%eax
    11c5:	88 45 d9             	mov    %al,-0x27(%ebp)
      unlink(name);
    11c8:	83 ec 0c             	sub    $0xc,%esp
    11cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
    11ce:	50                   	push   %eax
<<<<<<< HEAD
    11cf:	e8 94 26 00 00       	call   3868 <unlink>
=======
    11cf:	e8 7d 26 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    for(pi = 0; pi < 4; pi++){
    11d4:	83 c3 01             	add    $0x1,%ebx
    11d7:	83 c4 10             	add    $0x10,%esp
    11da:	83 fb 03             	cmp    $0x3,%ebx
    11dd:	7e dd                	jle    11bc <createdelete+0x1aa>
  for(i = 0; i < N; i++){
    11df:	83 c6 01             	add    $0x1,%esi
    11e2:	83 fe 13             	cmp    $0x13,%esi
    11e5:	7f 07                	jg     11ee <createdelete+0x1dc>
    for(pi = 0; pi < 4; pi++){
    11e7:	bb 00 00 00 00       	mov    $0x0,%ebx
    11ec:	eb ec                	jmp    11da <createdelete+0x1c8>
    }
  }

  printf(1, "createdelete ok\n");
    11ee:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    11f1:	68 e7 40 00 00       	push   $0x40e7
    11f6:	6a 01                	push   $0x1
    11f8:	e8 70 27 00 00       	call   396d <printf>
=======
    11f1:	68 cf 40 00 00       	push   $0x40cf
    11f6:	6a 01                	push   $0x1
    11f8:	e8 59 27 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    11fd:	83 c4 10             	add    $0x10,%esp
    1200:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1203:	5b                   	pop    %ebx
    1204:	5e                   	pop    %esi
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    

00001207 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1207:	55                   	push   %ebp
    1208:	89 e5                	mov    %esp,%ebp
    120a:	56                   	push   %esi
    120b:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    120c:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    120f:	68 f8 40 00 00       	push   $0x40f8
    1214:	6a 01                	push   $0x1
    1216:	e8 52 27 00 00       	call   396d <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    121b:	83 c4 08             	add    $0x8,%esp
    121e:	68 02 02 00 00       	push   $0x202
    1223:	68 09 41 00 00       	push   $0x4109
    1228:	e8 2b 26 00 00       	call   3858 <open>
=======
    120f:	68 e0 40 00 00       	push   $0x40e0
    1214:	6a 01                	push   $0x1
    1216:	e8 3b 27 00 00       	call   3956 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    121b:	83 c4 08             	add    $0x8,%esp
    121e:	68 02 02 00 00       	push   $0x202
    1223:	68 f1 40 00 00       	push   $0x40f1
    1228:	e8 14 26 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    122d:	83 c4 10             	add    $0x10,%esp
    1230:	85 c0                	test   %eax,%eax
    1232:	0f 88 f0 00 00 00    	js     1328 <unlinkread+0x121>
    1238:	89 c3                	mov    %eax,%ebx
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    123a:	83 ec 04             	sub    $0x4,%esp
    123d:	6a 05                	push   $0x5
<<<<<<< HEAD
    123f:	68 2e 41 00 00       	push   $0x412e
    1244:	50                   	push   %eax
    1245:	e8 ee 25 00 00       	call   3838 <write>
  close(fd);
    124a:	89 1c 24             	mov    %ebx,(%esp)
    124d:	e8 ee 25 00 00       	call   3840 <close>
=======
    123f:	68 16 41 00 00       	push   $0x4116
    1244:	50                   	push   %eax
    1245:	e8 d7 25 00 00       	call   3821 <write>
  close(fd);
    124a:	89 1c 24             	mov    %ebx,(%esp)
    124d:	e8 d7 25 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("unlinkread", O_RDWR);
    1252:	83 c4 08             	add    $0x8,%esp
    1255:	6a 02                	push   $0x2
<<<<<<< HEAD
    1257:	68 09 41 00 00       	push   $0x4109
    125c:	e8 f7 25 00 00       	call   3858 <open>
=======
    1257:	68 f1 40 00 00       	push   $0x40f1
    125c:	e8 e0 25 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1261:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1263:	83 c4 10             	add    $0x10,%esp
    1266:	85 c0                	test   %eax,%eax
    1268:	0f 88 ce 00 00 00    	js     133c <unlinkread+0x135>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    126e:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1271:	68 09 41 00 00       	push   $0x4109
    1276:	e8 ed 25 00 00       	call   3868 <unlink>
=======
    1271:	68 f1 40 00 00       	push   $0x40f1
    1276:	e8 d6 25 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    127b:	83 c4 10             	add    $0x10,%esp
    127e:	85 c0                	test   %eax,%eax
    1280:	0f 85 ca 00 00 00    	jne    1350 <unlinkread+0x149>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1286:	83 ec 08             	sub    $0x8,%esp
    1289:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    128e:	68 09 41 00 00       	push   $0x4109
    1293:	e8 c0 25 00 00       	call   3858 <open>
=======
    128e:	68 f1 40 00 00       	push   $0x40f1
    1293:	e8 a9 25 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1298:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    129a:	83 c4 0c             	add    $0xc,%esp
    129d:	6a 03                	push   $0x3
<<<<<<< HEAD
    129f:	68 66 41 00 00       	push   $0x4166
    12a4:	50                   	push   %eax
    12a5:	e8 8e 25 00 00       	call   3838 <write>
  close(fd1);
    12aa:	89 34 24             	mov    %esi,(%esp)
    12ad:	e8 8e 25 00 00       	call   3840 <close>
=======
    129f:	68 4e 41 00 00       	push   $0x414e
    12a4:	50                   	push   %eax
    12a5:	e8 77 25 00 00       	call   3821 <write>
  close(fd1);
    12aa:	89 34 24             	mov    %esi,(%esp)
    12ad:	e8 77 25 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  if(read(fd, buf, sizeof(buf)) != 5){
    12b2:	83 c4 0c             	add    $0xc,%esp
    12b5:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
    12ba:	68 c0 84 00 00       	push   $0x84c0
    12bf:	53                   	push   %ebx
    12c0:	e8 6b 25 00 00       	call   3830 <read>
=======
    12ba:	68 a0 84 00 00       	push   $0x84a0
    12bf:	53                   	push   %ebx
    12c0:	e8 54 25 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    12c5:	83 c4 10             	add    $0x10,%esp
    12c8:	83 f8 05             	cmp    $0x5,%eax
    12cb:	0f 85 93 00 00 00    	jne    1364 <unlinkread+0x15d>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
<<<<<<< HEAD
    12d1:	80 3d c0 84 00 00 68 	cmpb   $0x68,0x84c0
=======
    12d1:	80 3d a0 84 00 00 68 	cmpb   $0x68,0x84a0
>>>>>>> c59b0f9 (fixed thread_join and join)
    12d8:	0f 85 9a 00 00 00    	jne    1378 <unlinkread+0x171>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    12de:	83 ec 04             	sub    $0x4,%esp
    12e1:	6a 0a                	push   $0xa
<<<<<<< HEAD
    12e3:	68 c0 84 00 00       	push   $0x84c0
    12e8:	53                   	push   %ebx
    12e9:	e8 4a 25 00 00       	call   3838 <write>
=======
    12e3:	68 a0 84 00 00       	push   $0x84a0
    12e8:	53                   	push   %ebx
    12e9:	e8 33 25 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
    12ee:	83 c4 10             	add    $0x10,%esp
    12f1:	83 f8 0a             	cmp    $0xa,%eax
    12f4:	0f 85 92 00 00 00    	jne    138c <unlinkread+0x185>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    12fa:	83 ec 0c             	sub    $0xc,%esp
    12fd:	53                   	push   %ebx
<<<<<<< HEAD
    12fe:	e8 3d 25 00 00       	call   3840 <close>
  unlink("unlinkread");
    1303:	c7 04 24 09 41 00 00 	movl   $0x4109,(%esp)
    130a:	e8 59 25 00 00       	call   3868 <unlink>
  printf(1, "unlinkread ok\n");
    130f:	83 c4 08             	add    $0x8,%esp
    1312:	68 b1 41 00 00       	push   $0x41b1
    1317:	6a 01                	push   $0x1
    1319:	e8 4f 26 00 00       	call   396d <printf>
=======
    12fe:	e8 26 25 00 00       	call   3829 <close>
  unlink("unlinkread");
    1303:	c7 04 24 f1 40 00 00 	movl   $0x40f1,(%esp)
    130a:	e8 42 25 00 00       	call   3851 <unlink>
  printf(1, "unlinkread ok\n");
    130f:	83 c4 08             	add    $0x8,%esp
    1312:	68 99 41 00 00       	push   $0x4199
    1317:	6a 01                	push   $0x1
    1319:	e8 38 26 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    131e:	83 c4 10             	add    $0x10,%esp
    1321:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1324:	5b                   	pop    %ebx
    1325:	5e                   	pop    %esi
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1328:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    132b:	68 14 41 00 00       	push   $0x4114
    1330:	6a 01                	push   $0x1
    1332:	e8 36 26 00 00       	call   396d <printf>
    exit();
    1337:	e8 dc 24 00 00       	call   3818 <exit>
    printf(1, "open unlinkread failed\n");
    133c:	83 ec 08             	sub    $0x8,%esp
    133f:	68 34 41 00 00       	push   $0x4134
    1344:	6a 01                	push   $0x1
    1346:	e8 22 26 00 00       	call   396d <printf>
    exit();
    134b:	e8 c8 24 00 00       	call   3818 <exit>
    printf(1, "unlink unlinkread failed\n");
    1350:	83 ec 08             	sub    $0x8,%esp
    1353:	68 4c 41 00 00       	push   $0x414c
    1358:	6a 01                	push   $0x1
    135a:	e8 0e 26 00 00       	call   396d <printf>
    exit();
    135f:	e8 b4 24 00 00       	call   3818 <exit>
    printf(1, "unlinkread read failed");
    1364:	83 ec 08             	sub    $0x8,%esp
    1367:	68 6a 41 00 00       	push   $0x416a
    136c:	6a 01                	push   $0x1
    136e:	e8 fa 25 00 00       	call   396d <printf>
    exit();
    1373:	e8 a0 24 00 00       	call   3818 <exit>
    printf(1, "unlinkread wrong data\n");
    1378:	83 ec 08             	sub    $0x8,%esp
    137b:	68 81 41 00 00       	push   $0x4181
    1380:	6a 01                	push   $0x1
    1382:	e8 e6 25 00 00       	call   396d <printf>
    exit();
    1387:	e8 8c 24 00 00       	call   3818 <exit>
    printf(1, "unlinkread write failed\n");
    138c:	83 ec 08             	sub    $0x8,%esp
    138f:	68 98 41 00 00       	push   $0x4198
    1394:	6a 01                	push   $0x1
    1396:	e8 d2 25 00 00       	call   396d <printf>
    exit();
    139b:	e8 78 24 00 00       	call   3818 <exit>
=======
    132b:	68 fc 40 00 00       	push   $0x40fc
    1330:	6a 01                	push   $0x1
    1332:	e8 1f 26 00 00       	call   3956 <printf>
    exit();
    1337:	e8 c5 24 00 00       	call   3801 <exit>
    printf(1, "open unlinkread failed\n");
    133c:	83 ec 08             	sub    $0x8,%esp
    133f:	68 1c 41 00 00       	push   $0x411c
    1344:	6a 01                	push   $0x1
    1346:	e8 0b 26 00 00       	call   3956 <printf>
    exit();
    134b:	e8 b1 24 00 00       	call   3801 <exit>
    printf(1, "unlink unlinkread failed\n");
    1350:	83 ec 08             	sub    $0x8,%esp
    1353:	68 34 41 00 00       	push   $0x4134
    1358:	6a 01                	push   $0x1
    135a:	e8 f7 25 00 00       	call   3956 <printf>
    exit();
    135f:	e8 9d 24 00 00       	call   3801 <exit>
    printf(1, "unlinkread read failed");
    1364:	83 ec 08             	sub    $0x8,%esp
    1367:	68 52 41 00 00       	push   $0x4152
    136c:	6a 01                	push   $0x1
    136e:	e8 e3 25 00 00       	call   3956 <printf>
    exit();
    1373:	e8 89 24 00 00       	call   3801 <exit>
    printf(1, "unlinkread wrong data\n");
    1378:	83 ec 08             	sub    $0x8,%esp
    137b:	68 69 41 00 00       	push   $0x4169
    1380:	6a 01                	push   $0x1
    1382:	e8 cf 25 00 00       	call   3956 <printf>
    exit();
    1387:	e8 75 24 00 00       	call   3801 <exit>
    printf(1, "unlinkread write failed\n");
    138c:	83 ec 08             	sub    $0x8,%esp
    138f:	68 80 41 00 00       	push   $0x4180
    1394:	6a 01                	push   $0x1
    1396:	e8 bb 25 00 00       	call   3956 <printf>
    exit();
    139b:	e8 61 24 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000013a0 <linktest>:

void
linktest(void)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	53                   	push   %ebx
    13a4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
<<<<<<< HEAD
    13a7:	68 c0 41 00 00       	push   $0x41c0
    13ac:	6a 01                	push   $0x1
    13ae:	e8 ba 25 00 00       	call   396d <printf>

  unlink("lf1");
    13b3:	c7 04 24 ca 41 00 00 	movl   $0x41ca,(%esp)
    13ba:	e8 a9 24 00 00       	call   3868 <unlink>
  unlink("lf2");
    13bf:	c7 04 24 ce 41 00 00 	movl   $0x41ce,(%esp)
    13c6:	e8 9d 24 00 00       	call   3868 <unlink>
=======
    13a7:	68 a8 41 00 00       	push   $0x41a8
    13ac:	6a 01                	push   $0x1
    13ae:	e8 a3 25 00 00       	call   3956 <printf>

  unlink("lf1");
    13b3:	c7 04 24 b2 41 00 00 	movl   $0x41b2,(%esp)
    13ba:	e8 92 24 00 00       	call   3851 <unlink>
  unlink("lf2");
    13bf:	c7 04 24 b6 41 00 00 	movl   $0x41b6,(%esp)
    13c6:	e8 86 24 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("lf1", O_CREATE|O_RDWR);
    13cb:	83 c4 08             	add    $0x8,%esp
    13ce:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    13d3:	68 ca 41 00 00       	push   $0x41ca
    13d8:	e8 7b 24 00 00       	call   3858 <open>
=======
    13d3:	68 b2 41 00 00       	push   $0x41b2
    13d8:	e8 64 24 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    13dd:	83 c4 10             	add    $0x10,%esp
    13e0:	85 c0                	test   %eax,%eax
    13e2:	0f 88 2a 01 00 00    	js     1512 <linktest+0x172>
    13e8:	89 c3                	mov    %eax,%ebx
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    13ea:	83 ec 04             	sub    $0x4,%esp
    13ed:	6a 05                	push   $0x5
<<<<<<< HEAD
    13ef:	68 2e 41 00 00       	push   $0x412e
    13f4:	50                   	push   %eax
    13f5:	e8 3e 24 00 00       	call   3838 <write>
=======
    13ef:	68 16 41 00 00       	push   $0x4116
    13f4:	50                   	push   %eax
    13f5:	e8 27 24 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
    13fa:	83 c4 10             	add    $0x10,%esp
    13fd:	83 f8 05             	cmp    $0x5,%eax
    1400:	0f 85 20 01 00 00    	jne    1526 <linktest+0x186>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1406:	83 ec 0c             	sub    $0xc,%esp
    1409:	53                   	push   %ebx
<<<<<<< HEAD
    140a:	e8 31 24 00 00       	call   3840 <close>

  if(link("lf1", "lf2") < 0){
    140f:	83 c4 08             	add    $0x8,%esp
    1412:	68 ce 41 00 00       	push   $0x41ce
    1417:	68 ca 41 00 00       	push   $0x41ca
    141c:	e8 57 24 00 00       	call   3878 <link>
=======
    140a:	e8 1a 24 00 00       	call   3829 <close>

  if(link("lf1", "lf2") < 0){
    140f:	83 c4 08             	add    $0x8,%esp
    1412:	68 b6 41 00 00       	push   $0x41b6
    1417:	68 b2 41 00 00       	push   $0x41b2
    141c:	e8 40 24 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1421:	83 c4 10             	add    $0x10,%esp
    1424:	85 c0                	test   %eax,%eax
    1426:	0f 88 0e 01 00 00    	js     153a <linktest+0x19a>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    142c:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    142f:	68 ca 41 00 00       	push   $0x41ca
    1434:	e8 2f 24 00 00       	call   3868 <unlink>
=======
    142f:	68 b2 41 00 00       	push   $0x41b2
    1434:	e8 18 24 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)

  if(open("lf1", 0) >= 0){
    1439:	83 c4 08             	add    $0x8,%esp
    143c:	6a 00                	push   $0x0
<<<<<<< HEAD
    143e:	68 ca 41 00 00       	push   $0x41ca
    1443:	e8 10 24 00 00       	call   3858 <open>
=======
    143e:	68 b2 41 00 00       	push   $0x41b2
    1443:	e8 f9 23 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1448:	83 c4 10             	add    $0x10,%esp
    144b:	85 c0                	test   %eax,%eax
    144d:	0f 89 fb 00 00 00    	jns    154e <linktest+0x1ae>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1453:	83 ec 08             	sub    $0x8,%esp
    1456:	6a 00                	push   $0x0
<<<<<<< HEAD
    1458:	68 ce 41 00 00       	push   $0x41ce
    145d:	e8 f6 23 00 00       	call   3858 <open>
=======
    1458:	68 b6 41 00 00       	push   $0x41b6
    145d:	e8 df 23 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1462:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1464:	83 c4 10             	add    $0x10,%esp
    1467:	85 c0                	test   %eax,%eax
    1469:	0f 88 f3 00 00 00    	js     1562 <linktest+0x1c2>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    146f:	83 ec 04             	sub    $0x4,%esp
    1472:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
    1477:	68 c0 84 00 00       	push   $0x84c0
    147c:	50                   	push   %eax
    147d:	e8 ae 23 00 00       	call   3830 <read>
=======
    1477:	68 a0 84 00 00       	push   $0x84a0
    147c:	50                   	push   %eax
    147d:	e8 97 23 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1482:	83 c4 10             	add    $0x10,%esp
    1485:	83 f8 05             	cmp    $0x5,%eax
    1488:	0f 85 e8 00 00 00    	jne    1576 <linktest+0x1d6>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    148e:	83 ec 0c             	sub    $0xc,%esp
    1491:	53                   	push   %ebx
<<<<<<< HEAD
    1492:	e8 a9 23 00 00       	call   3840 <close>

  if(link("lf2", "lf2") >= 0){
    1497:	83 c4 08             	add    $0x8,%esp
    149a:	68 ce 41 00 00       	push   $0x41ce
    149f:	68 ce 41 00 00       	push   $0x41ce
    14a4:	e8 cf 23 00 00       	call   3878 <link>
=======
    1492:	e8 92 23 00 00       	call   3829 <close>

  if(link("lf2", "lf2") >= 0){
    1497:	83 c4 08             	add    $0x8,%esp
    149a:	68 b6 41 00 00       	push   $0x41b6
    149f:	68 b6 41 00 00       	push   $0x41b6
    14a4:	e8 b8 23 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    14a9:	83 c4 10             	add    $0x10,%esp
    14ac:	85 c0                	test   %eax,%eax
    14ae:	0f 89 d6 00 00 00    	jns    158a <linktest+0x1ea>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    14b4:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    14b7:	68 ce 41 00 00       	push   $0x41ce
    14bc:	e8 a7 23 00 00       	call   3868 <unlink>
  if(link("lf2", "lf1") >= 0){
    14c1:	83 c4 08             	add    $0x8,%esp
    14c4:	68 ca 41 00 00       	push   $0x41ca
    14c9:	68 ce 41 00 00       	push   $0x41ce
    14ce:	e8 a5 23 00 00       	call   3878 <link>
=======
    14b7:	68 b6 41 00 00       	push   $0x41b6
    14bc:	e8 90 23 00 00       	call   3851 <unlink>
  if(link("lf2", "lf1") >= 0){
    14c1:	83 c4 08             	add    $0x8,%esp
    14c4:	68 b2 41 00 00       	push   $0x41b2
    14c9:	68 b6 41 00 00       	push   $0x41b6
    14ce:	e8 8e 23 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    14d3:	83 c4 10             	add    $0x10,%esp
    14d6:	85 c0                	test   %eax,%eax
    14d8:	0f 89 c0 00 00 00    	jns    159e <linktest+0x1fe>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    14de:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    14e1:	68 ca 41 00 00       	push   $0x41ca
    14e6:	68 92 44 00 00       	push   $0x4492
    14eb:	e8 88 23 00 00       	call   3878 <link>
=======
    14e1:	68 b2 41 00 00       	push   $0x41b2
    14e6:	68 7a 44 00 00       	push   $0x447a
    14eb:	e8 71 23 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    14f0:	83 c4 10             	add    $0x10,%esp
    14f3:	85 c0                	test   %eax,%eax
    14f5:	0f 89 b7 00 00 00    	jns    15b2 <linktest+0x212>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    14fb:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    14fe:	68 68 42 00 00       	push   $0x4268
    1503:	6a 01                	push   $0x1
    1505:	e8 63 24 00 00       	call   396d <printf>
=======
    14fe:	68 50 42 00 00       	push   $0x4250
    1503:	6a 01                	push   $0x1
    1505:	e8 4c 24 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    150a:	83 c4 10             	add    $0x10,%esp
    150d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1510:	c9                   	leave  
    1511:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1512:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1515:	68 d2 41 00 00       	push   $0x41d2
    151a:	6a 01                	push   $0x1
    151c:	e8 4c 24 00 00       	call   396d <printf>
    exit();
    1521:	e8 f2 22 00 00       	call   3818 <exit>
    printf(1, "write lf1 failed\n");
    1526:	83 ec 08             	sub    $0x8,%esp
    1529:	68 e5 41 00 00       	push   $0x41e5
    152e:	6a 01                	push   $0x1
    1530:	e8 38 24 00 00       	call   396d <printf>
    exit();
    1535:	e8 de 22 00 00       	call   3818 <exit>
    printf(1, "link lf1 lf2 failed\n");
    153a:	83 ec 08             	sub    $0x8,%esp
    153d:	68 f7 41 00 00       	push   $0x41f7
    1542:	6a 01                	push   $0x1
    1544:	e8 24 24 00 00       	call   396d <printf>
    exit();
    1549:	e8 ca 22 00 00       	call   3818 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    154e:	83 ec 08             	sub    $0x8,%esp
    1551:	68 d8 4d 00 00       	push   $0x4dd8
    1556:	6a 01                	push   $0x1
    1558:	e8 10 24 00 00       	call   396d <printf>
    exit();
    155d:	e8 b6 22 00 00       	call   3818 <exit>
    printf(1, "open lf2 failed\n");
    1562:	83 ec 08             	sub    $0x8,%esp
    1565:	68 0c 42 00 00       	push   $0x420c
    156a:	6a 01                	push   $0x1
    156c:	e8 fc 23 00 00       	call   396d <printf>
    exit();
    1571:	e8 a2 22 00 00       	call   3818 <exit>
    printf(1, "read lf2 failed\n");
    1576:	83 ec 08             	sub    $0x8,%esp
    1579:	68 1d 42 00 00       	push   $0x421d
    157e:	6a 01                	push   $0x1
    1580:	e8 e8 23 00 00       	call   396d <printf>
    exit();
    1585:	e8 8e 22 00 00       	call   3818 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    158a:	83 ec 08             	sub    $0x8,%esp
    158d:	68 2e 42 00 00       	push   $0x422e
    1592:	6a 01                	push   $0x1
    1594:	e8 d4 23 00 00       	call   396d <printf>
    exit();
    1599:	e8 7a 22 00 00       	call   3818 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    159e:	83 ec 08             	sub    $0x8,%esp
    15a1:	68 00 4e 00 00       	push   $0x4e00
    15a6:	6a 01                	push   $0x1
    15a8:	e8 c0 23 00 00       	call   396d <printf>
    exit();
    15ad:	e8 66 22 00 00       	call   3818 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    15b2:	83 ec 08             	sub    $0x8,%esp
    15b5:	68 4c 42 00 00       	push   $0x424c
    15ba:	6a 01                	push   $0x1
    15bc:	e8 ac 23 00 00       	call   396d <printf>
    exit();
    15c1:	e8 52 22 00 00       	call   3818 <exit>
=======
    1515:	68 ba 41 00 00       	push   $0x41ba
    151a:	6a 01                	push   $0x1
    151c:	e8 35 24 00 00       	call   3956 <printf>
    exit();
    1521:	e8 db 22 00 00       	call   3801 <exit>
    printf(1, "write lf1 failed\n");
    1526:	83 ec 08             	sub    $0x8,%esp
    1529:	68 cd 41 00 00       	push   $0x41cd
    152e:	6a 01                	push   $0x1
    1530:	e8 21 24 00 00       	call   3956 <printf>
    exit();
    1535:	e8 c7 22 00 00       	call   3801 <exit>
    printf(1, "link lf1 lf2 failed\n");
    153a:	83 ec 08             	sub    $0x8,%esp
    153d:	68 df 41 00 00       	push   $0x41df
    1542:	6a 01                	push   $0x1
    1544:	e8 0d 24 00 00       	call   3956 <printf>
    exit();
    1549:	e8 b3 22 00 00       	call   3801 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    154e:	83 ec 08             	sub    $0x8,%esp
    1551:	68 c0 4d 00 00       	push   $0x4dc0
    1556:	6a 01                	push   $0x1
    1558:	e8 f9 23 00 00       	call   3956 <printf>
    exit();
    155d:	e8 9f 22 00 00       	call   3801 <exit>
    printf(1, "open lf2 failed\n");
    1562:	83 ec 08             	sub    $0x8,%esp
    1565:	68 f4 41 00 00       	push   $0x41f4
    156a:	6a 01                	push   $0x1
    156c:	e8 e5 23 00 00       	call   3956 <printf>
    exit();
    1571:	e8 8b 22 00 00       	call   3801 <exit>
    printf(1, "read lf2 failed\n");
    1576:	83 ec 08             	sub    $0x8,%esp
    1579:	68 05 42 00 00       	push   $0x4205
    157e:	6a 01                	push   $0x1
    1580:	e8 d1 23 00 00       	call   3956 <printf>
    exit();
    1585:	e8 77 22 00 00       	call   3801 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    158a:	83 ec 08             	sub    $0x8,%esp
    158d:	68 16 42 00 00       	push   $0x4216
    1592:	6a 01                	push   $0x1
    1594:	e8 bd 23 00 00       	call   3956 <printf>
    exit();
    1599:	e8 63 22 00 00       	call   3801 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    159e:	83 ec 08             	sub    $0x8,%esp
    15a1:	68 e8 4d 00 00       	push   $0x4de8
    15a6:	6a 01                	push   $0x1
    15a8:	e8 a9 23 00 00       	call   3956 <printf>
    exit();
    15ad:	e8 4f 22 00 00       	call   3801 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    15b2:	83 ec 08             	sub    $0x8,%esp
    15b5:	68 34 42 00 00       	push   $0x4234
    15ba:	6a 01                	push   $0x1
    15bc:	e8 95 23 00 00       	call   3956 <printf>
    exit();
    15c1:	e8 3b 22 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000015c6 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    15c6:	55                   	push   %ebp
    15c7:	89 e5                	mov    %esp,%ebp
    15c9:	57                   	push   %edi
    15ca:	56                   	push   %esi
    15cb:	53                   	push   %ebx
    15cc:	83 ec 54             	sub    $0x54,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
<<<<<<< HEAD
    15cf:	68 75 42 00 00       	push   $0x4275
    15d4:	6a 01                	push   $0x1
    15d6:	e8 92 23 00 00       	call   396d <printf>
=======
    15cf:	68 5d 42 00 00       	push   $0x425d
    15d4:	6a 01                	push   $0x1
    15d6:	e8 7b 23 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  file[0] = 'C';
    15db:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    15df:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    15e3:	83 c4 10             	add    $0x10,%esp
    15e6:	bb 00 00 00 00       	mov    $0x0,%ebx
    15eb:	eb 5e                	jmp    164b <concreate+0x85>
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    15ed:	85 f6                	test   %esi,%esi
    15ef:	75 22                	jne    1613 <concreate+0x4d>
    15f1:	ba 67 66 66 66       	mov    $0x66666667,%edx
    15f6:	89 d8                	mov    %ebx,%eax
    15f8:	f7 ea                	imul   %edx
    15fa:	d1 fa                	sar    %edx
    15fc:	89 d8                	mov    %ebx,%eax
    15fe:	c1 f8 1f             	sar    $0x1f,%eax
    1601:	29 c2                	sub    %eax,%edx
    1603:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1606:	89 da                	mov    %ebx,%edx
    1608:	29 c2                	sub    %eax,%edx
    160a:	83 fa 01             	cmp    $0x1,%edx
    160d:	0f 84 9b 00 00 00    	je     16ae <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1613:	83 ec 08             	sub    $0x8,%esp
    1616:	68 02 02 00 00       	push   $0x202
    161b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    161e:	50                   	push   %eax
<<<<<<< HEAD
    161f:	e8 34 22 00 00       	call   3858 <open>
=======
    161f:	e8 1d 22 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
      if(fd < 0){
    1624:	83 c4 10             	add    $0x10,%esp
    1627:	85 c0                	test   %eax,%eax
    1629:	0f 88 98 00 00 00    	js     16c7 <concreate+0x101>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    162f:	83 ec 0c             	sub    $0xc,%esp
    1632:	50                   	push   %eax
<<<<<<< HEAD
    1633:	e8 08 22 00 00       	call   3840 <close>
=======
    1633:	e8 f1 21 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1638:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    163b:	85 f6                	test   %esi,%esi
    163d:	0f 84 9c 00 00 00    	je     16df <concreate+0x119>
      exit();
    else
      wait();
<<<<<<< HEAD
    1643:	e8 d8 21 00 00       	call   3820 <wait>
=======
    1643:	e8 c1 21 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 40; i++){
    1648:	83 c3 01             	add    $0x1,%ebx
    164b:	83 fb 27             	cmp    $0x27,%ebx
    164e:	0f 8f 90 00 00 00    	jg     16e4 <concreate+0x11e>
    file[1] = '0' + i;
    1654:	8d 43 30             	lea    0x30(%ebx),%eax
    1657:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    165a:	83 ec 0c             	sub    $0xc,%esp
    165d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1660:	50                   	push   %eax
<<<<<<< HEAD
    1661:	e8 02 22 00 00       	call   3868 <unlink>
    pid = fork();
    1666:	e8 a5 21 00 00       	call   3810 <fork>
=======
    1661:	e8 eb 21 00 00       	call   3851 <unlink>
    pid = fork();
    1666:	e8 8e 21 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    166b:	89 c6                	mov    %eax,%esi
    if(pid && (i % 3) == 1){
    166d:	83 c4 10             	add    $0x10,%esp
    1670:	85 c0                	test   %eax,%eax
    1672:	0f 84 75 ff ff ff    	je     15ed <concreate+0x27>
    1678:	ba 56 55 55 55       	mov    $0x55555556,%edx
    167d:	89 d8                	mov    %ebx,%eax
    167f:	f7 ea                	imul   %edx
    1681:	89 d8                	mov    %ebx,%eax
    1683:	c1 f8 1f             	sar    $0x1f,%eax
    1686:	29 c2                	sub    %eax,%edx
    1688:	8d 04 52             	lea    (%edx,%edx,2),%eax
    168b:	89 da                	mov    %ebx,%edx
    168d:	29 c2                	sub    %eax,%edx
    168f:	83 fa 01             	cmp    $0x1,%edx
    1692:	0f 85 55 ff ff ff    	jne    15ed <concreate+0x27>
      link("C0", file);
    1698:	83 ec 08             	sub    $0x8,%esp
    169b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    169e:	50                   	push   %eax
<<<<<<< HEAD
    169f:	68 85 42 00 00       	push   $0x4285
    16a4:	e8 cf 21 00 00       	call   3878 <link>
=======
    169f:	68 6d 42 00 00       	push   $0x426d
    16a4:	e8 b8 21 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    16a9:	83 c4 10             	add    $0x10,%esp
    16ac:	eb 8d                	jmp    163b <concreate+0x75>
      link("C0", file);
    16ae:	83 ec 08             	sub    $0x8,%esp
    16b1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16b4:	50                   	push   %eax
<<<<<<< HEAD
    16b5:	68 85 42 00 00       	push   $0x4285
    16ba:	e8 b9 21 00 00       	call   3878 <link>
=======
    16b5:	68 6d 42 00 00       	push   $0x426d
    16ba:	e8 a2 21 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    16bf:	83 c4 10             	add    $0x10,%esp
    16c2:	e9 74 ff ff ff       	jmp    163b <concreate+0x75>
        printf(1, "concreate create %s failed\n", file);
    16c7:	83 ec 04             	sub    $0x4,%esp
    16ca:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16cd:	50                   	push   %eax
<<<<<<< HEAD
    16ce:	68 88 42 00 00       	push   $0x4288
    16d3:	6a 01                	push   $0x1
    16d5:	e8 93 22 00 00       	call   396d <printf>
        exit();
    16da:	e8 39 21 00 00       	call   3818 <exit>
      exit();
    16df:	e8 34 21 00 00       	call   3818 <exit>
=======
    16ce:	68 70 42 00 00       	push   $0x4270
    16d3:	6a 01                	push   $0x1
    16d5:	e8 7c 22 00 00       	call   3956 <printf>
        exit();
    16da:	e8 22 21 00 00       	call   3801 <exit>
      exit();
    16df:	e8 1d 21 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }

  memset(fa, 0, sizeof(fa));
    16e4:	83 ec 04             	sub    $0x4,%esp
    16e7:	6a 28                	push   $0x28
    16e9:	6a 00                	push   $0x0
    16eb:	8d 45 bd             	lea    -0x43(%ebp),%eax
    16ee:	50                   	push   %eax
<<<<<<< HEAD
    16ef:	e8 e9 1f 00 00       	call   36dd <memset>
  fd = open(".", 0);
    16f4:	83 c4 08             	add    $0x8,%esp
    16f7:	6a 00                	push   $0x0
    16f9:	68 92 44 00 00       	push   $0x4492
    16fe:	e8 55 21 00 00       	call   3858 <open>
=======
    16ef:	e8 d2 1f 00 00       	call   36c6 <memset>
  fd = open(".", 0);
    16f4:	83 c4 08             	add    $0x8,%esp
    16f7:	6a 00                	push   $0x0
    16f9:	68 7a 44 00 00       	push   $0x447a
    16fe:	e8 3e 21 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1703:	89 c3                	mov    %eax,%ebx
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1705:	83 c4 10             	add    $0x10,%esp
  n = 0;
    1708:	be 00 00 00 00       	mov    $0x0,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    170d:	83 ec 04             	sub    $0x4,%esp
    1710:	6a 10                	push   $0x10
    1712:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1715:	50                   	push   %eax
    1716:	53                   	push   %ebx
<<<<<<< HEAD
    1717:	e8 14 21 00 00       	call   3830 <read>
=======
    1717:	e8 fd 20 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    171c:	83 c4 10             	add    $0x10,%esp
    171f:	85 c0                	test   %eax,%eax
    1721:	7e 60                	jle    1783 <concreate+0x1bd>
    if(de.inum == 0)
    1723:	66 83 7d ac 00       	cmpw   $0x0,-0x54(%ebp)
    1728:	74 e3                	je     170d <concreate+0x147>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    172a:	80 7d ae 43          	cmpb   $0x43,-0x52(%ebp)
    172e:	75 dd                	jne    170d <concreate+0x147>
    1730:	80 7d b0 00          	cmpb   $0x0,-0x50(%ebp)
    1734:	75 d7                	jne    170d <concreate+0x147>
      i = de.name[1] - '0';
    1736:	0f be 45 af          	movsbl -0x51(%ebp),%eax
    173a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    173d:	83 f8 27             	cmp    $0x27,%eax
    1740:	77 11                	ja     1753 <concreate+0x18d>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    1742:	80 7c 05 bd 00       	cmpb   $0x0,-0x43(%ebp,%eax,1)
    1747:	75 22                	jne    176b <concreate+0x1a5>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1749:	c6 44 05 bd 01       	movb   $0x1,-0x43(%ebp,%eax,1)
      n++;
    174e:	83 c6 01             	add    $0x1,%esi
    1751:	eb ba                	jmp    170d <concreate+0x147>
        printf(1, "concreate weird file %s\n", de.name);
    1753:	83 ec 04             	sub    $0x4,%esp
    1756:	8d 45 ae             	lea    -0x52(%ebp),%eax
    1759:	50                   	push   %eax
<<<<<<< HEAD
    175a:	68 a4 42 00 00       	push   $0x42a4
    175f:	6a 01                	push   $0x1
    1761:	e8 07 22 00 00       	call   396d <printf>
        exit();
    1766:	e8 ad 20 00 00       	call   3818 <exit>
=======
    175a:	68 8c 42 00 00       	push   $0x428c
    175f:	6a 01                	push   $0x1
    1761:	e8 f0 21 00 00       	call   3956 <printf>
        exit();
    1766:	e8 96 20 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
        printf(1, "concreate duplicate file %s\n", de.name);
    176b:	83 ec 04             	sub    $0x4,%esp
    176e:	8d 45 ae             	lea    -0x52(%ebp),%eax
    1771:	50                   	push   %eax
<<<<<<< HEAD
    1772:	68 bd 42 00 00       	push   $0x42bd
    1777:	6a 01                	push   $0x1
    1779:	e8 ef 21 00 00       	call   396d <printf>
        exit();
    177e:	e8 95 20 00 00       	call   3818 <exit>
=======
    1772:	68 a5 42 00 00       	push   $0x42a5
    1777:	6a 01                	push   $0x1
    1779:	e8 d8 21 00 00       	call   3956 <printf>
        exit();
    177e:	e8 7e 20 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }
  close(fd);
    1783:	83 ec 0c             	sub    $0xc,%esp
    1786:	53                   	push   %ebx
<<<<<<< HEAD
    1787:	e8 b4 20 00 00       	call   3840 <close>
=======
    1787:	e8 9d 20 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  if(n != 40){
    178c:	83 c4 10             	add    $0x10,%esp
    178f:	83 fe 28             	cmp    $0x28,%esi
    1792:	75 0a                	jne    179e <concreate+0x1d8>
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1794:	bb 00 00 00 00       	mov    $0x0,%ebx
    1799:	e9 86 00 00 00       	jmp    1824 <concreate+0x25e>
    printf(1, "concreate not enough files in directory listing\n");
    179e:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    17a1:	68 24 4e 00 00       	push   $0x4e24
    17a6:	6a 01                	push   $0x1
    17a8:	e8 c0 21 00 00       	call   396d <printf>
    exit();
    17ad:	e8 66 20 00 00       	call   3818 <exit>
=======
    17a1:	68 0c 4e 00 00       	push   $0x4e0c
    17a6:	6a 01                	push   $0x1
    17a8:	e8 a9 21 00 00       	call   3956 <printf>
    exit();
    17ad:	e8 4f 20 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    17b2:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    17b5:	68 5d 4b 00 00       	push   $0x4b5d
    17ba:	6a 01                	push   $0x1
    17bc:	e8 ac 21 00 00       	call   396d <printf>
      exit();
    17c1:	e8 52 20 00 00       	call   3818 <exit>
=======
    17b5:	68 45 4b 00 00       	push   $0x4b45
    17ba:	6a 01                	push   $0x1
    17bc:	e8 95 21 00 00       	call   3956 <printf>
      exit();
    17c1:	e8 3b 20 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    17c6:	83 ec 08             	sub    $0x8,%esp
    17c9:	6a 00                	push   $0x0
    17cb:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    17ce:	57                   	push   %edi
<<<<<<< HEAD
    17cf:	e8 84 20 00 00       	call   3858 <open>
    17d4:	89 04 24             	mov    %eax,(%esp)
    17d7:	e8 64 20 00 00       	call   3840 <close>
=======
    17cf:	e8 6d 20 00 00       	call   3841 <open>
    17d4:	89 04 24             	mov    %eax,(%esp)
    17d7:	e8 4d 20 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
      close(open(file, 0));
    17dc:	83 c4 08             	add    $0x8,%esp
    17df:	6a 00                	push   $0x0
    17e1:	57                   	push   %edi
<<<<<<< HEAD
    17e2:	e8 71 20 00 00       	call   3858 <open>
    17e7:	89 04 24             	mov    %eax,(%esp)
    17ea:	e8 51 20 00 00       	call   3840 <close>
=======
    17e2:	e8 5a 20 00 00       	call   3841 <open>
    17e7:	89 04 24             	mov    %eax,(%esp)
    17ea:	e8 3a 20 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
      close(open(file, 0));
    17ef:	83 c4 08             	add    $0x8,%esp
    17f2:	6a 00                	push   $0x0
    17f4:	57                   	push   %edi
<<<<<<< HEAD
    17f5:	e8 5e 20 00 00       	call   3858 <open>
    17fa:	89 04 24             	mov    %eax,(%esp)
    17fd:	e8 3e 20 00 00       	call   3840 <close>
=======
    17f5:	e8 47 20 00 00       	call   3841 <open>
    17fa:	89 04 24             	mov    %eax,(%esp)
    17fd:	e8 27 20 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
      close(open(file, 0));
    1802:	83 c4 08             	add    $0x8,%esp
    1805:	6a 00                	push   $0x0
    1807:	57                   	push   %edi
<<<<<<< HEAD
    1808:	e8 4b 20 00 00       	call   3858 <open>
    180d:	89 04 24             	mov    %eax,(%esp)
    1810:	e8 2b 20 00 00       	call   3840 <close>
=======
    1808:	e8 34 20 00 00       	call   3841 <open>
    180d:	89 04 24             	mov    %eax,(%esp)
    1810:	e8 14 20 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1815:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1818:	85 f6                	test   %esi,%esi
    181a:	74 79                	je     1895 <concreate+0x2cf>
      exit();
    else
      wait();
<<<<<<< HEAD
    181c:	e8 ff 1f 00 00       	call   3820 <wait>
=======
    181c:	e8 e8 1f 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 40; i++){
    1821:	83 c3 01             	add    $0x1,%ebx
    1824:	83 fb 27             	cmp    $0x27,%ebx
    1827:	7f 71                	jg     189a <concreate+0x2d4>
    file[1] = '0' + i;
    1829:	8d 43 30             	lea    0x30(%ebx),%eax
    182c:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
<<<<<<< HEAD
    182f:	e8 dc 1f 00 00       	call   3810 <fork>
=======
    182f:	e8 c5 1f 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1834:	89 c6                	mov    %eax,%esi
    if(pid < 0){
    1836:	85 c0                	test   %eax,%eax
    1838:	0f 88 74 ff ff ff    	js     17b2 <concreate+0x1ec>
    if(((i % 3) == 0 && pid == 0) ||
    183e:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1843:	89 d8                	mov    %ebx,%eax
    1845:	f7 ea                	imul   %edx
    1847:	89 d8                	mov    %ebx,%eax
    1849:	c1 f8 1f             	sar    $0x1f,%eax
    184c:	29 c2                	sub    %eax,%edx
    184e:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1851:	89 da                	mov    %ebx,%edx
    1853:	29 c2                	sub    %eax,%edx
    1855:	89 d0                	mov    %edx,%eax
    1857:	09 f0                	or     %esi,%eax
    1859:	0f 84 67 ff ff ff    	je     17c6 <concreate+0x200>
    185f:	83 fa 01             	cmp    $0x1,%edx
    1862:	75 08                	jne    186c <concreate+0x2a6>
       ((i % 3) == 1 && pid != 0)){
    1864:	85 f6                	test   %esi,%esi
    1866:	0f 85 5a ff ff ff    	jne    17c6 <concreate+0x200>
      unlink(file);
    186c:	83 ec 0c             	sub    $0xc,%esp
    186f:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    1872:	57                   	push   %edi
<<<<<<< HEAD
    1873:	e8 f0 1f 00 00       	call   3868 <unlink>
      unlink(file);
    1878:	89 3c 24             	mov    %edi,(%esp)
    187b:	e8 e8 1f 00 00       	call   3868 <unlink>
      unlink(file);
    1880:	89 3c 24             	mov    %edi,(%esp)
    1883:	e8 e0 1f 00 00       	call   3868 <unlink>
      unlink(file);
    1888:	89 3c 24             	mov    %edi,(%esp)
    188b:	e8 d8 1f 00 00       	call   3868 <unlink>
    1890:	83 c4 10             	add    $0x10,%esp
    1893:	eb 83                	jmp    1818 <concreate+0x252>
      exit();
    1895:	e8 7e 1f 00 00       	call   3818 <exit>
=======
    1873:	e8 d9 1f 00 00       	call   3851 <unlink>
      unlink(file);
    1878:	89 3c 24             	mov    %edi,(%esp)
    187b:	e8 d1 1f 00 00       	call   3851 <unlink>
      unlink(file);
    1880:	89 3c 24             	mov    %edi,(%esp)
    1883:	e8 c9 1f 00 00       	call   3851 <unlink>
      unlink(file);
    1888:	89 3c 24             	mov    %edi,(%esp)
    188b:	e8 c1 1f 00 00       	call   3851 <unlink>
    1890:	83 c4 10             	add    $0x10,%esp
    1893:	eb 83                	jmp    1818 <concreate+0x252>
      exit();
    1895:	e8 67 1f 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }

  printf(1, "concreate ok\n");
    189a:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    189d:	68 da 42 00 00       	push   $0x42da
    18a2:	6a 01                	push   $0x1
    18a4:	e8 c4 20 00 00       	call   396d <printf>
=======
    189d:	68 c2 42 00 00       	push   $0x42c2
    18a2:	6a 01                	push   $0x1
    18a4:	e8 ad 20 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    18a9:	83 c4 10             	add    $0x10,%esp
    18ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18af:	5b                   	pop    %ebx
    18b0:	5e                   	pop    %esi
    18b1:	5f                   	pop    %edi
    18b2:	5d                   	pop    %ebp
    18b3:	c3                   	ret    

000018b4 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    18b4:	55                   	push   %ebp
    18b5:	89 e5                	mov    %esp,%ebp
    18b7:	57                   	push   %edi
    18b8:	56                   	push   %esi
    18b9:	53                   	push   %ebx
    18ba:	83 ec 14             	sub    $0x14,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
<<<<<<< HEAD
    18bd:	68 e8 42 00 00       	push   $0x42e8
    18c2:	6a 01                	push   $0x1
    18c4:	e8 a4 20 00 00       	call   396d <printf>

  unlink("x");
    18c9:	c7 04 24 75 45 00 00 	movl   $0x4575,(%esp)
    18d0:	e8 93 1f 00 00       	call   3868 <unlink>
  pid = fork();
    18d5:	e8 36 1f 00 00       	call   3810 <fork>
=======
    18bd:	68 d0 42 00 00       	push   $0x42d0
    18c2:	6a 01                	push   $0x1
    18c4:	e8 8d 20 00 00       	call   3956 <printf>

  unlink("x");
    18c9:	c7 04 24 5d 45 00 00 	movl   $0x455d,(%esp)
    18d0:	e8 7c 1f 00 00       	call   3851 <unlink>
  pid = fork();
    18d5:	e8 1f 1f 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(pid < 0){
    18da:	83 c4 10             	add    $0x10,%esp
    18dd:	85 c0                	test   %eax,%eax
    18df:	78 10                	js     18f1 <linkunlink+0x3d>
    18e1:	89 c7                	mov    %eax,%edi
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    18e3:	74 20                	je     1905 <linkunlink+0x51>
    18e5:	bb 01 00 00 00       	mov    $0x1,%ebx
    18ea:	be 00 00 00 00       	mov    $0x0,%esi
    18ef:	eb 3b                	jmp    192c <linkunlink+0x78>
    printf(1, "fork failed\n");
    18f1:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    18f4:	68 5d 4b 00 00       	push   $0x4b5d
    18f9:	6a 01                	push   $0x1
    18fb:	e8 6d 20 00 00       	call   396d <printf>
    exit();
    1900:	e8 13 1f 00 00       	call   3818 <exit>
=======
    18f4:	68 45 4b 00 00       	push   $0x4b45
    18f9:	6a 01                	push   $0x1
    18fb:	e8 56 20 00 00       	call   3956 <printf>
    exit();
    1900:	e8 fc 1e 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  unsigned int x = (pid ? 1 : 97);
    1905:	bb 61 00 00 00       	mov    $0x61,%ebx
    190a:	eb de                	jmp    18ea <linkunlink+0x36>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    190c:	83 ec 08             	sub    $0x8,%esp
    190f:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    1914:	68 75 45 00 00       	push   $0x4575
    1919:	e8 3a 1f 00 00       	call   3858 <open>
    191e:	89 04 24             	mov    %eax,(%esp)
    1921:	e8 1a 1f 00 00       	call   3840 <close>
=======
    1914:	68 5d 45 00 00       	push   $0x455d
    1919:	e8 23 1f 00 00       	call   3841 <open>
    191e:	89 04 24             	mov    %eax,(%esp)
    1921:	e8 03 1f 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1926:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1929:	83 c6 01             	add    $0x1,%esi
    192c:	83 fe 63             	cmp    $0x63,%esi
    192f:	7f 52                	jg     1983 <linkunlink+0xcf>
    x = x * 1103515245 + 12345;
    1931:	69 db 6d 4e c6 41    	imul   $0x41c64e6d,%ebx,%ebx
    1937:	81 c3 39 30 00 00    	add    $0x3039,%ebx
    if((x % 3) == 0){
    193d:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1942:	89 d8                	mov    %ebx,%eax
    1944:	f7 e2                	mul    %edx
    1946:	89 d0                	mov    %edx,%eax
    1948:	d1 e8                	shr    %eax
    194a:	83 e2 fe             	and    $0xfffffffe,%edx
    194d:	01 c2                	add    %eax,%edx
    194f:	89 d8                	mov    %ebx,%eax
    1951:	29 d0                	sub    %edx,%eax
    1953:	74 b7                	je     190c <linkunlink+0x58>
    } else if((x % 3) == 1){
    1955:	83 f8 01             	cmp    $0x1,%eax
    1958:	74 12                	je     196c <linkunlink+0xb8>
      link("cat", "x");
    } else {
      unlink("x");
    195a:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    195d:	68 75 45 00 00       	push   $0x4575
    1962:	e8 01 1f 00 00       	call   3868 <unlink>
=======
    195d:	68 5d 45 00 00       	push   $0x455d
    1962:	e8 ea 1e 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1967:	83 c4 10             	add    $0x10,%esp
    196a:	eb bd                	jmp    1929 <linkunlink+0x75>
      link("cat", "x");
    196c:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    196f:	68 75 45 00 00       	push   $0x4575
    1974:	68 f9 42 00 00       	push   $0x42f9
    1979:	e8 fa 1e 00 00       	call   3878 <link>
=======
    196f:	68 5d 45 00 00       	push   $0x455d
    1974:	68 e1 42 00 00       	push   $0x42e1
    1979:	e8 e3 1e 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    197e:	83 c4 10             	add    $0x10,%esp
    1981:	eb a6                	jmp    1929 <linkunlink+0x75>
    }
  }

  if(pid)
    1983:	85 ff                	test   %edi,%edi
    1985:	74 1c                	je     19a3 <linkunlink+0xef>
    wait();
<<<<<<< HEAD
    1987:	e8 94 1e 00 00       	call   3820 <wait>
=======
    1987:	e8 7d 1e 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  else
    exit();

  printf(1, "linkunlink ok\n");
    198c:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    198f:	68 fd 42 00 00       	push   $0x42fd
    1994:	6a 01                	push   $0x1
    1996:	e8 d2 1f 00 00       	call   396d <printf>
=======
    198f:	68 e5 42 00 00       	push   $0x42e5
    1994:	6a 01                	push   $0x1
    1996:	e8 bb 1f 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    199b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    199e:	5b                   	pop    %ebx
    199f:	5e                   	pop    %esi
    19a0:	5f                   	pop    %edi
    19a1:	5d                   	pop    %ebp
    19a2:	c3                   	ret    
    exit();
<<<<<<< HEAD
    19a3:	e8 70 1e 00 00       	call   3818 <exit>
=======
    19a3:	e8 59 1e 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000019a8 <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    19a8:	55                   	push   %ebp
    19a9:	89 e5                	mov    %esp,%ebp
    19ab:	53                   	push   %ebx
    19ac:	83 ec 1c             	sub    $0x1c,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
<<<<<<< HEAD
    19af:	68 0c 43 00 00       	push   $0x430c
    19b4:	6a 01                	push   $0x1
    19b6:	e8 b2 1f 00 00       	call   396d <printf>
  unlink("bd");
    19bb:	c7 04 24 19 43 00 00 	movl   $0x4319,(%esp)
    19c2:	e8 a1 1e 00 00       	call   3868 <unlink>
=======
    19af:	68 f4 42 00 00       	push   $0x42f4
    19b4:	6a 01                	push   $0x1
    19b6:	e8 9b 1f 00 00       	call   3956 <printf>
  unlink("bd");
    19bb:	c7 04 24 01 43 00 00 	movl   $0x4301,(%esp)
    19c2:	e8 8a 1e 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("bd", O_CREATE);
    19c7:	83 c4 08             	add    $0x8,%esp
    19ca:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    19cf:	68 19 43 00 00       	push   $0x4319
    19d4:	e8 7f 1e 00 00       	call   3858 <open>
=======
    19cf:	68 01 43 00 00       	push   $0x4301
    19d4:	e8 68 1e 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    19d9:	83 c4 10             	add    $0x10,%esp
    19dc:	85 c0                	test   %eax,%eax
    19de:	78 65                	js     1a45 <bigdir+0x9d>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    19e0:	83 ec 0c             	sub    $0xc,%esp
    19e3:	50                   	push   %eax
<<<<<<< HEAD
    19e4:	e8 57 1e 00 00       	call   3840 <close>
=======
    19e4:	e8 40 1e 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(i = 0; i < 500; i++){
    19e9:	83 c4 10             	add    $0x10,%esp
    19ec:	bb 00 00 00 00       	mov    $0x0,%ebx
    19f1:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    19f7:	7f 74                	jg     1a6d <bigdir+0xc5>
    name[0] = 'x';
    19f9:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    19fd:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1a00:	85 db                	test   %ebx,%ebx
    1a02:	0f 49 c3             	cmovns %ebx,%eax
    1a05:	c1 f8 06             	sar    $0x6,%eax
    1a08:	83 c0 30             	add    $0x30,%eax
    1a0b:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1a0e:	89 da                	mov    %ebx,%edx
    1a10:	c1 fa 1f             	sar    $0x1f,%edx
    1a13:	c1 ea 1a             	shr    $0x1a,%edx
    1a16:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1a19:	83 e0 3f             	and    $0x3f,%eax
    1a1c:	29 d0                	sub    %edx,%eax
    1a1e:	83 c0 30             	add    $0x30,%eax
    1a21:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1a24:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(link("bd", name) != 0){
    1a28:	83 ec 08             	sub    $0x8,%esp
    1a2b:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1a2e:	50                   	push   %eax
<<<<<<< HEAD
    1a2f:	68 19 43 00 00       	push   $0x4319
    1a34:	e8 3f 1e 00 00       	call   3878 <link>
=======
    1a2f:	68 01 43 00 00       	push   $0x4301
    1a34:	e8 28 1e 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1a39:	83 c4 10             	add    $0x10,%esp
    1a3c:	85 c0                	test   %eax,%eax
    1a3e:	75 19                	jne    1a59 <bigdir+0xb1>
  for(i = 0; i < 500; i++){
    1a40:	83 c3 01             	add    $0x1,%ebx
    1a43:	eb ac                	jmp    19f1 <bigdir+0x49>
    printf(1, "bigdir create failed\n");
    1a45:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1a48:	68 1c 43 00 00       	push   $0x431c
    1a4d:	6a 01                	push   $0x1
    1a4f:	e8 19 1f 00 00       	call   396d <printf>
    exit();
    1a54:	e8 bf 1d 00 00       	call   3818 <exit>
      printf(1, "bigdir link failed\n");
    1a59:	83 ec 08             	sub    $0x8,%esp
    1a5c:	68 32 43 00 00       	push   $0x4332
    1a61:	6a 01                	push   $0x1
    1a63:	e8 05 1f 00 00       	call   396d <printf>
      exit();
    1a68:	e8 ab 1d 00 00       	call   3818 <exit>
=======
    1a48:	68 04 43 00 00       	push   $0x4304
    1a4d:	6a 01                	push   $0x1
    1a4f:	e8 02 1f 00 00       	call   3956 <printf>
    exit();
    1a54:	e8 a8 1d 00 00       	call   3801 <exit>
      printf(1, "bigdir link failed\n");
    1a59:	83 ec 08             	sub    $0x8,%esp
    1a5c:	68 1a 43 00 00       	push   $0x431a
    1a61:	6a 01                	push   $0x1
    1a63:	e8 ee 1e 00 00       	call   3956 <printf>
      exit();
    1a68:	e8 94 1d 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  unlink("bd");
    1a6d:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1a70:	68 19 43 00 00       	push   $0x4319
    1a75:	e8 ee 1d 00 00       	call   3868 <unlink>
=======
    1a70:	68 01 43 00 00       	push   $0x4301
    1a75:	e8 d7 1d 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 500; i++){
    1a7a:	83 c4 10             	add    $0x10,%esp
    1a7d:	bb 00 00 00 00       	mov    $0x0,%ebx
    1a82:	eb 03                	jmp    1a87 <bigdir+0xdf>
    1a84:	83 c3 01             	add    $0x1,%ebx
    1a87:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    1a8d:	7f 56                	jg     1ae5 <bigdir+0x13d>
    name[0] = 'x';
    1a8f:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1a93:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1a96:	85 db                	test   %ebx,%ebx
    1a98:	0f 49 c3             	cmovns %ebx,%eax
    1a9b:	c1 f8 06             	sar    $0x6,%eax
    1a9e:	83 c0 30             	add    $0x30,%eax
    1aa1:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1aa4:	89 da                	mov    %ebx,%edx
    1aa6:	c1 fa 1f             	sar    $0x1f,%edx
    1aa9:	c1 ea 1a             	shr    $0x1a,%edx
    1aac:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1aaf:	83 e0 3f             	and    $0x3f,%eax
    1ab2:	29 d0                	sub    %edx,%eax
    1ab4:	83 c0 30             	add    $0x30,%eax
    1ab7:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1aba:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(unlink(name) != 0){
    1abe:	83 ec 0c             	sub    $0xc,%esp
    1ac1:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1ac4:	50                   	push   %eax
<<<<<<< HEAD
    1ac5:	e8 9e 1d 00 00       	call   3868 <unlink>
=======
    1ac5:	e8 87 1d 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1aca:	83 c4 10             	add    $0x10,%esp
    1acd:	85 c0                	test   %eax,%eax
    1acf:	74 b3                	je     1a84 <bigdir+0xdc>
      printf(1, "bigdir unlink failed");
    1ad1:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1ad4:	68 46 43 00 00       	push   $0x4346
    1ad9:	6a 01                	push   $0x1
    1adb:	e8 8d 1e 00 00       	call   396d <printf>
      exit();
    1ae0:	e8 33 1d 00 00       	call   3818 <exit>
=======
    1ad4:	68 2e 43 00 00       	push   $0x432e
    1ad9:	6a 01                	push   $0x1
    1adb:	e8 76 1e 00 00       	call   3956 <printf>
      exit();
    1ae0:	e8 1c 1d 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  printf(1, "bigdir ok\n");
    1ae5:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1ae8:	68 5b 43 00 00       	push   $0x435b
    1aed:	6a 01                	push   $0x1
    1aef:	e8 79 1e 00 00       	call   396d <printf>
=======
    1ae8:	68 43 43 00 00       	push   $0x4343
    1aed:	6a 01                	push   $0x1
    1aef:	e8 62 1e 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    1af4:	83 c4 10             	add    $0x10,%esp
    1af7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1afa:	c9                   	leave  
    1afb:	c3                   	ret    

00001afc <subdir>:

void
subdir(void)
{
    1afc:	55                   	push   %ebp
    1afd:	89 e5                	mov    %esp,%ebp
    1aff:	53                   	push   %ebx
    1b00:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
<<<<<<< HEAD
    1b03:	68 66 43 00 00       	push   $0x4366
    1b08:	6a 01                	push   $0x1
    1b0a:	e8 5e 1e 00 00       	call   396d <printf>

  unlink("ff");
    1b0f:	c7 04 24 ef 43 00 00 	movl   $0x43ef,(%esp)
    1b16:	e8 4d 1d 00 00       	call   3868 <unlink>
  if(mkdir("dd") != 0){
    1b1b:	c7 04 24 8c 44 00 00 	movl   $0x448c,(%esp)
    1b22:	e8 59 1d 00 00       	call   3880 <mkdir>
=======
    1b03:	68 4e 43 00 00       	push   $0x434e
    1b08:	6a 01                	push   $0x1
    1b0a:	e8 47 1e 00 00       	call   3956 <printf>

  unlink("ff");
    1b0f:	c7 04 24 d7 43 00 00 	movl   $0x43d7,(%esp)
    1b16:	e8 36 1d 00 00       	call   3851 <unlink>
  if(mkdir("dd") != 0){
    1b1b:	c7 04 24 74 44 00 00 	movl   $0x4474,(%esp)
    1b22:	e8 42 1d 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1b27:	83 c4 10             	add    $0x10,%esp
    1b2a:	85 c0                	test   %eax,%eax
    1b2c:	0f 85 14 04 00 00    	jne    1f46 <subdir+0x44a>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1b32:	83 ec 08             	sub    $0x8,%esp
    1b35:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    1b3a:	68 c5 43 00 00       	push   $0x43c5
    1b3f:	e8 14 1d 00 00       	call   3858 <open>
=======
    1b3a:	68 ad 43 00 00       	push   $0x43ad
    1b3f:	e8 fd 1c 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1b44:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1b46:	83 c4 10             	add    $0x10,%esp
    1b49:	85 c0                	test   %eax,%eax
    1b4b:	0f 88 09 04 00 00    	js     1f5a <subdir+0x45e>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1b51:	83 ec 04             	sub    $0x4,%esp
    1b54:	6a 02                	push   $0x2
<<<<<<< HEAD
    1b56:	68 ef 43 00 00       	push   $0x43ef
    1b5b:	50                   	push   %eax
    1b5c:	e8 d7 1c 00 00       	call   3838 <write>
  close(fd);
    1b61:	89 1c 24             	mov    %ebx,(%esp)
    1b64:	e8 d7 1c 00 00       	call   3840 <close>

  if(unlink("dd") >= 0){
    1b69:	c7 04 24 8c 44 00 00 	movl   $0x448c,(%esp)
    1b70:	e8 f3 1c 00 00       	call   3868 <unlink>
=======
    1b56:	68 d7 43 00 00       	push   $0x43d7
    1b5b:	50                   	push   %eax
    1b5c:	e8 c0 1c 00 00       	call   3821 <write>
  close(fd);
    1b61:	89 1c 24             	mov    %ebx,(%esp)
    1b64:	e8 c0 1c 00 00       	call   3829 <close>

  if(unlink("dd") >= 0){
    1b69:	c7 04 24 74 44 00 00 	movl   $0x4474,(%esp)
    1b70:	e8 dc 1c 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1b75:	83 c4 10             	add    $0x10,%esp
    1b78:	85 c0                	test   %eax,%eax
    1b7a:	0f 89 ee 03 00 00    	jns    1f6e <subdir+0x472>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1b80:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1b83:	68 a0 43 00 00       	push   $0x43a0
    1b88:	e8 f3 1c 00 00       	call   3880 <mkdir>
=======
    1b83:	68 88 43 00 00       	push   $0x4388
    1b88:	e8 dc 1c 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1b8d:	83 c4 10             	add    $0x10,%esp
    1b90:	85 c0                	test   %eax,%eax
    1b92:	0f 85 ea 03 00 00    	jne    1f82 <subdir+0x486>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1b98:	83 ec 08             	sub    $0x8,%esp
    1b9b:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    1ba0:	68 c2 43 00 00       	push   $0x43c2
    1ba5:	e8 ae 1c 00 00       	call   3858 <open>
=======
    1ba0:	68 aa 43 00 00       	push   $0x43aa
    1ba5:	e8 97 1c 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1baa:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1bac:	83 c4 10             	add    $0x10,%esp
    1baf:	85 c0                	test   %eax,%eax
    1bb1:	0f 88 df 03 00 00    	js     1f96 <subdir+0x49a>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1bb7:	83 ec 04             	sub    $0x4,%esp
    1bba:	6a 02                	push   $0x2
<<<<<<< HEAD
    1bbc:	68 e3 43 00 00       	push   $0x43e3
    1bc1:	50                   	push   %eax
    1bc2:	e8 71 1c 00 00       	call   3838 <write>
  close(fd);
    1bc7:	89 1c 24             	mov    %ebx,(%esp)
    1bca:	e8 71 1c 00 00       	call   3840 <close>
=======
    1bbc:	68 cb 43 00 00       	push   $0x43cb
    1bc1:	50                   	push   %eax
    1bc2:	e8 5a 1c 00 00       	call   3821 <write>
  close(fd);
    1bc7:	89 1c 24             	mov    %ebx,(%esp)
    1bca:	e8 5a 1c 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("dd/dd/../ff", 0);
    1bcf:	83 c4 08             	add    $0x8,%esp
    1bd2:	6a 00                	push   $0x0
<<<<<<< HEAD
    1bd4:	68 e6 43 00 00       	push   $0x43e6
    1bd9:	e8 7a 1c 00 00       	call   3858 <open>
=======
    1bd4:	68 ce 43 00 00       	push   $0x43ce
    1bd9:	e8 63 1c 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1bde:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1be0:	83 c4 10             	add    $0x10,%esp
    1be3:	85 c0                	test   %eax,%eax
    1be5:	0f 88 bf 03 00 00    	js     1faa <subdir+0x4ae>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1beb:	83 ec 04             	sub    $0x4,%esp
    1bee:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
    1bf3:	68 c0 84 00 00       	push   $0x84c0
    1bf8:	50                   	push   %eax
    1bf9:	e8 32 1c 00 00       	call   3830 <read>
=======
    1bf3:	68 a0 84 00 00       	push   $0x84a0
    1bf8:	50                   	push   %eax
    1bf9:	e8 1b 1c 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(cc != 2 || buf[0] != 'f'){
    1bfe:	83 c4 10             	add    $0x10,%esp
    1c01:	83 f8 02             	cmp    $0x2,%eax
    1c04:	0f 85 b4 03 00 00    	jne    1fbe <subdir+0x4c2>
<<<<<<< HEAD
    1c0a:	80 3d c0 84 00 00 66 	cmpb   $0x66,0x84c0
=======
    1c0a:	80 3d a0 84 00 00 66 	cmpb   $0x66,0x84a0
>>>>>>> c59b0f9 (fixed thread_join and join)
    1c11:	0f 85 a7 03 00 00    	jne    1fbe <subdir+0x4c2>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1c17:	83 ec 0c             	sub    $0xc,%esp
    1c1a:	53                   	push   %ebx
<<<<<<< HEAD
    1c1b:	e8 20 1c 00 00       	call   3840 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1c20:	83 c4 08             	add    $0x8,%esp
    1c23:	68 26 44 00 00       	push   $0x4426
    1c28:	68 c2 43 00 00       	push   $0x43c2
    1c2d:	e8 46 1c 00 00       	call   3878 <link>
=======
    1c1b:	e8 09 1c 00 00       	call   3829 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1c20:	83 c4 08             	add    $0x8,%esp
    1c23:	68 0e 44 00 00       	push   $0x440e
    1c28:	68 aa 43 00 00       	push   $0x43aa
    1c2d:	e8 2f 1c 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1c32:	83 c4 10             	add    $0x10,%esp
    1c35:	85 c0                	test   %eax,%eax
    1c37:	0f 85 95 03 00 00    	jne    1fd2 <subdir+0x4d6>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1c3d:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1c40:	68 c2 43 00 00       	push   $0x43c2
    1c45:	e8 1e 1c 00 00       	call   3868 <unlink>
=======
    1c40:	68 aa 43 00 00       	push   $0x43aa
    1c45:	e8 07 1c 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1c4a:	83 c4 10             	add    $0x10,%esp
    1c4d:	85 c0                	test   %eax,%eax
    1c4f:	0f 85 91 03 00 00    	jne    1fe6 <subdir+0x4ea>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1c55:	83 ec 08             	sub    $0x8,%esp
    1c58:	6a 00                	push   $0x0
<<<<<<< HEAD
    1c5a:	68 c2 43 00 00       	push   $0x43c2
    1c5f:	e8 f4 1b 00 00       	call   3858 <open>
=======
    1c5a:	68 aa 43 00 00       	push   $0x43aa
    1c5f:	e8 dd 1b 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1c64:	83 c4 10             	add    $0x10,%esp
    1c67:	85 c0                	test   %eax,%eax
    1c69:	0f 89 8b 03 00 00    	jns    1ffa <subdir+0x4fe>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1c6f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1c72:	68 8c 44 00 00       	push   $0x448c
    1c77:	e8 0c 1c 00 00       	call   3888 <chdir>
=======
    1c72:	68 74 44 00 00       	push   $0x4474
    1c77:	e8 f5 1b 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1c7c:	83 c4 10             	add    $0x10,%esp
    1c7f:	85 c0                	test   %eax,%eax
    1c81:	0f 85 87 03 00 00    	jne    200e <subdir+0x512>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1c87:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1c8a:	68 5a 44 00 00       	push   $0x445a
    1c8f:	e8 f4 1b 00 00       	call   3888 <chdir>
=======
    1c8a:	68 42 44 00 00       	push   $0x4442
    1c8f:	e8 dd 1b 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1c94:	83 c4 10             	add    $0x10,%esp
    1c97:	85 c0                	test   %eax,%eax
    1c99:	0f 85 83 03 00 00    	jne    2022 <subdir+0x526>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1c9f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1ca2:	68 80 44 00 00       	push   $0x4480
    1ca7:	e8 dc 1b 00 00       	call   3888 <chdir>
=======
    1ca2:	68 68 44 00 00       	push   $0x4468
    1ca7:	e8 c5 1b 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1cac:	83 c4 10             	add    $0x10,%esp
    1caf:	85 c0                	test   %eax,%eax
    1cb1:	0f 85 7f 03 00 00    	jne    2036 <subdir+0x53a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1cb7:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1cba:	68 8f 44 00 00       	push   $0x448f
    1cbf:	e8 c4 1b 00 00       	call   3888 <chdir>
=======
    1cba:	68 77 44 00 00       	push   $0x4477
    1cbf:	e8 ad 1b 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1cc4:	83 c4 10             	add    $0x10,%esp
    1cc7:	85 c0                	test   %eax,%eax
    1cc9:	0f 85 7b 03 00 00    	jne    204a <subdir+0x54e>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ccf:	83 ec 08             	sub    $0x8,%esp
    1cd2:	6a 00                	push   $0x0
<<<<<<< HEAD
    1cd4:	68 26 44 00 00       	push   $0x4426
    1cd9:	e8 7a 1b 00 00       	call   3858 <open>
=======
    1cd4:	68 0e 44 00 00       	push   $0x440e
    1cd9:	e8 63 1b 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1cde:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ce0:	83 c4 10             	add    $0x10,%esp
    1ce3:	85 c0                	test   %eax,%eax
    1ce5:	0f 88 73 03 00 00    	js     205e <subdir+0x562>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1ceb:	83 ec 04             	sub    $0x4,%esp
    1cee:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
    1cf3:	68 c0 84 00 00       	push   $0x84c0
    1cf8:	50                   	push   %eax
    1cf9:	e8 32 1b 00 00       	call   3830 <read>
=======
    1cf3:	68 a0 84 00 00       	push   $0x84a0
    1cf8:	50                   	push   %eax
    1cf9:	e8 1b 1b 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1cfe:	83 c4 10             	add    $0x10,%esp
    1d01:	83 f8 02             	cmp    $0x2,%eax
    1d04:	0f 85 68 03 00 00    	jne    2072 <subdir+0x576>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1d0a:	83 ec 0c             	sub    $0xc,%esp
    1d0d:	53                   	push   %ebx
<<<<<<< HEAD
    1d0e:	e8 2d 1b 00 00       	call   3840 <close>
=======
    1d0e:	e8 16 1b 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1d13:	83 c4 08             	add    $0x8,%esp
    1d16:	6a 00                	push   $0x0
<<<<<<< HEAD
    1d18:	68 c2 43 00 00       	push   $0x43c2
    1d1d:	e8 36 1b 00 00       	call   3858 <open>
=======
    1d18:	68 aa 43 00 00       	push   $0x43aa
    1d1d:	e8 1f 1b 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1d22:	83 c4 10             	add    $0x10,%esp
    1d25:	85 c0                	test   %eax,%eax
    1d27:	0f 89 59 03 00 00    	jns    2086 <subdir+0x58a>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1d2d:	83 ec 08             	sub    $0x8,%esp
    1d30:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    1d35:	68 da 44 00 00       	push   $0x44da
    1d3a:	e8 19 1b 00 00       	call   3858 <open>
=======
    1d35:	68 c2 44 00 00       	push   $0x44c2
    1d3a:	e8 02 1b 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1d3f:	83 c4 10             	add    $0x10,%esp
    1d42:	85 c0                	test   %eax,%eax
    1d44:	0f 89 50 03 00 00    	jns    209a <subdir+0x59e>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1d4a:	83 ec 08             	sub    $0x8,%esp
    1d4d:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    1d52:	68 ff 44 00 00       	push   $0x44ff
    1d57:	e8 fc 1a 00 00       	call   3858 <open>
=======
    1d52:	68 e7 44 00 00       	push   $0x44e7
    1d57:	e8 e5 1a 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1d5c:	83 c4 10             	add    $0x10,%esp
    1d5f:	85 c0                	test   %eax,%eax
    1d61:	0f 89 47 03 00 00    	jns    20ae <subdir+0x5b2>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1d67:	83 ec 08             	sub    $0x8,%esp
    1d6a:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    1d6f:	68 8c 44 00 00       	push   $0x448c
    1d74:	e8 df 1a 00 00       	call   3858 <open>
=======
    1d6f:	68 74 44 00 00       	push   $0x4474
    1d74:	e8 c8 1a 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1d79:	83 c4 10             	add    $0x10,%esp
    1d7c:	85 c0                	test   %eax,%eax
    1d7e:	0f 89 3e 03 00 00    	jns    20c2 <subdir+0x5c6>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1d84:	83 ec 08             	sub    $0x8,%esp
    1d87:	6a 02                	push   $0x2
<<<<<<< HEAD
    1d89:	68 8c 44 00 00       	push   $0x448c
    1d8e:	e8 c5 1a 00 00       	call   3858 <open>
=======
    1d89:	68 74 44 00 00       	push   $0x4474
    1d8e:	e8 ae 1a 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1d93:	83 c4 10             	add    $0x10,%esp
    1d96:	85 c0                	test   %eax,%eax
    1d98:	0f 89 38 03 00 00    	jns    20d6 <subdir+0x5da>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1d9e:	83 ec 08             	sub    $0x8,%esp
    1da1:	6a 01                	push   $0x1
<<<<<<< HEAD
    1da3:	68 8c 44 00 00       	push   $0x448c
    1da8:	e8 ab 1a 00 00       	call   3858 <open>
=======
    1da3:	68 74 44 00 00       	push   $0x4474
    1da8:	e8 94 1a 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1dad:	83 c4 10             	add    $0x10,%esp
    1db0:	85 c0                	test   %eax,%eax
    1db2:	0f 89 32 03 00 00    	jns    20ea <subdir+0x5ee>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1db8:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1dbb:	68 6e 45 00 00       	push   $0x456e
    1dc0:	68 da 44 00 00       	push   $0x44da
    1dc5:	e8 ae 1a 00 00       	call   3878 <link>
=======
    1dbb:	68 56 45 00 00       	push   $0x4556
    1dc0:	68 c2 44 00 00       	push   $0x44c2
    1dc5:	e8 97 1a 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1dca:	83 c4 10             	add    $0x10,%esp
    1dcd:	85 c0                	test   %eax,%eax
    1dcf:	0f 84 29 03 00 00    	je     20fe <subdir+0x602>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1dd5:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1dd8:	68 6e 45 00 00       	push   $0x456e
    1ddd:	68 ff 44 00 00       	push   $0x44ff
    1de2:	e8 91 1a 00 00       	call   3878 <link>
=======
    1dd8:	68 56 45 00 00       	push   $0x4556
    1ddd:	68 e7 44 00 00       	push   $0x44e7
    1de2:	e8 7a 1a 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1de7:	83 c4 10             	add    $0x10,%esp
    1dea:	85 c0                	test   %eax,%eax
    1dec:	0f 84 20 03 00 00    	je     2112 <subdir+0x616>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1df2:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1df5:	68 26 44 00 00       	push   $0x4426
    1dfa:	68 c5 43 00 00       	push   $0x43c5
    1dff:	e8 74 1a 00 00       	call   3878 <link>
=======
    1df5:	68 0e 44 00 00       	push   $0x440e
    1dfa:	68 ad 43 00 00       	push   $0x43ad
    1dff:	e8 5d 1a 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e04:	83 c4 10             	add    $0x10,%esp
    1e07:	85 c0                	test   %eax,%eax
    1e09:	0f 84 17 03 00 00    	je     2126 <subdir+0x62a>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    1e0f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1e12:	68 da 44 00 00       	push   $0x44da
    1e17:	e8 64 1a 00 00       	call   3880 <mkdir>
=======
    1e12:	68 c2 44 00 00       	push   $0x44c2
    1e17:	e8 4d 1a 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e1c:	83 c4 10             	add    $0x10,%esp
    1e1f:	85 c0                	test   %eax,%eax
    1e21:	0f 84 13 03 00 00    	je     213a <subdir+0x63e>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    1e27:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1e2a:	68 ff 44 00 00       	push   $0x44ff
    1e2f:	e8 4c 1a 00 00       	call   3880 <mkdir>
=======
    1e2a:	68 e7 44 00 00       	push   $0x44e7
    1e2f:	e8 35 1a 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e34:	83 c4 10             	add    $0x10,%esp
    1e37:	85 c0                	test   %eax,%eax
    1e39:	0f 84 0f 03 00 00    	je     214e <subdir+0x652>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    1e3f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1e42:	68 26 44 00 00       	push   $0x4426
    1e47:	e8 34 1a 00 00       	call   3880 <mkdir>
=======
    1e42:	68 0e 44 00 00       	push   $0x440e
    1e47:	e8 1d 1a 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e4c:	83 c4 10             	add    $0x10,%esp
    1e4f:	85 c0                	test   %eax,%eax
    1e51:	0f 84 0b 03 00 00    	je     2162 <subdir+0x666>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    1e57:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1e5a:	68 ff 44 00 00       	push   $0x44ff
    1e5f:	e8 04 1a 00 00       	call   3868 <unlink>
=======
    1e5a:	68 e7 44 00 00       	push   $0x44e7
    1e5f:	e8 ed 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e64:	83 c4 10             	add    $0x10,%esp
    1e67:	85 c0                	test   %eax,%eax
    1e69:	0f 84 07 03 00 00    	je     2176 <subdir+0x67a>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    1e6f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1e72:	68 da 44 00 00       	push   $0x44da
    1e77:	e8 ec 19 00 00       	call   3868 <unlink>
=======
    1e72:	68 c2 44 00 00       	push   $0x44c2
    1e77:	e8 d5 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e7c:	83 c4 10             	add    $0x10,%esp
    1e7f:	85 c0                	test   %eax,%eax
    1e81:	0f 84 03 03 00 00    	je     218a <subdir+0x68e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    1e87:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1e8a:	68 c5 43 00 00       	push   $0x43c5
    1e8f:	e8 f4 19 00 00       	call   3888 <chdir>
=======
    1e8a:	68 ad 43 00 00       	push   $0x43ad
    1e8f:	e8 dd 19 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1e94:	83 c4 10             	add    $0x10,%esp
    1e97:	85 c0                	test   %eax,%eax
    1e99:	0f 84 ff 02 00 00    	je     219e <subdir+0x6a2>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    1e9f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1ea2:	68 71 45 00 00       	push   $0x4571
    1ea7:	e8 dc 19 00 00       	call   3888 <chdir>
=======
    1ea2:	68 59 45 00 00       	push   $0x4559
    1ea7:	e8 c5 19 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1eac:	83 c4 10             	add    $0x10,%esp
    1eaf:	85 c0                	test   %eax,%eax
    1eb1:	0f 84 fb 02 00 00    	je     21b2 <subdir+0x6b6>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    1eb7:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1eba:	68 26 44 00 00       	push   $0x4426
    1ebf:	e8 a4 19 00 00       	call   3868 <unlink>
=======
    1eba:	68 0e 44 00 00       	push   $0x440e
    1ebf:	e8 8d 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1ec4:	83 c4 10             	add    $0x10,%esp
    1ec7:	85 c0                	test   %eax,%eax
    1ec9:	0f 85 f7 02 00 00    	jne    21c6 <subdir+0x6ca>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    1ecf:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1ed2:	68 c5 43 00 00       	push   $0x43c5
    1ed7:	e8 8c 19 00 00       	call   3868 <unlink>
=======
    1ed2:	68 ad 43 00 00       	push   $0x43ad
    1ed7:	e8 75 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1edc:	83 c4 10             	add    $0x10,%esp
    1edf:	85 c0                	test   %eax,%eax
    1ee1:	0f 85 f3 02 00 00    	jne    21da <subdir+0x6de>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    1ee7:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1eea:	68 8c 44 00 00       	push   $0x448c
    1eef:	e8 74 19 00 00       	call   3868 <unlink>
=======
    1eea:	68 74 44 00 00       	push   $0x4474
    1eef:	e8 5d 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1ef4:	83 c4 10             	add    $0x10,%esp
    1ef7:	85 c0                	test   %eax,%eax
    1ef9:	0f 84 ef 02 00 00    	je     21ee <subdir+0x6f2>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    1eff:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1f02:	68 a1 43 00 00       	push   $0x43a1
    1f07:	e8 5c 19 00 00       	call   3868 <unlink>
=======
    1f02:	68 89 43 00 00       	push   $0x4389
    1f07:	e8 45 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1f0c:	83 c4 10             	add    $0x10,%esp
    1f0f:	85 c0                	test   %eax,%eax
    1f11:	0f 88 eb 02 00 00    	js     2202 <subdir+0x706>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    1f17:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    1f1a:	68 8c 44 00 00       	push   $0x448c
    1f1f:	e8 44 19 00 00       	call   3868 <unlink>
=======
    1f1a:	68 74 44 00 00       	push   $0x4474
    1f1f:	e8 2d 19 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    1f24:	83 c4 10             	add    $0x10,%esp
    1f27:	85 c0                	test   %eax,%eax
    1f29:	0f 88 e7 02 00 00    	js     2216 <subdir+0x71a>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1f2f:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1f32:	68 6e 46 00 00       	push   $0x466e
    1f37:	6a 01                	push   $0x1
    1f39:	e8 2f 1a 00 00       	call   396d <printf>
=======
    1f32:	68 56 46 00 00       	push   $0x4656
    1f37:	6a 01                	push   $0x1
    1f39:	e8 18 1a 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    1f3e:	83 c4 10             	add    $0x10,%esp
    1f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f44:	c9                   	leave  
    1f45:	c3                   	ret    
    printf(1, "subdir mkdir dd failed\n");
    1f46:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    1f49:	68 73 43 00 00       	push   $0x4373
    1f4e:	6a 01                	push   $0x1
    1f50:	e8 18 1a 00 00       	call   396d <printf>
    exit();
    1f55:	e8 be 18 00 00       	call   3818 <exit>
    printf(1, "create dd/ff failed\n");
    1f5a:	83 ec 08             	sub    $0x8,%esp
    1f5d:	68 8b 43 00 00       	push   $0x438b
    1f62:	6a 01                	push   $0x1
    1f64:	e8 04 1a 00 00       	call   396d <printf>
    exit();
    1f69:	e8 aa 18 00 00       	call   3818 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1f6e:	83 ec 08             	sub    $0x8,%esp
    1f71:	68 58 4e 00 00       	push   $0x4e58
    1f76:	6a 01                	push   $0x1
    1f78:	e8 f0 19 00 00       	call   396d <printf>
    exit();
    1f7d:	e8 96 18 00 00       	call   3818 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1f82:	83 ec 08             	sub    $0x8,%esp
    1f85:	68 a7 43 00 00       	push   $0x43a7
    1f8a:	6a 01                	push   $0x1
    1f8c:	e8 dc 19 00 00       	call   396d <printf>
    exit();
    1f91:	e8 82 18 00 00       	call   3818 <exit>
    printf(1, "create dd/dd/ff failed\n");
    1f96:	83 ec 08             	sub    $0x8,%esp
    1f99:	68 cb 43 00 00       	push   $0x43cb
    1f9e:	6a 01                	push   $0x1
    1fa0:	e8 c8 19 00 00       	call   396d <printf>
    exit();
    1fa5:	e8 6e 18 00 00       	call   3818 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1faa:	83 ec 08             	sub    $0x8,%esp
    1fad:	68 f2 43 00 00       	push   $0x43f2
    1fb2:	6a 01                	push   $0x1
    1fb4:	e8 b4 19 00 00       	call   396d <printf>
    exit();
    1fb9:	e8 5a 18 00 00       	call   3818 <exit>
    printf(1, "dd/dd/../ff wrong content\n");
    1fbe:	83 ec 08             	sub    $0x8,%esp
    1fc1:	68 0b 44 00 00       	push   $0x440b
    1fc6:	6a 01                	push   $0x1
    1fc8:	e8 a0 19 00 00       	call   396d <printf>
    exit();
    1fcd:	e8 46 18 00 00       	call   3818 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1fd2:	83 ec 08             	sub    $0x8,%esp
    1fd5:	68 80 4e 00 00       	push   $0x4e80
    1fda:	6a 01                	push   $0x1
    1fdc:	e8 8c 19 00 00       	call   396d <printf>
    exit();
    1fe1:	e8 32 18 00 00       	call   3818 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 31 44 00 00       	push   $0x4431
    1fee:	6a 01                	push   $0x1
    1ff0:	e8 78 19 00 00       	call   396d <printf>
    exit();
    1ff5:	e8 1e 18 00 00       	call   3818 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1ffa:	83 ec 08             	sub    $0x8,%esp
    1ffd:	68 a4 4e 00 00       	push   $0x4ea4
    2002:	6a 01                	push   $0x1
    2004:	e8 64 19 00 00       	call   396d <printf>
    exit();
    2009:	e8 0a 18 00 00       	call   3818 <exit>
    printf(1, "chdir dd failed\n");
    200e:	83 ec 08             	sub    $0x8,%esp
    2011:	68 49 44 00 00       	push   $0x4449
    2016:	6a 01                	push   $0x1
    2018:	e8 50 19 00 00       	call   396d <printf>
    exit();
    201d:	e8 f6 17 00 00       	call   3818 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2022:	83 ec 08             	sub    $0x8,%esp
    2025:	68 66 44 00 00       	push   $0x4466
    202a:	6a 01                	push   $0x1
    202c:	e8 3c 19 00 00       	call   396d <printf>
    exit();
    2031:	e8 e2 17 00 00       	call   3818 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2036:	83 ec 08             	sub    $0x8,%esp
    2039:	68 66 44 00 00       	push   $0x4466
    203e:	6a 01                	push   $0x1
    2040:	e8 28 19 00 00       	call   396d <printf>
    exit();
    2045:	e8 ce 17 00 00       	call   3818 <exit>
    printf(1, "chdir ./.. failed\n");
    204a:	83 ec 08             	sub    $0x8,%esp
    204d:	68 94 44 00 00       	push   $0x4494
    2052:	6a 01                	push   $0x1
    2054:	e8 14 19 00 00       	call   396d <printf>
    exit();
    2059:	e8 ba 17 00 00       	call   3818 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    205e:	83 ec 08             	sub    $0x8,%esp
    2061:	68 a7 44 00 00       	push   $0x44a7
    2066:	6a 01                	push   $0x1
    2068:	e8 00 19 00 00       	call   396d <printf>
    exit();
    206d:	e8 a6 17 00 00       	call   3818 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    2072:	83 ec 08             	sub    $0x8,%esp
    2075:	68 bf 44 00 00       	push   $0x44bf
    207a:	6a 01                	push   $0x1
    207c:	e8 ec 18 00 00       	call   396d <printf>
    exit();
    2081:	e8 92 17 00 00       	call   3818 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2086:	83 ec 08             	sub    $0x8,%esp
    2089:	68 c8 4e 00 00       	push   $0x4ec8
    208e:	6a 01                	push   $0x1
    2090:	e8 d8 18 00 00       	call   396d <printf>
    exit();
    2095:	e8 7e 17 00 00       	call   3818 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    209a:	83 ec 08             	sub    $0x8,%esp
    209d:	68 e3 44 00 00       	push   $0x44e3
    20a2:	6a 01                	push   $0x1
    20a4:	e8 c4 18 00 00       	call   396d <printf>
    exit();
    20a9:	e8 6a 17 00 00       	call   3818 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    20ae:	83 ec 08             	sub    $0x8,%esp
    20b1:	68 08 45 00 00       	push   $0x4508
    20b6:	6a 01                	push   $0x1
    20b8:	e8 b0 18 00 00       	call   396d <printf>
    exit();
    20bd:	e8 56 17 00 00       	call   3818 <exit>
    printf(1, "create dd succeeded!\n");
    20c2:	83 ec 08             	sub    $0x8,%esp
    20c5:	68 24 45 00 00       	push   $0x4524
    20ca:	6a 01                	push   $0x1
    20cc:	e8 9c 18 00 00       	call   396d <printf>
    exit();
    20d1:	e8 42 17 00 00       	call   3818 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    20d6:	83 ec 08             	sub    $0x8,%esp
    20d9:	68 3a 45 00 00       	push   $0x453a
    20de:	6a 01                	push   $0x1
    20e0:	e8 88 18 00 00       	call   396d <printf>
    exit();
    20e5:	e8 2e 17 00 00       	call   3818 <exit>
    printf(1, "open dd wronly succeeded!\n");
    20ea:	83 ec 08             	sub    $0x8,%esp
    20ed:	68 53 45 00 00       	push   $0x4553
    20f2:	6a 01                	push   $0x1
    20f4:	e8 74 18 00 00       	call   396d <printf>
    exit();
    20f9:	e8 1a 17 00 00       	call   3818 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    20fe:	83 ec 08             	sub    $0x8,%esp
    2101:	68 f0 4e 00 00       	push   $0x4ef0
    2106:	6a 01                	push   $0x1
    2108:	e8 60 18 00 00       	call   396d <printf>
    exit();
    210d:	e8 06 17 00 00       	call   3818 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2112:	83 ec 08             	sub    $0x8,%esp
    2115:	68 14 4f 00 00       	push   $0x4f14
    211a:	6a 01                	push   $0x1
    211c:	e8 4c 18 00 00       	call   396d <printf>
    exit();
    2121:	e8 f2 16 00 00       	call   3818 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2126:	83 ec 08             	sub    $0x8,%esp
    2129:	68 38 4f 00 00       	push   $0x4f38
    212e:	6a 01                	push   $0x1
    2130:	e8 38 18 00 00       	call   396d <printf>
    exit();
    2135:	e8 de 16 00 00       	call   3818 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    213a:	83 ec 08             	sub    $0x8,%esp
    213d:	68 77 45 00 00       	push   $0x4577
    2142:	6a 01                	push   $0x1
    2144:	e8 24 18 00 00       	call   396d <printf>
    exit();
    2149:	e8 ca 16 00 00       	call   3818 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    214e:	83 ec 08             	sub    $0x8,%esp
    2151:	68 92 45 00 00       	push   $0x4592
    2156:	6a 01                	push   $0x1
    2158:	e8 10 18 00 00       	call   396d <printf>
    exit();
    215d:	e8 b6 16 00 00       	call   3818 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2162:	83 ec 08             	sub    $0x8,%esp
    2165:	68 ad 45 00 00       	push   $0x45ad
    216a:	6a 01                	push   $0x1
    216c:	e8 fc 17 00 00       	call   396d <printf>
    exit();
    2171:	e8 a2 16 00 00       	call   3818 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2176:	83 ec 08             	sub    $0x8,%esp
    2179:	68 ca 45 00 00       	push   $0x45ca
    217e:	6a 01                	push   $0x1
    2180:	e8 e8 17 00 00       	call   396d <printf>
    exit();
    2185:	e8 8e 16 00 00       	call   3818 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    218a:	83 ec 08             	sub    $0x8,%esp
    218d:	68 e6 45 00 00       	push   $0x45e6
    2192:	6a 01                	push   $0x1
    2194:	e8 d4 17 00 00       	call   396d <printf>
    exit();
    2199:	e8 7a 16 00 00       	call   3818 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    219e:	83 ec 08             	sub    $0x8,%esp
    21a1:	68 02 46 00 00       	push   $0x4602
    21a6:	6a 01                	push   $0x1
    21a8:	e8 c0 17 00 00       	call   396d <printf>
    exit();
    21ad:	e8 66 16 00 00       	call   3818 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    21b2:	83 ec 08             	sub    $0x8,%esp
    21b5:	68 1a 46 00 00       	push   $0x461a
    21ba:	6a 01                	push   $0x1
    21bc:	e8 ac 17 00 00       	call   396d <printf>
    exit();
    21c1:	e8 52 16 00 00       	call   3818 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    21c6:	83 ec 08             	sub    $0x8,%esp
    21c9:	68 31 44 00 00       	push   $0x4431
    21ce:	6a 01                	push   $0x1
    21d0:	e8 98 17 00 00       	call   396d <printf>
    exit();
    21d5:	e8 3e 16 00 00       	call   3818 <exit>
    printf(1, "unlink dd/ff failed\n");
    21da:	83 ec 08             	sub    $0x8,%esp
    21dd:	68 32 46 00 00       	push   $0x4632
    21e2:	6a 01                	push   $0x1
    21e4:	e8 84 17 00 00       	call   396d <printf>
    exit();
    21e9:	e8 2a 16 00 00       	call   3818 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    21ee:	83 ec 08             	sub    $0x8,%esp
    21f1:	68 5c 4f 00 00       	push   $0x4f5c
    21f6:	6a 01                	push   $0x1
    21f8:	e8 70 17 00 00       	call   396d <printf>
    exit();
    21fd:	e8 16 16 00 00       	call   3818 <exit>
    printf(1, "unlink dd/dd failed\n");
    2202:	83 ec 08             	sub    $0x8,%esp
    2205:	68 47 46 00 00       	push   $0x4647
    220a:	6a 01                	push   $0x1
    220c:	e8 5c 17 00 00       	call   396d <printf>
    exit();
    2211:	e8 02 16 00 00       	call   3818 <exit>
    printf(1, "unlink dd failed\n");
    2216:	83 ec 08             	sub    $0x8,%esp
    2219:	68 5c 46 00 00       	push   $0x465c
    221e:	6a 01                	push   $0x1
    2220:	e8 48 17 00 00       	call   396d <printf>
    exit();
    2225:	e8 ee 15 00 00       	call   3818 <exit>
=======
    1f49:	68 5b 43 00 00       	push   $0x435b
    1f4e:	6a 01                	push   $0x1
    1f50:	e8 01 1a 00 00       	call   3956 <printf>
    exit();
    1f55:	e8 a7 18 00 00       	call   3801 <exit>
    printf(1, "create dd/ff failed\n");
    1f5a:	83 ec 08             	sub    $0x8,%esp
    1f5d:	68 73 43 00 00       	push   $0x4373
    1f62:	6a 01                	push   $0x1
    1f64:	e8 ed 19 00 00       	call   3956 <printf>
    exit();
    1f69:	e8 93 18 00 00       	call   3801 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1f6e:	83 ec 08             	sub    $0x8,%esp
    1f71:	68 40 4e 00 00       	push   $0x4e40
    1f76:	6a 01                	push   $0x1
    1f78:	e8 d9 19 00 00       	call   3956 <printf>
    exit();
    1f7d:	e8 7f 18 00 00       	call   3801 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1f82:	83 ec 08             	sub    $0x8,%esp
    1f85:	68 8f 43 00 00       	push   $0x438f
    1f8a:	6a 01                	push   $0x1
    1f8c:	e8 c5 19 00 00       	call   3956 <printf>
    exit();
    1f91:	e8 6b 18 00 00       	call   3801 <exit>
    printf(1, "create dd/dd/ff failed\n");
    1f96:	83 ec 08             	sub    $0x8,%esp
    1f99:	68 b3 43 00 00       	push   $0x43b3
    1f9e:	6a 01                	push   $0x1
    1fa0:	e8 b1 19 00 00       	call   3956 <printf>
    exit();
    1fa5:	e8 57 18 00 00       	call   3801 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1faa:	83 ec 08             	sub    $0x8,%esp
    1fad:	68 da 43 00 00       	push   $0x43da
    1fb2:	6a 01                	push   $0x1
    1fb4:	e8 9d 19 00 00       	call   3956 <printf>
    exit();
    1fb9:	e8 43 18 00 00       	call   3801 <exit>
    printf(1, "dd/dd/../ff wrong content\n");
    1fbe:	83 ec 08             	sub    $0x8,%esp
    1fc1:	68 f3 43 00 00       	push   $0x43f3
    1fc6:	6a 01                	push   $0x1
    1fc8:	e8 89 19 00 00       	call   3956 <printf>
    exit();
    1fcd:	e8 2f 18 00 00       	call   3801 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1fd2:	83 ec 08             	sub    $0x8,%esp
    1fd5:	68 68 4e 00 00       	push   $0x4e68
    1fda:	6a 01                	push   $0x1
    1fdc:	e8 75 19 00 00       	call   3956 <printf>
    exit();
    1fe1:	e8 1b 18 00 00       	call   3801 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 19 44 00 00       	push   $0x4419
    1fee:	6a 01                	push   $0x1
    1ff0:	e8 61 19 00 00       	call   3956 <printf>
    exit();
    1ff5:	e8 07 18 00 00       	call   3801 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1ffa:	83 ec 08             	sub    $0x8,%esp
    1ffd:	68 8c 4e 00 00       	push   $0x4e8c
    2002:	6a 01                	push   $0x1
    2004:	e8 4d 19 00 00       	call   3956 <printf>
    exit();
    2009:	e8 f3 17 00 00       	call   3801 <exit>
    printf(1, "chdir dd failed\n");
    200e:	83 ec 08             	sub    $0x8,%esp
    2011:	68 31 44 00 00       	push   $0x4431
    2016:	6a 01                	push   $0x1
    2018:	e8 39 19 00 00       	call   3956 <printf>
    exit();
    201d:	e8 df 17 00 00       	call   3801 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2022:	83 ec 08             	sub    $0x8,%esp
    2025:	68 4e 44 00 00       	push   $0x444e
    202a:	6a 01                	push   $0x1
    202c:	e8 25 19 00 00       	call   3956 <printf>
    exit();
    2031:	e8 cb 17 00 00       	call   3801 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2036:	83 ec 08             	sub    $0x8,%esp
    2039:	68 4e 44 00 00       	push   $0x444e
    203e:	6a 01                	push   $0x1
    2040:	e8 11 19 00 00       	call   3956 <printf>
    exit();
    2045:	e8 b7 17 00 00       	call   3801 <exit>
    printf(1, "chdir ./.. failed\n");
    204a:	83 ec 08             	sub    $0x8,%esp
    204d:	68 7c 44 00 00       	push   $0x447c
    2052:	6a 01                	push   $0x1
    2054:	e8 fd 18 00 00       	call   3956 <printf>
    exit();
    2059:	e8 a3 17 00 00       	call   3801 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    205e:	83 ec 08             	sub    $0x8,%esp
    2061:	68 8f 44 00 00       	push   $0x448f
    2066:	6a 01                	push   $0x1
    2068:	e8 e9 18 00 00       	call   3956 <printf>
    exit();
    206d:	e8 8f 17 00 00       	call   3801 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    2072:	83 ec 08             	sub    $0x8,%esp
    2075:	68 a7 44 00 00       	push   $0x44a7
    207a:	6a 01                	push   $0x1
    207c:	e8 d5 18 00 00       	call   3956 <printf>
    exit();
    2081:	e8 7b 17 00 00       	call   3801 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2086:	83 ec 08             	sub    $0x8,%esp
    2089:	68 b0 4e 00 00       	push   $0x4eb0
    208e:	6a 01                	push   $0x1
    2090:	e8 c1 18 00 00       	call   3956 <printf>
    exit();
    2095:	e8 67 17 00 00       	call   3801 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    209a:	83 ec 08             	sub    $0x8,%esp
    209d:	68 cb 44 00 00       	push   $0x44cb
    20a2:	6a 01                	push   $0x1
    20a4:	e8 ad 18 00 00       	call   3956 <printf>
    exit();
    20a9:	e8 53 17 00 00       	call   3801 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    20ae:	83 ec 08             	sub    $0x8,%esp
    20b1:	68 f0 44 00 00       	push   $0x44f0
    20b6:	6a 01                	push   $0x1
    20b8:	e8 99 18 00 00       	call   3956 <printf>
    exit();
    20bd:	e8 3f 17 00 00       	call   3801 <exit>
    printf(1, "create dd succeeded!\n");
    20c2:	83 ec 08             	sub    $0x8,%esp
    20c5:	68 0c 45 00 00       	push   $0x450c
    20ca:	6a 01                	push   $0x1
    20cc:	e8 85 18 00 00       	call   3956 <printf>
    exit();
    20d1:	e8 2b 17 00 00       	call   3801 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    20d6:	83 ec 08             	sub    $0x8,%esp
    20d9:	68 22 45 00 00       	push   $0x4522
    20de:	6a 01                	push   $0x1
    20e0:	e8 71 18 00 00       	call   3956 <printf>
    exit();
    20e5:	e8 17 17 00 00       	call   3801 <exit>
    printf(1, "open dd wronly succeeded!\n");
    20ea:	83 ec 08             	sub    $0x8,%esp
    20ed:	68 3b 45 00 00       	push   $0x453b
    20f2:	6a 01                	push   $0x1
    20f4:	e8 5d 18 00 00       	call   3956 <printf>
    exit();
    20f9:	e8 03 17 00 00       	call   3801 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    20fe:	83 ec 08             	sub    $0x8,%esp
    2101:	68 d8 4e 00 00       	push   $0x4ed8
    2106:	6a 01                	push   $0x1
    2108:	e8 49 18 00 00       	call   3956 <printf>
    exit();
    210d:	e8 ef 16 00 00       	call   3801 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2112:	83 ec 08             	sub    $0x8,%esp
    2115:	68 fc 4e 00 00       	push   $0x4efc
    211a:	6a 01                	push   $0x1
    211c:	e8 35 18 00 00       	call   3956 <printf>
    exit();
    2121:	e8 db 16 00 00       	call   3801 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2126:	83 ec 08             	sub    $0x8,%esp
    2129:	68 20 4f 00 00       	push   $0x4f20
    212e:	6a 01                	push   $0x1
    2130:	e8 21 18 00 00       	call   3956 <printf>
    exit();
    2135:	e8 c7 16 00 00       	call   3801 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    213a:	83 ec 08             	sub    $0x8,%esp
    213d:	68 5f 45 00 00       	push   $0x455f
    2142:	6a 01                	push   $0x1
    2144:	e8 0d 18 00 00       	call   3956 <printf>
    exit();
    2149:	e8 b3 16 00 00       	call   3801 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    214e:	83 ec 08             	sub    $0x8,%esp
    2151:	68 7a 45 00 00       	push   $0x457a
    2156:	6a 01                	push   $0x1
    2158:	e8 f9 17 00 00       	call   3956 <printf>
    exit();
    215d:	e8 9f 16 00 00       	call   3801 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2162:	83 ec 08             	sub    $0x8,%esp
    2165:	68 95 45 00 00       	push   $0x4595
    216a:	6a 01                	push   $0x1
    216c:	e8 e5 17 00 00       	call   3956 <printf>
    exit();
    2171:	e8 8b 16 00 00       	call   3801 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2176:	83 ec 08             	sub    $0x8,%esp
    2179:	68 b2 45 00 00       	push   $0x45b2
    217e:	6a 01                	push   $0x1
    2180:	e8 d1 17 00 00       	call   3956 <printf>
    exit();
    2185:	e8 77 16 00 00       	call   3801 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    218a:	83 ec 08             	sub    $0x8,%esp
    218d:	68 ce 45 00 00       	push   $0x45ce
    2192:	6a 01                	push   $0x1
    2194:	e8 bd 17 00 00       	call   3956 <printf>
    exit();
    2199:	e8 63 16 00 00       	call   3801 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    219e:	83 ec 08             	sub    $0x8,%esp
    21a1:	68 ea 45 00 00       	push   $0x45ea
    21a6:	6a 01                	push   $0x1
    21a8:	e8 a9 17 00 00       	call   3956 <printf>
    exit();
    21ad:	e8 4f 16 00 00       	call   3801 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    21b2:	83 ec 08             	sub    $0x8,%esp
    21b5:	68 02 46 00 00       	push   $0x4602
    21ba:	6a 01                	push   $0x1
    21bc:	e8 95 17 00 00       	call   3956 <printf>
    exit();
    21c1:	e8 3b 16 00 00       	call   3801 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    21c6:	83 ec 08             	sub    $0x8,%esp
    21c9:	68 19 44 00 00       	push   $0x4419
    21ce:	6a 01                	push   $0x1
    21d0:	e8 81 17 00 00       	call   3956 <printf>
    exit();
    21d5:	e8 27 16 00 00       	call   3801 <exit>
    printf(1, "unlink dd/ff failed\n");
    21da:	83 ec 08             	sub    $0x8,%esp
    21dd:	68 1a 46 00 00       	push   $0x461a
    21e2:	6a 01                	push   $0x1
    21e4:	e8 6d 17 00 00       	call   3956 <printf>
    exit();
    21e9:	e8 13 16 00 00       	call   3801 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    21ee:	83 ec 08             	sub    $0x8,%esp
    21f1:	68 44 4f 00 00       	push   $0x4f44
    21f6:	6a 01                	push   $0x1
    21f8:	e8 59 17 00 00       	call   3956 <printf>
    exit();
    21fd:	e8 ff 15 00 00       	call   3801 <exit>
    printf(1, "unlink dd/dd failed\n");
    2202:	83 ec 08             	sub    $0x8,%esp
    2205:	68 2f 46 00 00       	push   $0x462f
    220a:	6a 01                	push   $0x1
    220c:	e8 45 17 00 00       	call   3956 <printf>
    exit();
    2211:	e8 eb 15 00 00       	call   3801 <exit>
    printf(1, "unlink dd failed\n");
    2216:	83 ec 08             	sub    $0x8,%esp
    2219:	68 44 46 00 00       	push   $0x4644
    221e:	6a 01                	push   $0x1
    2220:	e8 31 17 00 00       	call   3956 <printf>
    exit();
    2225:	e8 d7 15 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000222a <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    222a:	55                   	push   %ebp
    222b:	89 e5                	mov    %esp,%ebp
    222d:	57                   	push   %edi
    222e:	56                   	push   %esi
    222f:	53                   	push   %ebx
    2230:	83 ec 14             	sub    $0x14,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
<<<<<<< HEAD
    2233:	68 79 46 00 00       	push   $0x4679
    2238:	6a 01                	push   $0x1
    223a:	e8 2e 17 00 00       	call   396d <printf>

  unlink("bigwrite");
    223f:	c7 04 24 88 46 00 00 	movl   $0x4688,(%esp)
    2246:	e8 1d 16 00 00       	call   3868 <unlink>
=======
    2233:	68 61 46 00 00       	push   $0x4661
    2238:	6a 01                	push   $0x1
    223a:	e8 17 17 00 00       	call   3956 <printf>

  unlink("bigwrite");
    223f:	c7 04 24 70 46 00 00 	movl   $0x4670,(%esp)
    2246:	e8 06 16 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(sz = 499; sz < 12*512; sz += 471){
    224b:	83 c4 10             	add    $0x10,%esp
    224e:	be f3 01 00 00       	mov    $0x1f3,%esi
    2253:	eb 45                	jmp    229a <bigwrite+0x70>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2255:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2258:	68 91 46 00 00       	push   $0x4691
    225d:	6a 01                	push   $0x1
    225f:	e8 09 17 00 00       	call   396d <printf>
      exit();
    2264:	e8 af 15 00 00       	call   3818 <exit>
=======
    2258:	68 79 46 00 00       	push   $0x4679
    225d:	6a 01                	push   $0x1
    225f:	e8 f2 16 00 00       	call   3956 <printf>
      exit();
    2264:	e8 98 15 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    2269:	50                   	push   %eax
    226a:	56                   	push   %esi
<<<<<<< HEAD
    226b:	68 a9 46 00 00       	push   $0x46a9
    2270:	6a 01                	push   $0x1
    2272:	e8 f6 16 00 00       	call   396d <printf>
        exit();
    2277:	e8 9c 15 00 00       	call   3818 <exit>
=======
    226b:	68 91 46 00 00       	push   $0x4691
    2270:	6a 01                	push   $0x1
    2272:	e8 df 16 00 00       	call   3956 <printf>
        exit();
    2277:	e8 85 15 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      }
    }
    close(fd);
    227c:	83 ec 0c             	sub    $0xc,%esp
    227f:	57                   	push   %edi
<<<<<<< HEAD
    2280:	e8 bb 15 00 00       	call   3840 <close>
    unlink("bigwrite");
    2285:	c7 04 24 88 46 00 00 	movl   $0x4688,(%esp)
    228c:	e8 d7 15 00 00       	call   3868 <unlink>
=======
    2280:	e8 a4 15 00 00       	call   3829 <close>
    unlink("bigwrite");
    2285:	c7 04 24 70 46 00 00 	movl   $0x4670,(%esp)
    228c:	e8 c0 15 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(sz = 499; sz < 12*512; sz += 471){
    2291:	81 c6 d7 01 00 00    	add    $0x1d7,%esi
    2297:	83 c4 10             	add    $0x10,%esp
    229a:	81 fe ff 17 00 00    	cmp    $0x17ff,%esi
    22a0:	7f 40                	jg     22e2 <bigwrite+0xb8>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    22a2:	83 ec 08             	sub    $0x8,%esp
    22a5:	68 02 02 00 00       	push   $0x202
<<<<<<< HEAD
    22aa:	68 88 46 00 00       	push   $0x4688
    22af:	e8 a4 15 00 00       	call   3858 <open>
=======
    22aa:	68 70 46 00 00       	push   $0x4670
    22af:	e8 8d 15 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    22b4:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    22b6:	83 c4 10             	add    $0x10,%esp
    22b9:	85 c0                	test   %eax,%eax
    22bb:	78 98                	js     2255 <bigwrite+0x2b>
    for(i = 0; i < 2; i++){
    22bd:	bb 00 00 00 00       	mov    $0x0,%ebx
    22c2:	83 fb 01             	cmp    $0x1,%ebx
    22c5:	7f b5                	jg     227c <bigwrite+0x52>
      int cc = write(fd, buf, sz);
    22c7:	83 ec 04             	sub    $0x4,%esp
    22ca:	56                   	push   %esi
<<<<<<< HEAD
    22cb:	68 c0 84 00 00       	push   $0x84c0
    22d0:	57                   	push   %edi
    22d1:	e8 62 15 00 00       	call   3838 <write>
=======
    22cb:	68 a0 84 00 00       	push   $0x84a0
    22d0:	57                   	push   %edi
    22d1:	e8 4b 15 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
      if(cc != sz){
    22d6:	83 c4 10             	add    $0x10,%esp
    22d9:	39 c6                	cmp    %eax,%esi
    22db:	75 8c                	jne    2269 <bigwrite+0x3f>
    for(i = 0; i < 2; i++){
    22dd:	83 c3 01             	add    $0x1,%ebx
    22e0:	eb e0                	jmp    22c2 <bigwrite+0x98>
  }

  printf(1, "bigwrite ok\n");
    22e2:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    22e5:	68 bb 46 00 00       	push   $0x46bb
    22ea:	6a 01                	push   $0x1
    22ec:	e8 7c 16 00 00       	call   396d <printf>
=======
    22e5:	68 a3 46 00 00       	push   $0x46a3
    22ea:	6a 01                	push   $0x1
    22ec:	e8 65 16 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    22f1:	83 c4 10             	add    $0x10,%esp
    22f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    22f7:	5b                   	pop    %ebx
    22f8:	5e                   	pop    %esi
    22f9:	5f                   	pop    %edi
    22fa:	5d                   	pop    %ebp
    22fb:	c3                   	ret    

000022fc <bigfile>:

void
bigfile(void)
{
    22fc:	55                   	push   %ebp
    22fd:	89 e5                	mov    %esp,%ebp
    22ff:	57                   	push   %edi
    2300:	56                   	push   %esi
    2301:	53                   	push   %ebx
    2302:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
<<<<<<< HEAD
    2305:	68 c8 46 00 00       	push   $0x46c8
    230a:	6a 01                	push   $0x1
    230c:	e8 5c 16 00 00       	call   396d <printf>

  unlink("bigfile");
    2311:	c7 04 24 e4 46 00 00 	movl   $0x46e4,(%esp)
    2318:	e8 4b 15 00 00       	call   3868 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    231d:	83 c4 08             	add    $0x8,%esp
    2320:	68 02 02 00 00       	push   $0x202
    2325:	68 e4 46 00 00       	push   $0x46e4
    232a:	e8 29 15 00 00       	call   3858 <open>
=======
    2305:	68 b0 46 00 00       	push   $0x46b0
    230a:	6a 01                	push   $0x1
    230c:	e8 45 16 00 00       	call   3956 <printf>

  unlink("bigfile");
    2311:	c7 04 24 cc 46 00 00 	movl   $0x46cc,(%esp)
    2318:	e8 34 15 00 00       	call   3851 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    231d:	83 c4 08             	add    $0x8,%esp
    2320:	68 02 02 00 00       	push   $0x202
    2325:	68 cc 46 00 00       	push   $0x46cc
    232a:	e8 12 15 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    232f:	83 c4 10             	add    $0x10,%esp
    2332:	85 c0                	test   %eax,%eax
    2334:	78 41                	js     2377 <bigfile+0x7b>
    2336:	89 c6                	mov    %eax,%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    2338:	bb 00 00 00 00       	mov    $0x0,%ebx
    233d:	83 fb 13             	cmp    $0x13,%ebx
    2340:	7f 5d                	jg     239f <bigfile+0xa3>
    memset(buf, i, 600);
    2342:	83 ec 04             	sub    $0x4,%esp
    2345:	68 58 02 00 00       	push   $0x258
    234a:	53                   	push   %ebx
<<<<<<< HEAD
    234b:	68 c0 84 00 00       	push   $0x84c0
    2350:	e8 88 13 00 00       	call   36dd <memset>
    if(write(fd, buf, 600) != 600){
    2355:	83 c4 0c             	add    $0xc,%esp
    2358:	68 58 02 00 00       	push   $0x258
    235d:	68 c0 84 00 00       	push   $0x84c0
    2362:	56                   	push   %esi
    2363:	e8 d0 14 00 00       	call   3838 <write>
=======
    234b:	68 a0 84 00 00       	push   $0x84a0
    2350:	e8 71 13 00 00       	call   36c6 <memset>
    if(write(fd, buf, 600) != 600){
    2355:	83 c4 0c             	add    $0xc,%esp
    2358:	68 58 02 00 00       	push   $0x258
    235d:	68 a0 84 00 00       	push   $0x84a0
    2362:	56                   	push   %esi
    2363:	e8 b9 14 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2368:	83 c4 10             	add    $0x10,%esp
    236b:	3d 58 02 00 00       	cmp    $0x258,%eax
    2370:	75 19                	jne    238b <bigfile+0x8f>
  for(i = 0; i < 20; i++){
    2372:	83 c3 01             	add    $0x1,%ebx
    2375:	eb c6                	jmp    233d <bigfile+0x41>
    printf(1, "cannot create bigfile");
    2377:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    237a:	68 d6 46 00 00       	push   $0x46d6
    237f:	6a 01                	push   $0x1
    2381:	e8 e7 15 00 00       	call   396d <printf>
    exit();
    2386:	e8 8d 14 00 00       	call   3818 <exit>
      printf(1, "write bigfile failed\n");
    238b:	83 ec 08             	sub    $0x8,%esp
    238e:	68 ec 46 00 00       	push   $0x46ec
    2393:	6a 01                	push   $0x1
    2395:	e8 d3 15 00 00       	call   396d <printf>
      exit();
    239a:	e8 79 14 00 00       	call   3818 <exit>
=======
    237a:	68 be 46 00 00       	push   $0x46be
    237f:	6a 01                	push   $0x1
    2381:	e8 d0 15 00 00       	call   3956 <printf>
    exit();
    2386:	e8 76 14 00 00       	call   3801 <exit>
      printf(1, "write bigfile failed\n");
    238b:	83 ec 08             	sub    $0x8,%esp
    238e:	68 d4 46 00 00       	push   $0x46d4
    2393:	6a 01                	push   $0x1
    2395:	e8 bc 15 00 00       	call   3956 <printf>
      exit();
    239a:	e8 62 14 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }
  close(fd);
    239f:	83 ec 0c             	sub    $0xc,%esp
    23a2:	56                   	push   %esi
<<<<<<< HEAD
    23a3:	e8 98 14 00 00       	call   3840 <close>
=======
    23a3:	e8 81 14 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("bigfile", 0);
    23a8:	83 c4 08             	add    $0x8,%esp
    23ab:	6a 00                	push   $0x0
<<<<<<< HEAD
    23ad:	68 e4 46 00 00       	push   $0x46e4
    23b2:	e8 a1 14 00 00       	call   3858 <open>
=======
    23ad:	68 cc 46 00 00       	push   $0x46cc
    23b2:	e8 8a 14 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    23b7:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    23b9:	83 c4 10             	add    $0x10,%esp
    23bc:	85 c0                	test   %eax,%eax
    23be:	78 53                	js     2413 <bigfile+0x117>
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
    23c0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; ; i++){
    23c5:	bb 00 00 00 00       	mov    $0x0,%ebx
    cc = read(fd, buf, 300);
    23ca:	83 ec 04             	sub    $0x4,%esp
    23cd:	68 2c 01 00 00       	push   $0x12c
<<<<<<< HEAD
    23d2:	68 c0 84 00 00       	push   $0x84c0
    23d7:	57                   	push   %edi
    23d8:	e8 53 14 00 00       	call   3830 <read>
=======
    23d2:	68 a0 84 00 00       	push   $0x84a0
    23d7:	57                   	push   %edi
    23d8:	e8 3c 14 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(cc < 0){
    23dd:	83 c4 10             	add    $0x10,%esp
    23e0:	85 c0                	test   %eax,%eax
    23e2:	78 43                	js     2427 <bigfile+0x12b>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    23e4:	74 7d                	je     2463 <bigfile+0x167>
      break;
    if(cc != 300){
    23e6:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    23eb:	75 4e                	jne    243b <bigfile+0x13f>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
<<<<<<< HEAD
    23ed:	0f be 0d c0 84 00 00 	movsbl 0x84c0,%ecx
=======
    23ed:	0f be 0d a0 84 00 00 	movsbl 0x84a0,%ecx
>>>>>>> c59b0f9 (fixed thread_join and join)
    23f4:	89 da                	mov    %ebx,%edx
    23f6:	c1 ea 1f             	shr    $0x1f,%edx
    23f9:	01 da                	add    %ebx,%edx
    23fb:	d1 fa                	sar    %edx
    23fd:	39 d1                	cmp    %edx,%ecx
    23ff:	75 4e                	jne    244f <bigfile+0x153>
<<<<<<< HEAD
    2401:	0f be 0d eb 85 00 00 	movsbl 0x85eb,%ecx
=======
    2401:	0f be 0d cb 85 00 00 	movsbl 0x85cb,%ecx
>>>>>>> c59b0f9 (fixed thread_join and join)
    2408:	39 ca                	cmp    %ecx,%edx
    240a:	75 43                	jne    244f <bigfile+0x153>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    240c:	01 c6                	add    %eax,%esi
  for(i = 0; ; i++){
    240e:	83 c3 01             	add    $0x1,%ebx
    cc = read(fd, buf, 300);
    2411:	eb b7                	jmp    23ca <bigfile+0xce>
    printf(1, "cannot open bigfile\n");
    2413:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2416:	68 02 47 00 00       	push   $0x4702
    241b:	6a 01                	push   $0x1
    241d:	e8 4b 15 00 00       	call   396d <printf>
    exit();
    2422:	e8 f1 13 00 00       	call   3818 <exit>
      printf(1, "read bigfile failed\n");
    2427:	83 ec 08             	sub    $0x8,%esp
    242a:	68 17 47 00 00       	push   $0x4717
    242f:	6a 01                	push   $0x1
    2431:	e8 37 15 00 00       	call   396d <printf>
      exit();
    2436:	e8 dd 13 00 00       	call   3818 <exit>
      printf(1, "short read bigfile\n");
    243b:	83 ec 08             	sub    $0x8,%esp
    243e:	68 2c 47 00 00       	push   $0x472c
    2443:	6a 01                	push   $0x1
    2445:	e8 23 15 00 00       	call   396d <printf>
      exit();
    244a:	e8 c9 13 00 00       	call   3818 <exit>
      printf(1, "read bigfile wrong data\n");
    244f:	83 ec 08             	sub    $0x8,%esp
    2452:	68 40 47 00 00       	push   $0x4740
    2457:	6a 01                	push   $0x1
    2459:	e8 0f 15 00 00       	call   396d <printf>
      exit();
    245e:	e8 b5 13 00 00       	call   3818 <exit>
=======
    2416:	68 ea 46 00 00       	push   $0x46ea
    241b:	6a 01                	push   $0x1
    241d:	e8 34 15 00 00       	call   3956 <printf>
    exit();
    2422:	e8 da 13 00 00       	call   3801 <exit>
      printf(1, "read bigfile failed\n");
    2427:	83 ec 08             	sub    $0x8,%esp
    242a:	68 ff 46 00 00       	push   $0x46ff
    242f:	6a 01                	push   $0x1
    2431:	e8 20 15 00 00       	call   3956 <printf>
      exit();
    2436:	e8 c6 13 00 00       	call   3801 <exit>
      printf(1, "short read bigfile\n");
    243b:	83 ec 08             	sub    $0x8,%esp
    243e:	68 14 47 00 00       	push   $0x4714
    2443:	6a 01                	push   $0x1
    2445:	e8 0c 15 00 00       	call   3956 <printf>
      exit();
    244a:	e8 b2 13 00 00       	call   3801 <exit>
      printf(1, "read bigfile wrong data\n");
    244f:	83 ec 08             	sub    $0x8,%esp
    2452:	68 28 47 00 00       	push   $0x4728
    2457:	6a 01                	push   $0x1
    2459:	e8 f8 14 00 00       	call   3956 <printf>
      exit();
    245e:	e8 9e 13 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }
  close(fd);
    2463:	83 ec 0c             	sub    $0xc,%esp
    2466:	57                   	push   %edi
<<<<<<< HEAD
    2467:	e8 d4 13 00 00       	call   3840 <close>
=======
    2467:	e8 bd 13 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(total != 20*600){
    246c:	83 c4 10             	add    $0x10,%esp
    246f:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    2475:	75 27                	jne    249e <bigfile+0x1a2>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2477:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    247a:	68 e4 46 00 00       	push   $0x46e4
    247f:	e8 e4 13 00 00       	call   3868 <unlink>

  printf(1, "bigfile test ok\n");
    2484:	83 c4 08             	add    $0x8,%esp
    2487:	68 73 47 00 00       	push   $0x4773
    248c:	6a 01                	push   $0x1
    248e:	e8 da 14 00 00       	call   396d <printf>
=======
    247a:	68 cc 46 00 00       	push   $0x46cc
    247f:	e8 cd 13 00 00       	call   3851 <unlink>

  printf(1, "bigfile test ok\n");
    2484:	83 c4 08             	add    $0x8,%esp
    2487:	68 5b 47 00 00       	push   $0x475b
    248c:	6a 01                	push   $0x1
    248e:	e8 c3 14 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    2493:	83 c4 10             	add    $0x10,%esp
    2496:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2499:	5b                   	pop    %ebx
    249a:	5e                   	pop    %esi
    249b:	5f                   	pop    %edi
    249c:	5d                   	pop    %ebp
    249d:	c3                   	ret    
    printf(1, "read bigfile wrong total\n");
    249e:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    24a1:	68 59 47 00 00       	push   $0x4759
    24a6:	6a 01                	push   $0x1
    24a8:	e8 c0 14 00 00       	call   396d <printf>
    exit();
    24ad:	e8 66 13 00 00       	call   3818 <exit>
=======
    24a1:	68 41 47 00 00       	push   $0x4741
    24a6:	6a 01                	push   $0x1
    24a8:	e8 a9 14 00 00       	call   3956 <printf>
    exit();
    24ad:	e8 4f 13 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000024b2 <fourteen>:

void
fourteen(void)
{
    24b2:	55                   	push   %ebp
    24b3:	89 e5                	mov    %esp,%ebp
    24b5:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
<<<<<<< HEAD
    24b8:	68 84 47 00 00       	push   $0x4784
    24bd:	6a 01                	push   $0x1
    24bf:	e8 a9 14 00 00       	call   396d <printf>

  if(mkdir("12345678901234") != 0){
    24c4:	c7 04 24 bf 47 00 00 	movl   $0x47bf,(%esp)
    24cb:	e8 b0 13 00 00       	call   3880 <mkdir>
=======
    24b8:	68 6c 47 00 00       	push   $0x476c
    24bd:	6a 01                	push   $0x1
    24bf:	e8 92 14 00 00       	call   3956 <printf>

  if(mkdir("12345678901234") != 0){
    24c4:	c7 04 24 a7 47 00 00 	movl   $0x47a7,(%esp)
    24cb:	e8 99 13 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    24d0:	83 c4 10             	add    $0x10,%esp
    24d3:	85 c0                	test   %eax,%eax
    24d5:	0f 85 9c 00 00 00    	jne    2577 <fourteen+0xc5>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    24db:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    24de:	68 7c 4f 00 00       	push   $0x4f7c
    24e3:	e8 98 13 00 00       	call   3880 <mkdir>
=======
    24de:	68 64 4f 00 00       	push   $0x4f64
    24e3:	e8 81 13 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    24e8:	83 c4 10             	add    $0x10,%esp
    24eb:	85 c0                	test   %eax,%eax
    24ed:	0f 85 98 00 00 00    	jne    258b <fourteen+0xd9>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    24f3:	83 ec 08             	sub    $0x8,%esp
    24f6:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    24fb:	68 cc 4f 00 00       	push   $0x4fcc
    2500:	e8 53 13 00 00       	call   3858 <open>
=======
    24fb:	68 b4 4f 00 00       	push   $0x4fb4
    2500:	e8 3c 13 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    2505:	83 c4 10             	add    $0x10,%esp
    2508:	85 c0                	test   %eax,%eax
    250a:	0f 88 8f 00 00 00    	js     259f <fourteen+0xed>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    2510:	83 ec 0c             	sub    $0xc,%esp
    2513:	50                   	push   %eax
<<<<<<< HEAD
    2514:	e8 27 13 00 00       	call   3840 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2519:	83 c4 08             	add    $0x8,%esp
    251c:	6a 00                	push   $0x0
    251e:	68 3c 50 00 00       	push   $0x503c
    2523:	e8 30 13 00 00       	call   3858 <open>
=======
    2514:	e8 10 13 00 00       	call   3829 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2519:	83 c4 08             	add    $0x8,%esp
    251c:	6a 00                	push   $0x0
    251e:	68 24 50 00 00       	push   $0x5024
    2523:	e8 19 13 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    2528:	83 c4 10             	add    $0x10,%esp
    252b:	85 c0                	test   %eax,%eax
    252d:	0f 88 80 00 00 00    	js     25b3 <fourteen+0x101>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    2533:	83 ec 0c             	sub    $0xc,%esp
    2536:	50                   	push   %eax
<<<<<<< HEAD
    2537:	e8 04 13 00 00       	call   3840 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    253c:	c7 04 24 b0 47 00 00 	movl   $0x47b0,(%esp)
    2543:	e8 38 13 00 00       	call   3880 <mkdir>
=======
    2537:	e8 ed 12 00 00       	call   3829 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    253c:	c7 04 24 98 47 00 00 	movl   $0x4798,(%esp)
    2543:	e8 21 13 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2548:	83 c4 10             	add    $0x10,%esp
    254b:	85 c0                	test   %eax,%eax
    254d:	74 78                	je     25c7 <fourteen+0x115>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    254f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2552:	68 d8 50 00 00       	push   $0x50d8
    2557:	e8 24 13 00 00       	call   3880 <mkdir>
=======
    2552:	68 c0 50 00 00       	push   $0x50c0
    2557:	e8 0d 13 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    255c:	83 c4 10             	add    $0x10,%esp
    255f:	85 c0                	test   %eax,%eax
    2561:	74 78                	je     25db <fourteen+0x129>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    2563:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2566:	68 ce 47 00 00       	push   $0x47ce
    256b:	6a 01                	push   $0x1
    256d:	e8 fb 13 00 00       	call   396d <printf>
=======
    2566:	68 b6 47 00 00       	push   $0x47b6
    256b:	6a 01                	push   $0x1
    256d:	e8 e4 13 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    2572:	83 c4 10             	add    $0x10,%esp
    2575:	c9                   	leave  
    2576:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2577:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    257a:	68 93 47 00 00       	push   $0x4793
    257f:	6a 01                	push   $0x1
    2581:	e8 e7 13 00 00       	call   396d <printf>
    exit();
    2586:	e8 8d 12 00 00       	call   3818 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    258b:	83 ec 08             	sub    $0x8,%esp
    258e:	68 9c 4f 00 00       	push   $0x4f9c
    2593:	6a 01                	push   $0x1
    2595:	e8 d3 13 00 00       	call   396d <printf>
    exit();
    259a:	e8 79 12 00 00       	call   3818 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    259f:	83 ec 08             	sub    $0x8,%esp
    25a2:	68 fc 4f 00 00       	push   $0x4ffc
    25a7:	6a 01                	push   $0x1
    25a9:	e8 bf 13 00 00       	call   396d <printf>
    exit();
    25ae:	e8 65 12 00 00       	call   3818 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    25b3:	83 ec 08             	sub    $0x8,%esp
    25b6:	68 6c 50 00 00       	push   $0x506c
    25bb:	6a 01                	push   $0x1
    25bd:	e8 ab 13 00 00       	call   396d <printf>
    exit();
    25c2:	e8 51 12 00 00       	call   3818 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    25c7:	83 ec 08             	sub    $0x8,%esp
    25ca:	68 a8 50 00 00       	push   $0x50a8
    25cf:	6a 01                	push   $0x1
    25d1:	e8 97 13 00 00       	call   396d <printf>
    exit();
    25d6:	e8 3d 12 00 00       	call   3818 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    25db:	83 ec 08             	sub    $0x8,%esp
    25de:	68 f8 50 00 00       	push   $0x50f8
    25e3:	6a 01                	push   $0x1
    25e5:	e8 83 13 00 00       	call   396d <printf>
    exit();
    25ea:	e8 29 12 00 00       	call   3818 <exit>
=======
    257a:	68 7b 47 00 00       	push   $0x477b
    257f:	6a 01                	push   $0x1
    2581:	e8 d0 13 00 00       	call   3956 <printf>
    exit();
    2586:	e8 76 12 00 00       	call   3801 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    258b:	83 ec 08             	sub    $0x8,%esp
    258e:	68 84 4f 00 00       	push   $0x4f84
    2593:	6a 01                	push   $0x1
    2595:	e8 bc 13 00 00       	call   3956 <printf>
    exit();
    259a:	e8 62 12 00 00       	call   3801 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    259f:	83 ec 08             	sub    $0x8,%esp
    25a2:	68 e4 4f 00 00       	push   $0x4fe4
    25a7:	6a 01                	push   $0x1
    25a9:	e8 a8 13 00 00       	call   3956 <printf>
    exit();
    25ae:	e8 4e 12 00 00       	call   3801 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    25b3:	83 ec 08             	sub    $0x8,%esp
    25b6:	68 54 50 00 00       	push   $0x5054
    25bb:	6a 01                	push   $0x1
    25bd:	e8 94 13 00 00       	call   3956 <printf>
    exit();
    25c2:	e8 3a 12 00 00       	call   3801 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    25c7:	83 ec 08             	sub    $0x8,%esp
    25ca:	68 90 50 00 00       	push   $0x5090
    25cf:	6a 01                	push   $0x1
    25d1:	e8 80 13 00 00       	call   3956 <printf>
    exit();
    25d6:	e8 26 12 00 00       	call   3801 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    25db:	83 ec 08             	sub    $0x8,%esp
    25de:	68 e0 50 00 00       	push   $0x50e0
    25e3:	6a 01                	push   $0x1
    25e5:	e8 6c 13 00 00       	call   3956 <printf>
    exit();
    25ea:	e8 12 12 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000025ef <rmdot>:

void
rmdot(void)
{
    25ef:	55                   	push   %ebp
    25f0:	89 e5                	mov    %esp,%ebp
    25f2:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
<<<<<<< HEAD
    25f5:	68 db 47 00 00       	push   $0x47db
    25fa:	6a 01                	push   $0x1
    25fc:	e8 6c 13 00 00       	call   396d <printf>
  if(mkdir("dots") != 0){
    2601:	c7 04 24 e7 47 00 00 	movl   $0x47e7,(%esp)
    2608:	e8 73 12 00 00       	call   3880 <mkdir>
=======
    25f5:	68 c3 47 00 00       	push   $0x47c3
    25fa:	6a 01                	push   $0x1
    25fc:	e8 55 13 00 00       	call   3956 <printf>
  if(mkdir("dots") != 0){
    2601:	c7 04 24 cf 47 00 00 	movl   $0x47cf,(%esp)
    2608:	e8 5c 12 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    260d:	83 c4 10             	add    $0x10,%esp
    2610:	85 c0                	test   %eax,%eax
    2612:	0f 85 bc 00 00 00    	jne    26d4 <rmdot+0xe5>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2618:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    261b:	68 e7 47 00 00       	push   $0x47e7
    2620:	e8 63 12 00 00       	call   3888 <chdir>
=======
    261b:	68 cf 47 00 00       	push   $0x47cf
    2620:	e8 4c 12 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2625:	83 c4 10             	add    $0x10,%esp
    2628:	85 c0                	test   %eax,%eax
    262a:	0f 85 b8 00 00 00    	jne    26e8 <rmdot+0xf9>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2630:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2633:	68 92 44 00 00       	push   $0x4492
    2638:	e8 2b 12 00 00       	call   3868 <unlink>
=======
    2633:	68 7a 44 00 00       	push   $0x447a
    2638:	e8 14 12 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    263d:	83 c4 10             	add    $0x10,%esp
    2640:	85 c0                	test   %eax,%eax
    2642:	0f 84 b4 00 00 00    	je     26fc <rmdot+0x10d>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2648:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    264b:	68 91 44 00 00       	push   $0x4491
    2650:	e8 13 12 00 00       	call   3868 <unlink>
=======
    264b:	68 79 44 00 00       	push   $0x4479
    2650:	e8 fc 11 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2655:	83 c4 10             	add    $0x10,%esp
    2658:	85 c0                	test   %eax,%eax
    265a:	0f 84 b0 00 00 00    	je     2710 <rmdot+0x121>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2660:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2663:	68 65 3c 00 00       	push   $0x3c65
    2668:	e8 1b 12 00 00       	call   3888 <chdir>
=======
    2663:	68 4d 3c 00 00       	push   $0x3c4d
    2668:	e8 04 12 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    266d:	83 c4 10             	add    $0x10,%esp
    2670:	85 c0                	test   %eax,%eax
    2672:	0f 85 ac 00 00 00    	jne    2724 <rmdot+0x135>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2678:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    267b:	68 2f 48 00 00       	push   $0x482f
    2680:	e8 e3 11 00 00       	call   3868 <unlink>
=======
    267b:	68 17 48 00 00       	push   $0x4817
    2680:	e8 cc 11 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2685:	83 c4 10             	add    $0x10,%esp
    2688:	85 c0                	test   %eax,%eax
    268a:	0f 84 a8 00 00 00    	je     2738 <rmdot+0x149>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    2690:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2693:	68 4d 48 00 00       	push   $0x484d
    2698:	e8 cb 11 00 00       	call   3868 <unlink>
=======
    2693:	68 35 48 00 00       	push   $0x4835
    2698:	e8 b4 11 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    269d:	83 c4 10             	add    $0x10,%esp
    26a0:	85 c0                	test   %eax,%eax
    26a2:	0f 84 a4 00 00 00    	je     274c <rmdot+0x15d>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    26a8:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    26ab:	68 e7 47 00 00       	push   $0x47e7
    26b0:	e8 b3 11 00 00       	call   3868 <unlink>
=======
    26ab:	68 cf 47 00 00       	push   $0x47cf
    26b0:	e8 9c 11 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    26b5:	83 c4 10             	add    $0x10,%esp
    26b8:	85 c0                	test   %eax,%eax
    26ba:	0f 85 a0 00 00 00    	jne    2760 <rmdot+0x171>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    26c0:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    26c3:	68 82 48 00 00       	push   $0x4882
    26c8:	6a 01                	push   $0x1
    26ca:	e8 9e 12 00 00       	call   396d <printf>
=======
    26c3:	68 6a 48 00 00       	push   $0x486a
    26c8:	6a 01                	push   $0x1
    26ca:	e8 87 12 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    26cf:	83 c4 10             	add    $0x10,%esp
    26d2:	c9                   	leave  
    26d3:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    26d4:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    26d7:	68 ec 47 00 00       	push   $0x47ec
    26dc:	6a 01                	push   $0x1
    26de:	e8 8a 12 00 00       	call   396d <printf>
    exit();
    26e3:	e8 30 11 00 00       	call   3818 <exit>
    printf(1, "chdir dots failed\n");
    26e8:	83 ec 08             	sub    $0x8,%esp
    26eb:	68 ff 47 00 00       	push   $0x47ff
    26f0:	6a 01                	push   $0x1
    26f2:	e8 76 12 00 00       	call   396d <printf>
    exit();
    26f7:	e8 1c 11 00 00       	call   3818 <exit>
    printf(1, "rm . worked!\n");
    26fc:	83 ec 08             	sub    $0x8,%esp
    26ff:	68 12 48 00 00       	push   $0x4812
    2704:	6a 01                	push   $0x1
    2706:	e8 62 12 00 00       	call   396d <printf>
    exit();
    270b:	e8 08 11 00 00       	call   3818 <exit>
    printf(1, "rm .. worked!\n");
    2710:	83 ec 08             	sub    $0x8,%esp
    2713:	68 20 48 00 00       	push   $0x4820
    2718:	6a 01                	push   $0x1
    271a:	e8 4e 12 00 00       	call   396d <printf>
    exit();
    271f:	e8 f4 10 00 00       	call   3818 <exit>
    printf(1, "chdir / failed\n");
    2724:	83 ec 08             	sub    $0x8,%esp
    2727:	68 67 3c 00 00       	push   $0x3c67
    272c:	6a 01                	push   $0x1
    272e:	e8 3a 12 00 00       	call   396d <printf>
    exit();
    2733:	e8 e0 10 00 00       	call   3818 <exit>
    printf(1, "unlink dots/. worked!\n");
    2738:	83 ec 08             	sub    $0x8,%esp
    273b:	68 36 48 00 00       	push   $0x4836
    2740:	6a 01                	push   $0x1
    2742:	e8 26 12 00 00       	call   396d <printf>
    exit();
    2747:	e8 cc 10 00 00       	call   3818 <exit>
    printf(1, "unlink dots/.. worked!\n");
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 55 48 00 00       	push   $0x4855
    2754:	6a 01                	push   $0x1
    2756:	e8 12 12 00 00       	call   396d <printf>
    exit();
    275b:	e8 b8 10 00 00       	call   3818 <exit>
    printf(1, "unlink dots failed!\n");
    2760:	83 ec 08             	sub    $0x8,%esp
    2763:	68 6d 48 00 00       	push   $0x486d
    2768:	6a 01                	push   $0x1
    276a:	e8 fe 11 00 00       	call   396d <printf>
    exit();
    276f:	e8 a4 10 00 00       	call   3818 <exit>
=======
    26d7:	68 d4 47 00 00       	push   $0x47d4
    26dc:	6a 01                	push   $0x1
    26de:	e8 73 12 00 00       	call   3956 <printf>
    exit();
    26e3:	e8 19 11 00 00       	call   3801 <exit>
    printf(1, "chdir dots failed\n");
    26e8:	83 ec 08             	sub    $0x8,%esp
    26eb:	68 e7 47 00 00       	push   $0x47e7
    26f0:	6a 01                	push   $0x1
    26f2:	e8 5f 12 00 00       	call   3956 <printf>
    exit();
    26f7:	e8 05 11 00 00       	call   3801 <exit>
    printf(1, "rm . worked!\n");
    26fc:	83 ec 08             	sub    $0x8,%esp
    26ff:	68 fa 47 00 00       	push   $0x47fa
    2704:	6a 01                	push   $0x1
    2706:	e8 4b 12 00 00       	call   3956 <printf>
    exit();
    270b:	e8 f1 10 00 00       	call   3801 <exit>
    printf(1, "rm .. worked!\n");
    2710:	83 ec 08             	sub    $0x8,%esp
    2713:	68 08 48 00 00       	push   $0x4808
    2718:	6a 01                	push   $0x1
    271a:	e8 37 12 00 00       	call   3956 <printf>
    exit();
    271f:	e8 dd 10 00 00       	call   3801 <exit>
    printf(1, "chdir / failed\n");
    2724:	83 ec 08             	sub    $0x8,%esp
    2727:	68 4f 3c 00 00       	push   $0x3c4f
    272c:	6a 01                	push   $0x1
    272e:	e8 23 12 00 00       	call   3956 <printf>
    exit();
    2733:	e8 c9 10 00 00       	call   3801 <exit>
    printf(1, "unlink dots/. worked!\n");
    2738:	83 ec 08             	sub    $0x8,%esp
    273b:	68 1e 48 00 00       	push   $0x481e
    2740:	6a 01                	push   $0x1
    2742:	e8 0f 12 00 00       	call   3956 <printf>
    exit();
    2747:	e8 b5 10 00 00       	call   3801 <exit>
    printf(1, "unlink dots/.. worked!\n");
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 3d 48 00 00       	push   $0x483d
    2754:	6a 01                	push   $0x1
    2756:	e8 fb 11 00 00       	call   3956 <printf>
    exit();
    275b:	e8 a1 10 00 00       	call   3801 <exit>
    printf(1, "unlink dots failed!\n");
    2760:	83 ec 08             	sub    $0x8,%esp
    2763:	68 55 48 00 00       	push   $0x4855
    2768:	6a 01                	push   $0x1
    276a:	e8 e7 11 00 00       	call   3956 <printf>
    exit();
    276f:	e8 8d 10 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00002774 <dirfile>:

void
dirfile(void)
{
    2774:	55                   	push   %ebp
    2775:	89 e5                	mov    %esp,%ebp
    2777:	53                   	push   %ebx
    2778:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
<<<<<<< HEAD
    277b:	68 8c 48 00 00       	push   $0x488c
    2780:	6a 01                	push   $0x1
    2782:	e8 e6 11 00 00       	call   396d <printf>
=======
    277b:	68 74 48 00 00       	push   $0x4874
    2780:	6a 01                	push   $0x1
    2782:	e8 cf 11 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  fd = open("dirfile", O_CREATE);
    2787:	83 c4 08             	add    $0x8,%esp
    278a:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    278f:	68 99 48 00 00       	push   $0x4899
    2794:	e8 bf 10 00 00       	call   3858 <open>
=======
    278f:	68 81 48 00 00       	push   $0x4881
    2794:	e8 a8 10 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    2799:	83 c4 10             	add    $0x10,%esp
    279c:	85 c0                	test   %eax,%eax
    279e:	0f 88 22 01 00 00    	js     28c6 <dirfile+0x152>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    27a4:	83 ec 0c             	sub    $0xc,%esp
    27a7:	50                   	push   %eax
<<<<<<< HEAD
    27a8:	e8 93 10 00 00       	call   3840 <close>
  if(chdir("dirfile") == 0){
    27ad:	c7 04 24 99 48 00 00 	movl   $0x4899,(%esp)
    27b4:	e8 cf 10 00 00       	call   3888 <chdir>
=======
    27a8:	e8 7c 10 00 00       	call   3829 <close>
  if(chdir("dirfile") == 0){
    27ad:	c7 04 24 81 48 00 00 	movl   $0x4881,(%esp)
    27b4:	e8 b8 10 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    27b9:	83 c4 10             	add    $0x10,%esp
    27bc:	85 c0                	test   %eax,%eax
    27be:	0f 84 16 01 00 00    	je     28da <dirfile+0x166>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    27c4:	83 ec 08             	sub    $0x8,%esp
    27c7:	6a 00                	push   $0x0
<<<<<<< HEAD
    27c9:	68 d2 48 00 00       	push   $0x48d2
    27ce:	e8 85 10 00 00       	call   3858 <open>
=======
    27c9:	68 ba 48 00 00       	push   $0x48ba
    27ce:	e8 6e 10 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd >= 0){
    27d3:	83 c4 10             	add    $0x10,%esp
    27d6:	85 c0                	test   %eax,%eax
    27d8:	0f 89 10 01 00 00    	jns    28ee <dirfile+0x17a>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    27de:	83 ec 08             	sub    $0x8,%esp
    27e1:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    27e6:	68 d2 48 00 00       	push   $0x48d2
    27eb:	e8 68 10 00 00       	call   3858 <open>
=======
    27e6:	68 ba 48 00 00       	push   $0x48ba
    27eb:	e8 51 10 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd >= 0){
    27f0:	83 c4 10             	add    $0x10,%esp
    27f3:	85 c0                	test   %eax,%eax
    27f5:	0f 89 07 01 00 00    	jns    2902 <dirfile+0x18e>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    27fb:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    27fe:	68 d2 48 00 00       	push   $0x48d2
    2803:	e8 78 10 00 00       	call   3880 <mkdir>
=======
    27fe:	68 ba 48 00 00       	push   $0x48ba
    2803:	e8 61 10 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2808:	83 c4 10             	add    $0x10,%esp
    280b:	85 c0                	test   %eax,%eax
    280d:	0f 84 03 01 00 00    	je     2916 <dirfile+0x1a2>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    2813:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2816:	68 d2 48 00 00       	push   $0x48d2
    281b:	e8 48 10 00 00       	call   3868 <unlink>
=======
    2816:	68 ba 48 00 00       	push   $0x48ba
    281b:	e8 31 10 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2820:	83 c4 10             	add    $0x10,%esp
    2823:	85 c0                	test   %eax,%eax
    2825:	0f 84 ff 00 00 00    	je     292a <dirfile+0x1b6>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    282b:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    282e:	68 d2 48 00 00       	push   $0x48d2
    2833:	68 36 49 00 00       	push   $0x4936
    2838:	e8 3b 10 00 00       	call   3878 <link>
=======
    282e:	68 ba 48 00 00       	push   $0x48ba
    2833:	68 1e 49 00 00       	push   $0x491e
    2838:	e8 24 10 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    283d:	83 c4 10             	add    $0x10,%esp
    2840:	85 c0                	test   %eax,%eax
    2842:	0f 84 f6 00 00 00    	je     293e <dirfile+0x1ca>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2848:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    284b:	68 99 48 00 00       	push   $0x4899
    2850:	e8 13 10 00 00       	call   3868 <unlink>
=======
    284b:	68 81 48 00 00       	push   $0x4881
    2850:	e8 fc 0f 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2855:	83 c4 10             	add    $0x10,%esp
    2858:	85 c0                	test   %eax,%eax
    285a:	0f 85 f2 00 00 00    	jne    2952 <dirfile+0x1de>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2860:	83 ec 08             	sub    $0x8,%esp
    2863:	6a 02                	push   $0x2
<<<<<<< HEAD
    2865:	68 92 44 00 00       	push   $0x4492
    286a:	e8 e9 0f 00 00       	call   3858 <open>
=======
    2865:	68 7a 44 00 00       	push   $0x447a
    286a:	e8 d2 0f 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd >= 0){
    286f:	83 c4 10             	add    $0x10,%esp
    2872:	85 c0                	test   %eax,%eax
    2874:	0f 89 ec 00 00 00    	jns    2966 <dirfile+0x1f2>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    287a:	83 ec 08             	sub    $0x8,%esp
    287d:	6a 00                	push   $0x0
<<<<<<< HEAD
    287f:	68 92 44 00 00       	push   $0x4492
    2884:	e8 cf 0f 00 00       	call   3858 <open>
=======
    287f:	68 7a 44 00 00       	push   $0x447a
    2884:	e8 b8 0f 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2889:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    288b:	83 c4 0c             	add    $0xc,%esp
    288e:	6a 01                	push   $0x1
<<<<<<< HEAD
    2890:	68 75 45 00 00       	push   $0x4575
    2895:	50                   	push   %eax
    2896:	e8 9d 0f 00 00       	call   3838 <write>
=======
    2890:	68 5d 45 00 00       	push   $0x455d
    2895:	50                   	push   %eax
    2896:	e8 86 0f 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
    289b:	83 c4 10             	add    $0x10,%esp
    289e:	85 c0                	test   %eax,%eax
    28a0:	0f 8f d4 00 00 00    	jg     297a <dirfile+0x206>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    28a6:	83 ec 0c             	sub    $0xc,%esp
    28a9:	53                   	push   %ebx
<<<<<<< HEAD
    28aa:	e8 91 0f 00 00       	call   3840 <close>

  printf(1, "dir vs file OK\n");
    28af:	83 c4 08             	add    $0x8,%esp
    28b2:	68 69 49 00 00       	push   $0x4969
    28b7:	6a 01                	push   $0x1
    28b9:	e8 af 10 00 00       	call   396d <printf>
=======
    28aa:	e8 7a 0f 00 00       	call   3829 <close>

  printf(1, "dir vs file OK\n");
    28af:	83 c4 08             	add    $0x8,%esp
    28b2:	68 51 49 00 00       	push   $0x4951
    28b7:	6a 01                	push   $0x1
    28b9:	e8 98 10 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    28c4:	c9                   	leave  
    28c5:	c3                   	ret    
    printf(1, "create dirfile failed\n");
    28c6:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    28c9:	68 a1 48 00 00       	push   $0x48a1
    28ce:	6a 01                	push   $0x1
    28d0:	e8 98 10 00 00       	call   396d <printf>
    exit();
    28d5:	e8 3e 0f 00 00       	call   3818 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    28da:	83 ec 08             	sub    $0x8,%esp
    28dd:	68 b8 48 00 00       	push   $0x48b8
    28e2:	6a 01                	push   $0x1
    28e4:	e8 84 10 00 00       	call   396d <printf>
    exit();
    28e9:	e8 2a 0f 00 00       	call   3818 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    28ee:	83 ec 08             	sub    $0x8,%esp
    28f1:	68 dd 48 00 00       	push   $0x48dd
    28f6:	6a 01                	push   $0x1
    28f8:	e8 70 10 00 00       	call   396d <printf>
    exit();
    28fd:	e8 16 0f 00 00       	call   3818 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    2902:	83 ec 08             	sub    $0x8,%esp
    2905:	68 dd 48 00 00       	push   $0x48dd
    290a:	6a 01                	push   $0x1
    290c:	e8 5c 10 00 00       	call   396d <printf>
    exit();
    2911:	e8 02 0f 00 00       	call   3818 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2916:	83 ec 08             	sub    $0x8,%esp
    2919:	68 fb 48 00 00       	push   $0x48fb
    291e:	6a 01                	push   $0x1
    2920:	e8 48 10 00 00       	call   396d <printf>
    exit();
    2925:	e8 ee 0e 00 00       	call   3818 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    292a:	83 ec 08             	sub    $0x8,%esp
    292d:	68 18 49 00 00       	push   $0x4918
    2932:	6a 01                	push   $0x1
    2934:	e8 34 10 00 00       	call   396d <printf>
    exit();
    2939:	e8 da 0e 00 00       	call   3818 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    293e:	83 ec 08             	sub    $0x8,%esp
    2941:	68 2c 51 00 00       	push   $0x512c
    2946:	6a 01                	push   $0x1
    2948:	e8 20 10 00 00       	call   396d <printf>
    exit();
    294d:	e8 c6 0e 00 00       	call   3818 <exit>
    printf(1, "unlink dirfile failed!\n");
    2952:	83 ec 08             	sub    $0x8,%esp
    2955:	68 3d 49 00 00       	push   $0x493d
    295a:	6a 01                	push   $0x1
    295c:	e8 0c 10 00 00       	call   396d <printf>
    exit();
    2961:	e8 b2 0e 00 00       	call   3818 <exit>
    printf(1, "open . for writing succeeded!\n");
    2966:	83 ec 08             	sub    $0x8,%esp
    2969:	68 4c 51 00 00       	push   $0x514c
    296e:	6a 01                	push   $0x1
    2970:	e8 f8 0f 00 00       	call   396d <printf>
    exit();
    2975:	e8 9e 0e 00 00       	call   3818 <exit>
    printf(1, "write . succeeded!\n");
    297a:	83 ec 08             	sub    $0x8,%esp
    297d:	68 55 49 00 00       	push   $0x4955
    2982:	6a 01                	push   $0x1
    2984:	e8 e4 0f 00 00       	call   396d <printf>
    exit();
    2989:	e8 8a 0e 00 00       	call   3818 <exit>
=======
    28c9:	68 89 48 00 00       	push   $0x4889
    28ce:	6a 01                	push   $0x1
    28d0:	e8 81 10 00 00       	call   3956 <printf>
    exit();
    28d5:	e8 27 0f 00 00       	call   3801 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    28da:	83 ec 08             	sub    $0x8,%esp
    28dd:	68 a0 48 00 00       	push   $0x48a0
    28e2:	6a 01                	push   $0x1
    28e4:	e8 6d 10 00 00       	call   3956 <printf>
    exit();
    28e9:	e8 13 0f 00 00       	call   3801 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    28ee:	83 ec 08             	sub    $0x8,%esp
    28f1:	68 c5 48 00 00       	push   $0x48c5
    28f6:	6a 01                	push   $0x1
    28f8:	e8 59 10 00 00       	call   3956 <printf>
    exit();
    28fd:	e8 ff 0e 00 00       	call   3801 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    2902:	83 ec 08             	sub    $0x8,%esp
    2905:	68 c5 48 00 00       	push   $0x48c5
    290a:	6a 01                	push   $0x1
    290c:	e8 45 10 00 00       	call   3956 <printf>
    exit();
    2911:	e8 eb 0e 00 00       	call   3801 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2916:	83 ec 08             	sub    $0x8,%esp
    2919:	68 e3 48 00 00       	push   $0x48e3
    291e:	6a 01                	push   $0x1
    2920:	e8 31 10 00 00       	call   3956 <printf>
    exit();
    2925:	e8 d7 0e 00 00       	call   3801 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    292a:	83 ec 08             	sub    $0x8,%esp
    292d:	68 00 49 00 00       	push   $0x4900
    2932:	6a 01                	push   $0x1
    2934:	e8 1d 10 00 00       	call   3956 <printf>
    exit();
    2939:	e8 c3 0e 00 00       	call   3801 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    293e:	83 ec 08             	sub    $0x8,%esp
    2941:	68 14 51 00 00       	push   $0x5114
    2946:	6a 01                	push   $0x1
    2948:	e8 09 10 00 00       	call   3956 <printf>
    exit();
    294d:	e8 af 0e 00 00       	call   3801 <exit>
    printf(1, "unlink dirfile failed!\n");
    2952:	83 ec 08             	sub    $0x8,%esp
    2955:	68 25 49 00 00       	push   $0x4925
    295a:	6a 01                	push   $0x1
    295c:	e8 f5 0f 00 00       	call   3956 <printf>
    exit();
    2961:	e8 9b 0e 00 00       	call   3801 <exit>
    printf(1, "open . for writing succeeded!\n");
    2966:	83 ec 08             	sub    $0x8,%esp
    2969:	68 34 51 00 00       	push   $0x5134
    296e:	6a 01                	push   $0x1
    2970:	e8 e1 0f 00 00       	call   3956 <printf>
    exit();
    2975:	e8 87 0e 00 00       	call   3801 <exit>
    printf(1, "write . succeeded!\n");
    297a:	83 ec 08             	sub    $0x8,%esp
    297d:	68 3d 49 00 00       	push   $0x493d
    2982:	6a 01                	push   $0x1
    2984:	e8 cd 0f 00 00       	call   3956 <printf>
    exit();
    2989:	e8 73 0e 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000298e <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    298e:	55                   	push   %ebp
    298f:	89 e5                	mov    %esp,%ebp
    2991:	53                   	push   %ebx
    2992:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
<<<<<<< HEAD
    2995:	68 79 49 00 00       	push   $0x4979
    299a:	6a 01                	push   $0x1
    299c:	e8 cc 0f 00 00       	call   396d <printf>
=======
    2995:	68 61 49 00 00       	push   $0x4961
    299a:	6a 01                	push   $0x1
    299c:	e8 b5 0f 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    29a1:	83 c4 10             	add    $0x10,%esp
    29a4:	bb 00 00 00 00       	mov    $0x0,%ebx
    29a9:	eb 4c                	jmp    29f7 <iref+0x69>
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    29ab:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    29ae:	68 90 49 00 00       	push   $0x4990
    29b3:	6a 01                	push   $0x1
    29b5:	e8 b3 0f 00 00       	call   396d <printf>
      exit();
    29ba:	e8 59 0e 00 00       	call   3818 <exit>
=======
    29ae:	68 78 49 00 00       	push   $0x4978
    29b3:	6a 01                	push   $0x1
    29b5:	e8 9c 0f 00 00       	call   3956 <printf>
      exit();
    29ba:	e8 42 0e 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    29bf:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    29c2:	68 a4 49 00 00       	push   $0x49a4
    29c7:	6a 01                	push   $0x1
    29c9:	e8 9f 0f 00 00       	call   396d <printf>
      exit();
    29ce:	e8 45 0e 00 00       	call   3818 <exit>
=======
    29c2:	68 8c 49 00 00       	push   $0x498c
    29c7:	6a 01                	push   $0x1
    29c9:	e8 88 0f 00 00       	call   3956 <printf>
      exit();
    29ce:	e8 2e 0e 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

    mkdir("");
    link("README", "");
    fd = open("", O_CREATE);
    if(fd >= 0)
      close(fd);
    29d3:	83 ec 0c             	sub    $0xc,%esp
    29d6:	50                   	push   %eax
<<<<<<< HEAD
    29d7:	e8 64 0e 00 00       	call   3840 <close>
=======
    29d7:	e8 4d 0e 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    29dc:	83 c4 10             	add    $0x10,%esp
    29df:	e9 80 00 00 00       	jmp    2a64 <iref+0xd6>
    fd = open("xx", O_CREATE);
    if(fd >= 0)
      close(fd);
    unlink("xx");
    29e4:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    29e7:	68 74 45 00 00       	push   $0x4574
    29ec:	e8 77 0e 00 00       	call   3868 <unlink>
=======
    29e7:	68 5c 45 00 00       	push   $0x455c
    29ec:	e8 60 0e 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < 50 + 1; i++){
    29f1:	83 c3 01             	add    $0x1,%ebx
    29f4:	83 c4 10             	add    $0x10,%esp
    29f7:	83 fb 32             	cmp    $0x32,%ebx
    29fa:	0f 8f 92 00 00 00    	jg     2a92 <iref+0x104>
    if(mkdir("irefd") != 0){
    2a00:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2a03:	68 8a 49 00 00       	push   $0x498a
    2a08:	e8 73 0e 00 00       	call   3880 <mkdir>
=======
    2a03:	68 72 49 00 00       	push   $0x4972
    2a08:	e8 5c 0e 00 00       	call   3869 <mkdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2a0d:	83 c4 10             	add    $0x10,%esp
    2a10:	85 c0                	test   %eax,%eax
    2a12:	75 97                	jne    29ab <iref+0x1d>
    if(chdir("irefd") != 0){
    2a14:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2a17:	68 8a 49 00 00       	push   $0x498a
    2a1c:	e8 67 0e 00 00       	call   3888 <chdir>
=======
    2a17:	68 72 49 00 00       	push   $0x4972
    2a1c:	e8 50 0e 00 00       	call   3871 <chdir>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2a21:	83 c4 10             	add    $0x10,%esp
    2a24:	85 c0                	test   %eax,%eax
    2a26:	75 97                	jne    29bf <iref+0x31>
    mkdir("");
    2a28:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2a2b:	68 3f 40 00 00       	push   $0x403f
    2a30:	e8 4b 0e 00 00       	call   3880 <mkdir>
    link("README", "");
    2a35:	83 c4 08             	add    $0x8,%esp
    2a38:	68 3f 40 00 00       	push   $0x403f
    2a3d:	68 36 49 00 00       	push   $0x4936
    2a42:	e8 31 0e 00 00       	call   3878 <link>
    fd = open("", O_CREATE);
    2a47:	83 c4 08             	add    $0x8,%esp
    2a4a:	68 00 02 00 00       	push   $0x200
    2a4f:	68 3f 40 00 00       	push   $0x403f
    2a54:	e8 ff 0d 00 00       	call   3858 <open>
=======
    2a2b:	68 27 40 00 00       	push   $0x4027
    2a30:	e8 34 0e 00 00       	call   3869 <mkdir>
    link("README", "");
    2a35:	83 c4 08             	add    $0x8,%esp
    2a38:	68 27 40 00 00       	push   $0x4027
    2a3d:	68 1e 49 00 00       	push   $0x491e
    2a42:	e8 1a 0e 00 00       	call   3861 <link>
    fd = open("", O_CREATE);
    2a47:	83 c4 08             	add    $0x8,%esp
    2a4a:	68 00 02 00 00       	push   $0x200
    2a4f:	68 27 40 00 00       	push   $0x4027
    2a54:	e8 e8 0d 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(fd >= 0)
    2a59:	83 c4 10             	add    $0x10,%esp
    2a5c:	85 c0                	test   %eax,%eax
    2a5e:	0f 89 6f ff ff ff    	jns    29d3 <iref+0x45>
    fd = open("xx", O_CREATE);
    2a64:	83 ec 08             	sub    $0x8,%esp
    2a67:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    2a6c:	68 74 45 00 00       	push   $0x4574
    2a71:	e8 e2 0d 00 00       	call   3858 <open>
=======
    2a6c:	68 5c 45 00 00       	push   $0x455c
    2a71:	e8 cb 0d 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(fd >= 0)
    2a76:	83 c4 10             	add    $0x10,%esp
    2a79:	85 c0                	test   %eax,%eax
    2a7b:	0f 88 63 ff ff ff    	js     29e4 <iref+0x56>
      close(fd);
    2a81:	83 ec 0c             	sub    $0xc,%esp
    2a84:	50                   	push   %eax
<<<<<<< HEAD
    2a85:	e8 b6 0d 00 00       	call   3840 <close>
=======
    2a85:	e8 9f 0d 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2a8a:	83 c4 10             	add    $0x10,%esp
    2a8d:	e9 52 ff ff ff       	jmp    29e4 <iref+0x56>
  }

  chdir("/");
    2a92:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
    2a95:	68 65 3c 00 00       	push   $0x3c65
    2a9a:	e8 e9 0d 00 00       	call   3888 <chdir>
  printf(1, "empty file name OK\n");
    2a9f:	83 c4 08             	add    $0x8,%esp
    2aa2:	68 b8 49 00 00       	push   $0x49b8
    2aa7:	6a 01                	push   $0x1
    2aa9:	e8 bf 0e 00 00       	call   396d <printf>
=======
    2a95:	68 4d 3c 00 00       	push   $0x3c4d
    2a9a:	e8 d2 0d 00 00       	call   3871 <chdir>
  printf(1, "empty file name OK\n");
    2a9f:	83 c4 08             	add    $0x8,%esp
    2aa2:	68 a0 49 00 00       	push   $0x49a0
    2aa7:	6a 01                	push   $0x1
    2aa9:	e8 a8 0e 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    2aae:	83 c4 10             	add    $0x10,%esp
    2ab1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ab4:	c9                   	leave  
    2ab5:	c3                   	ret    

00002ab6 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2ab6:	55                   	push   %ebp
    2ab7:	89 e5                	mov    %esp,%ebp
    2ab9:	53                   	push   %ebx
    2aba:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
<<<<<<< HEAD
    2abd:	68 cc 49 00 00       	push   $0x49cc
    2ac2:	6a 01                	push   $0x1
    2ac4:	e8 a4 0e 00 00       	call   396d <printf>
=======
    2abd:	68 b4 49 00 00       	push   $0x49b4
    2ac2:	6a 01                	push   $0x1
    2ac4:	e8 8d 0e 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(n=0; n<1000; n++){
    2ac9:	83 c4 10             	add    $0x10,%esp
    2acc:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ad1:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
    2ad7:	7f 15                	jg     2aee <forktest+0x38>
    pid = fork();
<<<<<<< HEAD
    2ad9:	e8 32 0d 00 00       	call   3810 <fork>
=======
    2ad9:	e8 1b 0d 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(pid < 0)
    2ade:	85 c0                	test   %eax,%eax
    2ae0:	78 0c                	js     2aee <forktest+0x38>
      break;
    if(pid == 0)
    2ae2:	74 05                	je     2ae9 <forktest+0x33>
  for(n=0; n<1000; n++){
    2ae4:	83 c3 01             	add    $0x1,%ebx
    2ae7:	eb e8                	jmp    2ad1 <forktest+0x1b>
      exit();
<<<<<<< HEAD
    2ae9:	e8 2a 0d 00 00       	call   3818 <exit>
=======
    2ae9:	e8 13 0d 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }

  if(n == 1000){
    2aee:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2af4:	74 12                	je     2b08 <forktest+0x52>
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2af6:	85 db                	test   %ebx,%ebx
    2af8:	7e 36                	jle    2b30 <forktest+0x7a>
    if(wait() < 0){
<<<<<<< HEAD
    2afa:	e8 21 0d 00 00       	call   3820 <wait>
=======
    2afa:	e8 0a 0d 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2aff:	85 c0                	test   %eax,%eax
    2b01:	78 19                	js     2b1c <forktest+0x66>
  for(; n > 0; n--){
    2b03:	83 eb 01             	sub    $0x1,%ebx
    2b06:	eb ee                	jmp    2af6 <forktest+0x40>
    printf(1, "fork claimed to work 1000 times!\n");
    2b08:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2b0b:	68 6c 51 00 00       	push   $0x516c
    2b10:	6a 01                	push   $0x1
    2b12:	e8 56 0e 00 00       	call   396d <printf>
    exit();
    2b17:	e8 fc 0c 00 00       	call   3818 <exit>
      printf(1, "wait stopped early\n");
    2b1c:	83 ec 08             	sub    $0x8,%esp
    2b1f:	68 d7 49 00 00       	push   $0x49d7
    2b24:	6a 01                	push   $0x1
    2b26:	e8 42 0e 00 00       	call   396d <printf>
      exit();
    2b2b:	e8 e8 0c 00 00       	call   3818 <exit>
=======
    2b0b:	68 54 51 00 00       	push   $0x5154
    2b10:	6a 01                	push   $0x1
    2b12:	e8 3f 0e 00 00       	call   3956 <printf>
    exit();
    2b17:	e8 e5 0c 00 00       	call   3801 <exit>
      printf(1, "wait stopped early\n");
    2b1c:	83 ec 08             	sub    $0x8,%esp
    2b1f:	68 bf 49 00 00       	push   $0x49bf
    2b24:	6a 01                	push   $0x1
    2b26:	e8 2b 0e 00 00       	call   3956 <printf>
      exit();
    2b2b:	e8 d1 0c 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  if(wait() != -1){
<<<<<<< HEAD
    2b30:	e8 eb 0c 00 00       	call   3820 <wait>
=======
    2b30:	e8 d4 0c 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2b35:	83 f8 ff             	cmp    $0xffffffff,%eax
    2b38:	75 17                	jne    2b51 <forktest+0x9b>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2b3a:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2b3d:	68 fe 49 00 00       	push   $0x49fe
    2b42:	6a 01                	push   $0x1
    2b44:	e8 24 0e 00 00       	call   396d <printf>
=======
    2b3d:	68 e6 49 00 00       	push   $0x49e6
    2b42:	6a 01                	push   $0x1
    2b44:	e8 0d 0e 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    2b49:	83 c4 10             	add    $0x10,%esp
    2b4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b4f:	c9                   	leave  
    2b50:	c3                   	ret    
    printf(1, "wait got too many\n");
    2b51:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2b54:	68 eb 49 00 00       	push   $0x49eb
    2b59:	6a 01                	push   $0x1
    2b5b:	e8 0d 0e 00 00       	call   396d <printf>
    exit();
    2b60:	e8 b3 0c 00 00       	call   3818 <exit>
=======
    2b54:	68 d3 49 00 00       	push   $0x49d3
    2b59:	6a 01                	push   $0x1
    2b5b:	e8 f6 0d 00 00       	call   3956 <printf>
    exit();
    2b60:	e8 9c 0c 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00002b65 <sbrktest>:

void
sbrktest(void)
{
    2b65:	55                   	push   %ebp
    2b66:	89 e5                	mov    %esp,%ebp
    2b68:	57                   	push   %edi
    2b69:	56                   	push   %esi
    2b6a:	53                   	push   %ebx
    2b6b:	83 ec 54             	sub    $0x54,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
<<<<<<< HEAD
    2b6e:	68 0c 4a 00 00       	push   $0x4a0c
    2b73:	ff 35 78 5d 00 00    	push   0x5d78
    2b79:	e8 ef 0d 00 00       	call   396d <printf>
  oldbrk = sbrk(0);
    2b7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b85:	e8 16 0d 00 00       	call   38a0 <sbrk>
=======
    2b6e:	68 f4 49 00 00       	push   $0x49f4
    2b73:	ff 35 5c 5d 00 00    	push   0x5d5c
    2b79:	e8 d8 0d 00 00       	call   3956 <printf>
  oldbrk = sbrk(0);
    2b7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b85:	e8 ff 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2b8a:	89 c7                	mov    %eax,%edi

  // can one sbrk() less than a page?
  a = sbrk(0);
    2b8c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
<<<<<<< HEAD
    2b93:	e8 08 0d 00 00       	call   38a0 <sbrk>
=======
    2b93:	e8 f1 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2b98:	89 c6                	mov    %eax,%esi
  int i;
  for(i = 0; i < 5000; i++){
    2b9a:	83 c4 10             	add    $0x10,%esp
    2b9d:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ba2:	81 fb 87 13 00 00    	cmp    $0x1387,%ebx
    2ba8:	7f 3a                	jg     2be4 <sbrktest+0x7f>
    b = sbrk(1);
    2baa:	83 ec 0c             	sub    $0xc,%esp
    2bad:	6a 01                	push   $0x1
<<<<<<< HEAD
    2baf:	e8 ec 0c 00 00       	call   38a0 <sbrk>
=======
    2baf:	e8 d5 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(b != a){
    2bb4:	83 c4 10             	add    $0x10,%esp
    2bb7:	39 c6                	cmp    %eax,%esi
    2bb9:	75 0b                	jne    2bc6 <sbrktest+0x61>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2bbb:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2bbe:	8d 70 01             	lea    0x1(%eax),%esi
  for(i = 0; i < 5000; i++){
    2bc1:	83 c3 01             	add    $0x1,%ebx
    2bc4:	eb dc                	jmp    2ba2 <sbrktest+0x3d>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2bc6:	83 ec 0c             	sub    $0xc,%esp
    2bc9:	50                   	push   %eax
    2bca:	56                   	push   %esi
    2bcb:	53                   	push   %ebx
<<<<<<< HEAD
    2bcc:	68 17 4a 00 00       	push   $0x4a17
    2bd1:	ff 35 78 5d 00 00    	push   0x5d78
    2bd7:	e8 91 0d 00 00       	call   396d <printf>
      exit();
    2bdc:	83 c4 20             	add    $0x20,%esp
    2bdf:	e8 34 0c 00 00       	call   3818 <exit>
  }
  pid = fork();
    2be4:	e8 27 0c 00 00       	call   3810 <fork>
=======
    2bcc:	68 ff 49 00 00       	push   $0x49ff
    2bd1:	ff 35 5c 5d 00 00    	push   0x5d5c
    2bd7:	e8 7a 0d 00 00       	call   3956 <printf>
      exit();
    2bdc:	83 c4 20             	add    $0x20,%esp
    2bdf:	e8 1d 0c 00 00       	call   3801 <exit>
  }
  pid = fork();
    2be4:	e8 10 0c 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2be9:	89 c3                	mov    %eax,%ebx
  if(pid < 0){
    2beb:	85 c0                	test   %eax,%eax
    2bed:	0f 88 4c 01 00 00    	js     2d3f <sbrktest+0x1da>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2bf3:	83 ec 0c             	sub    $0xc,%esp
    2bf6:	6a 01                	push   $0x1
<<<<<<< HEAD
    2bf8:	e8 a3 0c 00 00       	call   38a0 <sbrk>
  c = sbrk(1);
    2bfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c04:	e8 97 0c 00 00       	call   38a0 <sbrk>
=======
    2bf8:	e8 8c 0c 00 00       	call   3889 <sbrk>
  c = sbrk(1);
    2bfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c04:	e8 80 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(c != a + 1){
    2c09:	83 c6 01             	add    $0x1,%esi
    2c0c:	83 c4 10             	add    $0x10,%esp
    2c0f:	39 c6                	cmp    %eax,%esi
    2c11:	0f 85 40 01 00 00    	jne    2d57 <sbrktest+0x1f2>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2c17:	85 db                	test   %ebx,%ebx
    2c19:	0f 84 50 01 00 00    	je     2d6f <sbrktest+0x20a>
    exit();
  wait();
<<<<<<< HEAD
    2c1f:	e8 fc 0b 00 00       	call   3820 <wait>
=======
    2c1f:	e8 e5 0b 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2c24:	83 ec 0c             	sub    $0xc,%esp
    2c27:	6a 00                	push   $0x0
<<<<<<< HEAD
    2c29:	e8 72 0c 00 00       	call   38a0 <sbrk>
=======
    2c29:	e8 5b 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2c2e:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2c30:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2c35:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2c37:	89 04 24             	mov    %eax,(%esp)
<<<<<<< HEAD
    2c3a:	e8 61 0c 00 00       	call   38a0 <sbrk>
=======
    2c3a:	e8 4a 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if (p != a) {
    2c3f:	83 c4 10             	add    $0x10,%esp
    2c42:	39 c3                	cmp    %eax,%ebx
    2c44:	0f 85 2a 01 00 00    	jne    2d74 <sbrktest+0x20f>
  }
  lastaddr = (char*) (BIG-1);
  //*lastaddr = 99; // Remzi: Why doesn't this work anymore?

  // can one de-allocate?
  a = sbrk(0);
    2c4a:	83 ec 0c             	sub    $0xc,%esp
    2c4d:	6a 00                	push   $0x0
<<<<<<< HEAD
    2c4f:	e8 4c 0c 00 00       	call   38a0 <sbrk>
    2c54:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2c56:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2c5d:	e8 3e 0c 00 00       	call   38a0 <sbrk>
=======
    2c4f:	e8 35 0c 00 00       	call   3889 <sbrk>
    2c54:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2c56:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2c5d:	e8 27 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(c == (char*)0xffffffff){
    2c62:	83 c4 10             	add    $0x10,%esp
    2c65:	83 f8 ff             	cmp    $0xffffffff,%eax
    2c68:	0f 84 1e 01 00 00    	je     2d8c <sbrktest+0x227>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2c6e:	83 ec 0c             	sub    $0xc,%esp
    2c71:	6a 00                	push   $0x0
<<<<<<< HEAD
    2c73:	e8 28 0c 00 00       	call   38a0 <sbrk>
=======
    2c73:	e8 11 0c 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(c != a - 4096){
    2c78:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2c7e:	83 c4 10             	add    $0x10,%esp
    2c81:	39 c2                	cmp    %eax,%edx
    2c83:	0f 85 1b 01 00 00    	jne    2da4 <sbrktest+0x23f>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2c89:	83 ec 0c             	sub    $0xc,%esp
    2c8c:	6a 00                	push   $0x0
<<<<<<< HEAD
    2c8e:	e8 0d 0c 00 00       	call   38a0 <sbrk>
    2c93:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2c95:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2c9c:	e8 ff 0b 00 00       	call   38a0 <sbrk>
=======
    2c8e:	e8 f6 0b 00 00       	call   3889 <sbrk>
    2c93:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2c95:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2c9c:	e8 e8 0b 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2ca1:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2ca3:	83 c4 10             	add    $0x10,%esp
    2ca6:	39 c3                	cmp    %eax,%ebx
    2ca8:	0f 85 0d 01 00 00    	jne    2dbb <sbrktest+0x256>
    2cae:	83 ec 0c             	sub    $0xc,%esp
    2cb1:	6a 00                	push   $0x0
<<<<<<< HEAD
    2cb3:	e8 e8 0b 00 00       	call   38a0 <sbrk>
=======
    2cb3:	e8 d1 0b 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2cb8:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2cbe:	83 c4 10             	add    $0x10,%esp
    2cc1:	39 c2                	cmp    %eax,%edx
    2cc3:	0f 85 f2 00 00 00    	jne    2dbb <sbrktest+0x256>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2cc9:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2cd0:	0f 84 fc 00 00 00    	je     2dd2 <sbrktest+0x26d>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2cd6:	83 ec 0c             	sub    $0xc,%esp
    2cd9:	6a 00                	push   $0x0
<<<<<<< HEAD
    2cdb:	e8 c0 0b 00 00       	call   38a0 <sbrk>
    2ce0:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2ce2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ce9:	e8 b2 0b 00 00       	call   38a0 <sbrk>
=======
    2cdb:	e8 a9 0b 00 00       	call   3889 <sbrk>
    2ce0:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2ce2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ce9:	e8 9b 0b 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2cee:	89 c2                	mov    %eax,%edx
    2cf0:	89 f8                	mov    %edi,%eax
    2cf2:	29 d0                	sub    %edx,%eax
    2cf4:	89 04 24             	mov    %eax,(%esp)
<<<<<<< HEAD
    2cf7:	e8 a4 0b 00 00       	call   38a0 <sbrk>
=======
    2cf7:	e8 8d 0b 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(c != a){
    2cfc:	83 c4 10             	add    $0x10,%esp
    2cff:	39 c3                	cmp    %eax,%ebx
    2d01:	0f 85 e3 00 00 00    	jne    2dea <sbrktest+0x285>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2d07:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2d0c:	81 fb 7f 84 1e 80    	cmp    $0x801e847f,%ebx
    2d12:	0f 87 23 01 00 00    	ja     2e3b <sbrktest+0x2d6>
    ppid = getpid();
<<<<<<< HEAD
    2d18:	e8 7b 0b 00 00       	call   3898 <getpid>
    2d1d:	89 c6                	mov    %eax,%esi
    pid = fork();
    2d1f:	e8 ec 0a 00 00       	call   3810 <fork>
=======
    2d18:	e8 64 0b 00 00       	call   3881 <getpid>
    2d1d:	89 c6                	mov    %eax,%esi
    pid = fork();
    2d1f:	e8 d5 0a 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(pid < 0){
    2d24:	85 c0                	test   %eax,%eax
    2d26:	0f 88 d5 00 00 00    	js     2e01 <sbrktest+0x29c>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2d2c:	0f 84 e7 00 00 00    	je     2e19 <sbrktest+0x2b4>
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
<<<<<<< HEAD
    2d32:	e8 e9 0a 00 00       	call   3820 <wait>
=======
    2d32:	e8 d2 0a 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2d37:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2d3d:	eb cd                	jmp    2d0c <sbrktest+0x1a7>
    printf(stdout, "sbrk test fork failed\n");
    2d3f:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2d42:	68 32 4a 00 00       	push   $0x4a32
    2d47:	ff 35 78 5d 00 00    	push   0x5d78
    2d4d:	e8 1b 0c 00 00       	call   396d <printf>
    exit();
    2d52:	e8 c1 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2d57:	83 ec 08             	sub    $0x8,%esp
    2d5a:	68 49 4a 00 00       	push   $0x4a49
    2d5f:	ff 35 78 5d 00 00    	push   0x5d78
    2d65:	e8 03 0c 00 00       	call   396d <printf>
    exit();
    2d6a:	e8 a9 0a 00 00       	call   3818 <exit>
    exit();
    2d6f:	e8 a4 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2d74:	83 ec 08             	sub    $0x8,%esp
    2d77:	68 90 51 00 00       	push   $0x5190
    2d7c:	ff 35 78 5d 00 00    	push   0x5d78
    2d82:	e8 e6 0b 00 00       	call   396d <printf>
    exit();
    2d87:	e8 8c 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2d8c:	83 ec 08             	sub    $0x8,%esp
    2d8f:	68 65 4a 00 00       	push   $0x4a65
    2d94:	ff 35 78 5d 00 00    	push   0x5d78
    2d9a:	e8 ce 0b 00 00       	call   396d <printf>
    exit();
    2d9f:	e8 74 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2da4:	50                   	push   %eax
    2da5:	53                   	push   %ebx
    2da6:	68 d0 51 00 00       	push   $0x51d0
    2dab:	ff 35 78 5d 00 00    	push   0x5d78
    2db1:	e8 b7 0b 00 00       	call   396d <printf>
    exit();
    2db6:	e8 5d 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2dbb:	56                   	push   %esi
    2dbc:	53                   	push   %ebx
    2dbd:	68 08 52 00 00       	push   $0x5208
    2dc2:	ff 35 78 5d 00 00    	push   0x5d78
    2dc8:	e8 a0 0b 00 00       	call   396d <printf>
    exit();
    2dcd:	e8 46 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2dd2:	83 ec 08             	sub    $0x8,%esp
    2dd5:	68 30 52 00 00       	push   $0x5230
    2dda:	ff 35 78 5d 00 00    	push   0x5d78
    2de0:	e8 88 0b 00 00       	call   396d <printf>
    exit();
    2de5:	e8 2e 0a 00 00       	call   3818 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2dea:	50                   	push   %eax
    2deb:	53                   	push   %ebx
    2dec:	68 60 52 00 00       	push   $0x5260
    2df1:	ff 35 78 5d 00 00    	push   0x5d78
    2df7:	e8 71 0b 00 00       	call   396d <printf>
    exit();
    2dfc:	e8 17 0a 00 00       	call   3818 <exit>
      printf(stdout, "fork failed\n");
    2e01:	83 ec 08             	sub    $0x8,%esp
    2e04:	68 5d 4b 00 00       	push   $0x4b5d
    2e09:	ff 35 78 5d 00 00    	push   0x5d78
    2e0f:	e8 59 0b 00 00       	call   396d <printf>
      exit();
    2e14:	e8 ff 09 00 00       	call   3818 <exit>
=======
    2d42:	68 1a 4a 00 00       	push   $0x4a1a
    2d47:	ff 35 5c 5d 00 00    	push   0x5d5c
    2d4d:	e8 04 0c 00 00       	call   3956 <printf>
    exit();
    2d52:	e8 aa 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2d57:	83 ec 08             	sub    $0x8,%esp
    2d5a:	68 31 4a 00 00       	push   $0x4a31
    2d5f:	ff 35 5c 5d 00 00    	push   0x5d5c
    2d65:	e8 ec 0b 00 00       	call   3956 <printf>
    exit();
    2d6a:	e8 92 0a 00 00       	call   3801 <exit>
    exit();
    2d6f:	e8 8d 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2d74:	83 ec 08             	sub    $0x8,%esp
    2d77:	68 78 51 00 00       	push   $0x5178
    2d7c:	ff 35 5c 5d 00 00    	push   0x5d5c
    2d82:	e8 cf 0b 00 00       	call   3956 <printf>
    exit();
    2d87:	e8 75 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2d8c:	83 ec 08             	sub    $0x8,%esp
    2d8f:	68 4d 4a 00 00       	push   $0x4a4d
    2d94:	ff 35 5c 5d 00 00    	push   0x5d5c
    2d9a:	e8 b7 0b 00 00       	call   3956 <printf>
    exit();
    2d9f:	e8 5d 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2da4:	50                   	push   %eax
    2da5:	53                   	push   %ebx
    2da6:	68 b8 51 00 00       	push   $0x51b8
    2dab:	ff 35 5c 5d 00 00    	push   0x5d5c
    2db1:	e8 a0 0b 00 00       	call   3956 <printf>
    exit();
    2db6:	e8 46 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2dbb:	56                   	push   %esi
    2dbc:	53                   	push   %ebx
    2dbd:	68 f0 51 00 00       	push   $0x51f0
    2dc2:	ff 35 5c 5d 00 00    	push   0x5d5c
    2dc8:	e8 89 0b 00 00       	call   3956 <printf>
    exit();
    2dcd:	e8 2f 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2dd2:	83 ec 08             	sub    $0x8,%esp
    2dd5:	68 18 52 00 00       	push   $0x5218
    2dda:	ff 35 5c 5d 00 00    	push   0x5d5c
    2de0:	e8 71 0b 00 00       	call   3956 <printf>
    exit();
    2de5:	e8 17 0a 00 00       	call   3801 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2dea:	50                   	push   %eax
    2deb:	53                   	push   %ebx
    2dec:	68 48 52 00 00       	push   $0x5248
    2df1:	ff 35 5c 5d 00 00    	push   0x5d5c
    2df7:	e8 5a 0b 00 00       	call   3956 <printf>
    exit();
    2dfc:	e8 00 0a 00 00       	call   3801 <exit>
      printf(stdout, "fork failed\n");
    2e01:	83 ec 08             	sub    $0x8,%esp
    2e04:	68 45 4b 00 00       	push   $0x4b45
    2e09:	ff 35 5c 5d 00 00    	push   0x5d5c
    2e0f:	e8 42 0b 00 00       	call   3956 <printf>
      exit();
    2e14:	e8 e8 09 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2e19:	0f be 03             	movsbl (%ebx),%eax
    2e1c:	50                   	push   %eax
    2e1d:	53                   	push   %ebx
<<<<<<< HEAD
    2e1e:	68 80 4a 00 00       	push   $0x4a80
    2e23:	ff 35 78 5d 00 00    	push   0x5d78
    2e29:	e8 3f 0b 00 00       	call   396d <printf>
      kill(ppid);
    2e2e:	89 34 24             	mov    %esi,(%esp)
    2e31:	e8 12 0a 00 00       	call   3848 <kill>
      exit();
    2e36:	e8 dd 09 00 00       	call   3818 <exit>
=======
    2e1e:	68 68 4a 00 00       	push   $0x4a68
    2e23:	ff 35 5c 5d 00 00    	push   0x5d5c
    2e29:	e8 28 0b 00 00       	call   3956 <printf>
      kill(ppid);
    2e2e:	89 34 24             	mov    %esi,(%esp)
    2e31:	e8 fb 09 00 00       	call   3831 <kill>
      exit();
    2e36:	e8 c6 09 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2e3b:	83 ec 0c             	sub    $0xc,%esp
    2e3e:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2e41:	50                   	push   %eax
<<<<<<< HEAD
    2e42:	e8 e1 09 00 00       	call   3828 <pipe>
=======
    2e42:	e8 ca 09 00 00       	call   3811 <pipe>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2e47:	89 c3                	mov    %eax,%ebx
    2e49:	83 c4 10             	add    $0x10,%esp
    2e4c:	85 c0                	test   %eax,%eax
    2e4e:	75 04                	jne    2e54 <sbrktest+0x2ef>
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2e50:	89 c6                	mov    %eax,%esi
    2e52:	eb 59                	jmp    2ead <sbrktest+0x348>
    printf(1, "pipe() failed\n");
    2e54:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2e57:	68 55 3f 00 00       	push   $0x3f55
    2e5c:	6a 01                	push   $0x1
    2e5e:	e8 0a 0b 00 00       	call   396d <printf>
    exit();
    2e63:	e8 b0 09 00 00       	call   3818 <exit>
=======
    2e57:	68 3d 3f 00 00       	push   $0x3f3d
    2e5c:	6a 01                	push   $0x1
    2e5e:	e8 f3 0a 00 00       	call   3956 <printf>
    exit();
    2e63:	e8 99 09 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2e68:	83 ec 0c             	sub    $0xc,%esp
    2e6b:	6a 00                	push   $0x0
<<<<<<< HEAD
    2e6d:	e8 2e 0a 00 00       	call   38a0 <sbrk>
=======
    2e6d:	e8 17 0a 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2e72:	89 c2                	mov    %eax,%edx
    2e74:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e79:	29 d0                	sub    %edx,%eax
    2e7b:	89 04 24             	mov    %eax,(%esp)
<<<<<<< HEAD
    2e7e:	e8 1d 0a 00 00       	call   38a0 <sbrk>
      write(fds[1], "x", 1);
    2e83:	83 c4 0c             	add    $0xc,%esp
    2e86:	6a 01                	push   $0x1
    2e88:	68 75 45 00 00       	push   $0x4575
    2e8d:	ff 75 e4             	push   -0x1c(%ebp)
    2e90:	e8 a3 09 00 00       	call   3838 <write>
=======
    2e7e:	e8 06 0a 00 00       	call   3889 <sbrk>
      write(fds[1], "x", 1);
    2e83:	83 c4 0c             	add    $0xc,%esp
    2e86:	6a 01                	push   $0x1
    2e88:	68 5d 45 00 00       	push   $0x455d
    2e8d:	ff 75 e4             	push   -0x1c(%ebp)
    2e90:	e8 8c 09 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2e95:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    2e98:	83 ec 0c             	sub    $0xc,%esp
    2e9b:	68 e8 03 00 00       	push   $0x3e8
<<<<<<< HEAD
    2ea0:	e8 03 0a 00 00       	call   38a8 <sleep>
=======
    2ea0:	e8 ec 09 00 00       	call   3891 <sleep>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2ea5:	83 c4 10             	add    $0x10,%esp
    2ea8:	eb ee                	jmp    2e98 <sbrktest+0x333>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2eaa:	83 c6 01             	add    $0x1,%esi
    2ead:	83 fe 09             	cmp    $0x9,%esi
    2eb0:	77 28                	ja     2eda <sbrktest+0x375>
    if((pids[i] = fork()) == 0){
<<<<<<< HEAD
    2eb2:	e8 59 09 00 00       	call   3810 <fork>
=======
    2eb2:	e8 42 09 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2eb7:	89 44 b5 b8          	mov    %eax,-0x48(%ebp,%esi,4)
    2ebb:	85 c0                	test   %eax,%eax
    2ebd:	74 a9                	je     2e68 <sbrktest+0x303>
    }
    if(pids[i] != -1)
    2ebf:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ec2:	74 e6                	je     2eaa <sbrktest+0x345>
      read(fds[0], &scratch, 1);
    2ec4:	83 ec 04             	sub    $0x4,%esp
    2ec7:	6a 01                	push   $0x1
    2ec9:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2ecc:	50                   	push   %eax
    2ecd:	ff 75 e0             	push   -0x20(%ebp)
<<<<<<< HEAD
    2ed0:	e8 5b 09 00 00       	call   3830 <read>
=======
    2ed0:	e8 44 09 00 00       	call   3819 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2ed5:	83 c4 10             	add    $0x10,%esp
    2ed8:	eb d0                	jmp    2eaa <sbrktest+0x345>
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2eda:	83 ec 0c             	sub    $0xc,%esp
    2edd:	68 00 10 00 00       	push   $0x1000
<<<<<<< HEAD
    2ee2:	e8 b9 09 00 00       	call   38a0 <sbrk>
=======
    2ee2:	e8 a2 09 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2ee7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2ee9:	83 c4 10             	add    $0x10,%esp
    2eec:	eb 03                	jmp    2ef1 <sbrktest+0x38c>
    2eee:	83 c3 01             	add    $0x1,%ebx
    2ef1:	83 fb 09             	cmp    $0x9,%ebx
    2ef4:	77 1c                	ja     2f12 <sbrktest+0x3ad>
    if(pids[i] == -1)
    2ef6:	8b 44 9d b8          	mov    -0x48(%ebp,%ebx,4),%eax
    2efa:	83 f8 ff             	cmp    $0xffffffff,%eax
    2efd:	74 ef                	je     2eee <sbrktest+0x389>
      continue;
    kill(pids[i]);
    2eff:	83 ec 0c             	sub    $0xc,%esp
    2f02:	50                   	push   %eax
<<<<<<< HEAD
    2f03:	e8 40 09 00 00       	call   3848 <kill>
    wait();
    2f08:	e8 13 09 00 00       	call   3820 <wait>
=======
    2f03:	e8 29 09 00 00       	call   3831 <kill>
    wait();
    2f08:	e8 fc 08 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2f0d:	83 c4 10             	add    $0x10,%esp
    2f10:	eb dc                	jmp    2eee <sbrktest+0x389>
  }
  if(c == (char*)0xffffffff){
    2f12:	83 fe ff             	cmp    $0xffffffff,%esi
    2f15:	74 2f                	je     2f46 <sbrktest+0x3e1>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f17:	83 ec 0c             	sub    $0xc,%esp
    2f1a:	6a 00                	push   $0x0
<<<<<<< HEAD
    2f1c:	e8 7f 09 00 00       	call   38a0 <sbrk>
=======
    2f1c:	e8 68 09 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2f21:	83 c4 10             	add    $0x10,%esp
    2f24:	39 c7                	cmp    %eax,%edi
    2f26:	72 36                	jb     2f5e <sbrktest+0x3f9>
    sbrk(-(sbrk(0) - oldbrk));

  printf(stdout, "sbrk test OK\n");
    2f28:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2f2b:	68 b4 4a 00 00       	push   $0x4ab4
    2f30:	ff 35 78 5d 00 00    	push   0x5d78
    2f36:	e8 32 0a 00 00       	call   396d <printf>
=======
    2f2b:	68 9c 4a 00 00       	push   $0x4a9c
    2f30:	ff 35 5c 5d 00 00    	push   0x5d5c
    2f36:	e8 1b 0a 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    2f3b:	83 c4 10             	add    $0x10,%esp
    2f3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2f41:	5b                   	pop    %ebx
    2f42:	5e                   	pop    %esi
    2f43:	5f                   	pop    %edi
    2f44:	5d                   	pop    %ebp
    2f45:	c3                   	ret    
    printf(stdout, "failed sbrk leaked memory\n");
    2f46:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2f49:	68 99 4a 00 00       	push   $0x4a99
    2f4e:	ff 35 78 5d 00 00    	push   0x5d78
    2f54:	e8 14 0a 00 00       	call   396d <printf>
    exit();
    2f59:	e8 ba 08 00 00       	call   3818 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    2f5e:	83 ec 0c             	sub    $0xc,%esp
    2f61:	6a 00                	push   $0x0
    2f63:	e8 38 09 00 00       	call   38a0 <sbrk>
    2f68:	29 c7                	sub    %eax,%edi
    2f6a:	89 3c 24             	mov    %edi,(%esp)
    2f6d:	e8 2e 09 00 00       	call   38a0 <sbrk>
=======
    2f49:	68 81 4a 00 00       	push   $0x4a81
    2f4e:	ff 35 5c 5d 00 00    	push   0x5d5c
    2f54:	e8 fd 09 00 00       	call   3956 <printf>
    exit();
    2f59:	e8 a3 08 00 00       	call   3801 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    2f5e:	83 ec 0c             	sub    $0xc,%esp
    2f61:	6a 00                	push   $0x0
    2f63:	e8 21 09 00 00       	call   3889 <sbrk>
    2f68:	29 c7                	sub    %eax,%edi
    2f6a:	89 3c 24             	mov    %edi,(%esp)
    2f6d:	e8 17 09 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2f72:	83 c4 10             	add    $0x10,%esp
    2f75:	eb b1                	jmp    2f28 <sbrktest+0x3c3>

00002f77 <validateint>:
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    2f77:	c3                   	ret    

00002f78 <validatetest>:

void
validatetest(void)
{
    2f78:	55                   	push   %ebp
    2f79:	89 e5                	mov    %esp,%ebp
    2f7b:	56                   	push   %esi
    2f7c:	53                   	push   %ebx
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2f7d:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    2f80:	68 c2 4a 00 00       	push   $0x4ac2
    2f85:	ff 35 78 5d 00 00    	push   0x5d78
    2f8b:	e8 dd 09 00 00       	call   396d <printf>
=======
    2f80:	68 aa 4a 00 00       	push   $0x4aaa
    2f85:	ff 35 5c 5d 00 00    	push   0x5d5c
    2f8b:	e8 c6 09 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    2f90:	83 c4 10             	add    $0x10,%esp
    2f93:	be 00 00 00 00       	mov    $0x0,%esi
    2f98:	81 fe 00 30 11 00    	cmp    $0x113000,%esi
    2f9e:	77 69                	ja     3009 <validatetest+0x91>
    if((pid = fork()) == 0){
<<<<<<< HEAD
    2fa0:	e8 6b 08 00 00       	call   3810 <fork>
=======
    2fa0:	e8 54 08 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2fa5:	89 c3                	mov    %eax,%ebx
    2fa7:	85 c0                	test   %eax,%eax
    2fa9:	74 41                	je     2fec <validatetest+0x74>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    2fab:	83 ec 0c             	sub    $0xc,%esp
    2fae:	6a 00                	push   $0x0
<<<<<<< HEAD
    2fb0:	e8 f3 08 00 00       	call   38a8 <sleep>
    sleep(0);
    2fb5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fbc:	e8 e7 08 00 00       	call   38a8 <sleep>
    kill(pid);
    2fc1:	89 1c 24             	mov    %ebx,(%esp)
    2fc4:	e8 7f 08 00 00       	call   3848 <kill>
    wait();
    2fc9:	e8 52 08 00 00       	call   3820 <wait>
=======
    2fb0:	e8 dc 08 00 00       	call   3891 <sleep>
    sleep(0);
    2fb5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fbc:	e8 d0 08 00 00       	call   3891 <sleep>
    kill(pid);
    2fc1:	89 1c 24             	mov    %ebx,(%esp)
    2fc4:	e8 68 08 00 00       	call   3831 <kill>
    wait();
    2fc9:	e8 3b 08 00 00       	call   3809 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    2fce:	83 c4 08             	add    $0x8,%esp
    2fd1:	56                   	push   %esi
<<<<<<< HEAD
    2fd2:	68 d1 4a 00 00       	push   $0x4ad1
    2fd7:	e8 9c 08 00 00       	call   3878 <link>
=======
    2fd2:	68 b9 4a 00 00       	push   $0x4ab9
    2fd7:	e8 85 08 00 00       	call   3861 <link>
>>>>>>> c59b0f9 (fixed thread_join and join)
    2fdc:	83 c4 10             	add    $0x10,%esp
    2fdf:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fe2:	75 0d                	jne    2ff1 <validatetest+0x79>
  for(p = 0; p <= (uint)hi; p += 4096){
    2fe4:	81 c6 00 10 00 00    	add    $0x1000,%esi
    2fea:	eb ac                	jmp    2f98 <validatetest+0x20>
      exit();
<<<<<<< HEAD
    2fec:	e8 27 08 00 00       	call   3818 <exit>
      printf(stdout, "link should not succeed\n");
    2ff1:	83 ec 08             	sub    $0x8,%esp
    2ff4:	68 dc 4a 00 00       	push   $0x4adc
    2ff9:	ff 35 78 5d 00 00    	push   0x5d78
    2fff:	e8 69 09 00 00       	call   396d <printf>
      exit();
    3004:	e8 0f 08 00 00       	call   3818 <exit>
=======
    2fec:	e8 10 08 00 00       	call   3801 <exit>
      printf(stdout, "link should not succeed\n");
    2ff1:	83 ec 08             	sub    $0x8,%esp
    2ff4:	68 c4 4a 00 00       	push   $0x4ac4
    2ff9:	ff 35 5c 5d 00 00    	push   0x5d5c
    2fff:	e8 52 09 00 00       	call   3956 <printf>
      exit();
    3004:	e8 f8 07 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  printf(stdout, "validate ok\n");
    3009:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    300c:	68 f5 4a 00 00       	push   $0x4af5
    3011:	ff 35 78 5d 00 00    	push   0x5d78
    3017:	e8 51 09 00 00       	call   396d <printf>
=======
    300c:	68 dd 4a 00 00       	push   $0x4add
    3011:	ff 35 5c 5d 00 00    	push   0x5d5c
    3017:	e8 3a 09 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    301c:	83 c4 10             	add    $0x10,%esp
    301f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3022:	5b                   	pop    %ebx
    3023:	5e                   	pop    %esi
    3024:	5d                   	pop    %ebp
    3025:	c3                   	ret    

00003026 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3026:	55                   	push   %ebp
    3027:	89 e5                	mov    %esp,%ebp
    3029:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
<<<<<<< HEAD
    302c:	68 02 4b 00 00       	push   $0x4b02
    3031:	ff 35 78 5d 00 00    	push   0x5d78
    3037:	e8 31 09 00 00       	call   396d <printf>
=======
    302c:	68 ea 4a 00 00       	push   $0x4aea
    3031:	ff 35 5c 5d 00 00    	push   0x5d5c
    3037:	e8 1a 09 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 0; i < sizeof(uninit); i++){
    303c:	83 c4 10             	add    $0x10,%esp
    303f:	b8 00 00 00 00       	mov    $0x0,%eax
    3044:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3049:	77 26                	ja     3071 <bsstest+0x4b>
    if(uninit[i] != '\0'){
<<<<<<< HEAD
    304b:	80 b8 a0 5d 00 00 00 	cmpb   $0x0,0x5da0(%eax)
=======
    304b:	80 b8 80 5d 00 00 00 	cmpb   $0x0,0x5d80(%eax)
>>>>>>> c59b0f9 (fixed thread_join and join)
    3052:	75 05                	jne    3059 <bsstest+0x33>
  for(i = 0; i < sizeof(uninit); i++){
    3054:	83 c0 01             	add    $0x1,%eax
    3057:	eb eb                	jmp    3044 <bsstest+0x1e>
      printf(stdout, "bss test failed\n");
    3059:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    305c:	68 0c 4b 00 00       	push   $0x4b0c
    3061:	ff 35 78 5d 00 00    	push   0x5d78
    3067:	e8 01 09 00 00       	call   396d <printf>
      exit();
    306c:	e8 a7 07 00 00       	call   3818 <exit>
=======
    305c:	68 f4 4a 00 00       	push   $0x4af4
    3061:	ff 35 5c 5d 00 00    	push   0x5d5c
    3067:	e8 ea 08 00 00       	call   3956 <printf>
      exit();
    306c:	e8 90 07 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }
  printf(stdout, "bss test ok\n");
    3071:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    3074:	68 1d 4b 00 00       	push   $0x4b1d
    3079:	ff 35 78 5d 00 00    	push   0x5d78
    307f:	e8 e9 08 00 00       	call   396d <printf>
=======
    3074:	68 05 4b 00 00       	push   $0x4b05
    3079:	ff 35 5c 5d 00 00    	push   0x5d5c
    307f:	e8 d2 08 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    3084:	83 c4 10             	add    $0x10,%esp
    3087:	c9                   	leave  
    3088:	c3                   	ret    

00003089 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3089:	55                   	push   %ebp
    308a:	89 e5                	mov    %esp,%ebp
    308c:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
<<<<<<< HEAD
    308f:	68 2a 4b 00 00       	push   $0x4b2a
    3094:	e8 cf 07 00 00       	call   3868 <unlink>
  pid = fork();
    3099:	e8 72 07 00 00       	call   3810 <fork>
=======
    308f:	68 12 4b 00 00       	push   $0x4b12
    3094:	e8 b8 07 00 00       	call   3851 <unlink>
  pid = fork();
    3099:	e8 5b 07 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(pid == 0){
    309e:	83 c4 10             	add    $0x10,%esp
    30a1:	85 c0                	test   %eax,%eax
    30a3:	74 4d                	je     30f2 <bigargtest+0x69>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    30a5:	0f 88 ad 00 00 00    	js     3158 <bigargtest+0xcf>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
<<<<<<< HEAD
    30ab:	e8 70 07 00 00       	call   3820 <wait>
  fd = open("bigarg-ok", 0);
    30b0:	83 ec 08             	sub    $0x8,%esp
    30b3:	6a 00                	push   $0x0
    30b5:	68 2a 4b 00 00       	push   $0x4b2a
    30ba:	e8 99 07 00 00       	call   3858 <open>
=======
    30ab:	e8 59 07 00 00       	call   3809 <wait>
  fd = open("bigarg-ok", 0);
    30b0:	83 ec 08             	sub    $0x8,%esp
    30b3:	6a 00                	push   $0x0
    30b5:	68 12 4b 00 00       	push   $0x4b12
    30ba:	e8 82 07 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(fd < 0){
    30bf:	83 c4 10             	add    $0x10,%esp
    30c2:	85 c0                	test   %eax,%eax
    30c4:	0f 88 a6 00 00 00    	js     3170 <bigargtest+0xe7>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    30ca:	83 ec 0c             	sub    $0xc,%esp
    30cd:	50                   	push   %eax
<<<<<<< HEAD
    30ce:	e8 6d 07 00 00       	call   3840 <close>
  unlink("bigarg-ok");
    30d3:	c7 04 24 2a 4b 00 00 	movl   $0x4b2a,(%esp)
    30da:	e8 89 07 00 00       	call   3868 <unlink>
=======
    30ce:	e8 56 07 00 00       	call   3829 <close>
  unlink("bigarg-ok");
    30d3:	c7 04 24 12 4b 00 00 	movl   $0x4b12,(%esp)
    30da:	e8 72 07 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    30df:	83 c4 10             	add    $0x10,%esp
    30e2:	c9                   	leave  
    30e3:	c3                   	ret    
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
<<<<<<< HEAD
    30e4:	c7 04 85 c0 a4 00 00 	movl   $0x5284,0xa4c0(,%eax,4)
    30eb:	84 52 00 00 
=======
    30e4:	c7 04 85 a0 a4 00 00 	movl   $0x526c,0xa4a0(,%eax,4)
    30eb:	6c 52 00 00 
>>>>>>> c59b0f9 (fixed thread_join and join)
    for(i = 0; i < MAXARG-1; i++)
    30ef:	83 c0 01             	add    $0x1,%eax
    30f2:	83 f8 1e             	cmp    $0x1e,%eax
    30f5:	7e ed                	jle    30e4 <bigargtest+0x5b>
    args[MAXARG-1] = 0;
<<<<<<< HEAD
    30f7:	c7 05 3c a5 00 00 00 	movl   $0x0,0xa53c
    30fe:	00 00 00 
    printf(stdout, "bigarg test\n");
    3101:	83 ec 08             	sub    $0x8,%esp
    3104:	68 34 4b 00 00       	push   $0x4b34
    3109:	ff 35 78 5d 00 00    	push   0x5d78
    310f:	e8 59 08 00 00       	call   396d <printf>
    exec("echo", args);
    3114:	83 c4 08             	add    $0x8,%esp
    3117:	68 c0 a4 00 00       	push   $0xa4c0
    311c:	68 01 3d 00 00       	push   $0x3d01
    3121:	e8 2a 07 00 00       	call   3850 <exec>
    printf(stdout, "bigarg test ok\n");
    3126:	83 c4 08             	add    $0x8,%esp
    3129:	68 41 4b 00 00       	push   $0x4b41
    312e:	ff 35 78 5d 00 00    	push   0x5d78
    3134:	e8 34 08 00 00       	call   396d <printf>
    fd = open("bigarg-ok", O_CREATE);
    3139:	83 c4 08             	add    $0x8,%esp
    313c:	68 00 02 00 00       	push   $0x200
    3141:	68 2a 4b 00 00       	push   $0x4b2a
    3146:	e8 0d 07 00 00       	call   3858 <open>
    close(fd);
    314b:	89 04 24             	mov    %eax,(%esp)
    314e:	e8 ed 06 00 00       	call   3840 <close>
    exit();
    3153:	e8 c0 06 00 00       	call   3818 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3158:	83 ec 08             	sub    $0x8,%esp
    315b:	68 51 4b 00 00       	push   $0x4b51
    3160:	ff 35 78 5d 00 00    	push   0x5d78
    3166:	e8 02 08 00 00       	call   396d <printf>
    exit();
    316b:	e8 a8 06 00 00       	call   3818 <exit>
    printf(stdout, "bigarg test failed!\n");
    3170:	83 ec 08             	sub    $0x8,%esp
    3173:	68 6a 4b 00 00       	push   $0x4b6a
    3178:	ff 35 78 5d 00 00    	push   0x5d78
    317e:	e8 ea 07 00 00       	call   396d <printf>
    exit();
    3183:	e8 90 06 00 00       	call   3818 <exit>
=======
    30f7:	c7 05 1c a5 00 00 00 	movl   $0x0,0xa51c
    30fe:	00 00 00 
    printf(stdout, "bigarg test\n");
    3101:	83 ec 08             	sub    $0x8,%esp
    3104:	68 1c 4b 00 00       	push   $0x4b1c
    3109:	ff 35 5c 5d 00 00    	push   0x5d5c
    310f:	e8 42 08 00 00       	call   3956 <printf>
    exec("echo", args);
    3114:	83 c4 08             	add    $0x8,%esp
    3117:	68 a0 a4 00 00       	push   $0xa4a0
    311c:	68 e9 3c 00 00       	push   $0x3ce9
    3121:	e8 13 07 00 00       	call   3839 <exec>
    printf(stdout, "bigarg test ok\n");
    3126:	83 c4 08             	add    $0x8,%esp
    3129:	68 29 4b 00 00       	push   $0x4b29
    312e:	ff 35 5c 5d 00 00    	push   0x5d5c
    3134:	e8 1d 08 00 00       	call   3956 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3139:	83 c4 08             	add    $0x8,%esp
    313c:	68 00 02 00 00       	push   $0x200
    3141:	68 12 4b 00 00       	push   $0x4b12
    3146:	e8 f6 06 00 00       	call   3841 <open>
    close(fd);
    314b:	89 04 24             	mov    %eax,(%esp)
    314e:	e8 d6 06 00 00       	call   3829 <close>
    exit();
    3153:	e8 a9 06 00 00       	call   3801 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3158:	83 ec 08             	sub    $0x8,%esp
    315b:	68 39 4b 00 00       	push   $0x4b39
    3160:	ff 35 5c 5d 00 00    	push   0x5d5c
    3166:	e8 eb 07 00 00       	call   3956 <printf>
    exit();
    316b:	e8 91 06 00 00       	call   3801 <exit>
    printf(stdout, "bigarg test failed!\n");
    3170:	83 ec 08             	sub    $0x8,%esp
    3173:	68 52 4b 00 00       	push   $0x4b52
    3178:	ff 35 5c 5d 00 00    	push   0x5d5c
    317e:	e8 d3 07 00 00       	call   3956 <printf>
    exit();
    3183:	e8 79 06 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00003188 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3188:	55                   	push   %ebp
    3189:	89 e5                	mov    %esp,%ebp
    318b:	57                   	push   %edi
    318c:	56                   	push   %esi
    318d:	53                   	push   %ebx
    318e:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
<<<<<<< HEAD
    3191:	68 7f 4b 00 00       	push   $0x4b7f
    3196:	6a 01                	push   $0x1
    3198:	e8 d0 07 00 00       	call   396d <printf>
=======
    3191:	68 67 4b 00 00       	push   $0x4b67
    3196:	6a 01                	push   $0x1
    3198:	e8 b9 07 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
    319d:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    31a0:	bb 00 00 00 00       	mov    $0x0,%ebx
    char name[64];
    name[0] = 'f';
    31a5:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    31a9:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    31ae:	89 d8                	mov    %ebx,%eax
    31b0:	f7 ea                	imul   %edx
    31b2:	c1 fa 06             	sar    $0x6,%edx
    31b5:	89 de                	mov    %ebx,%esi
    31b7:	c1 fe 1f             	sar    $0x1f,%esi
    31ba:	29 f2                	sub    %esi,%edx
    31bc:	8d 42 30             	lea    0x30(%edx),%eax
    31bf:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    31c2:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    31c8:	89 d9                	mov    %ebx,%ecx
    31ca:	29 d1                	sub    %edx,%ecx
    31cc:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
    31d1:	89 c8                	mov    %ecx,%eax
    31d3:	f7 ef                	imul   %edi
    31d5:	c1 fa 05             	sar    $0x5,%edx
    31d8:	c1 f9 1f             	sar    $0x1f,%ecx
    31db:	29 ca                	sub    %ecx,%edx
    31dd:	83 c2 30             	add    $0x30,%edx
    31e0:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    31e3:	89 d8                	mov    %ebx,%eax
    31e5:	f7 ef                	imul   %edi
    31e7:	89 d7                	mov    %edx,%edi
    31e9:	c1 ff 05             	sar    $0x5,%edi
    31ec:	29 f7                	sub    %esi,%edi
    31ee:	6b c7 64             	imul   $0x64,%edi,%eax
    31f1:	89 df                	mov    %ebx,%edi
    31f3:	29 c7                	sub    %eax,%edi
    31f5:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    31fa:	89 f8                	mov    %edi,%eax
    31fc:	f7 e9                	imul   %ecx
    31fe:	c1 fa 02             	sar    $0x2,%edx
    3201:	c1 ff 1f             	sar    $0x1f,%edi
    3204:	29 fa                	sub    %edi,%edx
    3206:	83 c2 30             	add    $0x30,%edx
    3209:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    320c:	89 d8                	mov    %ebx,%eax
    320e:	f7 e9                	imul   %ecx
    3210:	c1 fa 02             	sar    $0x2,%edx
    3213:	29 f2                	sub    %esi,%edx
    3215:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3218:	01 c0                	add    %eax,%eax
    321a:	89 da                	mov    %ebx,%edx
    321c:	29 c2                	sub    %eax,%edx
    321e:	83 c2 30             	add    $0x30,%edx
    3221:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    3224:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    printf(1, "writing %s\n", name);
    3228:	83 ec 04             	sub    $0x4,%esp
    322b:	8d 75 a8             	lea    -0x58(%ebp),%esi
    322e:	56                   	push   %esi
<<<<<<< HEAD
    322f:	68 8c 4b 00 00       	push   $0x4b8c
    3234:	6a 01                	push   $0x1
    3236:	e8 32 07 00 00       	call   396d <printf>
=======
    322f:	68 74 4b 00 00       	push   $0x4b74
    3234:	6a 01                	push   $0x1
    3236:	e8 1b 07 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
    int fd = open(name, O_CREATE|O_RDWR);
    323b:	83 c4 08             	add    $0x8,%esp
    323e:	68 02 02 00 00       	push   $0x202
    3243:	56                   	push   %esi
<<<<<<< HEAD
    3244:	e8 0f 06 00 00       	call   3858 <open>
=======
    3244:	e8 f8 05 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    3249:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    324b:	83 c4 10             	add    $0x10,%esp
    324e:	85 c0                	test   %eax,%eax
    3250:	79 1b                	jns    326d <fsfull+0xe5>
      printf(1, "open %s failed\n", name);
    3252:	83 ec 04             	sub    $0x4,%esp
    3255:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3258:	50                   	push   %eax
<<<<<<< HEAD
    3259:	68 98 4b 00 00       	push   $0x4b98
    325e:	6a 01                	push   $0x1
    3260:	e8 08 07 00 00       	call   396d <printf>
=======
    3259:	68 80 4b 00 00       	push   $0x4b80
    325e:	6a 01                	push   $0x1
    3260:	e8 f1 06 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
      break;
    3265:	83 c4 10             	add    $0x10,%esp
    3268:	e9 e6 00 00 00       	jmp    3353 <fsfull+0x1cb>
    }
    int total = 0;
    326d:	bf 00 00 00 00       	mov    $0x0,%edi
    while(1){
      int cc = write(fd, buf, 512);
    3272:	83 ec 04             	sub    $0x4,%esp
    3275:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    327a:	68 c0 84 00 00       	push   $0x84c0
    327f:	56                   	push   %esi
    3280:	e8 b3 05 00 00       	call   3838 <write>
=======
    327a:	68 a0 84 00 00       	push   $0x84a0
    327f:	56                   	push   %esi
    3280:	e8 9c 05 00 00       	call   3821 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
      if(cc < 512)
    3285:	83 c4 10             	add    $0x10,%esp
    3288:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    328d:	7e 04                	jle    3293 <fsfull+0x10b>
        break;
      total += cc;
    328f:	01 c7                	add    %eax,%edi
    while(1){
    3291:	eb df                	jmp    3272 <fsfull+0xea>
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3293:	83 ec 04             	sub    $0x4,%esp
    3296:	57                   	push   %edi
<<<<<<< HEAD
    3297:	68 a8 4b 00 00       	push   $0x4ba8
    329c:	6a 01                	push   $0x1
    329e:	e8 ca 06 00 00       	call   396d <printf>
    close(fd);
    32a3:	89 34 24             	mov    %esi,(%esp)
    32a6:	e8 95 05 00 00       	call   3840 <close>
=======
    3297:	68 90 4b 00 00       	push   $0x4b90
    329c:	6a 01                	push   $0x1
    329e:	e8 b3 06 00 00       	call   3956 <printf>
    close(fd);
    32a3:	89 34 24             	mov    %esi,(%esp)
    32a6:	e8 7e 05 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(total == 0)
    32ab:	83 c4 10             	add    $0x10,%esp
    32ae:	85 ff                	test   %edi,%edi
    32b0:	0f 84 9d 00 00 00    	je     3353 <fsfull+0x1cb>
  for(nfiles = 0; ; nfiles++){
    32b6:	83 c3 01             	add    $0x1,%ebx
    32b9:	e9 e7 fe ff ff       	jmp    31a5 <fsfull+0x1d>
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    32be:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    32c2:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    32c7:	89 d8                	mov    %ebx,%eax
    32c9:	f7 ea                	imul   %edx
    32cb:	c1 fa 06             	sar    $0x6,%edx
    32ce:	89 de                	mov    %ebx,%esi
    32d0:	c1 fe 1f             	sar    $0x1f,%esi
    32d3:	29 f2                	sub    %esi,%edx
    32d5:	8d 42 30             	lea    0x30(%edx),%eax
    32d8:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    32db:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    32e1:	89 d9                	mov    %ebx,%ecx
    32e3:	29 d1                	sub    %edx,%ecx
    32e5:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
    32ea:	89 c8                	mov    %ecx,%eax
    32ec:	f7 ef                	imul   %edi
    32ee:	c1 fa 05             	sar    $0x5,%edx
    32f1:	c1 f9 1f             	sar    $0x1f,%ecx
    32f4:	29 ca                	sub    %ecx,%edx
    32f6:	83 c2 30             	add    $0x30,%edx
    32f9:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    32fc:	89 d8                	mov    %ebx,%eax
    32fe:	f7 ef                	imul   %edi
    3300:	89 d7                	mov    %edx,%edi
    3302:	c1 ff 05             	sar    $0x5,%edi
    3305:	29 f7                	sub    %esi,%edi
    3307:	6b c7 64             	imul   $0x64,%edi,%eax
    330a:	89 df                	mov    %ebx,%edi
    330c:	29 c7                	sub    %eax,%edi
    330e:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    3313:	89 f8                	mov    %edi,%eax
    3315:	f7 e9                	imul   %ecx
    3317:	c1 fa 02             	sar    $0x2,%edx
    331a:	c1 ff 1f             	sar    $0x1f,%edi
    331d:	29 fa                	sub    %edi,%edx
    331f:	83 c2 30             	add    $0x30,%edx
    3322:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3325:	89 d8                	mov    %ebx,%eax
    3327:	f7 e9                	imul   %ecx
    3329:	c1 fa 02             	sar    $0x2,%edx
    332c:	29 f2                	sub    %esi,%edx
    332e:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3331:	01 c0                	add    %eax,%eax
    3333:	89 da                	mov    %ebx,%edx
    3335:	29 c2                	sub    %eax,%edx
    3337:	83 c2 30             	add    $0x30,%edx
    333a:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    333d:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    unlink(name);
    3341:	83 ec 0c             	sub    $0xc,%esp
    3344:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3347:	50                   	push   %eax
<<<<<<< HEAD
    3348:	e8 1b 05 00 00       	call   3868 <unlink>
=======
    3348:	e8 04 05 00 00       	call   3851 <unlink>
>>>>>>> c59b0f9 (fixed thread_join and join)
    nfiles--;
    334d:	83 eb 01             	sub    $0x1,%ebx
    3350:	83 c4 10             	add    $0x10,%esp
  while(nfiles >= 0){
    3353:	85 db                	test   %ebx,%ebx
    3355:	0f 89 63 ff ff ff    	jns    32be <fsfull+0x136>
  }

  printf(1, "fsfull test finished\n");
    335b:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    335e:	68 b8 4b 00 00       	push   $0x4bb8
    3363:	6a 01                	push   $0x1
    3365:	e8 03 06 00 00       	call   396d <printf>
=======
    335e:	68 a0 4b 00 00       	push   $0x4ba0
    3363:	6a 01                	push   $0x1
    3365:	e8 ec 05 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    336a:	83 c4 10             	add    $0x10,%esp
    336d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3370:	5b                   	pop    %ebx
    3371:	5e                   	pop    %esi
    3372:	5f                   	pop    %edi
    3373:	5d                   	pop    %ebp
    3374:	c3                   	ret    

00003375 <uio>:

void
uio()
{
    3375:	55                   	push   %ebp
    3376:	89 e5                	mov    %esp,%ebp
    3378:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
<<<<<<< HEAD
    337b:	68 ce 4b 00 00       	push   $0x4bce
    3380:	6a 01                	push   $0x1
    3382:	e8 e6 05 00 00       	call   396d <printf>
  pid = fork();
    3387:	e8 84 04 00 00       	call   3810 <fork>
=======
    337b:	68 b6 4b 00 00       	push   $0x4bb6
    3380:	6a 01                	push   $0x1
    3382:	e8 cf 05 00 00       	call   3956 <printf>
  pid = fork();
    3387:	e8 6d 04 00 00       	call   37f9 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if(pid == 0){
    338c:	83 c4 10             	add    $0x10,%esp
    338f:	85 c0                	test   %eax,%eax
    3391:	74 1b                	je     33ae <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    3393:	78 3e                	js     33d3 <uio+0x5e>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
<<<<<<< HEAD
    3395:	e8 86 04 00 00       	call   3820 <wait>
  printf(1, "uio test done\n");
    339a:	83 ec 08             	sub    $0x8,%esp
    339d:	68 d8 4b 00 00       	push   $0x4bd8
    33a2:	6a 01                	push   $0x1
    33a4:	e8 c4 05 00 00       	call   396d <printf>
=======
    3395:	e8 6f 04 00 00       	call   3809 <wait>
  printf(1, "uio test done\n");
    339a:	83 ec 08             	sub    $0x8,%esp
    339d:	68 c0 4b 00 00       	push   $0x4bc0
    33a2:	6a 01                	push   $0x1
    33a4:	e8 ad 05 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    33a9:	83 c4 10             	add    $0x10,%esp
    33ac:	c9                   	leave  
    33ad:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    33ae:	b8 09 00 00 00       	mov    $0x9,%eax
    33b3:	ba 70 00 00 00       	mov    $0x70,%edx
    33b8:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    33b9:	ba 71 00 00 00       	mov    $0x71,%edx
    33be:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    33bf:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    33c2:	68 64 53 00 00       	push   $0x5364
    33c7:	6a 01                	push   $0x1
    33c9:	e8 9f 05 00 00       	call   396d <printf>
    exit();
    33ce:	e8 45 04 00 00       	call   3818 <exit>
    printf (1, "fork failed\n");
    33d3:	83 ec 08             	sub    $0x8,%esp
    33d6:	68 5d 4b 00 00       	push   $0x4b5d
    33db:	6a 01                	push   $0x1
    33dd:	e8 8b 05 00 00       	call   396d <printf>
    exit();
    33e2:	e8 31 04 00 00       	call   3818 <exit>
=======
    33c2:	68 4c 53 00 00       	push   $0x534c
    33c7:	6a 01                	push   $0x1
    33c9:	e8 88 05 00 00       	call   3956 <printf>
    exit();
    33ce:	e8 2e 04 00 00       	call   3801 <exit>
    printf (1, "fork failed\n");
    33d3:	83 ec 08             	sub    $0x8,%esp
    33d6:	68 45 4b 00 00       	push   $0x4b45
    33db:	6a 01                	push   $0x1
    33dd:	e8 74 05 00 00       	call   3956 <printf>
    exit();
    33e2:	e8 1a 04 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000033e7 <argptest>:

void argptest()
{
    33e7:	55                   	push   %ebp
    33e8:	89 e5                	mov    %esp,%ebp
    33ea:	53                   	push   %ebx
    33eb:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    33ee:	6a 00                	push   $0x0
<<<<<<< HEAD
    33f0:	68 e7 4b 00 00       	push   $0x4be7
    33f5:	e8 5e 04 00 00       	call   3858 <open>
=======
    33f0:	68 cf 4b 00 00       	push   $0x4bcf
    33f5:	e8 47 04 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  if (fd < 0) {
    33fa:	83 c4 10             	add    $0x10,%esp
    33fd:	85 c0                	test   %eax,%eax
    33ff:	78 3a                	js     343b <argptest+0x54>
    3401:	89 c3                	mov    %eax,%ebx
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    3403:	83 ec 0c             	sub    $0xc,%esp
    3406:	6a 00                	push   $0x0
<<<<<<< HEAD
    3408:	e8 93 04 00 00       	call   38a0 <sbrk>
=======
    3408:	e8 7c 04 00 00       	call   3889 <sbrk>
>>>>>>> c59b0f9 (fixed thread_join and join)
    340d:	83 e8 01             	sub    $0x1,%eax
    3410:	83 c4 0c             	add    $0xc,%esp
    3413:	6a ff                	push   $0xffffffff
    3415:	50                   	push   %eax
    3416:	53                   	push   %ebx
<<<<<<< HEAD
    3417:	e8 14 04 00 00       	call   3830 <read>
  close(fd);
    341c:	89 1c 24             	mov    %ebx,(%esp)
    341f:	e8 1c 04 00 00       	call   3840 <close>
  printf(1, "arg test passed\n");
    3424:	83 c4 08             	add    $0x8,%esp
    3427:	68 f9 4b 00 00       	push   $0x4bf9
    342c:	6a 01                	push   $0x1
    342e:	e8 3a 05 00 00       	call   396d <printf>
=======
    3417:	e8 fd 03 00 00       	call   3819 <read>
  close(fd);
    341c:	89 1c 24             	mov    %ebx,(%esp)
    341f:	e8 05 04 00 00       	call   3829 <close>
  printf(1, "arg test passed\n");
    3424:	83 c4 08             	add    $0x8,%esp
    3427:	68 e1 4b 00 00       	push   $0x4be1
    342c:	6a 01                	push   $0x1
    342e:	e8 23 05 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
    3433:	83 c4 10             	add    $0x10,%esp
    3436:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3439:	c9                   	leave  
    343a:	c3                   	ret    
    printf(2, "open failed\n");
    343b:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    343e:	68 ec 4b 00 00       	push   $0x4bec
    3443:	6a 02                	push   $0x2
    3445:	e8 23 05 00 00       	call   396d <printf>
    exit();
    344a:	e8 c9 03 00 00       	call   3818 <exit>
=======
    343e:	68 d4 4b 00 00       	push   $0x4bd4
    3443:	6a 02                	push   $0x2
    3445:	e8 0c 05 00 00       	call   3956 <printf>
    exit();
    344a:	e8 b2 03 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

0000344f <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
<<<<<<< HEAD
    344f:	69 05 74 5d 00 00 0d 	imul   $0x19660d,0x5d74,%eax
    3456:	66 19 00 
    3459:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    345e:	a3 74 5d 00 00       	mov    %eax,0x5d74
=======
    344f:	69 05 58 5d 00 00 0d 	imul   $0x19660d,0x5d58,%eax
    3456:	66 19 00 
    3459:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    345e:	a3 58 5d 00 00       	mov    %eax,0x5d58
>>>>>>> c59b0f9 (fixed thread_join and join)
  return randstate;
}
    3463:	c3                   	ret    

00003464 <main>:

int
main(int argc, char *argv[])
{
    3464:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3468:	83 e4 f0             	and    $0xfffffff0,%esp
    346b:	ff 71 fc             	push   -0x4(%ecx)
    346e:	55                   	push   %ebp
    346f:	89 e5                	mov    %esp,%ebp
    3471:	51                   	push   %ecx
    3472:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
<<<<<<< HEAD
    3475:	68 0a 4c 00 00       	push   $0x4c0a
    347a:	6a 01                	push   $0x1
    347c:	e8 ec 04 00 00       	call   396d <printf>
=======
    3475:	68 f2 4b 00 00       	push   $0x4bf2
    347a:	6a 01                	push   $0x1
    347c:	e8 d5 04 00 00       	call   3956 <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)

  if(open("usertests.ran", 0) >= 0){
    3481:	83 c4 08             	add    $0x8,%esp
    3484:	6a 00                	push   $0x0
<<<<<<< HEAD
    3486:	68 1e 4c 00 00       	push   $0x4c1e
    348b:	e8 c8 03 00 00       	call   3858 <open>
=======
    3486:	68 06 4c 00 00       	push   $0x4c06
    348b:	e8 b1 03 00 00       	call   3841 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
    3490:	83 c4 10             	add    $0x10,%esp
    3493:	85 c0                	test   %eax,%eax
    3495:	78 14                	js     34ab <main+0x47>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3497:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
    349a:	68 88 53 00 00       	push   $0x5388
    349f:	6a 01                	push   $0x1
    34a1:	e8 c7 04 00 00       	call   396d <printf>
    exit();
    34a6:	e8 6d 03 00 00       	call   3818 <exit>
=======
    349a:	68 70 53 00 00       	push   $0x5370
    349f:	6a 01                	push   $0x1
    34a1:	e8 b0 04 00 00       	call   3956 <printf>
    exit();
    34a6:	e8 56 03 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }
  close(open("usertests.ran", O_CREATE));
    34ab:	83 ec 08             	sub    $0x8,%esp
    34ae:	68 00 02 00 00       	push   $0x200
<<<<<<< HEAD
    34b3:	68 1e 4c 00 00       	push   $0x4c1e
    34b8:	e8 9b 03 00 00       	call   3858 <open>
    34bd:	89 04 24             	mov    %eax,(%esp)
    34c0:	e8 7b 03 00 00       	call   3840 <close>
=======
    34b3:	68 06 4c 00 00       	push   $0x4c06
    34b8:	e8 84 03 00 00       	call   3841 <open>
    34bd:	89 04 24             	mov    %eax,(%esp)
    34c0:	e8 64 03 00 00       	call   3829 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)

  argptest();
    34c5:	e8 1d ff ff ff       	call   33e7 <argptest>
  createdelete();
    34ca:	e8 43 db ff ff       	call   1012 <createdelete>
  linkunlink();
    34cf:	e8 e0 e3 ff ff       	call   18b4 <linkunlink>
  concreate();
    34d4:	e8 ed e0 ff ff       	call   15c6 <concreate>
  fourfiles();
    34d9:	e8 4e d9 ff ff       	call   e2c <fourfiles>
  sharedfd();
    34de:	e8 ac d7 ff ff       	call   c8f <sharedfd>

  bigargtest();
    34e3:	e8 a1 fb ff ff       	call   3089 <bigargtest>
  bigwrite();
    34e8:	e8 3d ed ff ff       	call   222a <bigwrite>
  bigargtest();
    34ed:	e8 97 fb ff ff       	call   3089 <bigargtest>
  bsstest();
    34f2:	e8 2f fb ff ff       	call   3026 <bsstest>
  sbrktest();
    34f7:	e8 69 f6 ff ff       	call   2b65 <sbrktest>
  validatetest();
    34fc:	e8 77 fa ff ff       	call   2f78 <validatetest>

  opentest();
    3501:	e8 a6 cd ff ff       	call   2ac <opentest>
  writetest();
    3506:	e8 34 ce ff ff       	call   33f <writetest>
  writetest1();
    350b:	e8 f7 cf ff ff       	call   507 <writetest1>
  createtest();
    3510:	e8 a2 d1 ff ff       	call   6b7 <createtest>

  openiputtest();
    3515:	e8 a9 cc ff ff       	call   1c3 <openiputtest>
  exitiputtest();
    351a:	e8 be cb ff ff       	call   dd <exitiputtest>
  iputtest();
    351f:	e8 dc ca ff ff       	call   0 <iputtest>

  mem();
    3524:	e8 ab d6 ff ff       	call   bd4 <mem>
  pipe1();
    3529:	e8 5b d3 ff ff       	call   889 <pipe1>
  preempt();
    352e:	e8 f6 d4 ff ff       	call   a29 <preempt>
  exitwait();
    3533:	e8 2c d6 ff ff       	call   b64 <exitwait>

  rmdot();
    3538:	e8 b2 f0 ff ff       	call   25ef <rmdot>
  fourteen();
    353d:	e8 70 ef ff ff       	call   24b2 <fourteen>
  bigfile();
    3542:	e8 b5 ed ff ff       	call   22fc <bigfile>
  subdir();
    3547:	e8 b0 e5 ff ff       	call   1afc <subdir>
  linktest();
    354c:	e8 4f de ff ff       	call   13a0 <linktest>
  unlinkread();
    3551:	e8 b1 dc ff ff       	call   1207 <unlinkread>
  dirfile();
    3556:	e8 19 f2 ff ff       	call   2774 <dirfile>
  iref();
    355b:	e8 2e f4 ff ff       	call   298e <iref>
  forktest();
    3560:	e8 51 f5 ff ff       	call   2ab6 <forktest>
  bigdir(); // slow
    3565:	e8 3e e4 ff ff       	call   19a8 <bigdir>

  uio();
    356a:	e8 06 fe ff ff       	call   3375 <uio>

  exectest();
    356f:	e8 cc d2 ff ff       	call   840 <exectest>

  exit();
<<<<<<< HEAD
    3574:	e8 9f 02 00 00       	call   3818 <exit>
=======
    3574:	e8 88 02 00 00       	call   3801 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00003579 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
    3579:	55                   	push   %ebp
    357a:	89 e5                	mov    %esp,%ebp
    357c:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
    357f:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
    3581:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3584:	89 08                	mov    %ecx,(%eax)
  return old;
}
    3586:	89 d0                	mov    %edx,%eax
    3588:	5d                   	pop    %ebp
    3589:	c3                   	ret    

0000358a <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
    358a:	55                   	push   %ebp
    358b:	89 e5                	mov    %esp,%ebp
    358d:	53                   	push   %ebx
    358e:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
    3591:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
    3596:	e8 f8 05 00 00       	call   3b93 <malloc>
  if(n_stack == 0){
    359b:	83 c4 10             	add    $0x10,%esp
    359e:	85 c0                	test   %eax,%eax
    35a0:	74 41                	je     35e3 <thread_create+0x59>
    35a2:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
    35a4:	50                   	push   %eax
    35a5:	ff 75 10             	push   0x10(%ebp)
    35a8:	ff 75 0c             	push   0xc(%ebp)
    35ab:	ff 75 08             	push   0x8(%ebp)
    35ae:	e8 05 03 00 00       	call   38b8 <clone>
=======
    3596:	e8 e1 05 00 00       	call   3b7c <malloc>
  if(n_stack == 0){
    359b:	83 c4 10             	add    $0x10,%esp
    359e:	85 c0                	test   %eax,%eax
    35a0:	74 57                	je     35f9 <thread_create+0x6f>
    35a2:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
    35a4:	b8 00 00 00 00       	mov    $0x0,%eax
    35a9:	eb 03                	jmp    35ae <thread_create+0x24>
    35ab:	83 c0 01             	add    $0x1,%eax
    35ae:	83 f8 3f             	cmp    $0x3f,%eax
    35b1:	7f 2f                	jg     35e2 <thread_create+0x58>
    if(threads[i].flag==0){
    35b3:	8d 14 40             	lea    (%eax,%eax,2),%edx
    35b6:	83 3c 95 28 a5 00 00 	cmpl   $0x0,0xa528(,%edx,4)
    35bd:	00 
    35be:	75 eb                	jne    35ab <thread_create+0x21>
      threads[i].maddr = n_stack;
    35c0:	8d 14 00             	lea    (%eax,%eax,1),%edx
    35c3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    35c6:	c1 e3 02             	shl    $0x2,%ebx
    35c9:	89 8b 20 a5 00 00    	mov    %ecx,0xa520(%ebx)
      threads[i].pg1addr = n_stack;
    35cf:	89 8b 24 a5 00 00    	mov    %ecx,0xa524(%ebx)
      threads[i].flag = 1;
    35d5:	01 c2                	add    %eax,%edx
    35d7:	c7 04 95 28 a5 00 00 	movl   $0x1,0xa528(,%edx,4)
    35de:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
    35e2:	51                   	push   %ecx
    35e3:	ff 75 10             	push   0x10(%ebp)
    35e6:	ff 75 0c             	push   0xc(%ebp)
    35e9:	ff 75 08             	push   0x8(%ebp)
    35ec:	e8 b0 02 00 00       	call   38a1 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
    35b3:	83 c4 10             	add    $0x10,%esp
    35b6:	ba 00 00 00 00       	mov    $0x0,%edx
    35bb:	eb 03                	jmp    35c0 <thread_create+0x36>
    35bd:	83 c2 01             	add    $0x1,%edx
    35c0:	83 fa 3f             	cmp    $0x3f,%edx
    35c3:	7f 19                	jg     35de <thread_create+0x54>
    if(threads[i]->flag==0){
    35c5:	8b 0c 95 40 a5 00 00 	mov    0xa540(,%edx,4),%ecx
    35cc:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
    35d0:	75 eb                	jne    35bd <thread_create+0x33>
      threads[i]->maddr = n_stack;
    35d2:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
    35d4:	8b 14 95 40 a5 00 00 	mov    0xa540(,%edx,4),%edx
    35db:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
    35de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    35e1:	c9                   	leave  
    35e2:	c3                   	ret    
    return -1;
    35e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    35e8:	eb f4                	jmp    35de <thread_create+0x54>

000035ea <thread_join>:
=======
    35f1:	83 c4 10             	add    $0x10,%esp
}
    35f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    35f7:	c9                   	leave  
    35f8:	c3                   	ret    
    return -1;
    35f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    35fe:	eb f4                	jmp    35f4 <thread_create+0x6a>

00003600 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
    35ea:	55                   	push   %ebp
    35eb:	89 e5                	mov    %esp,%ebp
    35ed:	56                   	push   %esi
    35ee:	53                   	push   %ebx
    35ef:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
    35f2:	8d 45 f4             	lea    -0xc(%ebp),%eax
    35f5:	50                   	push   %eax
    35f6:	e8 c5 02 00 00       	call   38c0 <join>
    35fb:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
    35fd:	83 c4 10             	add    $0x10,%esp
    3600:	bb 00 00 00 00       	mov    $0x0,%ebx
    3605:	eb 03                	jmp    360a <thread_join+0x20>
    3607:	83 c3 01             	add    $0x1,%ebx
    360a:	83 fb 3f             	cmp    $0x3f,%ebx
    360d:	7f 23                	jg     3632 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
    360f:	8b 04 9d 40 a5 00 00 	mov    0xa540(,%ebx,4),%eax
    3616:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
    361a:	75 eb                	jne    3607 <thread_join+0x1d>
    361c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    361f:	39 50 04             	cmp    %edx,0x4(%eax)
    3622:	75 e3                	jne    3607 <thread_join+0x1d>
      free(stk_addr);
    3624:	83 ec 0c             	sub    $0xc,%esp
    3627:	52                   	push   %edx
    3628:	e8 a6 04 00 00       	call   3ad3 <free>
    362d:	83 c4 10             	add    $0x10,%esp
    3630:	eb d5                	jmp    3607 <thread_join+0x1d>
    }
  }
  return pid;
}
    3632:	89 f0                	mov    %esi,%eax
    3634:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3637:	5b                   	pop    %ebx
    3638:	5e                   	pop    %esi
    3639:	5d                   	pop    %ebp
    363a:	c3                   	ret    

0000363b <lock_acquire>:

void lock_acquire(lock_t *lock){
    363b:	55                   	push   %ebp
    363c:	89 e5                	mov    %esp,%ebp
    363e:	53                   	push   %ebx
    363f:	83 ec 04             	sub    $0x4,%esp
    3642:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
    3645:	83 ec 08             	sub    $0x8,%esp
    3648:	6a 01                	push   $0x1
    364a:	53                   	push   %ebx
    364b:	e8 29 ff ff ff       	call   3579 <test_and_set>
    3650:	83 c4 10             	add    $0x10,%esp
    3653:	83 f8 01             	cmp    $0x1,%eax
    3656:	74 ed                	je     3645 <lock_acquire+0xa>
    ;
}
    3658:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    365b:	c9                   	leave  
    365c:	c3                   	ret    

0000365d <lock_release>:

void lock_release(lock_t *lock) {
    365d:	55                   	push   %ebp
    365e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
    3660:	8b 45 08             	mov    0x8(%ebp),%eax
    3663:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    3669:	5d                   	pop    %ebp
    366a:	c3                   	ret    

0000366b <lock_init>:

void lock_init(lock_t *lock) {
    366b:	55                   	push   %ebp
    366c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
    366e:	8b 45 08             	mov    0x8(%ebp),%eax
    3671:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    3677:	5d                   	pop    %ebp
    3678:	c3                   	ret    

00003679 <strcpy>:
=======
    3600:	55                   	push   %ebp
    3601:	89 e5                	mov    %esp,%ebp
    3603:	53                   	push   %ebx
    3604:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
    3607:	8d 45 f4             	lea    -0xc(%ebp),%eax
    360a:	50                   	push   %eax
    360b:	e8 99 02 00 00       	call   38a9 <join>
    3610:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
    3612:	83 c4 04             	add    $0x4,%esp
    3615:	ff 75 f4             	push   -0xc(%ebp)
    3618:	e8 9f 04 00 00       	call   3abc <free>
  return pid;
}
    361d:	89 d8                	mov    %ebx,%eax
    361f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3622:	c9                   	leave  
    3623:	c3                   	ret    

00003624 <lock_acquire>:

void lock_acquire(lock_t *lock){
    3624:	55                   	push   %ebp
    3625:	89 e5                	mov    %esp,%ebp
    3627:	53                   	push   %ebx
    3628:	83 ec 04             	sub    $0x4,%esp
    362b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
    362e:	83 ec 08             	sub    $0x8,%esp
    3631:	6a 01                	push   $0x1
    3633:	53                   	push   %ebx
    3634:	e8 40 ff ff ff       	call   3579 <test_and_set>
    3639:	83 c4 10             	add    $0x10,%esp
    363c:	83 f8 01             	cmp    $0x1,%eax
    363f:	74 ed                	je     362e <lock_acquire+0xa>
    ;
}
    3641:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3644:	c9                   	leave  
    3645:	c3                   	ret    

00003646 <lock_release>:

void lock_release(lock_t *lock) {
    3646:	55                   	push   %ebp
    3647:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
    3649:	8b 45 08             	mov    0x8(%ebp),%eax
    364c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    3652:	5d                   	pop    %ebp
    3653:	c3                   	ret    

00003654 <lock_init>:

void lock_init(lock_t *lock) {
    3654:	55                   	push   %ebp
    3655:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
    3657:	8b 45 08             	mov    0x8(%ebp),%eax
    365a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    3660:	5d                   	pop    %ebp
    3661:	c3                   	ret    

00003662 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
    3679:	55                   	push   %ebp
    367a:	89 e5                	mov    %esp,%ebp
    367c:	56                   	push   %esi
    367d:	53                   	push   %ebx
    367e:	8b 75 08             	mov    0x8(%ebp),%esi
    3681:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
    3662:	55                   	push   %ebp
    3663:	89 e5                	mov    %esp,%ebp
    3665:	56                   	push   %esi
    3666:	53                   	push   %ebx
    3667:	8b 75 08             	mov    0x8(%ebp),%esi
    366a:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
    3684:	89 f0                	mov    %esi,%eax
    3686:	89 d1                	mov    %edx,%ecx
    3688:	83 c2 01             	add    $0x1,%edx
    368b:	89 c3                	mov    %eax,%ebx
    368d:	83 c0 01             	add    $0x1,%eax
    3690:	0f b6 09             	movzbl (%ecx),%ecx
    3693:	88 0b                	mov    %cl,(%ebx)
    3695:	84 c9                	test   %cl,%cl
    3697:	75 ed                	jne    3686 <strcpy+0xd>
    ;
  return os;
}
    3699:	89 f0                	mov    %esi,%eax
    369b:	5b                   	pop    %ebx
    369c:	5e                   	pop    %esi
    369d:	5d                   	pop    %ebp
    369e:	c3                   	ret    

0000369f <strcmp>:
=======
    366d:	89 f0                	mov    %esi,%eax
    366f:	89 d1                	mov    %edx,%ecx
    3671:	83 c2 01             	add    $0x1,%edx
    3674:	89 c3                	mov    %eax,%ebx
    3676:	83 c0 01             	add    $0x1,%eax
    3679:	0f b6 09             	movzbl (%ecx),%ecx
    367c:	88 0b                	mov    %cl,(%ebx)
    367e:	84 c9                	test   %cl,%cl
    3680:	75 ed                	jne    366f <strcpy+0xd>
    ;
  return os;
}
    3682:	89 f0                	mov    %esi,%eax
    3684:	5b                   	pop    %ebx
    3685:	5e                   	pop    %esi
    3686:	5d                   	pop    %ebp
    3687:	c3                   	ret    

00003688 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
    369f:	55                   	push   %ebp
    36a0:	89 e5                	mov    %esp,%ebp
    36a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    36a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    36a8:	eb 06                	jmp    36b0 <strcmp+0x11>
    p++, q++;
    36aa:	83 c1 01             	add    $0x1,%ecx
    36ad:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    36b0:	0f b6 01             	movzbl (%ecx),%eax
    36b3:	84 c0                	test   %al,%al
    36b5:	74 04                	je     36bb <strcmp+0x1c>
    36b7:	3a 02                	cmp    (%edx),%al
    36b9:	74 ef                	je     36aa <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    36bb:	0f b6 c0             	movzbl %al,%eax
    36be:	0f b6 12             	movzbl (%edx),%edx
    36c1:	29 d0                	sub    %edx,%eax
}
    36c3:	5d                   	pop    %ebp
    36c4:	c3                   	ret    

000036c5 <strlen>:
=======
    3688:	55                   	push   %ebp
    3689:	89 e5                	mov    %esp,%ebp
    368b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    368e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    3691:	eb 06                	jmp    3699 <strcmp+0x11>
    p++, q++;
    3693:	83 c1 01             	add    $0x1,%ecx
    3696:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    3699:	0f b6 01             	movzbl (%ecx),%eax
    369c:	84 c0                	test   %al,%al
    369e:	74 04                	je     36a4 <strcmp+0x1c>
    36a0:	3a 02                	cmp    (%edx),%al
    36a2:	74 ef                	je     3693 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    36a4:	0f b6 c0             	movzbl %al,%eax
    36a7:	0f b6 12             	movzbl (%edx),%edx
    36aa:	29 d0                	sub    %edx,%eax
}
    36ac:	5d                   	pop    %ebp
    36ad:	c3                   	ret    

000036ae <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
    36c5:	55                   	push   %ebp
    36c6:	89 e5                	mov    %esp,%ebp
    36c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    36cb:	b8 00 00 00 00       	mov    $0x0,%eax
    36d0:	eb 03                	jmp    36d5 <strlen+0x10>
    36d2:	83 c0 01             	add    $0x1,%eax
    36d5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    36d9:	75 f7                	jne    36d2 <strlen+0xd>
    ;
  return n;
}
    36db:	5d                   	pop    %ebp
    36dc:	c3                   	ret    

000036dd <memset>:
=======
    36ae:	55                   	push   %ebp
    36af:	89 e5                	mov    %esp,%ebp
    36b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    36b4:	b8 00 00 00 00       	mov    $0x0,%eax
    36b9:	eb 03                	jmp    36be <strlen+0x10>
    36bb:	83 c0 01             	add    $0x1,%eax
    36be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    36c2:	75 f7                	jne    36bb <strlen+0xd>
    ;
  return n;
}
    36c4:	5d                   	pop    %ebp
    36c5:	c3                   	ret    

000036c6 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
    36dd:	55                   	push   %ebp
    36de:	89 e5                	mov    %esp,%ebp
    36e0:	57                   	push   %edi
    36e1:	8b 55 08             	mov    0x8(%ebp),%edx
=======
    36c6:	55                   	push   %ebp
    36c7:	89 e5                	mov    %esp,%ebp
    36c9:	57                   	push   %edi
    36ca:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
    36e4:	89 d7                	mov    %edx,%edi
    36e6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    36e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    36ec:	fc                   	cld    
    36ed:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    36ef:	89 d0                	mov    %edx,%eax
    36f1:	8b 7d fc             	mov    -0x4(%ebp),%edi
    36f4:	c9                   	leave  
    36f5:	c3                   	ret    

000036f6 <strchr>:
=======
    36cd:	89 d7                	mov    %edx,%edi
    36cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
    36d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    36d5:	fc                   	cld    
    36d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    36d8:	89 d0                	mov    %edx,%eax
    36da:	8b 7d fc             	mov    -0x4(%ebp),%edi
    36dd:	c9                   	leave  
    36de:	c3                   	ret    

000036df <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
    36f6:	55                   	push   %ebp
    36f7:	89 e5                	mov    %esp,%ebp
    36f9:	8b 45 08             	mov    0x8(%ebp),%eax
    36fc:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    3700:	eb 03                	jmp    3705 <strchr+0xf>
    3702:	83 c0 01             	add    $0x1,%eax
    3705:	0f b6 10             	movzbl (%eax),%edx
    3708:	84 d2                	test   %dl,%dl
    370a:	74 06                	je     3712 <strchr+0x1c>
    if(*s == c)
    370c:	38 ca                	cmp    %cl,%dl
    370e:	75 f2                	jne    3702 <strchr+0xc>
    3710:	eb 05                	jmp    3717 <strchr+0x21>
      return (char*)s;
  return 0;
    3712:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3717:	5d                   	pop    %ebp
    3718:	c3                   	ret    

00003719 <gets>:
=======
    36df:	55                   	push   %ebp
    36e0:	89 e5                	mov    %esp,%ebp
    36e2:	8b 45 08             	mov    0x8(%ebp),%eax
    36e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    36e9:	eb 03                	jmp    36ee <strchr+0xf>
    36eb:	83 c0 01             	add    $0x1,%eax
    36ee:	0f b6 10             	movzbl (%eax),%edx
    36f1:	84 d2                	test   %dl,%dl
    36f3:	74 06                	je     36fb <strchr+0x1c>
    if(*s == c)
    36f5:	38 ca                	cmp    %cl,%dl
    36f7:	75 f2                	jne    36eb <strchr+0xc>
    36f9:	eb 05                	jmp    3700 <strchr+0x21>
      return (char*)s;
  return 0;
    36fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3700:	5d                   	pop    %ebp
    3701:	c3                   	ret    

00003702 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
    3719:	55                   	push   %ebp
    371a:	89 e5                	mov    %esp,%ebp
    371c:	57                   	push   %edi
    371d:	56                   	push   %esi
    371e:	53                   	push   %ebx
    371f:	83 ec 1c             	sub    $0x1c,%esp
    3722:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
    3702:	55                   	push   %ebp
    3703:	89 e5                	mov    %esp,%ebp
    3705:	57                   	push   %edi
    3706:	56                   	push   %esi
    3707:	53                   	push   %ebx
    3708:	83 ec 1c             	sub    $0x1c,%esp
    370b:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
    3725:	bb 00 00 00 00       	mov    $0x0,%ebx
    372a:	89 de                	mov    %ebx,%esi
    372c:	83 c3 01             	add    $0x1,%ebx
    372f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3732:	7d 2e                	jge    3762 <gets+0x49>
    cc = read(0, &c, 1);
    3734:	83 ec 04             	sub    $0x4,%esp
    3737:	6a 01                	push   $0x1
    3739:	8d 45 e7             	lea    -0x19(%ebp),%eax
    373c:	50                   	push   %eax
    373d:	6a 00                	push   $0x0
    373f:	e8 ec 00 00 00       	call   3830 <read>
    if(cc < 1)
    3744:	83 c4 10             	add    $0x10,%esp
    3747:	85 c0                	test   %eax,%eax
    3749:	7e 17                	jle    3762 <gets+0x49>
      break;
    buf[i++] = c;
    374b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    374f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    3752:	3c 0a                	cmp    $0xa,%al
    3754:	0f 94 c2             	sete   %dl
    3757:	3c 0d                	cmp    $0xd,%al
    3759:	0f 94 c0             	sete   %al
    375c:	08 c2                	or     %al,%dl
    375e:	74 ca                	je     372a <gets+0x11>
    buf[i++] = c;
    3760:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    3762:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    3766:	89 f8                	mov    %edi,%eax
    3768:	8d 65 f4             	lea    -0xc(%ebp),%esp
    376b:	5b                   	pop    %ebx
    376c:	5e                   	pop    %esi
    376d:	5f                   	pop    %edi
    376e:	5d                   	pop    %ebp
    376f:	c3                   	ret    

00003770 <stat>:
=======
    370e:	bb 00 00 00 00       	mov    $0x0,%ebx
    3713:	89 de                	mov    %ebx,%esi
    3715:	83 c3 01             	add    $0x1,%ebx
    3718:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    371b:	7d 2e                	jge    374b <gets+0x49>
    cc = read(0, &c, 1);
    371d:	83 ec 04             	sub    $0x4,%esp
    3720:	6a 01                	push   $0x1
    3722:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3725:	50                   	push   %eax
    3726:	6a 00                	push   $0x0
    3728:	e8 ec 00 00 00       	call   3819 <read>
    if(cc < 1)
    372d:	83 c4 10             	add    $0x10,%esp
    3730:	85 c0                	test   %eax,%eax
    3732:	7e 17                	jle    374b <gets+0x49>
      break;
    buf[i++] = c;
    3734:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3738:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    373b:	3c 0a                	cmp    $0xa,%al
    373d:	0f 94 c2             	sete   %dl
    3740:	3c 0d                	cmp    $0xd,%al
    3742:	0f 94 c0             	sete   %al
    3745:	08 c2                	or     %al,%dl
    3747:	74 ca                	je     3713 <gets+0x11>
    buf[i++] = c;
    3749:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    374b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    374f:	89 f8                	mov    %edi,%eax
    3751:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3754:	5b                   	pop    %ebx
    3755:	5e                   	pop    %esi
    3756:	5f                   	pop    %edi
    3757:	5d                   	pop    %ebp
    3758:	c3                   	ret    

00003759 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
    3770:	55                   	push   %ebp
    3771:	89 e5                	mov    %esp,%ebp
    3773:	56                   	push   %esi
    3774:	53                   	push   %ebx
=======
    3759:	55                   	push   %ebp
    375a:	89 e5                	mov    %esp,%ebp
    375c:	56                   	push   %esi
    375d:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
    3775:	83 ec 08             	sub    $0x8,%esp
    3778:	6a 00                	push   $0x0
    377a:	ff 75 08             	push   0x8(%ebp)
    377d:	e8 d6 00 00 00       	call   3858 <open>
  if(fd < 0)
    3782:	83 c4 10             	add    $0x10,%esp
    3785:	85 c0                	test   %eax,%eax
    3787:	78 24                	js     37ad <stat+0x3d>
    3789:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    378b:	83 ec 08             	sub    $0x8,%esp
    378e:	ff 75 0c             	push   0xc(%ebp)
    3791:	50                   	push   %eax
    3792:	e8 d9 00 00 00       	call   3870 <fstat>
    3797:	89 c6                	mov    %eax,%esi
  close(fd);
    3799:	89 1c 24             	mov    %ebx,(%esp)
    379c:	e8 9f 00 00 00       	call   3840 <close>
  return r;
    37a1:	83 c4 10             	add    $0x10,%esp
}
    37a4:	89 f0                	mov    %esi,%eax
    37a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    37a9:	5b                   	pop    %ebx
    37aa:	5e                   	pop    %esi
    37ab:	5d                   	pop    %ebp
    37ac:	c3                   	ret    
    return -1;
    37ad:	be ff ff ff ff       	mov    $0xffffffff,%esi
    37b2:	eb f0                	jmp    37a4 <stat+0x34>

000037b4 <atoi>:
=======
    375e:	83 ec 08             	sub    $0x8,%esp
    3761:	6a 00                	push   $0x0
    3763:	ff 75 08             	push   0x8(%ebp)
    3766:	e8 d6 00 00 00       	call   3841 <open>
  if(fd < 0)
    376b:	83 c4 10             	add    $0x10,%esp
    376e:	85 c0                	test   %eax,%eax
    3770:	78 24                	js     3796 <stat+0x3d>
    3772:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    3774:	83 ec 08             	sub    $0x8,%esp
    3777:	ff 75 0c             	push   0xc(%ebp)
    377a:	50                   	push   %eax
    377b:	e8 d9 00 00 00       	call   3859 <fstat>
    3780:	89 c6                	mov    %eax,%esi
  close(fd);
    3782:	89 1c 24             	mov    %ebx,(%esp)
    3785:	e8 9f 00 00 00       	call   3829 <close>
  return r;
    378a:	83 c4 10             	add    $0x10,%esp
}
    378d:	89 f0                	mov    %esi,%eax
    378f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3792:	5b                   	pop    %ebx
    3793:	5e                   	pop    %esi
    3794:	5d                   	pop    %ebp
    3795:	c3                   	ret    
    return -1;
    3796:	be ff ff ff ff       	mov    $0xffffffff,%esi
    379b:	eb f0                	jmp    378d <stat+0x34>

0000379d <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
    37b4:	55                   	push   %ebp
    37b5:	89 e5                	mov    %esp,%ebp
    37b7:	53                   	push   %ebx
    37b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    37bb:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    37c0:	eb 10                	jmp    37d2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    37c2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    37c5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    37c8:	83 c1 01             	add    $0x1,%ecx
    37cb:	0f be c0             	movsbl %al,%eax
    37ce:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    37d2:	0f b6 01             	movzbl (%ecx),%eax
    37d5:	8d 58 d0             	lea    -0x30(%eax),%ebx
    37d8:	80 fb 09             	cmp    $0x9,%bl
    37db:	76 e5                	jbe    37c2 <atoi+0xe>
  return n;
}
    37dd:	89 d0                	mov    %edx,%eax
    37df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    37e2:	c9                   	leave  
    37e3:	c3                   	ret    

000037e4 <memmove>:
=======
    379d:	55                   	push   %ebp
    379e:	89 e5                	mov    %esp,%ebp
    37a0:	53                   	push   %ebx
    37a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    37a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    37a9:	eb 10                	jmp    37bb <atoi+0x1e>
    n = n*10 + *s++ - '0';
    37ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    37ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    37b1:	83 c1 01             	add    $0x1,%ecx
    37b4:	0f be c0             	movsbl %al,%eax
    37b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    37bb:	0f b6 01             	movzbl (%ecx),%eax
    37be:	8d 58 d0             	lea    -0x30(%eax),%ebx
    37c1:	80 fb 09             	cmp    $0x9,%bl
    37c4:	76 e5                	jbe    37ab <atoi+0xe>
  return n;
}
    37c6:	89 d0                	mov    %edx,%eax
    37c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    37cb:	c9                   	leave  
    37cc:	c3                   	ret    

000037cd <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
    37e4:	55                   	push   %ebp
    37e5:	89 e5                	mov    %esp,%ebp
    37e7:	56                   	push   %esi
    37e8:	53                   	push   %ebx
    37e9:	8b 75 08             	mov    0x8(%ebp),%esi
    37ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    37ef:	8b 45 10             	mov    0x10(%ebp),%eax
=======
    37cd:	55                   	push   %ebp
    37ce:	89 e5                	mov    %esp,%ebp
    37d0:	56                   	push   %esi
    37d1:	53                   	push   %ebx
    37d2:	8b 75 08             	mov    0x8(%ebp),%esi
    37d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    37d8:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
    37f2:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    37f4:	eb 0d                	jmp    3803 <memmove+0x1f>
    *dst++ = *src++;
    37f6:	0f b6 01             	movzbl (%ecx),%eax
    37f9:	88 02                	mov    %al,(%edx)
    37fb:	8d 49 01             	lea    0x1(%ecx),%ecx
    37fe:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    3801:	89 d8                	mov    %ebx,%eax
    3803:	8d 58 ff             	lea    -0x1(%eax),%ebx
    3806:	85 c0                	test   %eax,%eax
    3808:	7f ec                	jg     37f6 <memmove+0x12>
  return vdst;
}
    380a:	89 f0                	mov    %esi,%eax
    380c:	5b                   	pop    %ebx
    380d:	5e                   	pop    %esi
    380e:	5d                   	pop    %ebp
    380f:	c3                   	ret    

00003810 <fork>:
=======
    37db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    37dd:	eb 0d                	jmp    37ec <memmove+0x1f>
    *dst++ = *src++;
    37df:	0f b6 01             	movzbl (%ecx),%eax
    37e2:	88 02                	mov    %al,(%edx)
    37e4:	8d 49 01             	lea    0x1(%ecx),%ecx
    37e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    37ea:	89 d8                	mov    %ebx,%eax
    37ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
    37ef:	85 c0                	test   %eax,%eax
    37f1:	7f ec                	jg     37df <memmove+0x12>
  return vdst;
}
    37f3:	89 f0                	mov    %esi,%eax
    37f5:	5b                   	pop    %ebx
    37f6:	5e                   	pop    %esi
    37f7:	5d                   	pop    %ebp
    37f8:	c3                   	ret    

000037f9 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
    3810:	b8 01 00 00 00       	mov    $0x1,%eax
    3815:	cd 40                	int    $0x40
    3817:	c3                   	ret    

00003818 <exit>:
SYSCALL(exit)
    3818:	b8 02 00 00 00       	mov    $0x2,%eax
    381d:	cd 40                	int    $0x40
    381f:	c3                   	ret    

00003820 <wait>:
SYSCALL(wait)
    3820:	b8 03 00 00 00       	mov    $0x3,%eax
    3825:	cd 40                	int    $0x40
    3827:	c3                   	ret    

00003828 <pipe>:
SYSCALL(pipe)
    3828:	b8 04 00 00 00       	mov    $0x4,%eax
    382d:	cd 40                	int    $0x40
    382f:	c3                   	ret    

00003830 <read>:
SYSCALL(read)
    3830:	b8 05 00 00 00       	mov    $0x5,%eax
    3835:	cd 40                	int    $0x40
    3837:	c3                   	ret    

00003838 <write>:
SYSCALL(write)
    3838:	b8 10 00 00 00       	mov    $0x10,%eax
    383d:	cd 40                	int    $0x40
    383f:	c3                   	ret    

00003840 <close>:
SYSCALL(close)
    3840:	b8 15 00 00 00       	mov    $0x15,%eax
    3845:	cd 40                	int    $0x40
    3847:	c3                   	ret    

00003848 <kill>:
SYSCALL(kill)
    3848:	b8 06 00 00 00       	mov    $0x6,%eax
    384d:	cd 40                	int    $0x40
    384f:	c3                   	ret    

00003850 <exec>:
SYSCALL(exec)
    3850:	b8 07 00 00 00       	mov    $0x7,%eax
    3855:	cd 40                	int    $0x40
    3857:	c3                   	ret    

00003858 <open>:
SYSCALL(open)
    3858:	b8 0f 00 00 00       	mov    $0xf,%eax
    385d:	cd 40                	int    $0x40
    385f:	c3                   	ret    

00003860 <mknod>:
SYSCALL(mknod)
    3860:	b8 11 00 00 00       	mov    $0x11,%eax
    3865:	cd 40                	int    $0x40
    3867:	c3                   	ret    

00003868 <unlink>:
SYSCALL(unlink)
    3868:	b8 12 00 00 00       	mov    $0x12,%eax
    386d:	cd 40                	int    $0x40
    386f:	c3                   	ret    

00003870 <fstat>:
SYSCALL(fstat)
    3870:	b8 08 00 00 00       	mov    $0x8,%eax
    3875:	cd 40                	int    $0x40
    3877:	c3                   	ret    

00003878 <link>:
SYSCALL(link)
    3878:	b8 13 00 00 00       	mov    $0x13,%eax
    387d:	cd 40                	int    $0x40
    387f:	c3                   	ret    

00003880 <mkdir>:
SYSCALL(mkdir)
    3880:	b8 14 00 00 00       	mov    $0x14,%eax
    3885:	cd 40                	int    $0x40
    3887:	c3                   	ret    

00003888 <chdir>:
SYSCALL(chdir)
    3888:	b8 09 00 00 00       	mov    $0x9,%eax
    388d:	cd 40                	int    $0x40
    388f:	c3                   	ret    

00003890 <dup>:
SYSCALL(dup)
    3890:	b8 0a 00 00 00       	mov    $0xa,%eax
    3895:	cd 40                	int    $0x40
    3897:	c3                   	ret    

00003898 <getpid>:
SYSCALL(getpid)
    3898:	b8 0b 00 00 00       	mov    $0xb,%eax
    389d:	cd 40                	int    $0x40
    389f:	c3                   	ret    

000038a0 <sbrk>:
SYSCALL(sbrk)
    38a0:	b8 0c 00 00 00       	mov    $0xc,%eax
    38a5:	cd 40                	int    $0x40
    38a7:	c3                   	ret    

000038a8 <sleep>:
SYSCALL(sleep)
    38a8:	b8 0d 00 00 00       	mov    $0xd,%eax
    38ad:	cd 40                	int    $0x40
    38af:	c3                   	ret    

000038b0 <uptime>:
SYSCALL(uptime)
    38b0:	b8 0e 00 00 00       	mov    $0xe,%eax
    38b5:	cd 40                	int    $0x40
    38b7:	c3                   	ret    

000038b8 <clone>:
SYSCALL(clone)
    38b8:	b8 16 00 00 00       	mov    $0x16,%eax
    38bd:	cd 40                	int    $0x40
    38bf:	c3                   	ret    

000038c0 <join>:
    38c0:	b8 17 00 00 00       	mov    $0x17,%eax
    38c5:	cd 40                	int    $0x40
    38c7:	c3                   	ret    

000038c8 <putc>:
=======
    37f9:	b8 01 00 00 00       	mov    $0x1,%eax
    37fe:	cd 40                	int    $0x40
    3800:	c3                   	ret    

00003801 <exit>:
SYSCALL(exit)
    3801:	b8 02 00 00 00       	mov    $0x2,%eax
    3806:	cd 40                	int    $0x40
    3808:	c3                   	ret    

00003809 <wait>:
SYSCALL(wait)
    3809:	b8 03 00 00 00       	mov    $0x3,%eax
    380e:	cd 40                	int    $0x40
    3810:	c3                   	ret    

00003811 <pipe>:
SYSCALL(pipe)
    3811:	b8 04 00 00 00       	mov    $0x4,%eax
    3816:	cd 40                	int    $0x40
    3818:	c3                   	ret    

00003819 <read>:
SYSCALL(read)
    3819:	b8 05 00 00 00       	mov    $0x5,%eax
    381e:	cd 40                	int    $0x40
    3820:	c3                   	ret    

00003821 <write>:
SYSCALL(write)
    3821:	b8 10 00 00 00       	mov    $0x10,%eax
    3826:	cd 40                	int    $0x40
    3828:	c3                   	ret    

00003829 <close>:
SYSCALL(close)
    3829:	b8 15 00 00 00       	mov    $0x15,%eax
    382e:	cd 40                	int    $0x40
    3830:	c3                   	ret    

00003831 <kill>:
SYSCALL(kill)
    3831:	b8 06 00 00 00       	mov    $0x6,%eax
    3836:	cd 40                	int    $0x40
    3838:	c3                   	ret    

00003839 <exec>:
SYSCALL(exec)
    3839:	b8 07 00 00 00       	mov    $0x7,%eax
    383e:	cd 40                	int    $0x40
    3840:	c3                   	ret    

00003841 <open>:
SYSCALL(open)
    3841:	b8 0f 00 00 00       	mov    $0xf,%eax
    3846:	cd 40                	int    $0x40
    3848:	c3                   	ret    

00003849 <mknod>:
SYSCALL(mknod)
    3849:	b8 11 00 00 00       	mov    $0x11,%eax
    384e:	cd 40                	int    $0x40
    3850:	c3                   	ret    

00003851 <unlink>:
SYSCALL(unlink)
    3851:	b8 12 00 00 00       	mov    $0x12,%eax
    3856:	cd 40                	int    $0x40
    3858:	c3                   	ret    

00003859 <fstat>:
SYSCALL(fstat)
    3859:	b8 08 00 00 00       	mov    $0x8,%eax
    385e:	cd 40                	int    $0x40
    3860:	c3                   	ret    

00003861 <link>:
SYSCALL(link)
    3861:	b8 13 00 00 00       	mov    $0x13,%eax
    3866:	cd 40                	int    $0x40
    3868:	c3                   	ret    

00003869 <mkdir>:
SYSCALL(mkdir)
    3869:	b8 14 00 00 00       	mov    $0x14,%eax
    386e:	cd 40                	int    $0x40
    3870:	c3                   	ret    

00003871 <chdir>:
SYSCALL(chdir)
    3871:	b8 09 00 00 00       	mov    $0x9,%eax
    3876:	cd 40                	int    $0x40
    3878:	c3                   	ret    

00003879 <dup>:
SYSCALL(dup)
    3879:	b8 0a 00 00 00       	mov    $0xa,%eax
    387e:	cd 40                	int    $0x40
    3880:	c3                   	ret    

00003881 <getpid>:
SYSCALL(getpid)
    3881:	b8 0b 00 00 00       	mov    $0xb,%eax
    3886:	cd 40                	int    $0x40
    3888:	c3                   	ret    

00003889 <sbrk>:
SYSCALL(sbrk)
    3889:	b8 0c 00 00 00       	mov    $0xc,%eax
    388e:	cd 40                	int    $0x40
    3890:	c3                   	ret    

00003891 <sleep>:
SYSCALL(sleep)
    3891:	b8 0d 00 00 00       	mov    $0xd,%eax
    3896:	cd 40                	int    $0x40
    3898:	c3                   	ret    

00003899 <uptime>:
SYSCALL(uptime)
    3899:	b8 0e 00 00 00       	mov    $0xe,%eax
    389e:	cd 40                	int    $0x40
    38a0:	c3                   	ret    

000038a1 <clone>:
SYSCALL(clone)
    38a1:	b8 16 00 00 00       	mov    $0x16,%eax
    38a6:	cd 40                	int    $0x40
    38a8:	c3                   	ret    

000038a9 <join>:
    38a9:	b8 17 00 00 00       	mov    $0x17,%eax
    38ae:	cd 40                	int    $0x40
    38b0:	c3                   	ret    

000038b1 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
    38c8:	55                   	push   %ebp
    38c9:	89 e5                	mov    %esp,%ebp
    38cb:	83 ec 1c             	sub    $0x1c,%esp
    38ce:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    38d1:	6a 01                	push   $0x1
    38d3:	8d 55 f4             	lea    -0xc(%ebp),%edx
    38d6:	52                   	push   %edx
    38d7:	50                   	push   %eax
    38d8:	e8 5b ff ff ff       	call   3838 <write>
}
    38dd:	83 c4 10             	add    $0x10,%esp
    38e0:	c9                   	leave  
    38e1:	c3                   	ret    

000038e2 <printint>:
=======
    38b1:	55                   	push   %ebp
    38b2:	89 e5                	mov    %esp,%ebp
    38b4:	83 ec 1c             	sub    $0x1c,%esp
    38b7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    38ba:	6a 01                	push   $0x1
    38bc:	8d 55 f4             	lea    -0xc(%ebp),%edx
    38bf:	52                   	push   %edx
    38c0:	50                   	push   %eax
    38c1:	e8 5b ff ff ff       	call   3821 <write>
}
    38c6:	83 c4 10             	add    $0x10,%esp
    38c9:	c9                   	leave  
    38ca:	c3                   	ret    

000038cb <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
    38e2:	55                   	push   %ebp
    38e3:	89 e5                	mov    %esp,%ebp
    38e5:	57                   	push   %edi
    38e6:	56                   	push   %esi
    38e7:	53                   	push   %ebx
    38e8:	83 ec 2c             	sub    $0x2c,%esp
    38eb:	89 45 d0             	mov    %eax,-0x30(%ebp)
    38ee:	89 d0                	mov    %edx,%eax
    38f0:	89 ce                	mov    %ecx,%esi
=======
    38cb:	55                   	push   %ebp
    38cc:	89 e5                	mov    %esp,%ebp
    38ce:	57                   	push   %edi
    38cf:	56                   	push   %esi
    38d0:	53                   	push   %ebx
    38d1:	83 ec 2c             	sub    $0x2c,%esp
    38d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    38d7:	89 d0                	mov    %edx,%eax
    38d9:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
    38f2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    38f6:	0f 95 c1             	setne  %cl
    38f9:	c1 ea 1f             	shr    $0x1f,%edx
    38fc:	84 d1                	test   %dl,%cl
    38fe:	74 44                	je     3944 <printint+0x62>
    neg = 1;
    x = -xx;
    3900:	f7 d8                	neg    %eax
    3902:	89 c1                	mov    %eax,%ecx
    neg = 1;
    3904:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
    38db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    38df:	0f 95 c1             	setne  %cl
    38e2:	c1 ea 1f             	shr    $0x1f,%edx
    38e5:	84 d1                	test   %dl,%cl
    38e7:	74 44                	je     392d <printint+0x62>
    neg = 1;
    x = -xx;
    38e9:	f7 d8                	neg    %eax
    38eb:	89 c1                	mov    %eax,%ecx
    neg = 1;
    38ed:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
    390b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    3910:	89 c8                	mov    %ecx,%eax
    3912:	ba 00 00 00 00       	mov    $0x0,%edx
    3917:	f7 f6                	div    %esi
    3919:	89 df                	mov    %ebx,%edi
    391b:	83 c3 01             	add    $0x1,%ebx
    391e:	0f b6 92 14 54 00 00 	movzbl 0x5414(%edx),%edx
    3925:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    3929:	89 ca                	mov    %ecx,%edx
    392b:	89 c1                	mov    %eax,%ecx
    392d:	39 d6                	cmp    %edx,%esi
    392f:	76 df                	jbe    3910 <printint+0x2e>
  if(neg)
    3931:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    3935:	74 31                	je     3968 <printint+0x86>
    buf[i++] = '-';
    3937:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    393c:	8d 5f 02             	lea    0x2(%edi),%ebx
    393f:	8b 75 d0             	mov    -0x30(%ebp),%esi
    3942:	eb 17                	jmp    395b <printint+0x79>
    x = xx;
    3944:	89 c1                	mov    %eax,%ecx
  neg = 0;
    3946:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    394d:	eb bc                	jmp    390b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    394f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    3954:	89 f0                	mov    %esi,%eax
    3956:	e8 6d ff ff ff       	call   38c8 <putc>
  while(--i >= 0)
    395b:	83 eb 01             	sub    $0x1,%ebx
    395e:	79 ef                	jns    394f <printint+0x6d>
}
    3960:	83 c4 2c             	add    $0x2c,%esp
    3963:	5b                   	pop    %ebx
    3964:	5e                   	pop    %esi
    3965:	5f                   	pop    %edi
    3966:	5d                   	pop    %ebp
    3967:	c3                   	ret    
    3968:	8b 75 d0             	mov    -0x30(%ebp),%esi
    396b:	eb ee                	jmp    395b <printint+0x79>

0000396d <printf>:
=======
    38f4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    38f9:	89 c8                	mov    %ecx,%eax
    38fb:	ba 00 00 00 00       	mov    $0x0,%edx
    3900:	f7 f6                	div    %esi
    3902:	89 df                	mov    %ebx,%edi
    3904:	83 c3 01             	add    $0x1,%ebx
    3907:	0f b6 92 fc 53 00 00 	movzbl 0x53fc(%edx),%edx
    390e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    3912:	89 ca                	mov    %ecx,%edx
    3914:	89 c1                	mov    %eax,%ecx
    3916:	39 d6                	cmp    %edx,%esi
    3918:	76 df                	jbe    38f9 <printint+0x2e>
  if(neg)
    391a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    391e:	74 31                	je     3951 <printint+0x86>
    buf[i++] = '-';
    3920:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    3925:	8d 5f 02             	lea    0x2(%edi),%ebx
    3928:	8b 75 d0             	mov    -0x30(%ebp),%esi
    392b:	eb 17                	jmp    3944 <printint+0x79>
    x = xx;
    392d:	89 c1                	mov    %eax,%ecx
  neg = 0;
    392f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    3936:	eb bc                	jmp    38f4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    3938:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    393d:	89 f0                	mov    %esi,%eax
    393f:	e8 6d ff ff ff       	call   38b1 <putc>
  while(--i >= 0)
    3944:	83 eb 01             	sub    $0x1,%ebx
    3947:	79 ef                	jns    3938 <printint+0x6d>
}
    3949:	83 c4 2c             	add    $0x2c,%esp
    394c:	5b                   	pop    %ebx
    394d:	5e                   	pop    %esi
    394e:	5f                   	pop    %edi
    394f:	5d                   	pop    %ebp
    3950:	c3                   	ret    
    3951:	8b 75 d0             	mov    -0x30(%ebp),%esi
    3954:	eb ee                	jmp    3944 <printint+0x79>

00003956 <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
    396d:	55                   	push   %ebp
    396e:	89 e5                	mov    %esp,%ebp
    3970:	57                   	push   %edi
    3971:	56                   	push   %esi
    3972:	53                   	push   %ebx
    3973:	83 ec 1c             	sub    $0x1c,%esp
=======
    3956:	55                   	push   %ebp
    3957:	89 e5                	mov    %esp,%ebp
    3959:	57                   	push   %edi
    395a:	56                   	push   %esi
    395b:	53                   	push   %ebx
    395c:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
    3976:	8d 45 10             	lea    0x10(%ebp),%eax
    3979:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    397c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    3981:	bb 00 00 00 00       	mov    $0x0,%ebx
    3986:	eb 14                	jmp    399c <printf+0x2f>
=======
    395f:	8d 45 10             	lea    0x10(%ebp),%eax
    3962:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    3965:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    396a:	bb 00 00 00 00       	mov    $0x0,%ebx
    396f:	eb 14                	jmp    3985 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
    3988:	89 fa                	mov    %edi,%edx
    398a:	8b 45 08             	mov    0x8(%ebp),%eax
    398d:	e8 36 ff ff ff       	call   38c8 <putc>
    3992:	eb 05                	jmp    3999 <printf+0x2c>
      }
    } else if(state == '%'){
    3994:	83 fe 25             	cmp    $0x25,%esi
    3997:	74 25                	je     39be <printf+0x51>
  for(i = 0; fmt[i]; i++){
    3999:	83 c3 01             	add    $0x1,%ebx
    399c:	8b 45 0c             	mov    0xc(%ebp),%eax
    399f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    39a3:	84 c0                	test   %al,%al
    39a5:	0f 84 20 01 00 00    	je     3acb <printf+0x15e>
    c = fmt[i] & 0xff;
    39ab:	0f be f8             	movsbl %al,%edi
    39ae:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    39b1:	85 f6                	test   %esi,%esi
    39b3:	75 df                	jne    3994 <printf+0x27>
      if(c == '%'){
    39b5:	83 f8 25             	cmp    $0x25,%eax
    39b8:	75 ce                	jne    3988 <printf+0x1b>
        state = '%';
    39ba:	89 c6                	mov    %eax,%esi
    39bc:	eb db                	jmp    3999 <printf+0x2c>
      if(c == 'd'){
    39be:	83 f8 25             	cmp    $0x25,%eax
    39c1:	0f 84 cf 00 00 00    	je     3a96 <printf+0x129>
    39c7:	0f 8c dd 00 00 00    	jl     3aaa <printf+0x13d>
    39cd:	83 f8 78             	cmp    $0x78,%eax
    39d0:	0f 8f d4 00 00 00    	jg     3aaa <printf+0x13d>
    39d6:	83 f8 63             	cmp    $0x63,%eax
    39d9:	0f 8c cb 00 00 00    	jl     3aaa <printf+0x13d>
    39df:	83 e8 63             	sub    $0x63,%eax
    39e2:	83 f8 15             	cmp    $0x15,%eax
    39e5:	0f 87 bf 00 00 00    	ja     3aaa <printf+0x13d>
    39eb:	ff 24 85 bc 53 00 00 	jmp    *0x53bc(,%eax,4)
        printint(fd, *ap, 10, 1);
    39f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    39f5:	8b 17                	mov    (%edi),%edx
    39f7:	83 ec 0c             	sub    $0xc,%esp
    39fa:	6a 01                	push   $0x1
    39fc:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3a01:	8b 45 08             	mov    0x8(%ebp),%eax
    3a04:	e8 d9 fe ff ff       	call   38e2 <printint>
        ap++;
    3a09:	83 c7 04             	add    $0x4,%edi
    3a0c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    3a0f:	83 c4 10             	add    $0x10,%esp
=======
    3971:	89 fa                	mov    %edi,%edx
    3973:	8b 45 08             	mov    0x8(%ebp),%eax
    3976:	e8 36 ff ff ff       	call   38b1 <putc>
    397b:	eb 05                	jmp    3982 <printf+0x2c>
      }
    } else if(state == '%'){
    397d:	83 fe 25             	cmp    $0x25,%esi
    3980:	74 25                	je     39a7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
    3982:	83 c3 01             	add    $0x1,%ebx
    3985:	8b 45 0c             	mov    0xc(%ebp),%eax
    3988:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    398c:	84 c0                	test   %al,%al
    398e:	0f 84 20 01 00 00    	je     3ab4 <printf+0x15e>
    c = fmt[i] & 0xff;
    3994:	0f be f8             	movsbl %al,%edi
    3997:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    399a:	85 f6                	test   %esi,%esi
    399c:	75 df                	jne    397d <printf+0x27>
      if(c == '%'){
    399e:	83 f8 25             	cmp    $0x25,%eax
    39a1:	75 ce                	jne    3971 <printf+0x1b>
        state = '%';
    39a3:	89 c6                	mov    %eax,%esi
    39a5:	eb db                	jmp    3982 <printf+0x2c>
      if(c == 'd'){
    39a7:	83 f8 25             	cmp    $0x25,%eax
    39aa:	0f 84 cf 00 00 00    	je     3a7f <printf+0x129>
    39b0:	0f 8c dd 00 00 00    	jl     3a93 <printf+0x13d>
    39b6:	83 f8 78             	cmp    $0x78,%eax
    39b9:	0f 8f d4 00 00 00    	jg     3a93 <printf+0x13d>
    39bf:	83 f8 63             	cmp    $0x63,%eax
    39c2:	0f 8c cb 00 00 00    	jl     3a93 <printf+0x13d>
    39c8:	83 e8 63             	sub    $0x63,%eax
    39cb:	83 f8 15             	cmp    $0x15,%eax
    39ce:	0f 87 bf 00 00 00    	ja     3a93 <printf+0x13d>
    39d4:	ff 24 85 a4 53 00 00 	jmp    *0x53a4(,%eax,4)
        printint(fd, *ap, 10, 1);
    39db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    39de:	8b 17                	mov    (%edi),%edx
    39e0:	83 ec 0c             	sub    $0xc,%esp
    39e3:	6a 01                	push   $0x1
    39e5:	b9 0a 00 00 00       	mov    $0xa,%ecx
    39ea:	8b 45 08             	mov    0x8(%ebp),%eax
    39ed:	e8 d9 fe ff ff       	call   38cb <printint>
        ap++;
    39f2:	83 c7 04             	add    $0x4,%edi
    39f5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    39f8:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
    3a12:	be 00 00 00 00       	mov    $0x0,%esi
    3a17:	eb 80                	jmp    3999 <printf+0x2c>
        printint(fd, *ap, 16, 0);
    3a19:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3a1c:	8b 17                	mov    (%edi),%edx
    3a1e:	83 ec 0c             	sub    $0xc,%esp
    3a21:	6a 00                	push   $0x0
    3a23:	b9 10 00 00 00       	mov    $0x10,%ecx
    3a28:	8b 45 08             	mov    0x8(%ebp),%eax
    3a2b:	e8 b2 fe ff ff       	call   38e2 <printint>
        ap++;
    3a30:	83 c7 04             	add    $0x4,%edi
    3a33:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    3a36:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3a39:	be 00 00 00 00       	mov    $0x0,%esi
    3a3e:	e9 56 ff ff ff       	jmp    3999 <printf+0x2c>
        s = (char*)*ap;
    3a43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a46:	8b 30                	mov    (%eax),%esi
        ap++;
    3a48:	83 c0 04             	add    $0x4,%eax
    3a4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    3a4e:	85 f6                	test   %esi,%esi
    3a50:	75 15                	jne    3a67 <printf+0xfa>
          s = "(null)";
    3a52:	be b2 53 00 00       	mov    $0x53b2,%esi
    3a57:	eb 0e                	jmp    3a67 <printf+0xfa>
          putc(fd, *s);
    3a59:	0f be d2             	movsbl %dl,%edx
    3a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    3a5f:	e8 64 fe ff ff       	call   38c8 <putc>
          s++;
    3a64:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    3a67:	0f b6 16             	movzbl (%esi),%edx
    3a6a:	84 d2                	test   %dl,%dl
    3a6c:	75 eb                	jne    3a59 <printf+0xec>
      state = 0;
    3a6e:	be 00 00 00 00       	mov    $0x0,%esi
    3a73:	e9 21 ff ff ff       	jmp    3999 <printf+0x2c>
        putc(fd, *ap);
    3a78:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3a7b:	0f be 17             	movsbl (%edi),%edx
    3a7e:	8b 45 08             	mov    0x8(%ebp),%eax
    3a81:	e8 42 fe ff ff       	call   38c8 <putc>
        ap++;
    3a86:	83 c7 04             	add    $0x4,%edi
    3a89:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    3a8c:	be 00 00 00 00       	mov    $0x0,%esi
    3a91:	e9 03 ff ff ff       	jmp    3999 <printf+0x2c>
        putc(fd, c);
    3a96:	89 fa                	mov    %edi,%edx
    3a98:	8b 45 08             	mov    0x8(%ebp),%eax
    3a9b:	e8 28 fe ff ff       	call   38c8 <putc>
      state = 0;
    3aa0:	be 00 00 00 00       	mov    $0x0,%esi
    3aa5:	e9 ef fe ff ff       	jmp    3999 <printf+0x2c>
        putc(fd, '%');
    3aaa:	ba 25 00 00 00       	mov    $0x25,%edx
    3aaf:	8b 45 08             	mov    0x8(%ebp),%eax
    3ab2:	e8 11 fe ff ff       	call   38c8 <putc>
        putc(fd, c);
    3ab7:	89 fa                	mov    %edi,%edx
    3ab9:	8b 45 08             	mov    0x8(%ebp),%eax
    3abc:	e8 07 fe ff ff       	call   38c8 <putc>
      state = 0;
    3ac1:	be 00 00 00 00       	mov    $0x0,%esi
    3ac6:	e9 ce fe ff ff       	jmp    3999 <printf+0x2c>
    }
  }
}
    3acb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ace:	5b                   	pop    %ebx
    3acf:	5e                   	pop    %esi
    3ad0:	5f                   	pop    %edi
    3ad1:	5d                   	pop    %ebp
    3ad2:	c3                   	ret    

00003ad3 <free>:
=======
    39fb:	be 00 00 00 00       	mov    $0x0,%esi
    3a00:	eb 80                	jmp    3982 <printf+0x2c>
        printint(fd, *ap, 16, 0);
    3a02:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3a05:	8b 17                	mov    (%edi),%edx
    3a07:	83 ec 0c             	sub    $0xc,%esp
    3a0a:	6a 00                	push   $0x0
    3a0c:	b9 10 00 00 00       	mov    $0x10,%ecx
    3a11:	8b 45 08             	mov    0x8(%ebp),%eax
    3a14:	e8 b2 fe ff ff       	call   38cb <printint>
        ap++;
    3a19:	83 c7 04             	add    $0x4,%edi
    3a1c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    3a1f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3a22:	be 00 00 00 00       	mov    $0x0,%esi
    3a27:	e9 56 ff ff ff       	jmp    3982 <printf+0x2c>
        s = (char*)*ap;
    3a2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a2f:	8b 30                	mov    (%eax),%esi
        ap++;
    3a31:	83 c0 04             	add    $0x4,%eax
    3a34:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    3a37:	85 f6                	test   %esi,%esi
    3a39:	75 15                	jne    3a50 <printf+0xfa>
          s = "(null)";
    3a3b:	be 9a 53 00 00       	mov    $0x539a,%esi
    3a40:	eb 0e                	jmp    3a50 <printf+0xfa>
          putc(fd, *s);
    3a42:	0f be d2             	movsbl %dl,%edx
    3a45:	8b 45 08             	mov    0x8(%ebp),%eax
    3a48:	e8 64 fe ff ff       	call   38b1 <putc>
          s++;
    3a4d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    3a50:	0f b6 16             	movzbl (%esi),%edx
    3a53:	84 d2                	test   %dl,%dl
    3a55:	75 eb                	jne    3a42 <printf+0xec>
      state = 0;
    3a57:	be 00 00 00 00       	mov    $0x0,%esi
    3a5c:	e9 21 ff ff ff       	jmp    3982 <printf+0x2c>
        putc(fd, *ap);
    3a61:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3a64:	0f be 17             	movsbl (%edi),%edx
    3a67:	8b 45 08             	mov    0x8(%ebp),%eax
    3a6a:	e8 42 fe ff ff       	call   38b1 <putc>
        ap++;
    3a6f:	83 c7 04             	add    $0x4,%edi
    3a72:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    3a75:	be 00 00 00 00       	mov    $0x0,%esi
    3a7a:	e9 03 ff ff ff       	jmp    3982 <printf+0x2c>
        putc(fd, c);
    3a7f:	89 fa                	mov    %edi,%edx
    3a81:	8b 45 08             	mov    0x8(%ebp),%eax
    3a84:	e8 28 fe ff ff       	call   38b1 <putc>
      state = 0;
    3a89:	be 00 00 00 00       	mov    $0x0,%esi
    3a8e:	e9 ef fe ff ff       	jmp    3982 <printf+0x2c>
        putc(fd, '%');
    3a93:	ba 25 00 00 00       	mov    $0x25,%edx
    3a98:	8b 45 08             	mov    0x8(%ebp),%eax
    3a9b:	e8 11 fe ff ff       	call   38b1 <putc>
        putc(fd, c);
    3aa0:	89 fa                	mov    %edi,%edx
    3aa2:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa5:	e8 07 fe ff ff       	call   38b1 <putc>
      state = 0;
    3aaa:	be 00 00 00 00       	mov    $0x0,%esi
    3aaf:	e9 ce fe ff ff       	jmp    3982 <printf+0x2c>
    }
  }
}
    3ab4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ab7:	5b                   	pop    %ebx
    3ab8:	5e                   	pop    %esi
    3ab9:	5f                   	pop    %edi
    3aba:	5d                   	pop    %ebp
    3abb:	c3                   	ret    

00003abc <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
    3ad3:	55                   	push   %ebp
    3ad4:	89 e5                	mov    %esp,%ebp
    3ad6:	57                   	push   %edi
    3ad7:	56                   	push   %esi
    3ad8:	53                   	push   %ebx
    3ad9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3adc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3adf:	a1 40 a6 00 00       	mov    0xa640,%eax
    3ae4:	eb 02                	jmp    3ae8 <free+0x15>
    3ae6:	89 d0                	mov    %edx,%eax
    3ae8:	39 c8                	cmp    %ecx,%eax
    3aea:	73 04                	jae    3af0 <free+0x1d>
    3aec:	39 08                	cmp    %ecx,(%eax)
    3aee:	77 12                	ja     3b02 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3af0:	8b 10                	mov    (%eax),%edx
    3af2:	39 c2                	cmp    %eax,%edx
    3af4:	77 f0                	ja     3ae6 <free+0x13>
    3af6:	39 c8                	cmp    %ecx,%eax
    3af8:	72 08                	jb     3b02 <free+0x2f>
    3afa:	39 ca                	cmp    %ecx,%edx
    3afc:	77 04                	ja     3b02 <free+0x2f>
    3afe:	89 d0                	mov    %edx,%eax
    3b00:	eb e6                	jmp    3ae8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3b02:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3b05:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3b08:	8b 10                	mov    (%eax),%edx
    3b0a:	39 d7                	cmp    %edx,%edi
    3b0c:	74 19                	je     3b27 <free+0x54>
=======
    3abc:	55                   	push   %ebp
    3abd:	89 e5                	mov    %esp,%ebp
    3abf:	57                   	push   %edi
    3ac0:	56                   	push   %esi
    3ac1:	53                   	push   %ebx
    3ac2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3ac5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3ac8:	a1 20 a8 00 00       	mov    0xa820,%eax
    3acd:	eb 02                	jmp    3ad1 <free+0x15>
    3acf:	89 d0                	mov    %edx,%eax
    3ad1:	39 c8                	cmp    %ecx,%eax
    3ad3:	73 04                	jae    3ad9 <free+0x1d>
    3ad5:	39 08                	cmp    %ecx,(%eax)
    3ad7:	77 12                	ja     3aeb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3ad9:	8b 10                	mov    (%eax),%edx
    3adb:	39 c2                	cmp    %eax,%edx
    3add:	77 f0                	ja     3acf <free+0x13>
    3adf:	39 c8                	cmp    %ecx,%eax
    3ae1:	72 08                	jb     3aeb <free+0x2f>
    3ae3:	39 ca                	cmp    %ecx,%edx
    3ae5:	77 04                	ja     3aeb <free+0x2f>
    3ae7:	89 d0                	mov    %edx,%eax
    3ae9:	eb e6                	jmp    3ad1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3aeb:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3aee:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3af1:	8b 10                	mov    (%eax),%edx
    3af3:	39 d7                	cmp    %edx,%edi
    3af5:	74 19                	je     3b10 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
    3b0e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3b11:	8b 50 04             	mov    0x4(%eax),%edx
    3b14:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3b17:	39 ce                	cmp    %ecx,%esi
    3b19:	74 1b                	je     3b36 <free+0x63>
=======
    3af7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3afa:	8b 50 04             	mov    0x4(%eax),%edx
    3afd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3b00:	39 ce                	cmp    %ecx,%esi
    3b02:	74 1b                	je     3b1f <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
    3b1b:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3b1d:	a3 40 a6 00 00       	mov    %eax,0xa640
}
    3b22:	5b                   	pop    %ebx
    3b23:	5e                   	pop    %esi
    3b24:	5f                   	pop    %edi
    3b25:	5d                   	pop    %ebp
    3b26:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    3b27:	03 72 04             	add    0x4(%edx),%esi
    3b2a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3b2d:	8b 10                	mov    (%eax),%edx
    3b2f:	8b 12                	mov    (%edx),%edx
    3b31:	89 53 f8             	mov    %edx,-0x8(%ebx)
    3b34:	eb db                	jmp    3b11 <free+0x3e>
    p->s.size += bp->s.size;
    3b36:	03 53 fc             	add    -0x4(%ebx),%edx
    3b39:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3b3c:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3b3f:	89 10                	mov    %edx,(%eax)
    3b41:	eb da                	jmp    3b1d <free+0x4a>

00003b43 <morecore>:
=======
    3b04:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3b06:	a3 20 a8 00 00       	mov    %eax,0xa820
}
    3b0b:	5b                   	pop    %ebx
    3b0c:	5e                   	pop    %esi
    3b0d:	5f                   	pop    %edi
    3b0e:	5d                   	pop    %ebp
    3b0f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    3b10:	03 72 04             	add    0x4(%edx),%esi
    3b13:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3b16:	8b 10                	mov    (%eax),%edx
    3b18:	8b 12                	mov    (%edx),%edx
    3b1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    3b1d:	eb db                	jmp    3afa <free+0x3e>
    p->s.size += bp->s.size;
    3b1f:	03 53 fc             	add    -0x4(%ebx),%edx
    3b22:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3b25:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3b28:	89 10                	mov    %edx,(%eax)
    3b2a:	eb da                	jmp    3b06 <free+0x4a>

00003b2c <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
    3b43:	55                   	push   %ebp
    3b44:	89 e5                	mov    %esp,%ebp
    3b46:	53                   	push   %ebx
    3b47:	83 ec 04             	sub    $0x4,%esp
    3b4a:	89 c3                	mov    %eax,%ebx
=======
    3b2c:	55                   	push   %ebp
    3b2d:	89 e5                	mov    %esp,%ebp
    3b2f:	53                   	push   %ebx
    3b30:	83 ec 04             	sub    $0x4,%esp
    3b33:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
    3b4c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    3b51:	77 05                	ja     3b58 <morecore+0x15>
    nu = 4096;
    3b53:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    3b58:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    3b5f:	83 ec 0c             	sub    $0xc,%esp
    3b62:	50                   	push   %eax
    3b63:	e8 38 fd ff ff       	call   38a0 <sbrk>
  if(p == (char*)-1)
    3b68:	83 c4 10             	add    $0x10,%esp
    3b6b:	83 f8 ff             	cmp    $0xffffffff,%eax
    3b6e:	74 1c                	je     3b8c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3b70:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3b73:	83 c0 08             	add    $0x8,%eax
    3b76:	83 ec 0c             	sub    $0xc,%esp
    3b79:	50                   	push   %eax
    3b7a:	e8 54 ff ff ff       	call   3ad3 <free>
  return freep;
    3b7f:	a1 40 a6 00 00       	mov    0xa640,%eax
    3b84:	83 c4 10             	add    $0x10,%esp
}
    3b87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b8a:	c9                   	leave  
    3b8b:	c3                   	ret    
    return 0;
    3b8c:	b8 00 00 00 00       	mov    $0x0,%eax
    3b91:	eb f4                	jmp    3b87 <morecore+0x44>

00003b93 <malloc>:
=======
    3b35:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    3b3a:	77 05                	ja     3b41 <morecore+0x15>
    nu = 4096;
    3b3c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    3b41:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    3b48:	83 ec 0c             	sub    $0xc,%esp
    3b4b:	50                   	push   %eax
    3b4c:	e8 38 fd ff ff       	call   3889 <sbrk>
  if(p == (char*)-1)
    3b51:	83 c4 10             	add    $0x10,%esp
    3b54:	83 f8 ff             	cmp    $0xffffffff,%eax
    3b57:	74 1c                	je     3b75 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3b59:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3b5c:	83 c0 08             	add    $0x8,%eax
    3b5f:	83 ec 0c             	sub    $0xc,%esp
    3b62:	50                   	push   %eax
    3b63:	e8 54 ff ff ff       	call   3abc <free>
  return freep;
    3b68:	a1 20 a8 00 00       	mov    0xa820,%eax
    3b6d:	83 c4 10             	add    $0x10,%esp
}
    3b70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b73:	c9                   	leave  
    3b74:	c3                   	ret    
    return 0;
    3b75:	b8 00 00 00 00       	mov    $0x0,%eax
    3b7a:	eb f4                	jmp    3b70 <morecore+0x44>

00003b7c <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
    3b93:	55                   	push   %ebp
    3b94:	89 e5                	mov    %esp,%ebp
    3b96:	53                   	push   %ebx
    3b97:	83 ec 04             	sub    $0x4,%esp
=======
    3b7c:	55                   	push   %ebp
    3b7d:	89 e5                	mov    %esp,%ebp
    3b7f:	53                   	push   %ebx
    3b80:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
    3b9a:	8b 45 08             	mov    0x8(%ebp),%eax
    3b9d:	8d 58 07             	lea    0x7(%eax),%ebx
    3ba0:	c1 eb 03             	shr    $0x3,%ebx
    3ba3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    3ba6:	8b 0d 40 a6 00 00    	mov    0xa640,%ecx
    3bac:	85 c9                	test   %ecx,%ecx
    3bae:	74 04                	je     3bb4 <malloc+0x21>
=======
    3b83:	8b 45 08             	mov    0x8(%ebp),%eax
    3b86:	8d 58 07             	lea    0x7(%eax),%ebx
    3b89:	c1 eb 03             	shr    $0x3,%ebx
    3b8c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    3b8f:	8b 0d 20 a8 00 00    	mov    0xa820,%ecx
    3b95:	85 c9                	test   %ecx,%ecx
    3b97:	74 04                	je     3b9d <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
    3bb0:	8b 01                	mov    (%ecx),%eax
    3bb2:	eb 4a                	jmp    3bfe <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    3bb4:	c7 05 40 a6 00 00 44 	movl   $0xa644,0xa640
    3bbb:	a6 00 00 
    3bbe:	c7 05 44 a6 00 00 44 	movl   $0xa644,0xa644
    3bc5:	a6 00 00 
    base.s.size = 0;
    3bc8:	c7 05 48 a6 00 00 00 	movl   $0x0,0xa648
    3bcf:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    3bd2:	b9 44 a6 00 00       	mov    $0xa644,%ecx
    3bd7:	eb d7                	jmp    3bb0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3bd9:	74 19                	je     3bf4 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3bdb:	29 da                	sub    %ebx,%edx
    3bdd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    3be0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    3be3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    3be6:	89 0d 40 a6 00 00    	mov    %ecx,0xa640
      return (void*)(p + 1);
    3bec:	83 c0 08             	add    $0x8,%eax
=======
    3b99:	8b 01                	mov    (%ecx),%eax
    3b9b:	eb 4a                	jmp    3be7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    3b9d:	c7 05 20 a8 00 00 24 	movl   $0xa824,0xa820
    3ba4:	a8 00 00 
    3ba7:	c7 05 24 a8 00 00 24 	movl   $0xa824,0xa824
    3bae:	a8 00 00 
    base.s.size = 0;
    3bb1:	c7 05 28 a8 00 00 00 	movl   $0x0,0xa828
    3bb8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    3bbb:	b9 24 a8 00 00       	mov    $0xa824,%ecx
    3bc0:	eb d7                	jmp    3b99 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3bc2:	74 19                	je     3bdd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3bc4:	29 da                	sub    %ebx,%edx
    3bc6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    3bc9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    3bcc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    3bcf:	89 0d 20 a8 00 00    	mov    %ecx,0xa820
      return (void*)(p + 1);
    3bd5:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
    3bef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3bf2:	c9                   	leave  
    3bf3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    3bf4:	8b 10                	mov    (%eax),%edx
    3bf6:	89 11                	mov    %edx,(%ecx)
    3bf8:	eb ec                	jmp    3be6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3bfa:	89 c1                	mov    %eax,%ecx
    3bfc:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    3bfe:	8b 50 04             	mov    0x4(%eax),%edx
    3c01:	39 da                	cmp    %ebx,%edx
    3c03:	73 d4                	jae    3bd9 <malloc+0x46>
    if(p == freep)
    3c05:	39 05 40 a6 00 00    	cmp    %eax,0xa640
    3c0b:	75 ed                	jne    3bfa <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    3c0d:	89 d8                	mov    %ebx,%eax
    3c0f:	e8 2f ff ff ff       	call   3b43 <morecore>
    3c14:	85 c0                	test   %eax,%eax
    3c16:	75 e2                	jne    3bfa <malloc+0x67>
    3c18:	eb d5                	jmp    3bef <malloc+0x5c>
=======
    3bd8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3bdb:	c9                   	leave  
    3bdc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    3bdd:	8b 10                	mov    (%eax),%edx
    3bdf:	89 11                	mov    %edx,(%ecx)
    3be1:	eb ec                	jmp    3bcf <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3be3:	89 c1                	mov    %eax,%ecx
    3be5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    3be7:	8b 50 04             	mov    0x4(%eax),%edx
    3bea:	39 da                	cmp    %ebx,%edx
    3bec:	73 d4                	jae    3bc2 <malloc+0x46>
    if(p == freep)
    3bee:	39 05 20 a8 00 00    	cmp    %eax,0xa820
    3bf4:	75 ed                	jne    3be3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    3bf6:	89 d8                	mov    %ebx,%eax
    3bf8:	e8 2f ff ff ff       	call   3b2c <morecore>
    3bfd:	85 c0                	test   %eax,%eax
    3bff:	75 e2                	jne    3be3 <malloc+0x67>
    3c01:	eb d5                	jmp    3bd8 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
