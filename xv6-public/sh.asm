
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	56                   	push   %esi
       4:	53                   	push   %ebx
       5:	8b 5d 08             	mov    0x8(%ebp),%ebx
       8:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 50 10 00 00       	push   $0x1050
      13:	6a 02                	push   $0x2
      15:	e8 89 0d 00 00       	call   da3 <printf>
  memset(buf, 0, nbuf);
      1a:	83 c4 0c             	add    $0xc,%esp
      1d:	56                   	push   %esi
      1e:	6a 00                	push   $0x0
      20:	53                   	push   %ebx
      21:	e8 ed 0a 00 00       	call   b13 <memset>
  gets(buf, nbuf);
      26:	83 c4 08             	add    $0x8,%esp
      29:	56                   	push   %esi
      2a:	53                   	push   %ebx
      2b:	e8 1f 0b 00 00       	call   b4f <gets>
  if(buf[0] == 0) // EOF
      30:	83 c4 10             	add    $0x10,%esp
      33:	80 3b 00             	cmpb   $0x0,(%ebx)
      36:	74 0c                	je     44 <getcmd+0x44>
    return -1;
  return 0;
      38:	b8 00 00 00 00       	mov    $0x0,%eax
}
      3d:	8d 65 f8             	lea    -0x8(%ebp),%esp
      40:	5b                   	pop    %ebx
      41:	5e                   	pop    %esi
      42:	5d                   	pop    %ebp
      43:	c3                   	ret    
    return -1;
      44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      49:	eb f2                	jmp    3d <getcmd+0x3d>

0000004b <panic>:
  exit();
}

void
panic(char *s)
{
      4b:	55                   	push   %ebp
      4c:	89 e5                	mov    %esp,%ebp
      4e:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
      51:	ff 75 08             	push   0x8(%ebp)
      54:	68 ed 10 00 00       	push   $0x10ed
      59:	6a 02                	push   $0x2
      5b:	e8 43 0d 00 00       	call   da3 <printf>
  exit();
      60:	e8 e9 0b 00 00       	call   c4e <exit>

00000065 <fork1>:
}

int
fork1(void)
{
      65:	55                   	push   %ebp
      66:	89 e5                	mov    %esp,%ebp
      68:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
      6b:	e8 d6 0b 00 00       	call   c46 <fork>
  if(pid == -1)
      70:	83 f8 ff             	cmp    $0xffffffff,%eax
      73:	74 02                	je     77 <fork1+0x12>
    panic("fork");
  return pid;
}
      75:	c9                   	leave  
      76:	c3                   	ret    
    panic("fork");
      77:	83 ec 0c             	sub    $0xc,%esp
      7a:	68 53 10 00 00       	push   $0x1053
      7f:	e8 c7 ff ff ff       	call   4b <panic>

00000084 <runcmd>:
{
      84:	55                   	push   %ebp
      85:	89 e5                	mov    %esp,%ebp
      87:	53                   	push   %ebx
      88:	83 ec 14             	sub    $0x14,%esp
      8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
      8e:	85 db                	test   %ebx,%ebx
      90:	74 0e                	je     a0 <runcmd+0x1c>
  switch(cmd->type){
      92:	8b 03                	mov    (%ebx),%eax
      94:	83 f8 05             	cmp    $0x5,%eax
      97:	77 0c                	ja     a5 <runcmd+0x21>
      99:	ff 24 85 08 11 00 00 	jmp    *0x1108(,%eax,4)
    exit();
      a0:	e8 a9 0b 00 00       	call   c4e <exit>
    panic("runcmd");
      a5:	83 ec 0c             	sub    $0xc,%esp
      a8:	68 58 10 00 00       	push   $0x1058
      ad:	e8 99 ff ff ff       	call   4b <panic>
    if(ecmd->argv[0] == 0)
      b2:	8b 43 04             	mov    0x4(%ebx),%eax
      b5:	85 c0                	test   %eax,%eax
      b7:	74 27                	je     e0 <runcmd+0x5c>
    exec(ecmd->argv[0], ecmd->argv);
      b9:	8d 53 04             	lea    0x4(%ebx),%edx
      bc:	83 ec 08             	sub    $0x8,%esp
      bf:	52                   	push   %edx
      c0:	50                   	push   %eax
      c1:	e8 c0 0b 00 00       	call   c86 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      c6:	83 c4 0c             	add    $0xc,%esp
      c9:	ff 73 04             	push   0x4(%ebx)
      cc:	68 5f 10 00 00       	push   $0x105f
      d1:	6a 02                	push   $0x2
      d3:	e8 cb 0c 00 00       	call   da3 <printf>
    break;
      d8:	83 c4 10             	add    $0x10,%esp
  exit();
      db:	e8 6e 0b 00 00       	call   c4e <exit>
      exit();
      e0:	e8 69 0b 00 00       	call   c4e <exit>
    close(rcmd->fd);
      e5:	83 ec 0c             	sub    $0xc,%esp
      e8:	ff 73 14             	push   0x14(%ebx)
      eb:	e8 86 0b 00 00       	call   c76 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      f0:	83 c4 08             	add    $0x8,%esp
      f3:	ff 73 10             	push   0x10(%ebx)
      f6:	ff 73 08             	push   0x8(%ebx)
      f9:	e8 90 0b 00 00       	call   c8e <open>
      fe:	83 c4 10             	add    $0x10,%esp
     101:	85 c0                	test   %eax,%eax
     103:	78 0b                	js     110 <runcmd+0x8c>
    runcmd(rcmd->cmd);
     105:	83 ec 0c             	sub    $0xc,%esp
     108:	ff 73 04             	push   0x4(%ebx)
     10b:	e8 74 ff ff ff       	call   84 <runcmd>
      printf(2, "open %s failed\n", rcmd->file);
     110:	83 ec 04             	sub    $0x4,%esp
     113:	ff 73 08             	push   0x8(%ebx)
     116:	68 6f 10 00 00       	push   $0x106f
     11b:	6a 02                	push   $0x2
     11d:	e8 81 0c 00 00       	call   da3 <printf>
      exit();
     122:	e8 27 0b 00 00       	call   c4e <exit>
    if(fork1() == 0)
     127:	e8 39 ff ff ff       	call   65 <fork1>
     12c:	85 c0                	test   %eax,%eax
     12e:	74 10                	je     140 <runcmd+0xbc>
    wait();
     130:	e8 21 0b 00 00       	call   c56 <wait>
    runcmd(lcmd->right);
     135:	83 ec 0c             	sub    $0xc,%esp
     138:	ff 73 08             	push   0x8(%ebx)
     13b:	e8 44 ff ff ff       	call   84 <runcmd>
      runcmd(lcmd->left);
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	ff 73 04             	push   0x4(%ebx)
     146:	e8 39 ff ff ff       	call   84 <runcmd>
    if(pipe(p) < 0)
     14b:	83 ec 0c             	sub    $0xc,%esp
     14e:	8d 45 f0             	lea    -0x10(%ebp),%eax
     151:	50                   	push   %eax
     152:	e8 07 0b 00 00       	call   c5e <pipe>
     157:	83 c4 10             	add    $0x10,%esp
     15a:	85 c0                	test   %eax,%eax
     15c:	78 3a                	js     198 <runcmd+0x114>
    if(fork1() == 0){
     15e:	e8 02 ff ff ff       	call   65 <fork1>
     163:	85 c0                	test   %eax,%eax
     165:	74 3e                	je     1a5 <runcmd+0x121>
    if(fork1() == 0){
     167:	e8 f9 fe ff ff       	call   65 <fork1>
     16c:	85 c0                	test   %eax,%eax
     16e:	74 6b                	je     1db <runcmd+0x157>
    close(p[0]);
     170:	83 ec 0c             	sub    $0xc,%esp
     173:	ff 75 f0             	push   -0x10(%ebp)
     176:	e8 fb 0a 00 00       	call   c76 <close>
    close(p[1]);
     17b:	83 c4 04             	add    $0x4,%esp
     17e:	ff 75 f4             	push   -0xc(%ebp)
     181:	e8 f0 0a 00 00       	call   c76 <close>
    wait();
     186:	e8 cb 0a 00 00       	call   c56 <wait>
    wait();
     18b:	e8 c6 0a 00 00       	call   c56 <wait>
    break;
     190:	83 c4 10             	add    $0x10,%esp
     193:	e9 43 ff ff ff       	jmp    db <runcmd+0x57>
      panic("pipe");
     198:	83 ec 0c             	sub    $0xc,%esp
     19b:	68 7f 10 00 00       	push   $0x107f
     1a0:	e8 a6 fe ff ff       	call   4b <panic>
      close(1);
     1a5:	83 ec 0c             	sub    $0xc,%esp
     1a8:	6a 01                	push   $0x1
     1aa:	e8 c7 0a 00 00       	call   c76 <close>
      dup(p[1]);
     1af:	83 c4 04             	add    $0x4,%esp
     1b2:	ff 75 f4             	push   -0xc(%ebp)
     1b5:	e8 0c 0b 00 00       	call   cc6 <dup>
      close(p[0]);
     1ba:	83 c4 04             	add    $0x4,%esp
     1bd:	ff 75 f0             	push   -0x10(%ebp)
     1c0:	e8 b1 0a 00 00       	call   c76 <close>
      close(p[1]);
     1c5:	83 c4 04             	add    $0x4,%esp
     1c8:	ff 75 f4             	push   -0xc(%ebp)
     1cb:	e8 a6 0a 00 00       	call   c76 <close>
      runcmd(pcmd->left);
     1d0:	83 c4 04             	add    $0x4,%esp
     1d3:	ff 73 04             	push   0x4(%ebx)
     1d6:	e8 a9 fe ff ff       	call   84 <runcmd>
      close(0);
     1db:	83 ec 0c             	sub    $0xc,%esp
     1de:	6a 00                	push   $0x0
     1e0:	e8 91 0a 00 00       	call   c76 <close>
      dup(p[0]);
     1e5:	83 c4 04             	add    $0x4,%esp
     1e8:	ff 75 f0             	push   -0x10(%ebp)
     1eb:	e8 d6 0a 00 00       	call   cc6 <dup>
      close(p[0]);
     1f0:	83 c4 04             	add    $0x4,%esp
     1f3:	ff 75 f0             	push   -0x10(%ebp)
     1f6:	e8 7b 0a 00 00       	call   c76 <close>
      close(p[1]);
     1fb:	83 c4 04             	add    $0x4,%esp
     1fe:	ff 75 f4             	push   -0xc(%ebp)
     201:	e8 70 0a 00 00       	call   c76 <close>
      runcmd(pcmd->right);
     206:	83 c4 04             	add    $0x4,%esp
     209:	ff 73 08             	push   0x8(%ebx)
     20c:	e8 73 fe ff ff       	call   84 <runcmd>
    if(fork1() == 0)
     211:	e8 4f fe ff ff       	call   65 <fork1>
     216:	85 c0                	test   %eax,%eax
     218:	0f 85 bd fe ff ff    	jne    db <runcmd+0x57>
      runcmd(bcmd->cmd);
     21e:	83 ec 0c             	sub    $0xc,%esp
     221:	ff 73 04             	push   0x4(%ebx)
     224:	e8 5b fe ff ff       	call   84 <runcmd>

00000229 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     229:	55                   	push   %ebp
     22a:	89 e5                	mov    %esp,%ebp
     22c:	53                   	push   %ebx
     22d:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     230:	6a 54                	push   $0x54
     232:	e8 92 0d 00 00       	call   fc9 <malloc>
     237:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     239:	83 c4 0c             	add    $0xc,%esp
     23c:	6a 54                	push   $0x54
     23e:	6a 00                	push   $0x0
     240:	50                   	push   %eax
     241:	e8 cd 08 00 00       	call   b13 <memset>
  cmd->type = EXEC;
     246:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     24c:	89 d8                	mov    %ebx,%eax
     24e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     251:	c9                   	leave  
     252:	c3                   	ret    

00000253 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     253:	55                   	push   %ebp
     254:	89 e5                	mov    %esp,%ebp
     256:	53                   	push   %ebx
     257:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     25a:	6a 18                	push   $0x18
     25c:	e8 68 0d 00 00       	call   fc9 <malloc>
     261:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     263:	83 c4 0c             	add    $0xc,%esp
     266:	6a 18                	push   $0x18
     268:	6a 00                	push   $0x0
     26a:	50                   	push   %eax
     26b:	e8 a3 08 00 00       	call   b13 <memset>
  cmd->type = REDIR;
     270:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     276:	8b 45 08             	mov    0x8(%ebp),%eax
     279:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     27c:	8b 45 0c             	mov    0xc(%ebp),%eax
     27f:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     282:	8b 45 10             	mov    0x10(%ebp),%eax
     285:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     288:	8b 45 14             	mov    0x14(%ebp),%eax
     28b:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     28e:	8b 45 18             	mov    0x18(%ebp),%eax
     291:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     294:	89 d8                	mov    %ebx,%eax
     296:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     299:	c9                   	leave  
     29a:	c3                   	ret    

0000029b <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     29b:	55                   	push   %ebp
     29c:	89 e5                	mov    %esp,%ebp
     29e:	53                   	push   %ebx
     29f:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2a2:	6a 0c                	push   $0xc
     2a4:	e8 20 0d 00 00       	call   fc9 <malloc>
     2a9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2ab:	83 c4 0c             	add    $0xc,%esp
     2ae:	6a 0c                	push   $0xc
     2b0:	6a 00                	push   $0x0
     2b2:	50                   	push   %eax
     2b3:	e8 5b 08 00 00       	call   b13 <memset>
  cmd->type = PIPE;
     2b8:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     2be:	8b 45 08             	mov    0x8(%ebp),%eax
     2c1:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     2c4:	8b 45 0c             	mov    0xc(%ebp),%eax
     2c7:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     2ca:	89 d8                	mov    %ebx,%eax
     2cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2cf:	c9                   	leave  
     2d0:	c3                   	ret    

000002d1 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     2d1:	55                   	push   %ebp
     2d2:	89 e5                	mov    %esp,%ebp
     2d4:	53                   	push   %ebx
     2d5:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2d8:	6a 0c                	push   $0xc
     2da:	e8 ea 0c 00 00       	call   fc9 <malloc>
     2df:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2e1:	83 c4 0c             	add    $0xc,%esp
     2e4:	6a 0c                	push   $0xc
     2e6:	6a 00                	push   $0x0
     2e8:	50                   	push   %eax
     2e9:	e8 25 08 00 00       	call   b13 <memset>
  cmd->type = LIST;
     2ee:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     2f4:	8b 45 08             	mov    0x8(%ebp),%eax
     2f7:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     2fd:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     300:	89 d8                	mov    %ebx,%eax
     302:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     305:	c9                   	leave  
     306:	c3                   	ret    

00000307 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     307:	55                   	push   %ebp
     308:	89 e5                	mov    %esp,%ebp
     30a:	53                   	push   %ebx
     30b:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     30e:	6a 08                	push   $0x8
     310:	e8 b4 0c 00 00       	call   fc9 <malloc>
     315:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     317:	83 c4 0c             	add    $0xc,%esp
     31a:	6a 08                	push   $0x8
     31c:	6a 00                	push   $0x0
     31e:	50                   	push   %eax
     31f:	e8 ef 07 00 00       	call   b13 <memset>
  cmd->type = BACK;
     324:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     32a:	8b 45 08             	mov    0x8(%ebp),%eax
     32d:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     330:	89 d8                	mov    %ebx,%eax
     332:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     335:	c9                   	leave  
     336:	c3                   	ret    

00000337 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     337:	55                   	push   %ebp
     338:	89 e5                	mov    %esp,%ebp
     33a:	57                   	push   %edi
     33b:	56                   	push   %esi
     33c:	53                   	push   %ebx
     33d:	83 ec 0c             	sub    $0xc,%esp
     340:	8b 75 0c             	mov    0xc(%ebp),%esi
     343:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     346:	8b 45 08             	mov    0x8(%ebp),%eax
     349:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     34b:	eb 03                	jmp    350 <gettoken+0x19>
    s++;
     34d:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     350:	39 f3                	cmp    %esi,%ebx
     352:	73 18                	jae    36c <gettoken+0x35>
     354:	83 ec 08             	sub    $0x8,%esp
     357:	0f be 03             	movsbl (%ebx),%eax
     35a:	50                   	push   %eax
     35b:	68 ec 17 00 00       	push   $0x17ec
     360:	e8 c7 07 00 00       	call   b2c <strchr>
     365:	83 c4 10             	add    $0x10,%esp
     368:	85 c0                	test   %eax,%eax
     36a:	75 e1                	jne    34d <gettoken+0x16>
  if(q)
     36c:	85 ff                	test   %edi,%edi
     36e:	74 02                	je     372 <gettoken+0x3b>
    *q = s;
     370:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     372:	0f b6 03             	movzbl (%ebx),%eax
     375:	0f be f8             	movsbl %al,%edi
  switch(*s){
     378:	3c 3c                	cmp    $0x3c,%al
     37a:	7f 27                	jg     3a3 <gettoken+0x6c>
     37c:	3c 3b                	cmp    $0x3b,%al
     37e:	7d 13                	jge    393 <gettoken+0x5c>
     380:	84 c0                	test   %al,%al
     382:	74 12                	je     396 <gettoken+0x5f>
     384:	78 41                	js     3c7 <gettoken+0x90>
     386:	3c 26                	cmp    $0x26,%al
     388:	74 09                	je     393 <gettoken+0x5c>
     38a:	7c 3b                	jl     3c7 <gettoken+0x90>
     38c:	83 e8 28             	sub    $0x28,%eax
     38f:	3c 01                	cmp    $0x1,%al
     391:	77 34                	ja     3c7 <gettoken+0x90>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     393:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     396:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     39a:	74 77                	je     413 <gettoken+0xdc>
    *eq = s;
     39c:	8b 45 14             	mov    0x14(%ebp),%eax
     39f:	89 18                	mov    %ebx,(%eax)
     3a1:	eb 70                	jmp    413 <gettoken+0xdc>
  switch(*s){
     3a3:	3c 3e                	cmp    $0x3e,%al
     3a5:	75 0d                	jne    3b4 <gettoken+0x7d>
    s++;
     3a7:	8d 43 01             	lea    0x1(%ebx),%eax
    if(*s == '>'){
     3aa:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
     3ae:	74 0a                	je     3ba <gettoken+0x83>
    s++;
     3b0:	89 c3                	mov    %eax,%ebx
     3b2:	eb e2                	jmp    396 <gettoken+0x5f>
  switch(*s){
     3b4:	3c 7c                	cmp    $0x7c,%al
     3b6:	75 0f                	jne    3c7 <gettoken+0x90>
     3b8:	eb d9                	jmp    393 <gettoken+0x5c>
      s++;
     3ba:	83 c3 02             	add    $0x2,%ebx
      ret = '+';
     3bd:	bf 2b 00 00 00       	mov    $0x2b,%edi
     3c2:	eb d2                	jmp    396 <gettoken+0x5f>
      s++;
     3c4:	83 c3 01             	add    $0x1,%ebx
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     3c7:	39 f3                	cmp    %esi,%ebx
     3c9:	73 37                	jae    402 <gettoken+0xcb>
     3cb:	83 ec 08             	sub    $0x8,%esp
     3ce:	0f be 03             	movsbl (%ebx),%eax
     3d1:	50                   	push   %eax
     3d2:	68 ec 17 00 00       	push   $0x17ec
     3d7:	e8 50 07 00 00       	call   b2c <strchr>
     3dc:	83 c4 10             	add    $0x10,%esp
     3df:	85 c0                	test   %eax,%eax
     3e1:	75 26                	jne    409 <gettoken+0xd2>
     3e3:	83 ec 08             	sub    $0x8,%esp
     3e6:	0f be 03             	movsbl (%ebx),%eax
     3e9:	50                   	push   %eax
     3ea:	68 e4 17 00 00       	push   $0x17e4
     3ef:	e8 38 07 00 00       	call   b2c <strchr>
     3f4:	83 c4 10             	add    $0x10,%esp
     3f7:	85 c0                	test   %eax,%eax
     3f9:	74 c9                	je     3c4 <gettoken+0x8d>
    ret = 'a';
     3fb:	bf 61 00 00 00       	mov    $0x61,%edi
     400:	eb 94                	jmp    396 <gettoken+0x5f>
     402:	bf 61 00 00 00       	mov    $0x61,%edi
     407:	eb 8d                	jmp    396 <gettoken+0x5f>
     409:	bf 61 00 00 00       	mov    $0x61,%edi
     40e:	eb 86                	jmp    396 <gettoken+0x5f>

  while(s < es && strchr(whitespace, *s))
    s++;
     410:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     413:	39 f3                	cmp    %esi,%ebx
     415:	73 18                	jae    42f <gettoken+0xf8>
     417:	83 ec 08             	sub    $0x8,%esp
     41a:	0f be 03             	movsbl (%ebx),%eax
     41d:	50                   	push   %eax
     41e:	68 ec 17 00 00       	push   $0x17ec
     423:	e8 04 07 00 00       	call   b2c <strchr>
     428:	83 c4 10             	add    $0x10,%esp
     42b:	85 c0                	test   %eax,%eax
     42d:	75 e1                	jne    410 <gettoken+0xd9>
  *ps = s;
     42f:	8b 45 08             	mov    0x8(%ebp),%eax
     432:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     434:	89 f8                	mov    %edi,%eax
     436:	8d 65 f4             	lea    -0xc(%ebp),%esp
     439:	5b                   	pop    %ebx
     43a:	5e                   	pop    %esi
     43b:	5f                   	pop    %edi
     43c:	5d                   	pop    %ebp
     43d:	c3                   	ret    

0000043e <peek>:

int
peek(char **ps, char *es, char *toks)
{
     43e:	55                   	push   %ebp
     43f:	89 e5                	mov    %esp,%ebp
     441:	57                   	push   %edi
     442:	56                   	push   %esi
     443:	53                   	push   %ebx
     444:	83 ec 0c             	sub    $0xc,%esp
     447:	8b 7d 08             	mov    0x8(%ebp),%edi
     44a:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     44d:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     44f:	eb 03                	jmp    454 <peek+0x16>
    s++;
     451:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     454:	39 f3                	cmp    %esi,%ebx
     456:	73 18                	jae    470 <peek+0x32>
     458:	83 ec 08             	sub    $0x8,%esp
     45b:	0f be 03             	movsbl (%ebx),%eax
     45e:	50                   	push   %eax
     45f:	68 ec 17 00 00       	push   $0x17ec
     464:	e8 c3 06 00 00       	call   b2c <strchr>
     469:	83 c4 10             	add    $0x10,%esp
     46c:	85 c0                	test   %eax,%eax
     46e:	75 e1                	jne    451 <peek+0x13>
  *ps = s;
     470:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     472:	0f b6 03             	movzbl (%ebx),%eax
     475:	84 c0                	test   %al,%al
     477:	75 0d                	jne    486 <peek+0x48>
     479:	b8 00 00 00 00       	mov    $0x0,%eax
}
     47e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     481:	5b                   	pop    %ebx
     482:	5e                   	pop    %esi
     483:	5f                   	pop    %edi
     484:	5d                   	pop    %ebp
     485:	c3                   	ret    
  return *s && strchr(toks, *s);
     486:	83 ec 08             	sub    $0x8,%esp
     489:	0f be c0             	movsbl %al,%eax
     48c:	50                   	push   %eax
     48d:	ff 75 10             	push   0x10(%ebp)
     490:	e8 97 06 00 00       	call   b2c <strchr>
     495:	83 c4 10             	add    $0x10,%esp
     498:	85 c0                	test   %eax,%eax
     49a:	74 07                	je     4a3 <peek+0x65>
     49c:	b8 01 00 00 00       	mov    $0x1,%eax
     4a1:	eb db                	jmp    47e <peek+0x40>
     4a3:	b8 00 00 00 00       	mov    $0x0,%eax
     4a8:	eb d4                	jmp    47e <peek+0x40>

000004aa <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     4aa:	55                   	push   %ebp
     4ab:	89 e5                	mov    %esp,%ebp
     4ad:	57                   	push   %edi
     4ae:	56                   	push   %esi
     4af:	53                   	push   %ebx
     4b0:	83 ec 1c             	sub    $0x1c,%esp
     4b3:	8b 7d 0c             	mov    0xc(%ebp),%edi
     4b6:	8b 75 10             	mov    0x10(%ebp),%esi
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     4b9:	eb 28                	jmp    4e3 <parseredirs+0x39>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     4bb:	83 ec 0c             	sub    $0xc,%esp
     4be:	68 84 10 00 00       	push   $0x1084
     4c3:	e8 83 fb ff ff       	call   4b <panic>
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     4c8:	83 ec 0c             	sub    $0xc,%esp
     4cb:	6a 00                	push   $0x0
     4cd:	6a 00                	push   $0x0
     4cf:	ff 75 e0             	push   -0x20(%ebp)
     4d2:	ff 75 e4             	push   -0x1c(%ebp)
     4d5:	ff 75 08             	push   0x8(%ebp)
     4d8:	e8 76 fd ff ff       	call   253 <redircmd>
     4dd:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     4e0:	83 c4 20             	add    $0x20,%esp
  while(peek(ps, es, "<>")){
     4e3:	83 ec 04             	sub    $0x4,%esp
     4e6:	68 a1 10 00 00       	push   $0x10a1
     4eb:	56                   	push   %esi
     4ec:	57                   	push   %edi
     4ed:	e8 4c ff ff ff       	call   43e <peek>
     4f2:	83 c4 10             	add    $0x10,%esp
     4f5:	85 c0                	test   %eax,%eax
     4f7:	74 76                	je     56f <parseredirs+0xc5>
    tok = gettoken(ps, es, 0, 0);
     4f9:	6a 00                	push   $0x0
     4fb:	6a 00                	push   $0x0
     4fd:	56                   	push   %esi
     4fe:	57                   	push   %edi
     4ff:	e8 33 fe ff ff       	call   337 <gettoken>
     504:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     506:	8d 45 e0             	lea    -0x20(%ebp),%eax
     509:	50                   	push   %eax
     50a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     50d:	50                   	push   %eax
     50e:	56                   	push   %esi
     50f:	57                   	push   %edi
     510:	e8 22 fe ff ff       	call   337 <gettoken>
     515:	83 c4 20             	add    $0x20,%esp
     518:	83 f8 61             	cmp    $0x61,%eax
     51b:	75 9e                	jne    4bb <parseredirs+0x11>
    switch(tok){
     51d:	83 fb 3c             	cmp    $0x3c,%ebx
     520:	74 a6                	je     4c8 <parseredirs+0x1e>
     522:	83 fb 3e             	cmp    $0x3e,%ebx
     525:	74 25                	je     54c <parseredirs+0xa2>
     527:	83 fb 2b             	cmp    $0x2b,%ebx
     52a:	75 b7                	jne    4e3 <parseredirs+0x39>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     52c:	83 ec 0c             	sub    $0xc,%esp
     52f:	6a 01                	push   $0x1
     531:	68 01 02 00 00       	push   $0x201
     536:	ff 75 e0             	push   -0x20(%ebp)
     539:	ff 75 e4             	push   -0x1c(%ebp)
     53c:	ff 75 08             	push   0x8(%ebp)
     53f:	e8 0f fd ff ff       	call   253 <redircmd>
     544:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     547:	83 c4 20             	add    $0x20,%esp
     54a:	eb 97                	jmp    4e3 <parseredirs+0x39>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     54c:	83 ec 0c             	sub    $0xc,%esp
     54f:	6a 01                	push   $0x1
     551:	68 01 02 00 00       	push   $0x201
     556:	ff 75 e0             	push   -0x20(%ebp)
     559:	ff 75 e4             	push   -0x1c(%ebp)
     55c:	ff 75 08             	push   0x8(%ebp)
     55f:	e8 ef fc ff ff       	call   253 <redircmd>
     564:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     567:	83 c4 20             	add    $0x20,%esp
     56a:	e9 74 ff ff ff       	jmp    4e3 <parseredirs+0x39>
    }
  }
  return cmd;
}
     56f:	8b 45 08             	mov    0x8(%ebp),%eax
     572:	8d 65 f4             	lea    -0xc(%ebp),%esp
     575:	5b                   	pop    %ebx
     576:	5e                   	pop    %esi
     577:	5f                   	pop    %edi
     578:	5d                   	pop    %ebp
     579:	c3                   	ret    

0000057a <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     57a:	55                   	push   %ebp
     57b:	89 e5                	mov    %esp,%ebp
     57d:	57                   	push   %edi
     57e:	56                   	push   %esi
     57f:	53                   	push   %ebx
     580:	83 ec 30             	sub    $0x30,%esp
     583:	8b 75 08             	mov    0x8(%ebp),%esi
     586:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     589:	68 a4 10 00 00       	push   $0x10a4
     58e:	57                   	push   %edi
     58f:	56                   	push   %esi
     590:	e8 a9 fe ff ff       	call   43e <peek>
     595:	83 c4 10             	add    $0x10,%esp
     598:	85 c0                	test   %eax,%eax
     59a:	75 1d                	jne    5b9 <parseexec+0x3f>
     59c:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     59e:	e8 86 fc ff ff       	call   229 <execcmd>
     5a3:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     5a6:	83 ec 04             	sub    $0x4,%esp
     5a9:	57                   	push   %edi
     5aa:	56                   	push   %esi
     5ab:	50                   	push   %eax
     5ac:	e8 f9 fe ff ff       	call   4aa <parseredirs>
     5b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     5b4:	83 c4 10             	add    $0x10,%esp
     5b7:	eb 3b                	jmp    5f4 <parseexec+0x7a>
    return parseblock(ps, es);
     5b9:	83 ec 08             	sub    $0x8,%esp
     5bc:	57                   	push   %edi
     5bd:	56                   	push   %esi
     5be:	e8 8f 01 00 00       	call   752 <parseblock>
     5c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     5c6:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     5c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5cf:	5b                   	pop    %ebx
     5d0:	5e                   	pop    %esi
     5d1:	5f                   	pop    %edi
     5d2:	5d                   	pop    %ebp
     5d3:	c3                   	ret    
      panic("syntax");
     5d4:	83 ec 0c             	sub    $0xc,%esp
     5d7:	68 a6 10 00 00       	push   $0x10a6
     5dc:	e8 6a fa ff ff       	call   4b <panic>
    ret = parseredirs(ret, ps, es);
     5e1:	83 ec 04             	sub    $0x4,%esp
     5e4:	57                   	push   %edi
     5e5:	56                   	push   %esi
     5e6:	ff 75 d4             	push   -0x2c(%ebp)
     5e9:	e8 bc fe ff ff       	call   4aa <parseredirs>
     5ee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     5f1:	83 c4 10             	add    $0x10,%esp
  while(!peek(ps, es, "|)&;")){
     5f4:	83 ec 04             	sub    $0x4,%esp
     5f7:	68 bb 10 00 00       	push   $0x10bb
     5fc:	57                   	push   %edi
     5fd:	56                   	push   %esi
     5fe:	e8 3b fe ff ff       	call   43e <peek>
     603:	83 c4 10             	add    $0x10,%esp
     606:	85 c0                	test   %eax,%eax
     608:	75 41                	jne    64b <parseexec+0xd1>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     60a:	8d 45 e0             	lea    -0x20(%ebp),%eax
     60d:	50                   	push   %eax
     60e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     611:	50                   	push   %eax
     612:	57                   	push   %edi
     613:	56                   	push   %esi
     614:	e8 1e fd ff ff       	call   337 <gettoken>
     619:	83 c4 10             	add    $0x10,%esp
     61c:	85 c0                	test   %eax,%eax
     61e:	74 2b                	je     64b <parseexec+0xd1>
    if(tok != 'a')
     620:	83 f8 61             	cmp    $0x61,%eax
     623:	75 af                	jne    5d4 <parseexec+0x5a>
    cmd->argv[argc] = q;
     625:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     628:	8b 55 d0             	mov    -0x30(%ebp),%edx
     62b:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     62f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     632:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     636:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     639:	83 fb 09             	cmp    $0x9,%ebx
     63c:	7e a3                	jle    5e1 <parseexec+0x67>
      panic("too many args");
     63e:	83 ec 0c             	sub    $0xc,%esp
     641:	68 ad 10 00 00       	push   $0x10ad
     646:	e8 00 fa ff ff       	call   4b <panic>
  cmd->argv[argc] = 0;
     64b:	8b 45 d0             	mov    -0x30(%ebp),%eax
     64e:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     655:	00 
  cmd->eargv[argc] = 0;
     656:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     65d:	00 
  return ret;
     65e:	e9 66 ff ff ff       	jmp    5c9 <parseexec+0x4f>

00000663 <parsepipe>:
{
     663:	55                   	push   %ebp
     664:	89 e5                	mov    %esp,%ebp
     666:	57                   	push   %edi
     667:	56                   	push   %esi
     668:	53                   	push   %ebx
     669:	83 ec 14             	sub    $0x14,%esp
     66c:	8b 75 08             	mov    0x8(%ebp),%esi
     66f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     672:	57                   	push   %edi
     673:	56                   	push   %esi
     674:	e8 01 ff ff ff       	call   57a <parseexec>
     679:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     67b:	83 c4 0c             	add    $0xc,%esp
     67e:	68 c0 10 00 00       	push   $0x10c0
     683:	57                   	push   %edi
     684:	56                   	push   %esi
     685:	e8 b4 fd ff ff       	call   43e <peek>
     68a:	83 c4 10             	add    $0x10,%esp
     68d:	85 c0                	test   %eax,%eax
     68f:	75 0a                	jne    69b <parsepipe+0x38>
}
     691:	89 d8                	mov    %ebx,%eax
     693:	8d 65 f4             	lea    -0xc(%ebp),%esp
     696:	5b                   	pop    %ebx
     697:	5e                   	pop    %esi
     698:	5f                   	pop    %edi
     699:	5d                   	pop    %ebp
     69a:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     69b:	6a 00                	push   $0x0
     69d:	6a 00                	push   $0x0
     69f:	57                   	push   %edi
     6a0:	56                   	push   %esi
     6a1:	e8 91 fc ff ff       	call   337 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6a6:	83 c4 08             	add    $0x8,%esp
     6a9:	57                   	push   %edi
     6aa:	56                   	push   %esi
     6ab:	e8 b3 ff ff ff       	call   663 <parsepipe>
     6b0:	83 c4 08             	add    $0x8,%esp
     6b3:	50                   	push   %eax
     6b4:	53                   	push   %ebx
     6b5:	e8 e1 fb ff ff       	call   29b <pipecmd>
     6ba:	89 c3                	mov    %eax,%ebx
     6bc:	83 c4 10             	add    $0x10,%esp
  return cmd;
     6bf:	eb d0                	jmp    691 <parsepipe+0x2e>

000006c1 <parseline>:
{
     6c1:	55                   	push   %ebp
     6c2:	89 e5                	mov    %esp,%ebp
     6c4:	57                   	push   %edi
     6c5:	56                   	push   %esi
     6c6:	53                   	push   %ebx
     6c7:	83 ec 14             	sub    $0x14,%esp
     6ca:	8b 75 08             	mov    0x8(%ebp),%esi
     6cd:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     6d0:	57                   	push   %edi
     6d1:	56                   	push   %esi
     6d2:	e8 8c ff ff ff       	call   663 <parsepipe>
     6d7:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     6d9:	83 c4 10             	add    $0x10,%esp
     6dc:	eb 18                	jmp    6f6 <parseline+0x35>
    gettoken(ps, es, 0, 0);
     6de:	6a 00                	push   $0x0
     6e0:	6a 00                	push   $0x0
     6e2:	57                   	push   %edi
     6e3:	56                   	push   %esi
     6e4:	e8 4e fc ff ff       	call   337 <gettoken>
    cmd = backcmd(cmd);
     6e9:	89 1c 24             	mov    %ebx,(%esp)
     6ec:	e8 16 fc ff ff       	call   307 <backcmd>
     6f1:	89 c3                	mov    %eax,%ebx
     6f3:	83 c4 10             	add    $0x10,%esp
  while(peek(ps, es, "&")){
     6f6:	83 ec 04             	sub    $0x4,%esp
     6f9:	68 c2 10 00 00       	push   $0x10c2
     6fe:	57                   	push   %edi
     6ff:	56                   	push   %esi
     700:	e8 39 fd ff ff       	call   43e <peek>
     705:	83 c4 10             	add    $0x10,%esp
     708:	85 c0                	test   %eax,%eax
     70a:	75 d2                	jne    6de <parseline+0x1d>
  if(peek(ps, es, ";")){
     70c:	83 ec 04             	sub    $0x4,%esp
     70f:	68 be 10 00 00       	push   $0x10be
     714:	57                   	push   %edi
     715:	56                   	push   %esi
     716:	e8 23 fd ff ff       	call   43e <peek>
     71b:	83 c4 10             	add    $0x10,%esp
     71e:	85 c0                	test   %eax,%eax
     720:	75 0a                	jne    72c <parseline+0x6b>
}
     722:	89 d8                	mov    %ebx,%eax
     724:	8d 65 f4             	lea    -0xc(%ebp),%esp
     727:	5b                   	pop    %ebx
     728:	5e                   	pop    %esi
     729:	5f                   	pop    %edi
     72a:	5d                   	pop    %ebp
     72b:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     72c:	6a 00                	push   $0x0
     72e:	6a 00                	push   $0x0
     730:	57                   	push   %edi
     731:	56                   	push   %esi
     732:	e8 00 fc ff ff       	call   337 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     737:	83 c4 08             	add    $0x8,%esp
     73a:	57                   	push   %edi
     73b:	56                   	push   %esi
     73c:	e8 80 ff ff ff       	call   6c1 <parseline>
     741:	83 c4 08             	add    $0x8,%esp
     744:	50                   	push   %eax
     745:	53                   	push   %ebx
     746:	e8 86 fb ff ff       	call   2d1 <listcmd>
     74b:	89 c3                	mov    %eax,%ebx
     74d:	83 c4 10             	add    $0x10,%esp
  return cmd;
     750:	eb d0                	jmp    722 <parseline+0x61>

00000752 <parseblock>:
{
     752:	55                   	push   %ebp
     753:	89 e5                	mov    %esp,%ebp
     755:	57                   	push   %edi
     756:	56                   	push   %esi
     757:	53                   	push   %ebx
     758:	83 ec 10             	sub    $0x10,%esp
     75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     75e:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     761:	68 a4 10 00 00       	push   $0x10a4
     766:	56                   	push   %esi
     767:	53                   	push   %ebx
     768:	e8 d1 fc ff ff       	call   43e <peek>
     76d:	83 c4 10             	add    $0x10,%esp
     770:	85 c0                	test   %eax,%eax
     772:	74 4b                	je     7bf <parseblock+0x6d>
  gettoken(ps, es, 0, 0);
     774:	6a 00                	push   $0x0
     776:	6a 00                	push   $0x0
     778:	56                   	push   %esi
     779:	53                   	push   %ebx
     77a:	e8 b8 fb ff ff       	call   337 <gettoken>
  cmd = parseline(ps, es);
     77f:	83 c4 08             	add    $0x8,%esp
     782:	56                   	push   %esi
     783:	53                   	push   %ebx
     784:	e8 38 ff ff ff       	call   6c1 <parseline>
     789:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     78b:	83 c4 0c             	add    $0xc,%esp
     78e:	68 e0 10 00 00       	push   $0x10e0
     793:	56                   	push   %esi
     794:	53                   	push   %ebx
     795:	e8 a4 fc ff ff       	call   43e <peek>
     79a:	83 c4 10             	add    $0x10,%esp
     79d:	85 c0                	test   %eax,%eax
     79f:	74 2b                	je     7cc <parseblock+0x7a>
  gettoken(ps, es, 0, 0);
     7a1:	6a 00                	push   $0x0
     7a3:	6a 00                	push   $0x0
     7a5:	56                   	push   %esi
     7a6:	53                   	push   %ebx
     7a7:	e8 8b fb ff ff       	call   337 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     7ac:	83 c4 0c             	add    $0xc,%esp
     7af:	56                   	push   %esi
     7b0:	53                   	push   %ebx
     7b1:	57                   	push   %edi
     7b2:	e8 f3 fc ff ff       	call   4aa <parseredirs>
}
     7b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7ba:	5b                   	pop    %ebx
     7bb:	5e                   	pop    %esi
     7bc:	5f                   	pop    %edi
     7bd:	5d                   	pop    %ebp
     7be:	c3                   	ret    
    panic("parseblock");
     7bf:	83 ec 0c             	sub    $0xc,%esp
     7c2:	68 c4 10 00 00       	push   $0x10c4
     7c7:	e8 7f f8 ff ff       	call   4b <panic>
    panic("syntax - missing )");
     7cc:	83 ec 0c             	sub    $0xc,%esp
     7cf:	68 cf 10 00 00       	push   $0x10cf
     7d4:	e8 72 f8 ff ff       	call   4b <panic>

000007d9 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     7d9:	55                   	push   %ebp
     7da:	89 e5                	mov    %esp,%ebp
     7dc:	53                   	push   %ebx
     7dd:	83 ec 04             	sub    $0x4,%esp
     7e0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     7e3:	85 db                	test   %ebx,%ebx
     7e5:	74 1f                	je     806 <nulterminate+0x2d>
    return 0;

  switch(cmd->type){
     7e7:	8b 03                	mov    (%ebx),%eax
     7e9:	83 f8 05             	cmp    $0x5,%eax
     7ec:	77 18                	ja     806 <nulterminate+0x2d>
     7ee:	ff 24 85 20 11 00 00 	jmp    *0x1120(,%eax,4)
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
     7f5:	8b 54 83 2c          	mov    0x2c(%ebx,%eax,4),%edx
     7f9:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     7fc:	83 c0 01             	add    $0x1,%eax
     7ff:	83 7c 83 04 00       	cmpl   $0x0,0x4(%ebx,%eax,4)
     804:	75 ef                	jne    7f5 <nulterminate+0x1c>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     806:	89 d8                	mov    %ebx,%eax
     808:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     80b:	c9                   	leave  
     80c:	c3                   	ret    
  switch(cmd->type){
     80d:	b8 00 00 00 00       	mov    $0x0,%eax
     812:	eb eb                	jmp    7ff <nulterminate+0x26>
    nulterminate(rcmd->cmd);
     814:	83 ec 0c             	sub    $0xc,%esp
     817:	ff 73 04             	push   0x4(%ebx)
     81a:	e8 ba ff ff ff       	call   7d9 <nulterminate>
    *rcmd->efile = 0;
     81f:	8b 43 0c             	mov    0xc(%ebx),%eax
     822:	c6 00 00             	movb   $0x0,(%eax)
    break;
     825:	83 c4 10             	add    $0x10,%esp
     828:	eb dc                	jmp    806 <nulterminate+0x2d>
    nulterminate(pcmd->left);
     82a:	83 ec 0c             	sub    $0xc,%esp
     82d:	ff 73 04             	push   0x4(%ebx)
     830:	e8 a4 ff ff ff       	call   7d9 <nulterminate>
    nulterminate(pcmd->right);
     835:	83 c4 04             	add    $0x4,%esp
     838:	ff 73 08             	push   0x8(%ebx)
     83b:	e8 99 ff ff ff       	call   7d9 <nulterminate>
    break;
     840:	83 c4 10             	add    $0x10,%esp
     843:	eb c1                	jmp    806 <nulterminate+0x2d>
    nulterminate(lcmd->left);
     845:	83 ec 0c             	sub    $0xc,%esp
     848:	ff 73 04             	push   0x4(%ebx)
     84b:	e8 89 ff ff ff       	call   7d9 <nulterminate>
    nulterminate(lcmd->right);
     850:	83 c4 04             	add    $0x4,%esp
     853:	ff 73 08             	push   0x8(%ebx)
     856:	e8 7e ff ff ff       	call   7d9 <nulterminate>
    break;
     85b:	83 c4 10             	add    $0x10,%esp
     85e:	eb a6                	jmp    806 <nulterminate+0x2d>
    nulterminate(bcmd->cmd);
     860:	83 ec 0c             	sub    $0xc,%esp
     863:	ff 73 04             	push   0x4(%ebx)
     866:	e8 6e ff ff ff       	call   7d9 <nulterminate>
    break;
     86b:	83 c4 10             	add    $0x10,%esp
     86e:	eb 96                	jmp    806 <nulterminate+0x2d>

00000870 <parsecmd>:
{
     870:	55                   	push   %ebp
     871:	89 e5                	mov    %esp,%ebp
     873:	56                   	push   %esi
     874:	53                   	push   %ebx
  es = s + strlen(s);
     875:	8b 5d 08             	mov    0x8(%ebp),%ebx
     878:	83 ec 0c             	sub    $0xc,%esp
     87b:	53                   	push   %ebx
     87c:	e8 7a 02 00 00       	call   afb <strlen>
     881:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     883:	83 c4 08             	add    $0x8,%esp
     886:	53                   	push   %ebx
     887:	8d 45 08             	lea    0x8(%ebp),%eax
     88a:	50                   	push   %eax
     88b:	e8 31 fe ff ff       	call   6c1 <parseline>
     890:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     892:	83 c4 0c             	add    $0xc,%esp
     895:	68 6e 10 00 00       	push   $0x106e
     89a:	53                   	push   %ebx
     89b:	8d 45 08             	lea    0x8(%ebp),%eax
     89e:	50                   	push   %eax
     89f:	e8 9a fb ff ff       	call   43e <peek>
  if(s != es){
     8a4:	8b 45 08             	mov    0x8(%ebp),%eax
     8a7:	83 c4 10             	add    $0x10,%esp
     8aa:	39 d8                	cmp    %ebx,%eax
     8ac:	75 12                	jne    8c0 <parsecmd+0x50>
  nulterminate(cmd);
     8ae:	83 ec 0c             	sub    $0xc,%esp
     8b1:	56                   	push   %esi
     8b2:	e8 22 ff ff ff       	call   7d9 <nulterminate>
}
     8b7:	89 f0                	mov    %esi,%eax
     8b9:	8d 65 f8             	lea    -0x8(%ebp),%esp
     8bc:	5b                   	pop    %ebx
     8bd:	5e                   	pop    %esi
     8be:	5d                   	pop    %ebp
     8bf:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     8c0:	83 ec 04             	sub    $0x4,%esp
     8c3:	50                   	push   %eax
     8c4:	68 e2 10 00 00       	push   $0x10e2
     8c9:	6a 02                	push   $0x2
     8cb:	e8 d3 04 00 00       	call   da3 <printf>
    panic("syntax");
     8d0:	c7 04 24 a6 10 00 00 	movl   $0x10a6,(%esp)
     8d7:	e8 6f f7 ff ff       	call   4b <panic>

000008dc <main>:
{
     8dc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     8e0:	83 e4 f0             	and    $0xfffffff0,%esp
     8e3:	ff 71 fc             	push   -0x4(%ecx)
     8e6:	55                   	push   %ebp
     8e7:	89 e5                	mov    %esp,%ebp
     8e9:	51                   	push   %ecx
     8ea:	83 ec 04             	sub    $0x4,%esp
  while((fd = open("console", O_RDWR)) >= 0){
     8ed:	83 ec 08             	sub    $0x8,%esp
     8f0:	6a 02                	push   $0x2
     8f2:	68 f1 10 00 00       	push   $0x10f1
     8f7:	e8 92 03 00 00       	call   c8e <open>
     8fc:	83 c4 10             	add    $0x10,%esp
     8ff:	85 c0                	test   %eax,%eax
     901:	78 21                	js     924 <main+0x48>
    if(fd >= 3){
     903:	83 f8 02             	cmp    $0x2,%eax
     906:	7e e5                	jle    8ed <main+0x11>
      close(fd);
     908:	83 ec 0c             	sub    $0xc,%esp
     90b:	50                   	push   %eax
     90c:	e8 65 03 00 00       	call   c76 <close>
      break;
     911:	83 c4 10             	add    $0x10,%esp
     914:	eb 0e                	jmp    924 <main+0x48>
    if(fork1() == 0)
     916:	e8 4a f7 ff ff       	call   65 <fork1>
     91b:	85 c0                	test   %eax,%eax
     91d:	74 76                	je     995 <main+0xb9>
    wait();
     91f:	e8 32 03 00 00       	call   c56 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     924:	83 ec 08             	sub    $0x8,%esp
     927:	6a 64                	push   $0x64
     929:	68 00 18 00 00       	push   $0x1800
     92e:	e8 cd f6 ff ff       	call   0 <getcmd>
     933:	83 c4 10             	add    $0x10,%esp
     936:	85 c0                	test   %eax,%eax
     938:	78 70                	js     9aa <main+0xce>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     93a:	80 3d 00 18 00 00 63 	cmpb   $0x63,0x1800
     941:	75 d3                	jne    916 <main+0x3a>
     943:	80 3d 01 18 00 00 64 	cmpb   $0x64,0x1801
     94a:	75 ca                	jne    916 <main+0x3a>
     94c:	80 3d 02 18 00 00 20 	cmpb   $0x20,0x1802
     953:	75 c1                	jne    916 <main+0x3a>
      buf[strlen(buf)-1] = 0;  // chop \n
     955:	83 ec 0c             	sub    $0xc,%esp
     958:	68 00 18 00 00       	push   $0x1800
     95d:	e8 99 01 00 00       	call   afb <strlen>
     962:	c6 80 ff 17 00 00 00 	movb   $0x0,0x17ff(%eax)
      if(chdir(buf+3) < 0)
     969:	c7 04 24 03 18 00 00 	movl   $0x1803,(%esp)
     970:	e8 49 03 00 00       	call   cbe <chdir>
     975:	83 c4 10             	add    $0x10,%esp
     978:	85 c0                	test   %eax,%eax
     97a:	79 a8                	jns    924 <main+0x48>
        printf(2, "cannot cd %s\n", buf+3);
     97c:	83 ec 04             	sub    $0x4,%esp
     97f:	68 03 18 00 00       	push   $0x1803
     984:	68 f9 10 00 00       	push   $0x10f9
     989:	6a 02                	push   $0x2
     98b:	e8 13 04 00 00       	call   da3 <printf>
     990:	83 c4 10             	add    $0x10,%esp
      continue;
     993:	eb 8f                	jmp    924 <main+0x48>
      runcmd(parsecmd(buf));
     995:	83 ec 0c             	sub    $0xc,%esp
     998:	68 00 18 00 00       	push   $0x1800
     99d:	e8 ce fe ff ff       	call   870 <parsecmd>
     9a2:	89 04 24             	mov    %eax,(%esp)
     9a5:	e8 da f6 ff ff       	call   84 <runcmd>
  exit();
     9aa:	e8 9f 02 00 00       	call   c4e <exit>

000009af <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
     9af:	55                   	push   %ebp
     9b0:	89 e5                	mov    %esp,%ebp
     9b2:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
     9b5:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
     9b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     9ba:	89 08                	mov    %ecx,(%eax)
  return old;
}
     9bc:	89 d0                	mov    %edx,%eax
     9be:	5d                   	pop    %ebp
     9bf:	c3                   	ret    

000009c0 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	53                   	push   %ebx
     9c4:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
     9c7:	68 00 20 00 00       	push   $0x2000
     9cc:	e8 f8 05 00 00       	call   fc9 <malloc>
  if(n_stack == 0){
     9d1:	83 c4 10             	add    $0x10,%esp
     9d4:	85 c0                	test   %eax,%eax
     9d6:	74 41                	je     a19 <thread_create+0x59>
     9d8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
     9da:	50                   	push   %eax
     9db:	ff 75 10             	push   0x10(%ebp)
     9de:	ff 75 0c             	push   0xc(%ebp)
     9e1:	ff 75 08             	push   0x8(%ebp)
     9e4:	e8 05 03 00 00       	call   cee <clone>

  for(int i=0; i<64; i++){
     9e9:	83 c4 10             	add    $0x10,%esp
     9ec:	ba 00 00 00 00       	mov    $0x0,%edx
     9f1:	eb 03                	jmp    9f6 <thread_create+0x36>
     9f3:	83 c2 01             	add    $0x1,%edx
     9f6:	83 fa 3f             	cmp    $0x3f,%edx
     9f9:	7f 19                	jg     a14 <thread_create+0x54>
    if(threads[i]->flag==0){
     9fb:	8b 0c 95 80 18 00 00 	mov    0x1880(,%edx,4),%ecx
     a02:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
     a06:	75 eb                	jne    9f3 <thread_create+0x33>
      threads[i]->maddr = n_stack;
     a08:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
     a0a:	8b 14 95 80 18 00 00 	mov    0x1880(,%edx,4),%edx
     a11:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
     a14:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a17:	c9                   	leave  
     a18:	c3                   	ret    
    return -1;
     a19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     a1e:	eb f4                	jmp    a14 <thread_create+0x54>

00000a20 <thread_join>:

//TODO: fix
int thread_join() {
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	56                   	push   %esi
     a24:	53                   	push   %ebx
     a25:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
     a28:	8d 45 f4             	lea    -0xc(%ebp),%eax
     a2b:	50                   	push   %eax
     a2c:	e8 c5 02 00 00       	call   cf6 <join>
     a31:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
     a33:	83 c4 10             	add    $0x10,%esp
     a36:	bb 00 00 00 00       	mov    $0x0,%ebx
     a3b:	eb 03                	jmp    a40 <thread_join+0x20>
     a3d:	83 c3 01             	add    $0x1,%ebx
     a40:	83 fb 3f             	cmp    $0x3f,%ebx
     a43:	7f 23                	jg     a68 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
     a45:	8b 04 9d 80 18 00 00 	mov    0x1880(,%ebx,4),%eax
     a4c:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
     a50:	75 eb                	jne    a3d <thread_join+0x1d>
     a52:	8b 55 f4             	mov    -0xc(%ebp),%edx
     a55:	39 50 04             	cmp    %edx,0x4(%eax)
     a58:	75 e3                	jne    a3d <thread_join+0x1d>
      free(stk_addr);
     a5a:	83 ec 0c             	sub    $0xc,%esp
     a5d:	52                   	push   %edx
     a5e:	e8 a6 04 00 00       	call   f09 <free>
     a63:	83 c4 10             	add    $0x10,%esp
     a66:	eb d5                	jmp    a3d <thread_join+0x1d>
    }
  }
  return pid;
}
     a68:	89 f0                	mov    %esi,%eax
     a6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     a6d:	5b                   	pop    %ebx
     a6e:	5e                   	pop    %esi
     a6f:	5d                   	pop    %ebp
     a70:	c3                   	ret    

00000a71 <lock_acquire>:

void lock_acquire(lock_t *lock){
     a71:	55                   	push   %ebp
     a72:	89 e5                	mov    %esp,%ebp
     a74:	53                   	push   %ebx
     a75:	83 ec 04             	sub    $0x4,%esp
     a78:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
     a7b:	83 ec 08             	sub    $0x8,%esp
     a7e:	6a 01                	push   $0x1
     a80:	53                   	push   %ebx
     a81:	e8 29 ff ff ff       	call   9af <test_and_set>
     a86:	83 c4 10             	add    $0x10,%esp
     a89:	83 f8 01             	cmp    $0x1,%eax
     a8c:	74 ed                	je     a7b <lock_acquire+0xa>
    ;
}
     a8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a91:	c9                   	leave  
     a92:	c3                   	ret    

00000a93 <lock_release>:

void lock_release(lock_t *lock) {
     a93:	55                   	push   %ebp
     a94:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
     a96:	8b 45 08             	mov    0x8(%ebp),%eax
     a99:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     a9f:	5d                   	pop    %ebp
     aa0:	c3                   	ret    

00000aa1 <lock_init>:

void lock_init(lock_t *lock) {
     aa1:	55                   	push   %ebp
     aa2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
     aa4:	8b 45 08             	mov    0x8(%ebp),%eax
     aa7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     aad:	5d                   	pop    %ebp
     aae:	c3                   	ret    

00000aaf <strcpy>:

char*
strcpy(char *s, const char *t)
{
     aaf:	55                   	push   %ebp
     ab0:	89 e5                	mov    %esp,%ebp
     ab2:	56                   	push   %esi
     ab3:	53                   	push   %ebx
     ab4:	8b 75 08             	mov    0x8(%ebp),%esi
     ab7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     aba:	89 f0                	mov    %esi,%eax
     abc:	89 d1                	mov    %edx,%ecx
     abe:	83 c2 01             	add    $0x1,%edx
     ac1:	89 c3                	mov    %eax,%ebx
     ac3:	83 c0 01             	add    $0x1,%eax
     ac6:	0f b6 09             	movzbl (%ecx),%ecx
     ac9:	88 0b                	mov    %cl,(%ebx)
     acb:	84 c9                	test   %cl,%cl
     acd:	75 ed                	jne    abc <strcpy+0xd>
    ;
  return os;
}
     acf:	89 f0                	mov    %esi,%eax
     ad1:	5b                   	pop    %ebx
     ad2:	5e                   	pop    %esi
     ad3:	5d                   	pop    %ebp
     ad4:	c3                   	ret    

00000ad5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ad5:	55                   	push   %ebp
     ad6:	89 e5                	mov    %esp,%ebp
     ad8:	8b 4d 08             	mov    0x8(%ebp),%ecx
     adb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     ade:	eb 06                	jmp    ae6 <strcmp+0x11>
    p++, q++;
     ae0:	83 c1 01             	add    $0x1,%ecx
     ae3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     ae6:	0f b6 01             	movzbl (%ecx),%eax
     ae9:	84 c0                	test   %al,%al
     aeb:	74 04                	je     af1 <strcmp+0x1c>
     aed:	3a 02                	cmp    (%edx),%al
     aef:	74 ef                	je     ae0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
     af1:	0f b6 c0             	movzbl %al,%eax
     af4:	0f b6 12             	movzbl (%edx),%edx
     af7:	29 d0                	sub    %edx,%eax
}
     af9:	5d                   	pop    %ebp
     afa:	c3                   	ret    

00000afb <strlen>:

uint
strlen(const char *s)
{
     afb:	55                   	push   %ebp
     afc:	89 e5                	mov    %esp,%ebp
     afe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b01:	b8 00 00 00 00       	mov    $0x0,%eax
     b06:	eb 03                	jmp    b0b <strlen+0x10>
     b08:	83 c0 01             	add    $0x1,%eax
     b0b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
     b0f:	75 f7                	jne    b08 <strlen+0xd>
    ;
  return n;
}
     b11:	5d                   	pop    %ebp
     b12:	c3                   	ret    

00000b13 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b13:	55                   	push   %ebp
     b14:	89 e5                	mov    %esp,%ebp
     b16:	57                   	push   %edi
     b17:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b1a:	89 d7                	mov    %edx,%edi
     b1c:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b1f:	8b 45 0c             	mov    0xc(%ebp),%eax
     b22:	fc                   	cld    
     b23:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b25:	89 d0                	mov    %edx,%eax
     b27:	8b 7d fc             	mov    -0x4(%ebp),%edi
     b2a:	c9                   	leave  
     b2b:	c3                   	ret    

00000b2c <strchr>:

char*
strchr(const char *s, char c)
{
     b2c:	55                   	push   %ebp
     b2d:	89 e5                	mov    %esp,%ebp
     b2f:	8b 45 08             	mov    0x8(%ebp),%eax
     b32:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     b36:	eb 03                	jmp    b3b <strchr+0xf>
     b38:	83 c0 01             	add    $0x1,%eax
     b3b:	0f b6 10             	movzbl (%eax),%edx
     b3e:	84 d2                	test   %dl,%dl
     b40:	74 06                	je     b48 <strchr+0x1c>
    if(*s == c)
     b42:	38 ca                	cmp    %cl,%dl
     b44:	75 f2                	jne    b38 <strchr+0xc>
     b46:	eb 05                	jmp    b4d <strchr+0x21>
      return (char*)s;
  return 0;
     b48:	b8 00 00 00 00       	mov    $0x0,%eax
}
     b4d:	5d                   	pop    %ebp
     b4e:	c3                   	ret    

00000b4f <gets>:

char*
gets(char *buf, int max)
{
     b4f:	55                   	push   %ebp
     b50:	89 e5                	mov    %esp,%ebp
     b52:	57                   	push   %edi
     b53:	56                   	push   %esi
     b54:	53                   	push   %ebx
     b55:	83 ec 1c             	sub    $0x1c,%esp
     b58:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b5b:	bb 00 00 00 00       	mov    $0x0,%ebx
     b60:	89 de                	mov    %ebx,%esi
     b62:	83 c3 01             	add    $0x1,%ebx
     b65:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b68:	7d 2e                	jge    b98 <gets+0x49>
    cc = read(0, &c, 1);
     b6a:	83 ec 04             	sub    $0x4,%esp
     b6d:	6a 01                	push   $0x1
     b6f:	8d 45 e7             	lea    -0x19(%ebp),%eax
     b72:	50                   	push   %eax
     b73:	6a 00                	push   $0x0
     b75:	e8 ec 00 00 00       	call   c66 <read>
    if(cc < 1)
     b7a:	83 c4 10             	add    $0x10,%esp
     b7d:	85 c0                	test   %eax,%eax
     b7f:	7e 17                	jle    b98 <gets+0x49>
      break;
    buf[i++] = c;
     b81:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b85:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
     b88:	3c 0a                	cmp    $0xa,%al
     b8a:	0f 94 c2             	sete   %dl
     b8d:	3c 0d                	cmp    $0xd,%al
     b8f:	0f 94 c0             	sete   %al
     b92:	08 c2                	or     %al,%dl
     b94:	74 ca                	je     b60 <gets+0x11>
    buf[i++] = c;
     b96:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     b98:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     b9c:	89 f8                	mov    %edi,%eax
     b9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba1:	5b                   	pop    %ebx
     ba2:	5e                   	pop    %esi
     ba3:	5f                   	pop    %edi
     ba4:	5d                   	pop    %ebp
     ba5:	c3                   	ret    

00000ba6 <stat>:

int
stat(const char *n, struct stat *st)
{
     ba6:	55                   	push   %ebp
     ba7:	89 e5                	mov    %esp,%ebp
     ba9:	56                   	push   %esi
     baa:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     bab:	83 ec 08             	sub    $0x8,%esp
     bae:	6a 00                	push   $0x0
     bb0:	ff 75 08             	push   0x8(%ebp)
     bb3:	e8 d6 00 00 00       	call   c8e <open>
  if(fd < 0)
     bb8:	83 c4 10             	add    $0x10,%esp
     bbb:	85 c0                	test   %eax,%eax
     bbd:	78 24                	js     be3 <stat+0x3d>
     bbf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     bc1:	83 ec 08             	sub    $0x8,%esp
     bc4:	ff 75 0c             	push   0xc(%ebp)
     bc7:	50                   	push   %eax
     bc8:	e8 d9 00 00 00       	call   ca6 <fstat>
     bcd:	89 c6                	mov    %eax,%esi
  close(fd);
     bcf:	89 1c 24             	mov    %ebx,(%esp)
     bd2:	e8 9f 00 00 00       	call   c76 <close>
  return r;
     bd7:	83 c4 10             	add    $0x10,%esp
}
     bda:	89 f0                	mov    %esi,%eax
     bdc:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bdf:	5b                   	pop    %ebx
     be0:	5e                   	pop    %esi
     be1:	5d                   	pop    %ebp
     be2:	c3                   	ret    
    return -1;
     be3:	be ff ff ff ff       	mov    $0xffffffff,%esi
     be8:	eb f0                	jmp    bda <stat+0x34>

00000bea <atoi>:

int
atoi(const char *s)
{
     bea:	55                   	push   %ebp
     beb:	89 e5                	mov    %esp,%ebp
     bed:	53                   	push   %ebx
     bee:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
     bf1:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
     bf6:	eb 10                	jmp    c08 <atoi+0x1e>
    n = n*10 + *s++ - '0';
     bf8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
     bfb:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
     bfe:	83 c1 01             	add    $0x1,%ecx
     c01:	0f be c0             	movsbl %al,%eax
     c04:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
     c08:	0f b6 01             	movzbl (%ecx),%eax
     c0b:	8d 58 d0             	lea    -0x30(%eax),%ebx
     c0e:	80 fb 09             	cmp    $0x9,%bl
     c11:	76 e5                	jbe    bf8 <atoi+0xe>
  return n;
}
     c13:	89 d0                	mov    %edx,%eax
     c15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c18:	c9                   	leave  
     c19:	c3                   	ret    

00000c1a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     c1a:	55                   	push   %ebp
     c1b:	89 e5                	mov    %esp,%ebp
     c1d:	56                   	push   %esi
     c1e:	53                   	push   %ebx
     c1f:	8b 75 08             	mov    0x8(%ebp),%esi
     c22:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     c25:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
     c28:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
     c2a:	eb 0d                	jmp    c39 <memmove+0x1f>
    *dst++ = *src++;
     c2c:	0f b6 01             	movzbl (%ecx),%eax
     c2f:	88 02                	mov    %al,(%edx)
     c31:	8d 49 01             	lea    0x1(%ecx),%ecx
     c34:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
     c37:	89 d8                	mov    %ebx,%eax
     c39:	8d 58 ff             	lea    -0x1(%eax),%ebx
     c3c:	85 c0                	test   %eax,%eax
     c3e:	7f ec                	jg     c2c <memmove+0x12>
  return vdst;
}
     c40:	89 f0                	mov    %esi,%eax
     c42:	5b                   	pop    %ebx
     c43:	5e                   	pop    %esi
     c44:	5d                   	pop    %ebp
     c45:	c3                   	ret    

00000c46 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     c46:	b8 01 00 00 00       	mov    $0x1,%eax
     c4b:	cd 40                	int    $0x40
     c4d:	c3                   	ret    

00000c4e <exit>:
SYSCALL(exit)
     c4e:	b8 02 00 00 00       	mov    $0x2,%eax
     c53:	cd 40                	int    $0x40
     c55:	c3                   	ret    

00000c56 <wait>:
SYSCALL(wait)
     c56:	b8 03 00 00 00       	mov    $0x3,%eax
     c5b:	cd 40                	int    $0x40
     c5d:	c3                   	ret    

00000c5e <pipe>:
SYSCALL(pipe)
     c5e:	b8 04 00 00 00       	mov    $0x4,%eax
     c63:	cd 40                	int    $0x40
     c65:	c3                   	ret    

00000c66 <read>:
SYSCALL(read)
     c66:	b8 05 00 00 00       	mov    $0x5,%eax
     c6b:	cd 40                	int    $0x40
     c6d:	c3                   	ret    

00000c6e <write>:
SYSCALL(write)
     c6e:	b8 10 00 00 00       	mov    $0x10,%eax
     c73:	cd 40                	int    $0x40
     c75:	c3                   	ret    

00000c76 <close>:
SYSCALL(close)
     c76:	b8 15 00 00 00       	mov    $0x15,%eax
     c7b:	cd 40                	int    $0x40
     c7d:	c3                   	ret    

00000c7e <kill>:
SYSCALL(kill)
     c7e:	b8 06 00 00 00       	mov    $0x6,%eax
     c83:	cd 40                	int    $0x40
     c85:	c3                   	ret    

00000c86 <exec>:
SYSCALL(exec)
     c86:	b8 07 00 00 00       	mov    $0x7,%eax
     c8b:	cd 40                	int    $0x40
     c8d:	c3                   	ret    

00000c8e <open>:
SYSCALL(open)
     c8e:	b8 0f 00 00 00       	mov    $0xf,%eax
     c93:	cd 40                	int    $0x40
     c95:	c3                   	ret    

00000c96 <mknod>:
SYSCALL(mknod)
     c96:	b8 11 00 00 00       	mov    $0x11,%eax
     c9b:	cd 40                	int    $0x40
     c9d:	c3                   	ret    

00000c9e <unlink>:
SYSCALL(unlink)
     c9e:	b8 12 00 00 00       	mov    $0x12,%eax
     ca3:	cd 40                	int    $0x40
     ca5:	c3                   	ret    

00000ca6 <fstat>:
SYSCALL(fstat)
     ca6:	b8 08 00 00 00       	mov    $0x8,%eax
     cab:	cd 40                	int    $0x40
     cad:	c3                   	ret    

00000cae <link>:
SYSCALL(link)
     cae:	b8 13 00 00 00       	mov    $0x13,%eax
     cb3:	cd 40                	int    $0x40
     cb5:	c3                   	ret    

00000cb6 <mkdir>:
SYSCALL(mkdir)
     cb6:	b8 14 00 00 00       	mov    $0x14,%eax
     cbb:	cd 40                	int    $0x40
     cbd:	c3                   	ret    

00000cbe <chdir>:
SYSCALL(chdir)
     cbe:	b8 09 00 00 00       	mov    $0x9,%eax
     cc3:	cd 40                	int    $0x40
     cc5:	c3                   	ret    

00000cc6 <dup>:
SYSCALL(dup)
     cc6:	b8 0a 00 00 00       	mov    $0xa,%eax
     ccb:	cd 40                	int    $0x40
     ccd:	c3                   	ret    

00000cce <getpid>:
SYSCALL(getpid)
     cce:	b8 0b 00 00 00       	mov    $0xb,%eax
     cd3:	cd 40                	int    $0x40
     cd5:	c3                   	ret    

00000cd6 <sbrk>:
SYSCALL(sbrk)
     cd6:	b8 0c 00 00 00       	mov    $0xc,%eax
     cdb:	cd 40                	int    $0x40
     cdd:	c3                   	ret    

00000cde <sleep>:
SYSCALL(sleep)
     cde:	b8 0d 00 00 00       	mov    $0xd,%eax
     ce3:	cd 40                	int    $0x40
     ce5:	c3                   	ret    

00000ce6 <uptime>:
SYSCALL(uptime)
     ce6:	b8 0e 00 00 00       	mov    $0xe,%eax
     ceb:	cd 40                	int    $0x40
     ced:	c3                   	ret    

00000cee <clone>:
SYSCALL(clone)
     cee:	b8 16 00 00 00       	mov    $0x16,%eax
     cf3:	cd 40                	int    $0x40
     cf5:	c3                   	ret    

00000cf6 <join>:
     cf6:	b8 17 00 00 00       	mov    $0x17,%eax
     cfb:	cd 40                	int    $0x40
     cfd:	c3                   	ret    

00000cfe <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     cfe:	55                   	push   %ebp
     cff:	89 e5                	mov    %esp,%ebp
     d01:	83 ec 1c             	sub    $0x1c,%esp
     d04:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
     d07:	6a 01                	push   $0x1
     d09:	8d 55 f4             	lea    -0xc(%ebp),%edx
     d0c:	52                   	push   %edx
     d0d:	50                   	push   %eax
     d0e:	e8 5b ff ff ff       	call   c6e <write>
}
     d13:	83 c4 10             	add    $0x10,%esp
     d16:	c9                   	leave  
     d17:	c3                   	ret    

00000d18 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     d18:	55                   	push   %ebp
     d19:	89 e5                	mov    %esp,%ebp
     d1b:	57                   	push   %edi
     d1c:	56                   	push   %esi
     d1d:	53                   	push   %ebx
     d1e:	83 ec 2c             	sub    $0x2c,%esp
     d21:	89 45 d0             	mov    %eax,-0x30(%ebp)
     d24:	89 d0                	mov    %edx,%eax
     d26:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     d28:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     d2c:	0f 95 c1             	setne  %cl
     d2f:	c1 ea 1f             	shr    $0x1f,%edx
     d32:	84 d1                	test   %dl,%cl
     d34:	74 44                	je     d7a <printint+0x62>
    neg = 1;
    x = -xx;
     d36:	f7 d8                	neg    %eax
     d38:	89 c1                	mov    %eax,%ecx
    neg = 1;
     d3a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     d41:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
     d46:	89 c8                	mov    %ecx,%eax
     d48:	ba 00 00 00 00       	mov    $0x0,%edx
     d4d:	f7 f6                	div    %esi
     d4f:	89 df                	mov    %ebx,%edi
     d51:	83 c3 01             	add    $0x1,%ebx
     d54:	0f b6 92 98 11 00 00 	movzbl 0x1198(%edx),%edx
     d5b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
     d5f:	89 ca                	mov    %ecx,%edx
     d61:	89 c1                	mov    %eax,%ecx
     d63:	39 d6                	cmp    %edx,%esi
     d65:	76 df                	jbe    d46 <printint+0x2e>
  if(neg)
     d67:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
     d6b:	74 31                	je     d9e <printint+0x86>
    buf[i++] = '-';
     d6d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
     d72:	8d 5f 02             	lea    0x2(%edi),%ebx
     d75:	8b 75 d0             	mov    -0x30(%ebp),%esi
     d78:	eb 17                	jmp    d91 <printint+0x79>
    x = xx;
     d7a:	89 c1                	mov    %eax,%ecx
  neg = 0;
     d7c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     d83:	eb bc                	jmp    d41 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
     d85:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
     d8a:	89 f0                	mov    %esi,%eax
     d8c:	e8 6d ff ff ff       	call   cfe <putc>
  while(--i >= 0)
     d91:	83 eb 01             	sub    $0x1,%ebx
     d94:	79 ef                	jns    d85 <printint+0x6d>
}
     d96:	83 c4 2c             	add    $0x2c,%esp
     d99:	5b                   	pop    %ebx
     d9a:	5e                   	pop    %esi
     d9b:	5f                   	pop    %edi
     d9c:	5d                   	pop    %ebp
     d9d:	c3                   	ret    
     d9e:	8b 75 d0             	mov    -0x30(%ebp),%esi
     da1:	eb ee                	jmp    d91 <printint+0x79>

00000da3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     da3:	55                   	push   %ebp
     da4:	89 e5                	mov    %esp,%ebp
     da6:	57                   	push   %edi
     da7:	56                   	push   %esi
     da8:	53                   	push   %ebx
     da9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     dac:	8d 45 10             	lea    0x10(%ebp),%eax
     daf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
     db2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
     db7:	bb 00 00 00 00       	mov    $0x0,%ebx
     dbc:	eb 14                	jmp    dd2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
     dbe:	89 fa                	mov    %edi,%edx
     dc0:	8b 45 08             	mov    0x8(%ebp),%eax
     dc3:	e8 36 ff ff ff       	call   cfe <putc>
     dc8:	eb 05                	jmp    dcf <printf+0x2c>
      }
    } else if(state == '%'){
     dca:	83 fe 25             	cmp    $0x25,%esi
     dcd:	74 25                	je     df4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
     dcf:	83 c3 01             	add    $0x1,%ebx
     dd2:	8b 45 0c             	mov    0xc(%ebp),%eax
     dd5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
     dd9:	84 c0                	test   %al,%al
     ddb:	0f 84 20 01 00 00    	je     f01 <printf+0x15e>
    c = fmt[i] & 0xff;
     de1:	0f be f8             	movsbl %al,%edi
     de4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
     de7:	85 f6                	test   %esi,%esi
     de9:	75 df                	jne    dca <printf+0x27>
      if(c == '%'){
     deb:	83 f8 25             	cmp    $0x25,%eax
     dee:	75 ce                	jne    dbe <printf+0x1b>
        state = '%';
     df0:	89 c6                	mov    %eax,%esi
     df2:	eb db                	jmp    dcf <printf+0x2c>
      if(c == 'd'){
     df4:	83 f8 25             	cmp    $0x25,%eax
     df7:	0f 84 cf 00 00 00    	je     ecc <printf+0x129>
     dfd:	0f 8c dd 00 00 00    	jl     ee0 <printf+0x13d>
     e03:	83 f8 78             	cmp    $0x78,%eax
     e06:	0f 8f d4 00 00 00    	jg     ee0 <printf+0x13d>
     e0c:	83 f8 63             	cmp    $0x63,%eax
     e0f:	0f 8c cb 00 00 00    	jl     ee0 <printf+0x13d>
     e15:	83 e8 63             	sub    $0x63,%eax
     e18:	83 f8 15             	cmp    $0x15,%eax
     e1b:	0f 87 bf 00 00 00    	ja     ee0 <printf+0x13d>
     e21:	ff 24 85 40 11 00 00 	jmp    *0x1140(,%eax,4)
        printint(fd, *ap, 10, 1);
     e28:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     e2b:	8b 17                	mov    (%edi),%edx
     e2d:	83 ec 0c             	sub    $0xc,%esp
     e30:	6a 01                	push   $0x1
     e32:	b9 0a 00 00 00       	mov    $0xa,%ecx
     e37:	8b 45 08             	mov    0x8(%ebp),%eax
     e3a:	e8 d9 fe ff ff       	call   d18 <printint>
        ap++;
     e3f:	83 c7 04             	add    $0x4,%edi
     e42:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     e45:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     e48:	be 00 00 00 00       	mov    $0x0,%esi
     e4d:	eb 80                	jmp    dcf <printf+0x2c>
        printint(fd, *ap, 16, 0);
     e4f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     e52:	8b 17                	mov    (%edi),%edx
     e54:	83 ec 0c             	sub    $0xc,%esp
     e57:	6a 00                	push   $0x0
     e59:	b9 10 00 00 00       	mov    $0x10,%ecx
     e5e:	8b 45 08             	mov    0x8(%ebp),%eax
     e61:	e8 b2 fe ff ff       	call   d18 <printint>
        ap++;
     e66:	83 c7 04             	add    $0x4,%edi
     e69:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     e6c:	83 c4 10             	add    $0x10,%esp
      state = 0;
     e6f:	be 00 00 00 00       	mov    $0x0,%esi
     e74:	e9 56 ff ff ff       	jmp    dcf <printf+0x2c>
        s = (char*)*ap;
     e79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e7c:	8b 30                	mov    (%eax),%esi
        ap++;
     e7e:	83 c0 04             	add    $0x4,%eax
     e81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
     e84:	85 f6                	test   %esi,%esi
     e86:	75 15                	jne    e9d <printf+0xfa>
          s = "(null)";
     e88:	be 38 11 00 00       	mov    $0x1138,%esi
     e8d:	eb 0e                	jmp    e9d <printf+0xfa>
          putc(fd, *s);
     e8f:	0f be d2             	movsbl %dl,%edx
     e92:	8b 45 08             	mov    0x8(%ebp),%eax
     e95:	e8 64 fe ff ff       	call   cfe <putc>
          s++;
     e9a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
     e9d:	0f b6 16             	movzbl (%esi),%edx
     ea0:	84 d2                	test   %dl,%dl
     ea2:	75 eb                	jne    e8f <printf+0xec>
      state = 0;
     ea4:	be 00 00 00 00       	mov    $0x0,%esi
     ea9:	e9 21 ff ff ff       	jmp    dcf <printf+0x2c>
        putc(fd, *ap);
     eae:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     eb1:	0f be 17             	movsbl (%edi),%edx
     eb4:	8b 45 08             	mov    0x8(%ebp),%eax
     eb7:	e8 42 fe ff ff       	call   cfe <putc>
        ap++;
     ebc:	83 c7 04             	add    $0x4,%edi
     ebf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
     ec2:	be 00 00 00 00       	mov    $0x0,%esi
     ec7:	e9 03 ff ff ff       	jmp    dcf <printf+0x2c>
        putc(fd, c);
     ecc:	89 fa                	mov    %edi,%edx
     ece:	8b 45 08             	mov    0x8(%ebp),%eax
     ed1:	e8 28 fe ff ff       	call   cfe <putc>
      state = 0;
     ed6:	be 00 00 00 00       	mov    $0x0,%esi
     edb:	e9 ef fe ff ff       	jmp    dcf <printf+0x2c>
        putc(fd, '%');
     ee0:	ba 25 00 00 00       	mov    $0x25,%edx
     ee5:	8b 45 08             	mov    0x8(%ebp),%eax
     ee8:	e8 11 fe ff ff       	call   cfe <putc>
        putc(fd, c);
     eed:	89 fa                	mov    %edi,%edx
     eef:	8b 45 08             	mov    0x8(%ebp),%eax
     ef2:	e8 07 fe ff ff       	call   cfe <putc>
      state = 0;
     ef7:	be 00 00 00 00       	mov    $0x0,%esi
     efc:	e9 ce fe ff ff       	jmp    dcf <printf+0x2c>
    }
  }
}
     f01:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f04:	5b                   	pop    %ebx
     f05:	5e                   	pop    %esi
     f06:	5f                   	pop    %edi
     f07:	5d                   	pop    %ebp
     f08:	c3                   	ret    

00000f09 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f09:	55                   	push   %ebp
     f0a:	89 e5                	mov    %esp,%ebp
     f0c:	57                   	push   %edi
     f0d:	56                   	push   %esi
     f0e:	53                   	push   %ebx
     f0f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f12:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f15:	a1 80 19 00 00       	mov    0x1980,%eax
     f1a:	eb 02                	jmp    f1e <free+0x15>
     f1c:	89 d0                	mov    %edx,%eax
     f1e:	39 c8                	cmp    %ecx,%eax
     f20:	73 04                	jae    f26 <free+0x1d>
     f22:	39 08                	cmp    %ecx,(%eax)
     f24:	77 12                	ja     f38 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f26:	8b 10                	mov    (%eax),%edx
     f28:	39 c2                	cmp    %eax,%edx
     f2a:	77 f0                	ja     f1c <free+0x13>
     f2c:	39 c8                	cmp    %ecx,%eax
     f2e:	72 08                	jb     f38 <free+0x2f>
     f30:	39 ca                	cmp    %ecx,%edx
     f32:	77 04                	ja     f38 <free+0x2f>
     f34:	89 d0                	mov    %edx,%eax
     f36:	eb e6                	jmp    f1e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
     f38:	8b 73 fc             	mov    -0x4(%ebx),%esi
     f3b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     f3e:	8b 10                	mov    (%eax),%edx
     f40:	39 d7                	cmp    %edx,%edi
     f42:	74 19                	je     f5d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     f44:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     f47:	8b 50 04             	mov    0x4(%eax),%edx
     f4a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     f4d:	39 ce                	cmp    %ecx,%esi
     f4f:	74 1b                	je     f6c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     f51:	89 08                	mov    %ecx,(%eax)
  freep = p;
     f53:	a3 80 19 00 00       	mov    %eax,0x1980
}
     f58:	5b                   	pop    %ebx
     f59:	5e                   	pop    %esi
     f5a:	5f                   	pop    %edi
     f5b:	5d                   	pop    %ebp
     f5c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
     f5d:	03 72 04             	add    0x4(%edx),%esi
     f60:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     f63:	8b 10                	mov    (%eax),%edx
     f65:	8b 12                	mov    (%edx),%edx
     f67:	89 53 f8             	mov    %edx,-0x8(%ebx)
     f6a:	eb db                	jmp    f47 <free+0x3e>
    p->s.size += bp->s.size;
     f6c:	03 53 fc             	add    -0x4(%ebx),%edx
     f6f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     f72:	8b 53 f8             	mov    -0x8(%ebx),%edx
     f75:	89 10                	mov    %edx,(%eax)
     f77:	eb da                	jmp    f53 <free+0x4a>

00000f79 <morecore>:

static Header*
morecore(uint nu)
{
     f79:	55                   	push   %ebp
     f7a:	89 e5                	mov    %esp,%ebp
     f7c:	53                   	push   %ebx
     f7d:	83 ec 04             	sub    $0x4,%esp
     f80:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
     f82:	3d ff 0f 00 00       	cmp    $0xfff,%eax
     f87:	77 05                	ja     f8e <morecore+0x15>
    nu = 4096;
     f89:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
     f8e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
     f95:	83 ec 0c             	sub    $0xc,%esp
     f98:	50                   	push   %eax
     f99:	e8 38 fd ff ff       	call   cd6 <sbrk>
  if(p == (char*)-1)
     f9e:	83 c4 10             	add    $0x10,%esp
     fa1:	83 f8 ff             	cmp    $0xffffffff,%eax
     fa4:	74 1c                	je     fc2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     fa6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     fa9:	83 c0 08             	add    $0x8,%eax
     fac:	83 ec 0c             	sub    $0xc,%esp
     faf:	50                   	push   %eax
     fb0:	e8 54 ff ff ff       	call   f09 <free>
  return freep;
     fb5:	a1 80 19 00 00       	mov    0x1980,%eax
     fba:	83 c4 10             	add    $0x10,%esp
}
     fbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fc0:	c9                   	leave  
     fc1:	c3                   	ret    
    return 0;
     fc2:	b8 00 00 00 00       	mov    $0x0,%eax
     fc7:	eb f4                	jmp    fbd <morecore+0x44>

00000fc9 <malloc>:

void*
malloc(uint nbytes)
{
     fc9:	55                   	push   %ebp
     fca:	89 e5                	mov    %esp,%ebp
     fcc:	53                   	push   %ebx
     fcd:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fd0:	8b 45 08             	mov    0x8(%ebp),%eax
     fd3:	8d 58 07             	lea    0x7(%eax),%ebx
     fd6:	c1 eb 03             	shr    $0x3,%ebx
     fd9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
     fdc:	8b 0d 80 19 00 00    	mov    0x1980,%ecx
     fe2:	85 c9                	test   %ecx,%ecx
     fe4:	74 04                	je     fea <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fe6:	8b 01                	mov    (%ecx),%eax
     fe8:	eb 4a                	jmp    1034 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
     fea:	c7 05 80 19 00 00 84 	movl   $0x1984,0x1980
     ff1:	19 00 00 
     ff4:	c7 05 84 19 00 00 84 	movl   $0x1984,0x1984
     ffb:	19 00 00 
    base.s.size = 0;
     ffe:	c7 05 88 19 00 00 00 	movl   $0x0,0x1988
    1005:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1008:	b9 84 19 00 00       	mov    $0x1984,%ecx
    100d:	eb d7                	jmp    fe6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    100f:	74 19                	je     102a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1011:	29 da                	sub    %ebx,%edx
    1013:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1016:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    1019:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    101c:	89 0d 80 19 00 00    	mov    %ecx,0x1980
      return (void*)(p + 1);
    1022:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1025:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1028:	c9                   	leave  
    1029:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    102a:	8b 10                	mov    (%eax),%edx
    102c:	89 11                	mov    %edx,(%ecx)
    102e:	eb ec                	jmp    101c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1030:	89 c1                	mov    %eax,%ecx
    1032:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    1034:	8b 50 04             	mov    0x4(%eax),%edx
    1037:	39 da                	cmp    %ebx,%edx
    1039:	73 d4                	jae    100f <malloc+0x46>
    if(p == freep)
    103b:	39 05 80 19 00 00    	cmp    %eax,0x1980
    1041:	75 ed                	jne    1030 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    1043:	89 d8                	mov    %ebx,%eax
    1045:	e8 2f ff ff ff       	call   f79 <morecore>
    104a:	85 c0                	test   %eax,%eax
    104c:	75 e2                	jne    1030 <malloc+0x67>
    104e:	eb d5                	jmp    1025 <malloc+0x5c>
