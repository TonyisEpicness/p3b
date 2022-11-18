
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 91 00 00 00    	jg     b2 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 d9 13 00 00       	push   $0x13d9
      2b:	e8 b3 0e 00 00       	call   ee3 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 22 1b 00 00 20 	cmpb   $0x20,0x1b22
      47:	0f 84 88 00 00 00    	je     d5 <main+0xd5>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 46 0e 00 00       	call   e9b <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 5e                	je     c0 <main+0xc0>
    wait();
      62:	e8 44 0e 00 00       	call   eab <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 38 13 00 00       	push   $0x1338
      6f:	6a 02                	push   $0x2
      71:	e8 9a 0f 00 00       	call   1010 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 20 1b 00 00       	push   $0x1b20
      82:	e8 89 0c 00 00       	call   d10 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 20 1b 00 00       	push   $0x1b20
      90:	e8 db 0c 00 00       	call   d70 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 20 1b 00 00 	movzbl 0x1b20,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 77                	je     11a <main+0x11a>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d 21 1b 00 00 64 	cmpb   $0x64,0x1b21
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
      close(fd);
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	50                   	push   %eax
      b6:	e8 10 0e 00 00       	call   ecb <close>
      break;
      bb:	83 c4 10             	add    $0x10,%esp
      be:	eb a7                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c0:	83 ec 0c             	sub    $0xc,%esp
      c3:	68 20 1b 00 00       	push   $0x1b20
      c8:	e8 93 0a 00 00       	call   b60 <parsecmd>
      cd:	89 04 24             	mov    %eax,(%esp)
      d0:	e8 db 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	68 20 1b 00 00       	push   $0x1b20
      dd:	e8 fe 0b 00 00       	call   ce0 <strlen>
      if(chdir(buf+3) < 0)
      e2:	c7 04 24 23 1b 00 00 	movl   $0x1b23,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      e9:	c6 80 1f 1b 00 00 00 	movb   $0x0,0x1b1f(%eax)
      if(chdir(buf+3) < 0)
      f0:	e8 1e 0e 00 00       	call   f13 <chdir>
      f5:	83 c4 10             	add    $0x10,%esp
      f8:	85 c0                	test   %eax,%eax
      fa:	0f 89 67 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     100:	51                   	push   %ecx
     101:	68 23 1b 00 00       	push   $0x1b23
     106:	68 e1 13 00 00       	push   $0x13e1
     10b:	6a 02                	push   $0x2
     10d:	e8 fe 0e 00 00       	call   1010 <printf>
     112:	83 c4 10             	add    $0x10,%esp
     115:	e9 4d ff ff ff       	jmp    67 <main+0x67>
  exit();
     11a:	e8 84 0d 00 00       	call   ea3 <exit>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 3b 13 00 00       	push   $0x133b
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 75 0c             	mov    0xc(%ebp),%esi
     138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 38 13 00 00       	push   $0x1338
     143:	6a 02                	push   $0x2
     145:	e8 c6 0e 00 00       	call   1010 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 ba 0b 00 00       	call   d10 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 11 0c 00 00       	call   d70 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret    
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 d5 13 00 00       	push   $0x13d5
     17e:	6a 02                	push   $0x2
     180:	e8 8b 0e 00 00       	call   1010 <printf>
  exit();
     185:	e8 19 0d 00 00       	call   ea3 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 00 0d 00 00       	call   e9b <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 3b 13 00 00       	push   $0x133b
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 42                	je     200 <runcmd+0x50>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e3 00 00 00    	ja     2aa <runcmd+0xfa>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 f0 13 00 00 	jmp    *0x13f0(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 29                	je     200 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 f8 0c 00 00       	call   edb <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 47 13 00 00       	push   $0x1347
     1ee:	6a 02                	push   $0x2
     1f0:	e8 1b 0e 00 00       	call   1010 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
     1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ff:	90                   	nop
    exit();
     200:	e8 9e 0c 00 00       	call   ea3 <exit>
    if(fork1() == 0)
     205:	e8 86 ff ff ff       	call   190 <fork1>
     20a:	85 c0                	test   %eax,%eax
     20c:	75 f2                	jne    200 <runcmd+0x50>
     20e:	e9 8c 00 00 00       	jmp    29f <runcmd+0xef>
    if(pipe(p) < 0)
     213:	83 ec 0c             	sub    $0xc,%esp
     216:	8d 45 f0             	lea    -0x10(%ebp),%eax
     219:	50                   	push   %eax
     21a:	e8 94 0c 00 00       	call   eb3 <pipe>
     21f:	83 c4 10             	add    $0x10,%esp
     222:	85 c0                	test   %eax,%eax
     224:	0f 88 a2 00 00 00    	js     2cc <runcmd+0x11c>
    if(fork1() == 0){
     22a:	e8 61 ff ff ff       	call   190 <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 a2 00 00 00    	je     2d9 <runcmd+0x129>
    if(fork1() == 0){
     237:	e8 54 ff ff ff       	call   190 <fork1>
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 84 c3 00 00 00    	je     307 <runcmd+0x157>
    close(p[0]);
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	ff 75 f0             	push   -0x10(%ebp)
     24a:	e8 7c 0c 00 00       	call   ecb <close>
    close(p[1]);
     24f:	58                   	pop    %eax
     250:	ff 75 f4             	push   -0xc(%ebp)
     253:	e8 73 0c 00 00       	call   ecb <close>
    wait();
     258:	e8 4e 0c 00 00       	call   eab <wait>
    wait();
     25d:	e8 49 0c 00 00       	call   eab <wait>
    break;
     262:	83 c4 10             	add    $0x10,%esp
     265:	eb 99                	jmp    200 <runcmd+0x50>
    if(fork1() == 0)
     267:	e8 24 ff ff ff       	call   190 <fork1>
     26c:	85 c0                	test   %eax,%eax
     26e:	74 2f                	je     29f <runcmd+0xef>
    wait();
     270:	e8 36 0c 00 00       	call   eab <wait>
    runcmd(lcmd->right);
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 08             	push   0x8(%ebx)
     27b:	e8 30 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     280:	83 ec 0c             	sub    $0xc,%esp
     283:	ff 73 14             	push   0x14(%ebx)
     286:	e8 40 0c 00 00       	call   ecb <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28b:	58                   	pop    %eax
     28c:	5a                   	pop    %edx
     28d:	ff 73 10             	push   0x10(%ebx)
     290:	ff 73 08             	push   0x8(%ebx)
     293:	e8 4b 0c 00 00       	call   ee3 <open>
     298:	83 c4 10             	add    $0x10,%esp
     29b:	85 c0                	test   %eax,%eax
     29d:	78 18                	js     2b7 <runcmd+0x107>
      runcmd(bcmd->cmd);
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	ff 73 04             	push   0x4(%ebx)
     2a5:	e8 06 ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2aa:	83 ec 0c             	sub    $0xc,%esp
     2ad:	68 40 13 00 00       	push   $0x1340
     2b2:	e8 b9 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2b7:	51                   	push   %ecx
     2b8:	ff 73 08             	push   0x8(%ebx)
     2bb:	68 57 13 00 00       	push   $0x1357
     2c0:	6a 02                	push   $0x2
     2c2:	e8 49 0d 00 00       	call   1010 <printf>
      exit();
     2c7:	e8 d7 0b 00 00       	call   ea3 <exit>
      panic("pipe");
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	68 67 13 00 00       	push   $0x1367
     2d4:	e8 97 fe ff ff       	call   170 <panic>
      close(1);
     2d9:	83 ec 0c             	sub    $0xc,%esp
     2dc:	6a 01                	push   $0x1
     2de:	e8 e8 0b 00 00       	call   ecb <close>
      dup(p[1]);
     2e3:	58                   	pop    %eax
     2e4:	ff 75 f4             	push   -0xc(%ebp)
     2e7:	e8 2f 0c 00 00       	call   f1b <dup>
      close(p[0]);
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f0             	push   -0x10(%ebp)
     2f0:	e8 d6 0b 00 00       	call   ecb <close>
      close(p[1]);
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	push   -0xc(%ebp)
     2f9:	e8 cd 0b 00 00       	call   ecb <close>
      runcmd(pcmd->left);
     2fe:	5a                   	pop    %edx
     2ff:	ff 73 04             	push   0x4(%ebx)
     302:	e8 a9 fe ff ff       	call   1b0 <runcmd>
      close(0);
     307:	83 ec 0c             	sub    $0xc,%esp
     30a:	6a 00                	push   $0x0
     30c:	e8 ba 0b 00 00       	call   ecb <close>
      dup(p[0]);
     311:	5a                   	pop    %edx
     312:	ff 75 f0             	push   -0x10(%ebp)
     315:	e8 01 0c 00 00       	call   f1b <dup>
      close(p[0]);
     31a:	59                   	pop    %ecx
     31b:	ff 75 f0             	push   -0x10(%ebp)
     31e:	e8 a8 0b 00 00       	call   ecb <close>
      close(p[1]);
     323:	58                   	pop    %eax
     324:	ff 75 f4             	push   -0xc(%ebp)
     327:	e8 9f 0b 00 00       	call   ecb <close>
      runcmd(pcmd->right);
     32c:	58                   	pop    %eax
     32d:	ff 73 08             	push   0x8(%ebx)
     330:	e8 7b fe ff ff       	call   1b0 <runcmd>
     335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 54                	push   $0x54
     349:	e8 f2 0e 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 b3 09 00 00       	call   d10 <memset>
  cmd->type = EXEC;
     35d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     363:	89 d8                	mov    %ebx,%eax
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	c9                   	leave  
     369:	c3                   	ret    
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	6a 18                	push   $0x18
     379:	e8 c2 0e 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     37e:	83 c4 0c             	add    $0xc,%esp
     381:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	6a 00                	push   $0x0
     387:	50                   	push   %eax
     388:	e8 83 09 00 00       	call   d10 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b6:	c9                   	leave  
     3b7:	c3                   	ret    
     3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bf:	90                   	nop

000003c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 0c                	push   $0xc
     3c9:	e8 72 0e 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 33 09 00 00       	call   d10 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ef:	89 d8                	mov    %ebx,%eax
     3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f4:	c9                   	leave  
     3f5:	c3                   	ret    
     3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 32 0e 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
     411:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     413:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 f3 08 00 00       	call   d10 <memset>
  cmd->type = LIST;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 08                	push   $0x8
     449:	e8 f2 0d 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 b3 08 00 00       	call   d10 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     469:	89 d8                	mov    %ebx,%eax
     46b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     46e:	c9                   	leave  
     46f:	c3                   	ret    

00000470 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     479:	8b 45 08             	mov    0x8(%ebp),%eax
{
     47c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     47f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     482:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     484:	39 df                	cmp    %ebx,%edi
     486:	72 0f                	jb     497 <gettoken+0x27>
     488:	eb 25                	jmp    4af <gettoken+0x3f>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     490:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     493:	39 fb                	cmp    %edi,%ebx
     495:	74 18                	je     4af <gettoken+0x3f>
     497:	0f be 07             	movsbl (%edi),%eax
     49a:	83 ec 08             	sub    $0x8,%esp
     49d:	50                   	push   %eax
     49e:	68 04 1b 00 00       	push   $0x1b04
     4a3:	e8 88 08 00 00       	call   d30 <strchr>
     4a8:	83 c4 10             	add    $0x10,%esp
     4ab:	85 c0                	test   %eax,%eax
     4ad:	75 e1                	jne    490 <gettoken+0x20>
  if(q)
     4af:	85 f6                	test   %esi,%esi
     4b1:	74 02                	je     4b5 <gettoken+0x45>
    *q = s;
     4b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4b8:	3c 3c                	cmp    $0x3c,%al
     4ba:	0f 8f d0 00 00 00    	jg     590 <gettoken+0x120>
     4c0:	3c 3a                	cmp    $0x3a,%al
     4c2:	0f 8f b4 00 00 00    	jg     57c <gettoken+0x10c>
     4c8:	84 c0                	test   %al,%al
     4ca:	75 44                	jne    510 <gettoken+0xa0>
     4cc:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ce:	8b 55 14             	mov    0x14(%ebp),%edx
     4d1:	85 d2                	test   %edx,%edx
     4d3:	74 05                	je     4da <gettoken+0x6a>
    *eq = s;
     4d5:	8b 45 14             	mov    0x14(%ebp),%eax
     4d8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4da:	39 df                	cmp    %ebx,%edi
     4dc:	72 09                	jb     4e7 <gettoken+0x77>
     4de:	eb 1f                	jmp    4ff <gettoken+0x8f>
    s++;
     4e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x8f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 04 1b 00 00       	push   $0x1b04
     4f3:	e8 38 08 00 00       	call   d30 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x70>
  *ps = s;
     4ff:	8b 45 08             	mov    0x8(%ebp),%eax
     502:	89 38                	mov    %edi,(%eax)
  return ret;
}
     504:	8d 65 f4             	lea    -0xc(%ebp),%esp
     507:	89 f0                	mov    %esi,%eax
     509:	5b                   	pop    %ebx
     50a:	5e                   	pop    %esi
     50b:	5f                   	pop    %edi
     50c:	5d                   	pop    %ebp
     50d:	c3                   	ret    
     50e:	66 90                	xchg   %ax,%ax
  switch(*s){
     510:	79 5e                	jns    570 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     512:	39 fb                	cmp    %edi,%ebx
     514:	77 34                	ja     54a <gettoken+0xda>
  if(eq)
     516:	8b 45 14             	mov    0x14(%ebp),%eax
     519:	be 61 00 00 00       	mov    $0x61,%esi
     51e:	85 c0                	test   %eax,%eax
     520:	75 b3                	jne    4d5 <gettoken+0x65>
     522:	eb db                	jmp    4ff <gettoken+0x8f>
     524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     528:	0f be 07             	movsbl (%edi),%eax
     52b:	83 ec 08             	sub    $0x8,%esp
     52e:	50                   	push   %eax
     52f:	68 fc 1a 00 00       	push   $0x1afc
     534:	e8 f7 07 00 00       	call   d30 <strchr>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	75 22                	jne    562 <gettoken+0xf2>
      s++;
     540:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     543:	39 fb                	cmp    %edi,%ebx
     545:	74 cf                	je     516 <gettoken+0xa6>
     547:	0f b6 07             	movzbl (%edi),%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	0f be f0             	movsbl %al,%esi
     550:	56                   	push   %esi
     551:	68 04 1b 00 00       	push   $0x1b04
     556:	e8 d5 07 00 00       	call   d30 <strchr>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	85 c0                	test   %eax,%eax
     560:	74 c6                	je     528 <gettoken+0xb8>
    ret = 'a';
     562:	be 61 00 00 00       	mov    $0x61,%esi
     567:	e9 62 ff ff ff       	jmp    4ce <gettoken+0x5e>
     56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     570:	3c 26                	cmp    $0x26,%al
     572:	74 08                	je     57c <gettoken+0x10c>
     574:	8d 48 d8             	lea    -0x28(%eax),%ecx
     577:	80 f9 01             	cmp    $0x1,%cl
     57a:	77 96                	ja     512 <gettoken+0xa2>
  ret = *s;
     57c:	0f be f0             	movsbl %al,%esi
    s++;
     57f:	83 c7 01             	add    $0x1,%edi
    break;
     582:	e9 47 ff ff ff       	jmp    4ce <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	3c 3e                	cmp    $0x3e,%al
     592:	75 1c                	jne    5b0 <gettoken+0x140>
    if(*s == '>'){
     594:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     598:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     59b:	74 1c                	je     5b9 <gettoken+0x149>
    s++;
     59d:	89 c7                	mov    %eax,%edi
     59f:	be 3e 00 00 00       	mov    $0x3e,%esi
     5a4:	e9 25 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5b0:	3c 7c                	cmp    $0x7c,%al
     5b2:	74 c8                	je     57c <gettoken+0x10c>
     5b4:	e9 59 ff ff ff       	jmp    512 <gettoken+0xa2>
      s++;
     5b9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     5bc:	be 2b 00 00 00       	mov    $0x2b,%esi
     5c1:	e9 08 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ee:	66 90                	xchg   %ax,%ax
    s++;
     5f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 04 1b 00 00       	push   $0x1b04
     603:	e8 28 07 00 00       	call   d30 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
  *ps = s;
     60f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     611:	0f be 03             	movsbl (%ebx),%eax
     614:	31 d2                	xor    %edx,%edx
     616:	84 c0                	test   %al,%al
     618:	75 0e                	jne    628 <peek+0x58>
}
     61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61d:	89 d0                	mov    %edx,%eax
     61f:	5b                   	pop    %ebx
     620:	5e                   	pop    %esi
     621:	5f                   	pop    %edi
     622:	5d                   	pop    %ebp
     623:	c3                   	ret    
     624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     628:	83 ec 08             	sub    $0x8,%esp
     62b:	50                   	push   %eax
     62c:	ff 75 10             	push   0x10(%ebp)
     62f:	e8 fc 06 00 00       	call   d30 <strchr>
     634:	83 c4 10             	add    $0x10,%esp
     637:	31 d2                	xor    %edx,%edx
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c2             	setne  %dl
}
     63e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     641:	5b                   	pop    %ebx
     642:	89 d0                	mov    %edx,%eax
     644:	5e                   	pop    %esi
     645:	5f                   	pop    %edi
     646:	5d                   	pop    %ebp
     647:	c3                   	ret    
     648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     64f:	90                   	nop

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 89 13 00 00       	push   $0x1389
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 61 ff ff ff       	call   5d0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 eb fd ff ff       	call   470 <gettoken>
     685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 da fd ff ff       	call   470 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
  cmd = malloc(sizeof(*cmd));
     6b1:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6ba:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bf:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6c2:	e8 79 0b 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 3a 06 00 00       	call   d10 <memset>
  cmd->type = REDIR;
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70e:	66 90                	xchg   %ax,%ax
  cmd = malloc(sizeof(*cmd));
     710:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     713:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     716:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     719:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     71b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     721:	e8 1a 0b 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     72b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 db 05 00 00       	call   d10 <memset>
  cmd->cmd = subcmd;
     735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     73b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     747:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     74a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     74d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     750:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     753:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     75a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret    
      panic("missing file for redirection");
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 6c 13 00 00       	push   $0x136c
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78f:	90                   	nop

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 30             	sub    $0x30,%esp
     799:	8b 75 08             	mov    0x8(%ebp),%esi
     79c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     79f:	68 8c 13 00 00       	push   $0x138c
     7a4:	57                   	push   %edi
     7a5:	56                   	push   %esi
     7a6:	e8 25 fe ff ff       	call   5d0 <peek>
     7ab:	83 c4 10             	add    $0x10,%esp
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 85 aa 00 00 00    	jne    860 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7b6:	83 ec 0c             	sub    $0xc,%esp
     7b9:	89 c3                	mov    %eax,%ebx
     7bb:	6a 54                	push   $0x54
     7bd:	e8 7e 0a 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7c2:	83 c4 0c             	add    $0xc,%esp
     7c5:	6a 54                	push   $0x54
     7c7:	6a 00                	push   $0x0
     7c9:	50                   	push   %eax
     7ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7cd:	e8 3e 05 00 00       	call   d10 <memset>
  cmd->type = EXEC;
     7d2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7d5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7de:	57                   	push   %edi
     7df:	56                   	push   %esi
     7e0:	50                   	push   %eax
     7e1:	e8 6a fe ff ff       	call   650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7e6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ec:	eb 15                	jmp    803 <parseexec+0x73>
     7ee:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7f0:	83 ec 04             	sub    $0x4,%esp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	ff 75 d4             	push   -0x2c(%ebp)
     7f8:	e8 53 fe ff ff       	call   650 <parseredirs>
     7fd:	83 c4 10             	add    $0x10,%esp
     800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     803:	83 ec 04             	sub    $0x4,%esp
     806:	68 a3 13 00 00       	push   $0x13a3
     80b:	57                   	push   %edi
     80c:	56                   	push   %esi
     80d:	e8 be fd ff ff       	call   5d0 <peek>
     812:	83 c4 10             	add    $0x10,%esp
     815:	85 c0                	test   %eax,%eax
     817:	75 5f                	jne    878 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     81c:	50                   	push   %eax
     81d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     820:	50                   	push   %eax
     821:	57                   	push   %edi
     822:	56                   	push   %esi
     823:	e8 48 fc ff ff       	call   470 <gettoken>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	74 49                	je     878 <parseexec+0xe8>
    if(tok != 'a')
     82f:	83 f8 61             	cmp    $0x61,%eax
     832:	75 62                	jne    896 <parseexec+0x106>
    cmd->argv[argc] = q;
     834:	8b 45 e0             	mov    -0x20(%ebp),%eax
     837:	8b 55 d0             	mov    -0x30(%ebp),%edx
     83a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     841:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     845:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     848:	83 fb 0a             	cmp    $0xa,%ebx
     84b:	75 a3                	jne    7f0 <parseexec+0x60>
      panic("too many args");
     84d:	83 ec 0c             	sub    $0xc,%esp
     850:	68 95 13 00 00       	push   $0x1395
     855:	e8 16 f9 ff ff       	call   170 <panic>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     860:	89 7d 0c             	mov    %edi,0xc(%ebp)
     863:	89 75 08             	mov    %esi,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     866:	8d 65 f4             	lea    -0xc(%ebp),%esp
     869:	5b                   	pop    %ebx
     86a:	5e                   	pop    %esi
     86b:	5f                   	pop    %edi
     86c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     86d:	e9 ae 01 00 00       	jmp    a20 <parseblock>
     872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     878:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87b:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     882:	00 
  cmd->eargv[argc] = 0;
     883:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     88a:	00 
}
     88b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	5b                   	pop    %ebx
     892:	5e                   	pop    %esi
     893:	5f                   	pop    %edi
     894:	5d                   	pop    %ebp
     895:	c3                   	ret    
      panic("syntax");
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	68 8e 13 00 00       	push   $0x138e
     89e:	e8 cd f8 ff ff       	call   170 <panic>
     8a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008b0 <parsepipe>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 a8 13 00 00       	push   $0x13a8
  cmd = parseexec(ps, es);
     8ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 f9 fc ff ff       	call   5d0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
}
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret    
     8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ef:	90                   	nop
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 75 fb ff ff       	call   470 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     90d:	e8 2e 09 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 ef 03 00 00       	call   d10 <memset>
  cmd->left = left;
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     924:	83 c4 10             	add    $0x10,%esp
     927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     92f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     931:	89 7e 08             	mov    %edi,0x8(%esi)
}
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret    
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
  while(peek(ps, es, "&")){
     956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 05 fb ff ff       	call   470 <gettoken>
  cmd = malloc(sizeof(*cmd));
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 c9 08 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 89 03 00 00       	call   d10 <memset>
  cmd->type = BACK;
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     98a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
     996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 aa 13 00 00       	push   $0x13aa
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 29 fc ff ff       	call   5d0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 a6 13 00 00       	push   $0x13a6
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 13 fc ff ff       	call   5d0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret    
     9ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 95 fa ff ff       	call   470 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
  cmd = malloc(sizeof(*cmd));
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9ed:	e8 4e 08 00 00       	call   1240 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 0f 03 00 00       	call   d10 <memset>
  cmd->left = left;
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a04:	83 c4 10             	add    $0x10,%esp
     a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret    
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a2f:	68 8c 13 00 00       	push   $0x138c
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 95 fb ff ff       	call   5d0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 23 fa ff ff       	call   470 <gettoken>
  cmd = parseline(ps, es);
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
  if(!peek(ps, es, ")"))
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 c8 13 00 00       	push   $0x13c8
  cmd = parseline(ps, es);
     a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 69 fb ff ff       	call   5d0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 f7 f9 ff ff       	call   470 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
}
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret    
    panic("parseblock");
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 ac 13 00 00       	push   $0x13ac
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 b7 13 00 00       	push   $0x13b7
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aba:	85 db                	test   %ebx,%ebx
     abc:	0f 84 8e 00 00 00    	je     b50 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ac2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac5:	77 61                	ja     b28 <nulterminate+0x78>
     ac7:	8b 03                	mov    (%ebx),%eax
     ac9:	ff 24 85 08 14 00 00 	jmp    *0x1408(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
    nulterminate(lcmd->right);
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	push   0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
    break;
     ae4:	83 c4 10             	add    $0x10,%esp
     ae7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave  
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	push   0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
    break;
     afb:	89 d8                	mov    %ebx,%eax
     afd:	83 c4 10             	add    $0x10,%esp
}
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave  
     b04:	c3                   	ret    
     b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	8d 43 08             	lea    0x8(%ebx),%eax
     b0e:	85 c9                	test   %ecx,%ecx
     b10:	74 16                	je     b28 <nulterminate+0x78>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b18:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b1b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b1e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b21:	8b 50 fc             	mov    -0x4(%eax),%edx
     b24:	85 d2                	test   %edx,%edx
     b26:	75 f0                	jne    b18 <nulterminate+0x68>
  switch(cmd->type){
     b28:	89 d8                	mov    %ebx,%eax
}
     b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b2d:	c9                   	leave  
     b2e:	c3                   	ret    
     b2f:	90                   	nop
    nulterminate(rcmd->cmd);
     b30:	83 ec 0c             	sub    $0xc,%esp
     b33:	ff 73 04             	push   0x4(%ebx)
     b36:	e8 75 ff ff ff       	call   ab0 <nulterminate>
    *rcmd->efile = 0;
     b3b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b3e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b41:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b44:	89 d8                	mov    %ebx,%eax
}
     b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b49:	c9                   	leave  
     b4a:	c3                   	ret    
     b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b4f:	90                   	nop
    return 0;
     b50:	31 c0                	xor    %eax,%eax
     b52:	eb 95                	jmp    ae9 <nulterminate+0x39>
     b54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b5f:	90                   	nop

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 6b 01 00 00       	call   ce0 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 56 13 00 00       	push   $0x1356
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 3f fa ff ff       	call   5d0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 ca 13 00 00       	push   $0x13ca
     bb5:	6a 02                	push   $0x2
     bb7:	e8 54 04 00 00       	call   1010 <printf>
    panic("syntax");
     bbc:	c7 04 24 8e 13 00 00 	movl   $0x138e,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
     bd6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
     bd9:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
     bdb:	89 08                	mov    %ecx,(%eax)
  return old;
}
     bdd:	5d                   	pop    %ebp
     bde:	89 d0                	mov    %edx,%eax
     be0:	c3                   	ret    
     be1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     be8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bef:	90                   	nop

00000bf0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  return 0;
}
     bf0:	31 c0                	xor    %eax,%eax
     bf2:	c3                   	ret    
     bf3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c00 <thread_join>:

int thread_join() {
  return 0;
}
     c00:	31 c0                	xor    %eax,%eax
     c02:	c3                   	ret    
     c03:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c10 <lock_acquire>:

void lock_acquire(lock_t *lock){
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
     c16:	83 38 01             	cmpl   $0x1,(%eax)
     c19:	75 05                	jne    c20 <lock_acquire+0x10>
     c1b:	eb fe                	jmp    c1b <lock_acquire+0xb>
     c1d:	8d 76 00             	lea    0x0(%esi),%esi
     c20:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
     c26:	5d                   	pop    %ebp
     c27:	c3                   	ret    
     c28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c2f:	90                   	nop

00000c30 <lock_release>:

void lock_release(lock_t *lock) {
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
     c33:	8b 45 08             	mov    0x8(%ebp),%eax
     c36:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     c3c:	5d                   	pop    %ebp
     c3d:	c3                   	ret    
     c3e:	66 90                	xchg   %ax,%ax

00000c40 <lock_init>:
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	8b 45 08             	mov    0x8(%ebp),%eax
     c46:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     c4c:	5d                   	pop    %ebp
     c4d:	c3                   	ret    
     c4e:	66 90                	xchg   %ax,%ax

00000c50 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
     c50:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c51:	31 c0                	xor    %eax,%eax
{
     c53:	89 e5                	mov    %esp,%ebp
     c55:	53                   	push   %ebx
     c56:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     c60:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     c64:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     c67:	83 c0 01             	add    $0x1,%eax
     c6a:	84 d2                	test   %dl,%dl
     c6c:	75 f2                	jne    c60 <strcpy+0x10>
    ;
  return os;
}
     c6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c71:	89 c8                	mov    %ecx,%eax
     c73:	c9                   	leave  
     c74:	c3                   	ret    
     c75:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c80 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	53                   	push   %ebx
     c84:	8b 55 08             	mov    0x8(%ebp),%edx
     c87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c8a:	0f b6 02             	movzbl (%edx),%eax
     c8d:	84 c0                	test   %al,%al
     c8f:	75 17                	jne    ca8 <strcmp+0x28>
     c91:	eb 3a                	jmp    ccd <strcmp+0x4d>
     c93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c97:	90                   	nop
     c98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c9c:	83 c2 01             	add    $0x1,%edx
     c9f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     ca2:	84 c0                	test   %al,%al
     ca4:	74 1a                	je     cc0 <strcmp+0x40>
    p++, q++;
     ca6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     ca8:	0f b6 19             	movzbl (%ecx),%ebx
     cab:	38 c3                	cmp    %al,%bl
     cad:	74 e9                	je     c98 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     caf:	29 d8                	sub    %ebx,%eax
}
     cb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cb4:	c9                   	leave  
     cb5:	c3                   	ret    
     cb6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cbd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     cc0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     cc4:	31 c0                	xor    %eax,%eax
     cc6:	29 d8                	sub    %ebx,%eax
}
     cc8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ccb:	c9                   	leave  
     ccc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     ccd:	0f b6 19             	movzbl (%ecx),%ebx
     cd0:	31 c0                	xor    %eax,%eax
     cd2:	eb db                	jmp    caf <strcmp+0x2f>
     cd4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cdf:	90                   	nop

00000ce0 <strlen>:

uint
strlen(const char *s)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     ce6:	80 3a 00             	cmpb   $0x0,(%edx)
     ce9:	74 15                	je     d00 <strlen+0x20>
     ceb:	31 c0                	xor    %eax,%eax
     ced:	8d 76 00             	lea    0x0(%esi),%esi
     cf0:	83 c0 01             	add    $0x1,%eax
     cf3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     cf7:	89 c1                	mov    %eax,%ecx
     cf9:	75 f5                	jne    cf0 <strlen+0x10>
    ;
  return n;
}
     cfb:	89 c8                	mov    %ecx,%eax
     cfd:	5d                   	pop    %ebp
     cfe:	c3                   	ret    
     cff:	90                   	nop
  for(n = 0; s[n]; n++)
     d00:	31 c9                	xor    %ecx,%ecx
}
     d02:	5d                   	pop    %ebp
     d03:	89 c8                	mov    %ecx,%eax
     d05:	c3                   	ret    
     d06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d0d:	8d 76 00             	lea    0x0(%esi),%esi

00000d10 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	57                   	push   %edi
     d14:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     d17:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d1d:	89 d7                	mov    %edx,%edi
     d1f:	fc                   	cld    
     d20:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d22:	8b 7d fc             	mov    -0x4(%ebp),%edi
     d25:	89 d0                	mov    %edx,%eax
     d27:	c9                   	leave  
     d28:	c3                   	ret    
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d30 <strchr>:

char*
strchr(const char *s, char c)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	8b 45 08             	mov    0x8(%ebp),%eax
     d36:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d3a:	0f b6 10             	movzbl (%eax),%edx
     d3d:	84 d2                	test   %dl,%dl
     d3f:	75 12                	jne    d53 <strchr+0x23>
     d41:	eb 1d                	jmp    d60 <strchr+0x30>
     d43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d47:	90                   	nop
     d48:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     d4c:	83 c0 01             	add    $0x1,%eax
     d4f:	84 d2                	test   %dl,%dl
     d51:	74 0d                	je     d60 <strchr+0x30>
    if(*s == c)
     d53:	38 d1                	cmp    %dl,%cl
     d55:	75 f1                	jne    d48 <strchr+0x18>
      return (char*)s;
  return 0;
}
     d57:	5d                   	pop    %ebp
     d58:	c3                   	ret    
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     d60:	31 c0                	xor    %eax,%eax
}
     d62:	5d                   	pop    %ebp
     d63:	c3                   	ret    
     d64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d6f:	90                   	nop

00000d70 <gets>:

char*
gets(char *buf, int max)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     d75:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     d78:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     d79:	31 db                	xor    %ebx,%ebx
{
     d7b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     d7e:	eb 27                	jmp    da7 <gets+0x37>
    cc = read(0, &c, 1);
     d80:	83 ec 04             	sub    $0x4,%esp
     d83:	6a 01                	push   $0x1
     d85:	57                   	push   %edi
     d86:	6a 00                	push   $0x0
     d88:	e8 2e 01 00 00       	call   ebb <read>
    if(cc < 1)
     d8d:	83 c4 10             	add    $0x10,%esp
     d90:	85 c0                	test   %eax,%eax
     d92:	7e 1d                	jle    db1 <gets+0x41>
      break;
    buf[i++] = c;
     d94:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d98:	8b 55 08             	mov    0x8(%ebp),%edx
     d9b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d9f:	3c 0a                	cmp    $0xa,%al
     da1:	74 1d                	je     dc0 <gets+0x50>
     da3:	3c 0d                	cmp    $0xd,%al
     da5:	74 19                	je     dc0 <gets+0x50>
  for(i=0; i+1 < max; ){
     da7:	89 de                	mov    %ebx,%esi
     da9:	83 c3 01             	add    $0x1,%ebx
     dac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     daf:	7c cf                	jl     d80 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     db1:	8b 45 08             	mov    0x8(%ebp),%eax
     db4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     db8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dbb:	5b                   	pop    %ebx
     dbc:	5e                   	pop    %esi
     dbd:	5f                   	pop    %edi
     dbe:	5d                   	pop    %ebp
     dbf:	c3                   	ret    
  buf[i] = '\0';
     dc0:	8b 45 08             	mov    0x8(%ebp),%eax
     dc3:	89 de                	mov    %ebx,%esi
     dc5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     dc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dcc:	5b                   	pop    %ebx
     dcd:	5e                   	pop    %esi
     dce:	5f                   	pop    %edi
     dcf:	5d                   	pop    %ebp
     dd0:	c3                   	ret    
     dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ddf:	90                   	nop

00000de0 <stat>:

int
stat(const char *n, struct stat *st)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	56                   	push   %esi
     de4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     de5:	83 ec 08             	sub    $0x8,%esp
     de8:	6a 00                	push   $0x0
     dea:	ff 75 08             	push   0x8(%ebp)
     ded:	e8 f1 00 00 00       	call   ee3 <open>
  if(fd < 0)
     df2:	83 c4 10             	add    $0x10,%esp
     df5:	85 c0                	test   %eax,%eax
     df7:	78 27                	js     e20 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     df9:	83 ec 08             	sub    $0x8,%esp
     dfc:	ff 75 0c             	push   0xc(%ebp)
     dff:	89 c3                	mov    %eax,%ebx
     e01:	50                   	push   %eax
     e02:	e8 f4 00 00 00       	call   efb <fstat>
  close(fd);
     e07:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     e0a:	89 c6                	mov    %eax,%esi
  close(fd);
     e0c:	e8 ba 00 00 00       	call   ecb <close>
  return r;
     e11:	83 c4 10             	add    $0x10,%esp
}
     e14:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e17:	89 f0                	mov    %esi,%eax
     e19:	5b                   	pop    %ebx
     e1a:	5e                   	pop    %esi
     e1b:	5d                   	pop    %ebp
     e1c:	c3                   	ret    
     e1d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     e20:	be ff ff ff ff       	mov    $0xffffffff,%esi
     e25:	eb ed                	jmp    e14 <stat+0x34>
     e27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e2e:	66 90                	xchg   %ax,%ax

00000e30 <atoi>:

int
atoi(const char *s)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	53                   	push   %ebx
     e34:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e37:	0f be 02             	movsbl (%edx),%eax
     e3a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     e3d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     e40:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     e45:	77 1e                	ja     e65 <atoi+0x35>
     e47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e4e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     e50:	83 c2 01             	add    $0x1,%edx
     e53:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     e56:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     e5a:	0f be 02             	movsbl (%edx),%eax
     e5d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     e60:	80 fb 09             	cmp    $0x9,%bl
     e63:	76 eb                	jbe    e50 <atoi+0x20>
  return n;
}
     e65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e68:	89 c8                	mov    %ecx,%eax
     e6a:	c9                   	leave  
     e6b:	c3                   	ret    
     e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e70 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	57                   	push   %edi
     e74:	8b 45 10             	mov    0x10(%ebp),%eax
     e77:	8b 55 08             	mov    0x8(%ebp),%edx
     e7a:	56                   	push   %esi
     e7b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e7e:	85 c0                	test   %eax,%eax
     e80:	7e 13                	jle    e95 <memmove+0x25>
     e82:	01 d0                	add    %edx,%eax
  dst = vdst;
     e84:	89 d7                	mov    %edx,%edi
     e86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e8d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     e90:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e91:	39 f8                	cmp    %edi,%eax
     e93:	75 fb                	jne    e90 <memmove+0x20>
  return vdst;
}
     e95:	5e                   	pop    %esi
     e96:	89 d0                	mov    %edx,%eax
     e98:	5f                   	pop    %edi
     e99:	5d                   	pop    %ebp
     e9a:	c3                   	ret    

00000e9b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e9b:	b8 01 00 00 00       	mov    $0x1,%eax
     ea0:	cd 40                	int    $0x40
     ea2:	c3                   	ret    

00000ea3 <exit>:
SYSCALL(exit)
     ea3:	b8 02 00 00 00       	mov    $0x2,%eax
     ea8:	cd 40                	int    $0x40
     eaa:	c3                   	ret    

00000eab <wait>:
SYSCALL(wait)
     eab:	b8 03 00 00 00       	mov    $0x3,%eax
     eb0:	cd 40                	int    $0x40
     eb2:	c3                   	ret    

00000eb3 <pipe>:
SYSCALL(pipe)
     eb3:	b8 04 00 00 00       	mov    $0x4,%eax
     eb8:	cd 40                	int    $0x40
     eba:	c3                   	ret    

00000ebb <read>:
SYSCALL(read)
     ebb:	b8 05 00 00 00       	mov    $0x5,%eax
     ec0:	cd 40                	int    $0x40
     ec2:	c3                   	ret    

00000ec3 <write>:
SYSCALL(write)
     ec3:	b8 10 00 00 00       	mov    $0x10,%eax
     ec8:	cd 40                	int    $0x40
     eca:	c3                   	ret    

00000ecb <close>:
SYSCALL(close)
     ecb:	b8 15 00 00 00       	mov    $0x15,%eax
     ed0:	cd 40                	int    $0x40
     ed2:	c3                   	ret    

00000ed3 <kill>:
SYSCALL(kill)
     ed3:	b8 06 00 00 00       	mov    $0x6,%eax
     ed8:	cd 40                	int    $0x40
     eda:	c3                   	ret    

00000edb <exec>:
SYSCALL(exec)
     edb:	b8 07 00 00 00       	mov    $0x7,%eax
     ee0:	cd 40                	int    $0x40
     ee2:	c3                   	ret    

00000ee3 <open>:
SYSCALL(open)
     ee3:	b8 0f 00 00 00       	mov    $0xf,%eax
     ee8:	cd 40                	int    $0x40
     eea:	c3                   	ret    

00000eeb <mknod>:
SYSCALL(mknod)
     eeb:	b8 11 00 00 00       	mov    $0x11,%eax
     ef0:	cd 40                	int    $0x40
     ef2:	c3                   	ret    

00000ef3 <unlink>:
SYSCALL(unlink)
     ef3:	b8 12 00 00 00       	mov    $0x12,%eax
     ef8:	cd 40                	int    $0x40
     efa:	c3                   	ret    

00000efb <fstat>:
SYSCALL(fstat)
     efb:	b8 08 00 00 00       	mov    $0x8,%eax
     f00:	cd 40                	int    $0x40
     f02:	c3                   	ret    

00000f03 <link>:
SYSCALL(link)
     f03:	b8 13 00 00 00       	mov    $0x13,%eax
     f08:	cd 40                	int    $0x40
     f0a:	c3                   	ret    

00000f0b <mkdir>:
SYSCALL(mkdir)
     f0b:	b8 14 00 00 00       	mov    $0x14,%eax
     f10:	cd 40                	int    $0x40
     f12:	c3                   	ret    

00000f13 <chdir>:
SYSCALL(chdir)
     f13:	b8 09 00 00 00       	mov    $0x9,%eax
     f18:	cd 40                	int    $0x40
     f1a:	c3                   	ret    

00000f1b <dup>:
SYSCALL(dup)
     f1b:	b8 0a 00 00 00       	mov    $0xa,%eax
     f20:	cd 40                	int    $0x40
     f22:	c3                   	ret    

00000f23 <getpid>:
SYSCALL(getpid)
     f23:	b8 0b 00 00 00       	mov    $0xb,%eax
     f28:	cd 40                	int    $0x40
     f2a:	c3                   	ret    

00000f2b <sbrk>:
SYSCALL(sbrk)
     f2b:	b8 0c 00 00 00       	mov    $0xc,%eax
     f30:	cd 40                	int    $0x40
     f32:	c3                   	ret    

00000f33 <sleep>:
SYSCALL(sleep)
     f33:	b8 0d 00 00 00       	mov    $0xd,%eax
     f38:	cd 40                	int    $0x40
     f3a:	c3                   	ret    

00000f3b <uptime>:
SYSCALL(uptime)
     f3b:	b8 0e 00 00 00       	mov    $0xe,%eax
     f40:	cd 40                	int    $0x40
     f42:	c3                   	ret    

00000f43 <clone>:
SYSCALL(clone)
     f43:	b8 16 00 00 00       	mov    $0x16,%eax
     f48:	cd 40                	int    $0x40
     f4a:	c3                   	ret    

00000f4b <join>:
     f4b:	b8 17 00 00 00       	mov    $0x17,%eax
     f50:	cd 40                	int    $0x40
     f52:	c3                   	ret    
     f53:	66 90                	xchg   %ax,%ax
     f55:	66 90                	xchg   %ax,%ax
     f57:	66 90                	xchg   %ax,%ax
     f59:	66 90                	xchg   %ax,%ax
     f5b:	66 90                	xchg   %ax,%ax
     f5d:	66 90                	xchg   %ax,%ax
     f5f:	90                   	nop

00000f60 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	57                   	push   %edi
     f64:	56                   	push   %esi
     f65:	53                   	push   %ebx
     f66:	83 ec 3c             	sub    $0x3c,%esp
     f69:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     f6c:	89 d1                	mov    %edx,%ecx
{
     f6e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     f71:	85 d2                	test   %edx,%edx
     f73:	0f 89 7f 00 00 00    	jns    ff8 <printint+0x98>
     f79:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     f7d:	74 79                	je     ff8 <printint+0x98>
    neg = 1;
     f7f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     f86:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     f88:	31 db                	xor    %ebx,%ebx
     f8a:	8d 75 d7             	lea    -0x29(%ebp),%esi
     f8d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     f90:	89 c8                	mov    %ecx,%eax
     f92:	31 d2                	xor    %edx,%edx
     f94:	89 cf                	mov    %ecx,%edi
     f96:	f7 75 c4             	divl   -0x3c(%ebp)
     f99:	0f b6 92 80 14 00 00 	movzbl 0x1480(%edx),%edx
     fa0:	89 45 c0             	mov    %eax,-0x40(%ebp)
     fa3:	89 d8                	mov    %ebx,%eax
     fa5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     fa8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     fab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     fae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     fb1:	76 dd                	jbe    f90 <printint+0x30>
  if(neg)
     fb3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     fb6:	85 c9                	test   %ecx,%ecx
     fb8:	74 0c                	je     fc6 <printint+0x66>
    buf[i++] = '-';
     fba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     fbf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     fc1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     fc6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     fc9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     fcd:	eb 07                	jmp    fd6 <printint+0x76>
     fcf:	90                   	nop
    putc(fd, buf[i]);
     fd0:	0f b6 13             	movzbl (%ebx),%edx
     fd3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     fd6:	83 ec 04             	sub    $0x4,%esp
     fd9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     fdc:	6a 01                	push   $0x1
     fde:	56                   	push   %esi
     fdf:	57                   	push   %edi
     fe0:	e8 de fe ff ff       	call   ec3 <write>
  while(--i >= 0)
     fe5:	83 c4 10             	add    $0x10,%esp
     fe8:	39 de                	cmp    %ebx,%esi
     fea:	75 e4                	jne    fd0 <printint+0x70>
}
     fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fef:	5b                   	pop    %ebx
     ff0:	5e                   	pop    %esi
     ff1:	5f                   	pop    %edi
     ff2:	5d                   	pop    %ebp
     ff3:	c3                   	ret    
     ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     ff8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     fff:	eb 87                	jmp    f88 <printint+0x28>
    1001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1008:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100f:	90                   	nop

00001010 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
    1016:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1019:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    101c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    101f:	0f b6 13             	movzbl (%ebx),%edx
    1022:	84 d2                	test   %dl,%dl
    1024:	74 6a                	je     1090 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1026:	8d 45 10             	lea    0x10(%ebp),%eax
    1029:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    102c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    102f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1031:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1034:	eb 36                	jmp    106c <printf+0x5c>
    1036:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103d:	8d 76 00             	lea    0x0(%esi),%esi
    1040:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1043:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1048:	83 f8 25             	cmp    $0x25,%eax
    104b:	74 15                	je     1062 <printf+0x52>
  write(fd, &c, 1);
    104d:	83 ec 04             	sub    $0x4,%esp
    1050:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1053:	6a 01                	push   $0x1
    1055:	57                   	push   %edi
    1056:	56                   	push   %esi
    1057:	e8 67 fe ff ff       	call   ec3 <write>
    105c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    105f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1062:	0f b6 13             	movzbl (%ebx),%edx
    1065:	83 c3 01             	add    $0x1,%ebx
    1068:	84 d2                	test   %dl,%dl
    106a:	74 24                	je     1090 <printf+0x80>
    c = fmt[i] & 0xff;
    106c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    106f:	85 c9                	test   %ecx,%ecx
    1071:	74 cd                	je     1040 <printf+0x30>
      }
    } else if(state == '%'){
    1073:	83 f9 25             	cmp    $0x25,%ecx
    1076:	75 ea                	jne    1062 <printf+0x52>
      if(c == 'd'){
    1078:	83 f8 25             	cmp    $0x25,%eax
    107b:	0f 84 07 01 00 00    	je     1188 <printf+0x178>
    1081:	83 e8 63             	sub    $0x63,%eax
    1084:	83 f8 15             	cmp    $0x15,%eax
    1087:	77 17                	ja     10a0 <printf+0x90>
    1089:	ff 24 85 28 14 00 00 	jmp    *0x1428(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1090:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1093:	5b                   	pop    %ebx
    1094:	5e                   	pop    %esi
    1095:	5f                   	pop    %edi
    1096:	5d                   	pop    %ebp
    1097:	c3                   	ret    
    1098:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109f:	90                   	nop
  write(fd, &c, 1);
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    10a6:	6a 01                	push   $0x1
    10a8:	57                   	push   %edi
    10a9:	56                   	push   %esi
    10aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    10ae:	e8 10 fe ff ff       	call   ec3 <write>
        putc(fd, c);
    10b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    10b7:	83 c4 0c             	add    $0xc,%esp
    10ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
    10bd:	6a 01                	push   $0x1
    10bf:	57                   	push   %edi
    10c0:	56                   	push   %esi
    10c1:	e8 fd fd ff ff       	call   ec3 <write>
        putc(fd, c);
    10c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10c9:	31 c9                	xor    %ecx,%ecx
    10cb:	eb 95                	jmp    1062 <printf+0x52>
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    10d0:	83 ec 0c             	sub    $0xc,%esp
    10d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    10d8:	6a 00                	push   $0x0
    10da:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10dd:	8b 10                	mov    (%eax),%edx
    10df:	89 f0                	mov    %esi,%eax
    10e1:	e8 7a fe ff ff       	call   f60 <printint>
        ap++;
    10e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    10ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10ed:	31 c9                	xor    %ecx,%ecx
    10ef:	e9 6e ff ff ff       	jmp    1062 <printf+0x52>
    10f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    10f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10fb:	8b 10                	mov    (%eax),%edx
        ap++;
    10fd:	83 c0 04             	add    $0x4,%eax
    1100:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1103:	85 d2                	test   %edx,%edx
    1105:	0f 84 8d 00 00 00    	je     1198 <printf+0x188>
        while(*s != 0){
    110b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    110e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1110:	84 c0                	test   %al,%al
    1112:	0f 84 4a ff ff ff    	je     1062 <printf+0x52>
    1118:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    111b:	89 d3                	mov    %edx,%ebx
    111d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1120:	83 ec 04             	sub    $0x4,%esp
          s++;
    1123:	83 c3 01             	add    $0x1,%ebx
    1126:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1129:	6a 01                	push   $0x1
    112b:	57                   	push   %edi
    112c:	56                   	push   %esi
    112d:	e8 91 fd ff ff       	call   ec3 <write>
        while(*s != 0){
    1132:	0f b6 03             	movzbl (%ebx),%eax
    1135:	83 c4 10             	add    $0x10,%esp
    1138:	84 c0                	test   %al,%al
    113a:	75 e4                	jne    1120 <printf+0x110>
      state = 0;
    113c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    113f:	31 c9                	xor    %ecx,%ecx
    1141:	e9 1c ff ff ff       	jmp    1062 <printf+0x52>
    1146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1150:	83 ec 0c             	sub    $0xc,%esp
    1153:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1158:	6a 01                	push   $0x1
    115a:	e9 7b ff ff ff       	jmp    10da <printf+0xca>
    115f:	90                   	nop
        putc(fd, *ap);
    1160:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1163:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1166:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1168:	6a 01                	push   $0x1
    116a:	57                   	push   %edi
    116b:	56                   	push   %esi
        putc(fd, *ap);
    116c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    116f:	e8 4f fd ff ff       	call   ec3 <write>
        ap++;
    1174:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1178:	83 c4 10             	add    $0x10,%esp
      state = 0;
    117b:	31 c9                	xor    %ecx,%ecx
    117d:	e9 e0 fe ff ff       	jmp    1062 <printf+0x52>
    1182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1188:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    118b:	83 ec 04             	sub    $0x4,%esp
    118e:	e9 2a ff ff ff       	jmp    10bd <printf+0xad>
    1193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1197:	90                   	nop
          s = "(null)";
    1198:	ba 20 14 00 00       	mov    $0x1420,%edx
        while(*s != 0){
    119d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    11a0:	b8 28 00 00 00       	mov    $0x28,%eax
    11a5:	89 d3                	mov    %edx,%ebx
    11a7:	e9 74 ff ff ff       	jmp    1120 <printf+0x110>
    11ac:	66 90                	xchg   %ax,%ax
    11ae:	66 90                	xchg   %ax,%ax

000011b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11b1:	a1 84 1b 00 00       	mov    0x1b84,%eax
{
    11b6:	89 e5                	mov    %esp,%ebp
    11b8:	57                   	push   %edi
    11b9:	56                   	push   %esi
    11ba:	53                   	push   %ebx
    11bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    11be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c8:	89 c2                	mov    %eax,%edx
    11ca:	8b 00                	mov    (%eax),%eax
    11cc:	39 ca                	cmp    %ecx,%edx
    11ce:	73 30                	jae    1200 <free+0x50>
    11d0:	39 c1                	cmp    %eax,%ecx
    11d2:	72 04                	jb     11d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11d4:	39 c2                	cmp    %eax,%edx
    11d6:	72 f0                	jb     11c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    11d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11de:	39 f8                	cmp    %edi,%eax
    11e0:	74 30                	je     1212 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    11e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    11e5:	8b 42 04             	mov    0x4(%edx),%eax
    11e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    11eb:	39 f1                	cmp    %esi,%ecx
    11ed:	74 3a                	je     1229 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    11ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    11f1:	5b                   	pop    %ebx
  freep = p;
    11f2:	89 15 84 1b 00 00    	mov    %edx,0x1b84
}
    11f8:	5e                   	pop    %esi
    11f9:	5f                   	pop    %edi
    11fa:	5d                   	pop    %ebp
    11fb:	c3                   	ret    
    11fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1200:	39 c2                	cmp    %eax,%edx
    1202:	72 c4                	jb     11c8 <free+0x18>
    1204:	39 c1                	cmp    %eax,%ecx
    1206:	73 c0                	jae    11c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1208:	8b 73 fc             	mov    -0x4(%ebx),%esi
    120b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    120e:	39 f8                	cmp    %edi,%eax
    1210:	75 d0                	jne    11e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1212:	03 70 04             	add    0x4(%eax),%esi
    1215:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1218:	8b 02                	mov    (%edx),%eax
    121a:	8b 00                	mov    (%eax),%eax
    121c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    121f:	8b 42 04             	mov    0x4(%edx),%eax
    1222:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1225:	39 f1                	cmp    %esi,%ecx
    1227:	75 c6                	jne    11ef <free+0x3f>
    p->s.size += bp->s.size;
    1229:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    122c:	89 15 84 1b 00 00    	mov    %edx,0x1b84
    p->s.size += bp->s.size;
    1232:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1235:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1238:	89 0a                	mov    %ecx,(%edx)
}
    123a:	5b                   	pop    %ebx
    123b:	5e                   	pop    %esi
    123c:	5f                   	pop    %edi
    123d:	5d                   	pop    %ebp
    123e:	c3                   	ret    
    123f:	90                   	nop

00001240 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	56                   	push   %esi
    1245:	53                   	push   %ebx
    1246:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1249:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    124c:	8b 3d 84 1b 00 00    	mov    0x1b84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1252:	8d 70 07             	lea    0x7(%eax),%esi
    1255:	c1 ee 03             	shr    $0x3,%esi
    1258:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    125b:	85 ff                	test   %edi,%edi
    125d:	0f 84 9d 00 00 00    	je     1300 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1263:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1265:	8b 4a 04             	mov    0x4(%edx),%ecx
    1268:	39 f1                	cmp    %esi,%ecx
    126a:	73 6a                	jae    12d6 <malloc+0x96>
    126c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1271:	39 de                	cmp    %ebx,%esi
    1273:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1276:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    127d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1280:	eb 17                	jmp    1299 <malloc+0x59>
    1282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1288:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    128a:	8b 48 04             	mov    0x4(%eax),%ecx
    128d:	39 f1                	cmp    %esi,%ecx
    128f:	73 4f                	jae    12e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1291:	8b 3d 84 1b 00 00    	mov    0x1b84,%edi
    1297:	89 c2                	mov    %eax,%edx
    1299:	39 d7                	cmp    %edx,%edi
    129b:	75 eb                	jne    1288 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    129d:	83 ec 0c             	sub    $0xc,%esp
    12a0:	ff 75 e4             	push   -0x1c(%ebp)
    12a3:	e8 83 fc ff ff       	call   f2b <sbrk>
  if(p == (char*)-1)
    12a8:	83 c4 10             	add    $0x10,%esp
    12ab:	83 f8 ff             	cmp    $0xffffffff,%eax
    12ae:	74 1c                	je     12cc <malloc+0x8c>
  hp->s.size = nu;
    12b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    12b3:	83 ec 0c             	sub    $0xc,%esp
    12b6:	83 c0 08             	add    $0x8,%eax
    12b9:	50                   	push   %eax
    12ba:	e8 f1 fe ff ff       	call   11b0 <free>
  return freep;
    12bf:	8b 15 84 1b 00 00    	mov    0x1b84,%edx
      if((p = morecore(nunits)) == 0)
    12c5:	83 c4 10             	add    $0x10,%esp
    12c8:	85 d2                	test   %edx,%edx
    12ca:	75 bc                	jne    1288 <malloc+0x48>
        return 0;
  }
}
    12cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    12cf:	31 c0                	xor    %eax,%eax
}
    12d1:	5b                   	pop    %ebx
    12d2:	5e                   	pop    %esi
    12d3:	5f                   	pop    %edi
    12d4:	5d                   	pop    %ebp
    12d5:	c3                   	ret    
    if(p->s.size >= nunits){
    12d6:	89 d0                	mov    %edx,%eax
    12d8:	89 fa                	mov    %edi,%edx
    12da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    12e0:	39 ce                	cmp    %ecx,%esi
    12e2:	74 4c                	je     1330 <malloc+0xf0>
        p->s.size -= nunits;
    12e4:	29 f1                	sub    %esi,%ecx
    12e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    12e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    12ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    12ef:	89 15 84 1b 00 00    	mov    %edx,0x1b84
}
    12f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    12f8:	83 c0 08             	add    $0x8,%eax
}
    12fb:	5b                   	pop    %ebx
    12fc:	5e                   	pop    %esi
    12fd:	5f                   	pop    %edi
    12fe:	5d                   	pop    %ebp
    12ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1300:	c7 05 84 1b 00 00 88 	movl   $0x1b88,0x1b84
    1307:	1b 00 00 
    base.s.size = 0;
    130a:	bf 88 1b 00 00       	mov    $0x1b88,%edi
    base.s.ptr = freep = prevp = &base;
    130f:	c7 05 88 1b 00 00 88 	movl   $0x1b88,0x1b88
    1316:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1319:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    131b:	c7 05 8c 1b 00 00 00 	movl   $0x0,0x1b8c
    1322:	00 00 00 
    if(p->s.size >= nunits){
    1325:	e9 42 ff ff ff       	jmp    126c <malloc+0x2c>
    132a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1330:	8b 08                	mov    (%eax),%ecx
    1332:	89 0a                	mov    %ecx,(%edx)
    1334:	eb b9                	jmp    12ef <malloc+0xaf>
