
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
   e:	68 ac 0f 00 00       	push   $0xfac
  13:	6a 02                	push   $0x2
  15:	e8 e4 0c 00 00       	call   cfe <printf>
  memset(buf, 0, nbuf);
  1a:	83 c4 0c             	add    $0xc,%esp
  1d:	56                   	push   %esi
  1e:	6a 00                	push   $0x0
  20:	53                   	push   %ebx
  21:	e8 48 0a 00 00       	call   a6e <memset>
  gets(buf, nbuf);
  26:	83 c4 08             	add    $0x8,%esp
  29:	56                   	push   %esi
  2a:	53                   	push   %ebx
  2b:	e8 7a 0a 00 00       	call   aaa <gets>
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
  54:	68 49 10 00 00       	push   $0x1049
  59:	6a 02                	push   $0x2
  5b:	e8 9e 0c 00 00       	call   cfe <printf>
  exit();
  60:	e8 44 0b 00 00       	call   ba9 <exit>

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
  6b:	e8 31 0b 00 00       	call   ba1 <fork>
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
  7a:	68 af 0f 00 00       	push   $0xfaf
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
  99:	ff 24 85 64 10 00 00 	jmp    *0x1064(,%eax,4)
    exit();
  a0:	e8 04 0b 00 00       	call   ba9 <exit>
    panic("runcmd");
  a5:	83 ec 0c             	sub    $0xc,%esp
  a8:	68 b4 0f 00 00       	push   $0xfb4
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
  c1:	e8 1b 0b 00 00       	call   be1 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
  c6:	83 c4 0c             	add    $0xc,%esp
  c9:	ff 73 04             	push   0x4(%ebx)
  cc:	68 bb 0f 00 00       	push   $0xfbb
  d1:	6a 02                	push   $0x2
  d3:	e8 26 0c 00 00       	call   cfe <printf>
    break;
  d8:	83 c4 10             	add    $0x10,%esp
  exit();
  db:	e8 c9 0a 00 00       	call   ba9 <exit>
      exit();
  e0:	e8 c4 0a 00 00       	call   ba9 <exit>
    close(rcmd->fd);
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	ff 73 14             	push   0x14(%ebx)
  eb:	e8 e1 0a 00 00       	call   bd1 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
  f0:	83 c4 08             	add    $0x8,%esp
  f3:	ff 73 10             	push   0x10(%ebx)
  f6:	ff 73 08             	push   0x8(%ebx)
  f9:	e8 eb 0a 00 00       	call   be9 <open>
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
 116:	68 cb 0f 00 00       	push   $0xfcb
 11b:	6a 02                	push   $0x2
 11d:	e8 dc 0b 00 00       	call   cfe <printf>
      exit();
 122:	e8 82 0a 00 00       	call   ba9 <exit>
    if(fork1() == 0)
 127:	e8 39 ff ff ff       	call   65 <fork1>
 12c:	85 c0                	test   %eax,%eax
 12e:	74 10                	je     140 <runcmd+0xbc>
    wait();
 130:	e8 7c 0a 00 00       	call   bb1 <wait>
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
 152:	e8 62 0a 00 00       	call   bb9 <pipe>
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
 176:	e8 56 0a 00 00       	call   bd1 <close>
    close(p[1]);
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 75 f4             	push   -0xc(%ebp)
 181:	e8 4b 0a 00 00       	call   bd1 <close>
    wait();
 186:	e8 26 0a 00 00       	call   bb1 <wait>
    wait();
 18b:	e8 21 0a 00 00       	call   bb1 <wait>
    break;
 190:	83 c4 10             	add    $0x10,%esp
 193:	e9 43 ff ff ff       	jmp    db <runcmd+0x57>
      panic("pipe");
 198:	83 ec 0c             	sub    $0xc,%esp
 19b:	68 db 0f 00 00       	push   $0xfdb
 1a0:	e8 a6 fe ff ff       	call   4b <panic>
      close(1);
 1a5:	83 ec 0c             	sub    $0xc,%esp
 1a8:	6a 01                	push   $0x1
 1aa:	e8 22 0a 00 00       	call   bd1 <close>
      dup(p[1]);
 1af:	83 c4 04             	add    $0x4,%esp
 1b2:	ff 75 f4             	push   -0xc(%ebp)
 1b5:	e8 67 0a 00 00       	call   c21 <dup>
      close(p[0]);
 1ba:	83 c4 04             	add    $0x4,%esp
 1bd:	ff 75 f0             	push   -0x10(%ebp)
 1c0:	e8 0c 0a 00 00       	call   bd1 <close>
      close(p[1]);
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 75 f4             	push   -0xc(%ebp)
 1cb:	e8 01 0a 00 00       	call   bd1 <close>
      runcmd(pcmd->left);
 1d0:	83 c4 04             	add    $0x4,%esp
 1d3:	ff 73 04             	push   0x4(%ebx)
 1d6:	e8 a9 fe ff ff       	call   84 <runcmd>
      close(0);
 1db:	83 ec 0c             	sub    $0xc,%esp
 1de:	6a 00                	push   $0x0
 1e0:	e8 ec 09 00 00       	call   bd1 <close>
      dup(p[0]);
 1e5:	83 c4 04             	add    $0x4,%esp
 1e8:	ff 75 f0             	push   -0x10(%ebp)
 1eb:	e8 31 0a 00 00       	call   c21 <dup>
      close(p[0]);
 1f0:	83 c4 04             	add    $0x4,%esp
 1f3:	ff 75 f0             	push   -0x10(%ebp)
 1f6:	e8 d6 09 00 00       	call   bd1 <close>
      close(p[1]);
 1fb:	83 c4 04             	add    $0x4,%esp
 1fe:	ff 75 f4             	push   -0xc(%ebp)
 201:	e8 cb 09 00 00       	call   bd1 <close>
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
 232:	e8 ed 0c 00 00       	call   f24 <malloc>
 237:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 239:	83 c4 0c             	add    $0xc,%esp
 23c:	6a 54                	push   $0x54
 23e:	6a 00                	push   $0x0
 240:	50                   	push   %eax
 241:	e8 28 08 00 00       	call   a6e <memset>
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
 25c:	e8 c3 0c 00 00       	call   f24 <malloc>
 261:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 263:	83 c4 0c             	add    $0xc,%esp
 266:	6a 18                	push   $0x18
 268:	6a 00                	push   $0x0
 26a:	50                   	push   %eax
 26b:	e8 fe 07 00 00       	call   a6e <memset>
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
 2a4:	e8 7b 0c 00 00       	call   f24 <malloc>
 2a9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 2ab:	83 c4 0c             	add    $0xc,%esp
 2ae:	6a 0c                	push   $0xc
 2b0:	6a 00                	push   $0x0
 2b2:	50                   	push   %eax
 2b3:	e8 b6 07 00 00       	call   a6e <memset>
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
 2da:	e8 45 0c 00 00       	call   f24 <malloc>
 2df:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 2e1:	83 c4 0c             	add    $0xc,%esp
 2e4:	6a 0c                	push   $0xc
 2e6:	6a 00                	push   $0x0
 2e8:	50                   	push   %eax
 2e9:	e8 80 07 00 00       	call   a6e <memset>
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
 310:	e8 0f 0c 00 00       	call   f24 <malloc>
 315:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 317:	83 c4 0c             	add    $0xc,%esp
 31a:	6a 08                	push   $0x8
 31c:	6a 00                	push   $0x0
 31e:	50                   	push   %eax
 31f:	e8 4a 07 00 00       	call   a6e <memset>
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
 35b:	68 20 17 00 00       	push   $0x1720
 360:	e8 22 07 00 00       	call   a87 <strchr>
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
 3d2:	68 20 17 00 00       	push   $0x1720
 3d7:	e8 ab 06 00 00       	call   a87 <strchr>
 3dc:	83 c4 10             	add    $0x10,%esp
 3df:	85 c0                	test   %eax,%eax
 3e1:	75 26                	jne    409 <gettoken+0xd2>
 3e3:	83 ec 08             	sub    $0x8,%esp
 3e6:	0f be 03             	movsbl (%ebx),%eax
 3e9:	50                   	push   %eax
 3ea:	68 18 17 00 00       	push   $0x1718
 3ef:	e8 93 06 00 00       	call   a87 <strchr>
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
 41e:	68 20 17 00 00       	push   $0x1720
 423:	e8 5f 06 00 00       	call   a87 <strchr>
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
 45f:	68 20 17 00 00       	push   $0x1720
 464:	e8 1e 06 00 00       	call   a87 <strchr>
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
 490:	e8 f2 05 00 00       	call   a87 <strchr>
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
 4be:	68 e0 0f 00 00       	push   $0xfe0
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
 4e6:	68 fd 0f 00 00       	push   $0xffd
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
 589:	68 00 10 00 00       	push   $0x1000
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
 5d7:	68 02 10 00 00       	push   $0x1002
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
 5f7:	68 17 10 00 00       	push   $0x1017
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
 641:	68 09 10 00 00       	push   $0x1009
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
 67e:	68 1c 10 00 00       	push   $0x101c
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
 6f9:	68 1e 10 00 00       	push   $0x101e
 6fe:	57                   	push   %edi
 6ff:	56                   	push   %esi
 700:	e8 39 fd ff ff       	call   43e <peek>
 705:	83 c4 10             	add    $0x10,%esp
 708:	85 c0                	test   %eax,%eax
 70a:	75 d2                	jne    6de <parseline+0x1d>
  if(peek(ps, es, ";")){
 70c:	83 ec 04             	sub    $0x4,%esp
 70f:	68 1a 10 00 00       	push   $0x101a
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
 761:	68 00 10 00 00       	push   $0x1000
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
 78e:	68 3c 10 00 00       	push   $0x103c
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
 7c2:	68 20 10 00 00       	push   $0x1020
 7c7:	e8 7f f8 ff ff       	call   4b <panic>
    panic("syntax - missing )");
 7cc:	83 ec 0c             	sub    $0xc,%esp
 7cf:	68 2b 10 00 00       	push   $0x102b
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
 7ee:	ff 24 85 7c 10 00 00 	jmp    *0x107c(,%eax,4)
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
 87c:	e8 d5 01 00 00       	call   a56 <strlen>
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
 895:	68 ca 0f 00 00       	push   $0xfca
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
 8c4:	68 3e 10 00 00       	push   $0x103e
 8c9:	6a 02                	push   $0x2
 8cb:	e8 2e 04 00 00       	call   cfe <printf>
    panic("syntax");
 8d0:	c7 04 24 02 10 00 00 	movl   $0x1002,(%esp)
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
 8f2:	68 4d 10 00 00       	push   $0x104d
 8f7:	e8 ed 02 00 00       	call   be9 <open>
 8fc:	83 c4 10             	add    $0x10,%esp
 8ff:	85 c0                	test   %eax,%eax
 901:	78 21                	js     924 <main+0x48>
    if(fd >= 3){
 903:	83 f8 02             	cmp    $0x2,%eax
 906:	7e e5                	jle    8ed <main+0x11>
      close(fd);
 908:	83 ec 0c             	sub    $0xc,%esp
 90b:	50                   	push   %eax
 90c:	e8 c0 02 00 00       	call   bd1 <close>
      break;
 911:	83 c4 10             	add    $0x10,%esp
 914:	eb 0e                	jmp    924 <main+0x48>
    if(fork1() == 0)
 916:	e8 4a f7 ff ff       	call   65 <fork1>
 91b:	85 c0                	test   %eax,%eax
 91d:	74 76                	je     995 <main+0xb9>
    wait();
 91f:	e8 8d 02 00 00       	call   bb1 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
 924:	83 ec 08             	sub    $0x8,%esp
 927:	6a 64                	push   $0x64
 929:	68 40 17 00 00       	push   $0x1740
 92e:	e8 cd f6 ff ff       	call   0 <getcmd>
 933:	83 c4 10             	add    $0x10,%esp
 936:	85 c0                	test   %eax,%eax
 938:	78 70                	js     9aa <main+0xce>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
 93a:	80 3d 40 17 00 00 63 	cmpb   $0x63,0x1740
 941:	75 d3                	jne    916 <main+0x3a>
 943:	80 3d 41 17 00 00 64 	cmpb   $0x64,0x1741
 94a:	75 ca                	jne    916 <main+0x3a>
 94c:	80 3d 42 17 00 00 20 	cmpb   $0x20,0x1742
 953:	75 c1                	jne    916 <main+0x3a>
      buf[strlen(buf)-1] = 0;  // chop \n
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	68 40 17 00 00       	push   $0x1740
 95d:	e8 f4 00 00 00       	call   a56 <strlen>
 962:	c6 80 3f 17 00 00 00 	movb   $0x0,0x173f(%eax)
      if(chdir(buf+3) < 0)
 969:	c7 04 24 43 17 00 00 	movl   $0x1743,(%esp)
 970:	e8 a4 02 00 00       	call   c19 <chdir>
 975:	83 c4 10             	add    $0x10,%esp
 978:	85 c0                	test   %eax,%eax
 97a:	79 a8                	jns    924 <main+0x48>
        printf(2, "cannot cd %s\n", buf+3);
 97c:	83 ec 04             	sub    $0x4,%esp
 97f:	68 43 17 00 00       	push   $0x1743
 984:	68 55 10 00 00       	push   $0x1055
 989:	6a 02                	push   $0x2
 98b:	e8 6e 03 00 00       	call   cfe <printf>
 990:	83 c4 10             	add    $0x10,%esp
      continue;
 993:	eb 8f                	jmp    924 <main+0x48>
      runcmd(parsecmd(buf));
 995:	83 ec 0c             	sub    $0xc,%esp
 998:	68 40 17 00 00       	push   $0x1740
 99d:	e8 ce fe ff ff       	call   870 <parsecmd>
 9a2:	89 04 24             	mov    %eax,(%esp)
 9a5:	e8 da f6 ff ff       	call   84 <runcmd>
  exit();
 9aa:	e8 fa 01 00 00       	call   ba9 <exit>

000009af <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 9c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9c5:	c3                   	ret    

000009c6 <thread_join>:

int thread_join() {
  return 0;
}
 9c6:	b8 00 00 00 00       	mov    $0x0,%eax
 9cb:	c3                   	ret    

000009cc <lock_acquire>:

void lock_acquire(lock_t *lock){
 9cc:	55                   	push   %ebp
 9cd:	89 e5                	mov    %esp,%ebp
 9cf:	53                   	push   %ebx
 9d0:	83 ec 04             	sub    $0x4,%esp
 9d3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 9d6:	83 ec 08             	sub    $0x8,%esp
 9d9:	6a 01                	push   $0x1
 9db:	53                   	push   %ebx
 9dc:	e8 ce ff ff ff       	call   9af <test_and_set>
 9e1:	83 c4 10             	add    $0x10,%esp
 9e4:	83 f8 01             	cmp    $0x1,%eax
 9e7:	74 ed                	je     9d6 <lock_acquire+0xa>
    ;
}
 9e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ec:	c9                   	leave  
 9ed:	c3                   	ret    

000009ee <lock_release>:

void lock_release(lock_t *lock) {
 9ee:	55                   	push   %ebp
 9ef:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 9f1:	8b 45 08             	mov    0x8(%ebp),%eax
 9f4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9fa:	5d                   	pop    %ebp
 9fb:	c3                   	ret    

000009fc <lock_init>:

void lock_init(lock_t *lock) {
 9fc:	55                   	push   %ebp
 9fd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 9ff:	8b 45 08             	mov    0x8(%ebp),%eax
 a02:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a08:	5d                   	pop    %ebp
 a09:	c3                   	ret    

00000a0a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 a0a:	55                   	push   %ebp
 a0b:	89 e5                	mov    %esp,%ebp
 a0d:	56                   	push   %esi
 a0e:	53                   	push   %ebx
 a0f:	8b 75 08             	mov    0x8(%ebp),%esi
 a12:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 a15:	89 f0                	mov    %esi,%eax
 a17:	89 d1                	mov    %edx,%ecx
 a19:	83 c2 01             	add    $0x1,%edx
 a1c:	89 c3                	mov    %eax,%ebx
 a1e:	83 c0 01             	add    $0x1,%eax
 a21:	0f b6 09             	movzbl (%ecx),%ecx
 a24:	88 0b                	mov    %cl,(%ebx)
 a26:	84 c9                	test   %cl,%cl
 a28:	75 ed                	jne    a17 <strcpy+0xd>
    ;
  return os;
}
 a2a:	89 f0                	mov    %esi,%eax
 a2c:	5b                   	pop    %ebx
 a2d:	5e                   	pop    %esi
 a2e:	5d                   	pop    %ebp
 a2f:	c3                   	ret    

00000a30 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a36:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 a39:	eb 06                	jmp    a41 <strcmp+0x11>
    p++, q++;
 a3b:	83 c1 01             	add    $0x1,%ecx
 a3e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 a41:	0f b6 01             	movzbl (%ecx),%eax
 a44:	84 c0                	test   %al,%al
 a46:	74 04                	je     a4c <strcmp+0x1c>
 a48:	3a 02                	cmp    (%edx),%al
 a4a:	74 ef                	je     a3b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 a4c:	0f b6 c0             	movzbl %al,%eax
 a4f:	0f b6 12             	movzbl (%edx),%edx
 a52:	29 d0                	sub    %edx,%eax
}
 a54:	5d                   	pop    %ebp
 a55:	c3                   	ret    

00000a56 <strlen>:

uint
strlen(const char *s)
{
 a56:	55                   	push   %ebp
 a57:	89 e5                	mov    %esp,%ebp
 a59:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 a5c:	b8 00 00 00 00       	mov    $0x0,%eax
 a61:	eb 03                	jmp    a66 <strlen+0x10>
 a63:	83 c0 01             	add    $0x1,%eax
 a66:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 a6a:	75 f7                	jne    a63 <strlen+0xd>
    ;
  return n;
}
 a6c:	5d                   	pop    %ebp
 a6d:	c3                   	ret    

00000a6e <memset>:

void*
memset(void *dst, int c, uint n)
{
 a6e:	55                   	push   %ebp
 a6f:	89 e5                	mov    %esp,%ebp
 a71:	57                   	push   %edi
 a72:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 a75:	89 d7                	mov    %edx,%edi
 a77:	8b 4d 10             	mov    0x10(%ebp),%ecx
 a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
 a7d:	fc                   	cld    
 a7e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 a80:	89 d0                	mov    %edx,%eax
 a82:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a85:	c9                   	leave  
 a86:	c3                   	ret    

00000a87 <strchr>:

char*
strchr(const char *s, char c)
{
 a87:	55                   	push   %ebp
 a88:	89 e5                	mov    %esp,%ebp
 a8a:	8b 45 08             	mov    0x8(%ebp),%eax
 a8d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 a91:	eb 03                	jmp    a96 <strchr+0xf>
 a93:	83 c0 01             	add    $0x1,%eax
 a96:	0f b6 10             	movzbl (%eax),%edx
 a99:	84 d2                	test   %dl,%dl
 a9b:	74 06                	je     aa3 <strchr+0x1c>
    if(*s == c)
 a9d:	38 ca                	cmp    %cl,%dl
 a9f:	75 f2                	jne    a93 <strchr+0xc>
 aa1:	eb 05                	jmp    aa8 <strchr+0x21>
      return (char*)s;
  return 0;
 aa3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 aa8:	5d                   	pop    %ebp
 aa9:	c3                   	ret    

00000aaa <gets>:

char*
gets(char *buf, int max)
{
 aaa:	55                   	push   %ebp
 aab:	89 e5                	mov    %esp,%ebp
 aad:	57                   	push   %edi
 aae:	56                   	push   %esi
 aaf:	53                   	push   %ebx
 ab0:	83 ec 1c             	sub    $0x1c,%esp
 ab3:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 ab6:	bb 00 00 00 00       	mov    $0x0,%ebx
 abb:	89 de                	mov    %ebx,%esi
 abd:	83 c3 01             	add    $0x1,%ebx
 ac0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 ac3:	7d 2e                	jge    af3 <gets+0x49>
    cc = read(0, &c, 1);
 ac5:	83 ec 04             	sub    $0x4,%esp
 ac8:	6a 01                	push   $0x1
 aca:	8d 45 e7             	lea    -0x19(%ebp),%eax
 acd:	50                   	push   %eax
 ace:	6a 00                	push   $0x0
 ad0:	e8 ec 00 00 00       	call   bc1 <read>
    if(cc < 1)
 ad5:	83 c4 10             	add    $0x10,%esp
 ad8:	85 c0                	test   %eax,%eax
 ada:	7e 17                	jle    af3 <gets+0x49>
      break;
    buf[i++] = c;
 adc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 ae0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 ae3:	3c 0a                	cmp    $0xa,%al
 ae5:	0f 94 c2             	sete   %dl
 ae8:	3c 0d                	cmp    $0xd,%al
 aea:	0f 94 c0             	sete   %al
 aed:	08 c2                	or     %al,%dl
 aef:	74 ca                	je     abb <gets+0x11>
    buf[i++] = c;
 af1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 af3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 af7:	89 f8                	mov    %edi,%eax
 af9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 afc:	5b                   	pop    %ebx
 afd:	5e                   	pop    %esi
 afe:	5f                   	pop    %edi
 aff:	5d                   	pop    %ebp
 b00:	c3                   	ret    

00000b01 <stat>:

int
stat(const char *n, struct stat *st)
{
 b01:	55                   	push   %ebp
 b02:	89 e5                	mov    %esp,%ebp
 b04:	56                   	push   %esi
 b05:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 b06:	83 ec 08             	sub    $0x8,%esp
 b09:	6a 00                	push   $0x0
 b0b:	ff 75 08             	push   0x8(%ebp)
 b0e:	e8 d6 00 00 00       	call   be9 <open>
  if(fd < 0)
 b13:	83 c4 10             	add    $0x10,%esp
 b16:	85 c0                	test   %eax,%eax
 b18:	78 24                	js     b3e <stat+0x3d>
 b1a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 b1c:	83 ec 08             	sub    $0x8,%esp
 b1f:	ff 75 0c             	push   0xc(%ebp)
 b22:	50                   	push   %eax
 b23:	e8 d9 00 00 00       	call   c01 <fstat>
 b28:	89 c6                	mov    %eax,%esi
  close(fd);
 b2a:	89 1c 24             	mov    %ebx,(%esp)
 b2d:	e8 9f 00 00 00       	call   bd1 <close>
  return r;
 b32:	83 c4 10             	add    $0x10,%esp
}
 b35:	89 f0                	mov    %esi,%eax
 b37:	8d 65 f8             	lea    -0x8(%ebp),%esp
 b3a:	5b                   	pop    %ebx
 b3b:	5e                   	pop    %esi
 b3c:	5d                   	pop    %ebp
 b3d:	c3                   	ret    
    return -1;
 b3e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 b43:	eb f0                	jmp    b35 <stat+0x34>

00000b45 <atoi>:

int
atoi(const char *s)
{
 b45:	55                   	push   %ebp
 b46:	89 e5                	mov    %esp,%ebp
 b48:	53                   	push   %ebx
 b49:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 b4c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 b51:	eb 10                	jmp    b63 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 b53:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 b56:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 b59:	83 c1 01             	add    $0x1,%ecx
 b5c:	0f be c0             	movsbl %al,%eax
 b5f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 b63:	0f b6 01             	movzbl (%ecx),%eax
 b66:	8d 58 d0             	lea    -0x30(%eax),%ebx
 b69:	80 fb 09             	cmp    $0x9,%bl
 b6c:	76 e5                	jbe    b53 <atoi+0xe>
  return n;
}
 b6e:	89 d0                	mov    %edx,%eax
 b70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b73:	c9                   	leave  
 b74:	c3                   	ret    

00000b75 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 b75:	55                   	push   %ebp
 b76:	89 e5                	mov    %esp,%ebp
 b78:	56                   	push   %esi
 b79:	53                   	push   %ebx
 b7a:	8b 75 08             	mov    0x8(%ebp),%esi
 b7d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b80:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 b83:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 b85:	eb 0d                	jmp    b94 <memmove+0x1f>
    *dst++ = *src++;
 b87:	0f b6 01             	movzbl (%ecx),%eax
 b8a:	88 02                	mov    %al,(%edx)
 b8c:	8d 49 01             	lea    0x1(%ecx),%ecx
 b8f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 b92:	89 d8                	mov    %ebx,%eax
 b94:	8d 58 ff             	lea    -0x1(%eax),%ebx
 b97:	85 c0                	test   %eax,%eax
 b99:	7f ec                	jg     b87 <memmove+0x12>
  return vdst;
}
 b9b:	89 f0                	mov    %esi,%eax
 b9d:	5b                   	pop    %ebx
 b9e:	5e                   	pop    %esi
 b9f:	5d                   	pop    %ebp
 ba0:	c3                   	ret    

00000ba1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 ba1:	b8 01 00 00 00       	mov    $0x1,%eax
 ba6:	cd 40                	int    $0x40
 ba8:	c3                   	ret    

00000ba9 <exit>:
SYSCALL(exit)
 ba9:	b8 02 00 00 00       	mov    $0x2,%eax
 bae:	cd 40                	int    $0x40
 bb0:	c3                   	ret    

00000bb1 <wait>:
SYSCALL(wait)
 bb1:	b8 03 00 00 00       	mov    $0x3,%eax
 bb6:	cd 40                	int    $0x40
 bb8:	c3                   	ret    

00000bb9 <pipe>:
SYSCALL(pipe)
 bb9:	b8 04 00 00 00       	mov    $0x4,%eax
 bbe:	cd 40                	int    $0x40
 bc0:	c3                   	ret    

00000bc1 <read>:
SYSCALL(read)
 bc1:	b8 05 00 00 00       	mov    $0x5,%eax
 bc6:	cd 40                	int    $0x40
 bc8:	c3                   	ret    

00000bc9 <write>:
SYSCALL(write)
 bc9:	b8 10 00 00 00       	mov    $0x10,%eax
 bce:	cd 40                	int    $0x40
 bd0:	c3                   	ret    

00000bd1 <close>:
SYSCALL(close)
 bd1:	b8 15 00 00 00       	mov    $0x15,%eax
 bd6:	cd 40                	int    $0x40
 bd8:	c3                   	ret    

00000bd9 <kill>:
SYSCALL(kill)
 bd9:	b8 06 00 00 00       	mov    $0x6,%eax
 bde:	cd 40                	int    $0x40
 be0:	c3                   	ret    

00000be1 <exec>:
SYSCALL(exec)
 be1:	b8 07 00 00 00       	mov    $0x7,%eax
 be6:	cd 40                	int    $0x40
 be8:	c3                   	ret    

00000be9 <open>:
SYSCALL(open)
 be9:	b8 0f 00 00 00       	mov    $0xf,%eax
 bee:	cd 40                	int    $0x40
 bf0:	c3                   	ret    

00000bf1 <mknod>:
SYSCALL(mknod)
 bf1:	b8 11 00 00 00       	mov    $0x11,%eax
 bf6:	cd 40                	int    $0x40
 bf8:	c3                   	ret    

00000bf9 <unlink>:
SYSCALL(unlink)
 bf9:	b8 12 00 00 00       	mov    $0x12,%eax
 bfe:	cd 40                	int    $0x40
 c00:	c3                   	ret    

00000c01 <fstat>:
SYSCALL(fstat)
 c01:	b8 08 00 00 00       	mov    $0x8,%eax
 c06:	cd 40                	int    $0x40
 c08:	c3                   	ret    

00000c09 <link>:
SYSCALL(link)
 c09:	b8 13 00 00 00       	mov    $0x13,%eax
 c0e:	cd 40                	int    $0x40
 c10:	c3                   	ret    

00000c11 <mkdir>:
SYSCALL(mkdir)
 c11:	b8 14 00 00 00       	mov    $0x14,%eax
 c16:	cd 40                	int    $0x40
 c18:	c3                   	ret    

00000c19 <chdir>:
SYSCALL(chdir)
 c19:	b8 09 00 00 00       	mov    $0x9,%eax
 c1e:	cd 40                	int    $0x40
 c20:	c3                   	ret    

00000c21 <dup>:
SYSCALL(dup)
 c21:	b8 0a 00 00 00       	mov    $0xa,%eax
 c26:	cd 40                	int    $0x40
 c28:	c3                   	ret    

00000c29 <getpid>:
SYSCALL(getpid)
 c29:	b8 0b 00 00 00       	mov    $0xb,%eax
 c2e:	cd 40                	int    $0x40
 c30:	c3                   	ret    

00000c31 <sbrk>:
SYSCALL(sbrk)
 c31:	b8 0c 00 00 00       	mov    $0xc,%eax
 c36:	cd 40                	int    $0x40
 c38:	c3                   	ret    

00000c39 <sleep>:
SYSCALL(sleep)
 c39:	b8 0d 00 00 00       	mov    $0xd,%eax
 c3e:	cd 40                	int    $0x40
 c40:	c3                   	ret    

00000c41 <uptime>:
SYSCALL(uptime)
 c41:	b8 0e 00 00 00       	mov    $0xe,%eax
 c46:	cd 40                	int    $0x40
 c48:	c3                   	ret    

00000c49 <clone>:
SYSCALL(clone)
 c49:	b8 16 00 00 00       	mov    $0x16,%eax
 c4e:	cd 40                	int    $0x40
 c50:	c3                   	ret    

00000c51 <join>:
 c51:	b8 17 00 00 00       	mov    $0x17,%eax
 c56:	cd 40                	int    $0x40
 c58:	c3                   	ret    

00000c59 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 c59:	55                   	push   %ebp
 c5a:	89 e5                	mov    %esp,%ebp
 c5c:	83 ec 1c             	sub    $0x1c,%esp
 c5f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 c62:	6a 01                	push   $0x1
 c64:	8d 55 f4             	lea    -0xc(%ebp),%edx
 c67:	52                   	push   %edx
 c68:	50                   	push   %eax
 c69:	e8 5b ff ff ff       	call   bc9 <write>
}
 c6e:	83 c4 10             	add    $0x10,%esp
 c71:	c9                   	leave  
 c72:	c3                   	ret    

00000c73 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 c73:	55                   	push   %ebp
 c74:	89 e5                	mov    %esp,%ebp
 c76:	57                   	push   %edi
 c77:	56                   	push   %esi
 c78:	53                   	push   %ebx
 c79:	83 ec 2c             	sub    $0x2c,%esp
 c7c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 c7f:	89 d0                	mov    %edx,%eax
 c81:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 c83:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 c87:	0f 95 c1             	setne  %cl
 c8a:	c1 ea 1f             	shr    $0x1f,%edx
 c8d:	84 d1                	test   %dl,%cl
 c8f:	74 44                	je     cd5 <printint+0x62>
    neg = 1;
    x = -xx;
 c91:	f7 d8                	neg    %eax
 c93:	89 c1                	mov    %eax,%ecx
    neg = 1;
 c95:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 c9c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 ca1:	89 c8                	mov    %ecx,%eax
 ca3:	ba 00 00 00 00       	mov    $0x0,%edx
 ca8:	f7 f6                	div    %esi
 caa:	89 df                	mov    %ebx,%edi
 cac:	83 c3 01             	add    $0x1,%ebx
 caf:	0f b6 92 f4 10 00 00 	movzbl 0x10f4(%edx),%edx
 cb6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 cba:	89 ca                	mov    %ecx,%edx
 cbc:	89 c1                	mov    %eax,%ecx
 cbe:	39 d6                	cmp    %edx,%esi
 cc0:	76 df                	jbe    ca1 <printint+0x2e>
  if(neg)
 cc2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 cc6:	74 31                	je     cf9 <printint+0x86>
    buf[i++] = '-';
 cc8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 ccd:	8d 5f 02             	lea    0x2(%edi),%ebx
 cd0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 cd3:	eb 17                	jmp    cec <printint+0x79>
    x = xx;
 cd5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 cd7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 cde:	eb bc                	jmp    c9c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 ce0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 ce5:	89 f0                	mov    %esi,%eax
 ce7:	e8 6d ff ff ff       	call   c59 <putc>
  while(--i >= 0)
 cec:	83 eb 01             	sub    $0x1,%ebx
 cef:	79 ef                	jns    ce0 <printint+0x6d>
}
 cf1:	83 c4 2c             	add    $0x2c,%esp
 cf4:	5b                   	pop    %ebx
 cf5:	5e                   	pop    %esi
 cf6:	5f                   	pop    %edi
 cf7:	5d                   	pop    %ebp
 cf8:	c3                   	ret    
 cf9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 cfc:	eb ee                	jmp    cec <printint+0x79>

00000cfe <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 cfe:	55                   	push   %ebp
 cff:	89 e5                	mov    %esp,%ebp
 d01:	57                   	push   %edi
 d02:	56                   	push   %esi
 d03:	53                   	push   %ebx
 d04:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 d07:	8d 45 10             	lea    0x10(%ebp),%eax
 d0a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 d0d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 d12:	bb 00 00 00 00       	mov    $0x0,%ebx
 d17:	eb 14                	jmp    d2d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 d19:	89 fa                	mov    %edi,%edx
 d1b:	8b 45 08             	mov    0x8(%ebp),%eax
 d1e:	e8 36 ff ff ff       	call   c59 <putc>
 d23:	eb 05                	jmp    d2a <printf+0x2c>
      }
    } else if(state == '%'){
 d25:	83 fe 25             	cmp    $0x25,%esi
 d28:	74 25                	je     d4f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 d2a:	83 c3 01             	add    $0x1,%ebx
 d2d:	8b 45 0c             	mov    0xc(%ebp),%eax
 d30:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 d34:	84 c0                	test   %al,%al
 d36:	0f 84 20 01 00 00    	je     e5c <printf+0x15e>
    c = fmt[i] & 0xff;
 d3c:	0f be f8             	movsbl %al,%edi
 d3f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 d42:	85 f6                	test   %esi,%esi
 d44:	75 df                	jne    d25 <printf+0x27>
      if(c == '%'){
 d46:	83 f8 25             	cmp    $0x25,%eax
 d49:	75 ce                	jne    d19 <printf+0x1b>
        state = '%';
 d4b:	89 c6                	mov    %eax,%esi
 d4d:	eb db                	jmp    d2a <printf+0x2c>
      if(c == 'd'){
 d4f:	83 f8 25             	cmp    $0x25,%eax
 d52:	0f 84 cf 00 00 00    	je     e27 <printf+0x129>
 d58:	0f 8c dd 00 00 00    	jl     e3b <printf+0x13d>
 d5e:	83 f8 78             	cmp    $0x78,%eax
 d61:	0f 8f d4 00 00 00    	jg     e3b <printf+0x13d>
 d67:	83 f8 63             	cmp    $0x63,%eax
 d6a:	0f 8c cb 00 00 00    	jl     e3b <printf+0x13d>
 d70:	83 e8 63             	sub    $0x63,%eax
 d73:	83 f8 15             	cmp    $0x15,%eax
 d76:	0f 87 bf 00 00 00    	ja     e3b <printf+0x13d>
 d7c:	ff 24 85 9c 10 00 00 	jmp    *0x109c(,%eax,4)
        printint(fd, *ap, 10, 1);
 d83:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 d86:	8b 17                	mov    (%edi),%edx
 d88:	83 ec 0c             	sub    $0xc,%esp
 d8b:	6a 01                	push   $0x1
 d8d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 d92:	8b 45 08             	mov    0x8(%ebp),%eax
 d95:	e8 d9 fe ff ff       	call   c73 <printint>
        ap++;
 d9a:	83 c7 04             	add    $0x4,%edi
 d9d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 da0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 da3:	be 00 00 00 00       	mov    $0x0,%esi
 da8:	eb 80                	jmp    d2a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 daa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 dad:	8b 17                	mov    (%edi),%edx
 daf:	83 ec 0c             	sub    $0xc,%esp
 db2:	6a 00                	push   $0x0
 db4:	b9 10 00 00 00       	mov    $0x10,%ecx
 db9:	8b 45 08             	mov    0x8(%ebp),%eax
 dbc:	e8 b2 fe ff ff       	call   c73 <printint>
        ap++;
 dc1:	83 c7 04             	add    $0x4,%edi
 dc4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 dc7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 dca:	be 00 00 00 00       	mov    $0x0,%esi
 dcf:	e9 56 ff ff ff       	jmp    d2a <printf+0x2c>
        s = (char*)*ap;
 dd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 dd7:	8b 30                	mov    (%eax),%esi
        ap++;
 dd9:	83 c0 04             	add    $0x4,%eax
 ddc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 ddf:	85 f6                	test   %esi,%esi
 de1:	75 15                	jne    df8 <printf+0xfa>
          s = "(null)";
 de3:	be 94 10 00 00       	mov    $0x1094,%esi
 de8:	eb 0e                	jmp    df8 <printf+0xfa>
          putc(fd, *s);
 dea:	0f be d2             	movsbl %dl,%edx
 ded:	8b 45 08             	mov    0x8(%ebp),%eax
 df0:	e8 64 fe ff ff       	call   c59 <putc>
          s++;
 df5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 df8:	0f b6 16             	movzbl (%esi),%edx
 dfb:	84 d2                	test   %dl,%dl
 dfd:	75 eb                	jne    dea <printf+0xec>
      state = 0;
 dff:	be 00 00 00 00       	mov    $0x0,%esi
 e04:	e9 21 ff ff ff       	jmp    d2a <printf+0x2c>
        putc(fd, *ap);
 e09:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 e0c:	0f be 17             	movsbl (%edi),%edx
 e0f:	8b 45 08             	mov    0x8(%ebp),%eax
 e12:	e8 42 fe ff ff       	call   c59 <putc>
        ap++;
 e17:	83 c7 04             	add    $0x4,%edi
 e1a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 e1d:	be 00 00 00 00       	mov    $0x0,%esi
 e22:	e9 03 ff ff ff       	jmp    d2a <printf+0x2c>
        putc(fd, c);
 e27:	89 fa                	mov    %edi,%edx
 e29:	8b 45 08             	mov    0x8(%ebp),%eax
 e2c:	e8 28 fe ff ff       	call   c59 <putc>
      state = 0;
 e31:	be 00 00 00 00       	mov    $0x0,%esi
 e36:	e9 ef fe ff ff       	jmp    d2a <printf+0x2c>
        putc(fd, '%');
 e3b:	ba 25 00 00 00       	mov    $0x25,%edx
 e40:	8b 45 08             	mov    0x8(%ebp),%eax
 e43:	e8 11 fe ff ff       	call   c59 <putc>
        putc(fd, c);
 e48:	89 fa                	mov    %edi,%edx
 e4a:	8b 45 08             	mov    0x8(%ebp),%eax
 e4d:	e8 07 fe ff ff       	call   c59 <putc>
      state = 0;
 e52:	be 00 00 00 00       	mov    $0x0,%esi
 e57:	e9 ce fe ff ff       	jmp    d2a <printf+0x2c>
    }
  }
}
 e5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e5f:	5b                   	pop    %ebx
 e60:	5e                   	pop    %esi
 e61:	5f                   	pop    %edi
 e62:	5d                   	pop    %ebp
 e63:	c3                   	ret    

00000e64 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 e64:	55                   	push   %ebp
 e65:	89 e5                	mov    %esp,%ebp
 e67:	57                   	push   %edi
 e68:	56                   	push   %esi
 e69:	53                   	push   %ebx
 e6a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 e6d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 e70:	a1 a4 17 00 00       	mov    0x17a4,%eax
 e75:	eb 02                	jmp    e79 <free+0x15>
 e77:	89 d0                	mov    %edx,%eax
 e79:	39 c8                	cmp    %ecx,%eax
 e7b:	73 04                	jae    e81 <free+0x1d>
 e7d:	39 08                	cmp    %ecx,(%eax)
 e7f:	77 12                	ja     e93 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 e81:	8b 10                	mov    (%eax),%edx
 e83:	39 c2                	cmp    %eax,%edx
 e85:	77 f0                	ja     e77 <free+0x13>
 e87:	39 c8                	cmp    %ecx,%eax
 e89:	72 08                	jb     e93 <free+0x2f>
 e8b:	39 ca                	cmp    %ecx,%edx
 e8d:	77 04                	ja     e93 <free+0x2f>
 e8f:	89 d0                	mov    %edx,%eax
 e91:	eb e6                	jmp    e79 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 e93:	8b 73 fc             	mov    -0x4(%ebx),%esi
 e96:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 e99:	8b 10                	mov    (%eax),%edx
 e9b:	39 d7                	cmp    %edx,%edi
 e9d:	74 19                	je     eb8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 e9f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ea2:	8b 50 04             	mov    0x4(%eax),%edx
 ea5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ea8:	39 ce                	cmp    %ecx,%esi
 eaa:	74 1b                	je     ec7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 eac:	89 08                	mov    %ecx,(%eax)
  freep = p;
 eae:	a3 a4 17 00 00       	mov    %eax,0x17a4
}
 eb3:	5b                   	pop    %ebx
 eb4:	5e                   	pop    %esi
 eb5:	5f                   	pop    %edi
 eb6:	5d                   	pop    %ebp
 eb7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 eb8:	03 72 04             	add    0x4(%edx),%esi
 ebb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ebe:	8b 10                	mov    (%eax),%edx
 ec0:	8b 12                	mov    (%edx),%edx
 ec2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 ec5:	eb db                	jmp    ea2 <free+0x3e>
    p->s.size += bp->s.size;
 ec7:	03 53 fc             	add    -0x4(%ebx),%edx
 eca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ecd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 ed0:	89 10                	mov    %edx,(%eax)
 ed2:	eb da                	jmp    eae <free+0x4a>

00000ed4 <morecore>:

static Header*
morecore(uint nu)
{
 ed4:	55                   	push   %ebp
 ed5:	89 e5                	mov    %esp,%ebp
 ed7:	53                   	push   %ebx
 ed8:	83 ec 04             	sub    $0x4,%esp
 edb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 edd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 ee2:	77 05                	ja     ee9 <morecore+0x15>
    nu = 4096;
 ee4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 ee9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 ef0:	83 ec 0c             	sub    $0xc,%esp
 ef3:	50                   	push   %eax
 ef4:	e8 38 fd ff ff       	call   c31 <sbrk>
  if(p == (char*)-1)
 ef9:	83 c4 10             	add    $0x10,%esp
 efc:	83 f8 ff             	cmp    $0xffffffff,%eax
 eff:	74 1c                	je     f1d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 f01:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 f04:	83 c0 08             	add    $0x8,%eax
 f07:	83 ec 0c             	sub    $0xc,%esp
 f0a:	50                   	push   %eax
 f0b:	e8 54 ff ff ff       	call   e64 <free>
  return freep;
 f10:	a1 a4 17 00 00       	mov    0x17a4,%eax
 f15:	83 c4 10             	add    $0x10,%esp
}
 f18:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f1b:	c9                   	leave  
 f1c:	c3                   	ret    
    return 0;
 f1d:	b8 00 00 00 00       	mov    $0x0,%eax
 f22:	eb f4                	jmp    f18 <morecore+0x44>

00000f24 <malloc>:

void*
malloc(uint nbytes)
{
 f24:	55                   	push   %ebp
 f25:	89 e5                	mov    %esp,%ebp
 f27:	53                   	push   %ebx
 f28:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 f2b:	8b 45 08             	mov    0x8(%ebp),%eax
 f2e:	8d 58 07             	lea    0x7(%eax),%ebx
 f31:	c1 eb 03             	shr    $0x3,%ebx
 f34:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 f37:	8b 0d a4 17 00 00    	mov    0x17a4,%ecx
 f3d:	85 c9                	test   %ecx,%ecx
 f3f:	74 04                	je     f45 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f41:	8b 01                	mov    (%ecx),%eax
 f43:	eb 4a                	jmp    f8f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 f45:	c7 05 a4 17 00 00 a8 	movl   $0x17a8,0x17a4
 f4c:	17 00 00 
 f4f:	c7 05 a8 17 00 00 a8 	movl   $0x17a8,0x17a8
 f56:	17 00 00 
    base.s.size = 0;
 f59:	c7 05 ac 17 00 00 00 	movl   $0x0,0x17ac
 f60:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 f63:	b9 a8 17 00 00       	mov    $0x17a8,%ecx
 f68:	eb d7                	jmp    f41 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 f6a:	74 19                	je     f85 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 f6c:	29 da                	sub    %ebx,%edx
 f6e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 f71:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 f74:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 f77:	89 0d a4 17 00 00    	mov    %ecx,0x17a4
      return (void*)(p + 1);
 f7d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 f80:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f83:	c9                   	leave  
 f84:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 f85:	8b 10                	mov    (%eax),%edx
 f87:	89 11                	mov    %edx,(%ecx)
 f89:	eb ec                	jmp    f77 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f8b:	89 c1                	mov    %eax,%ecx
 f8d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 f8f:	8b 50 04             	mov    0x4(%eax),%edx
 f92:	39 da                	cmp    %ebx,%edx
 f94:	73 d4                	jae    f6a <malloc+0x46>
    if(p == freep)
 f96:	39 05 a4 17 00 00    	cmp    %eax,0x17a4
 f9c:	75 ed                	jne    f8b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 f9e:	89 d8                	mov    %ebx,%eax
 fa0:	e8 2f ff ff ff       	call   ed4 <morecore>
 fa5:	85 c0                	test   %eax,%eax
 fa7:	75 e2                	jne    f8b <malloc+0x67>
 fa9:	eb d5                	jmp    f80 <malloc+0x5c>
