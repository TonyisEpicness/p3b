
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
   e:	68 e4 0f 00 00       	push   $0xfe4
  13:	6a 02                	push   $0x2
  15:	e8 1b 0d 00 00       	call   d35 <printf>
  memset(buf, 0, nbuf);
  1a:	83 c4 0c             	add    $0xc,%esp
  1d:	56                   	push   %esi
  1e:	6a 00                	push   $0x0
  20:	53                   	push   %ebx
  21:	e8 7f 0a 00 00       	call   aa5 <memset>
  gets(buf, nbuf);
  26:	83 c4 08             	add    $0x8,%esp
  29:	56                   	push   %esi
  2a:	53                   	push   %ebx
  2b:	e8 b1 0a 00 00       	call   ae1 <gets>
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
  54:	68 81 10 00 00       	push   $0x1081
  59:	6a 02                	push   $0x2
  5b:	e8 d5 0c 00 00       	call   d35 <printf>
  exit();
  60:	e8 7b 0b 00 00       	call   be0 <exit>

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
  6b:	e8 68 0b 00 00       	call   bd8 <fork>
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
  7a:	68 e7 0f 00 00       	push   $0xfe7
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
  99:	ff 24 85 9c 10 00 00 	jmp    *0x109c(,%eax,4)
    exit();
  a0:	e8 3b 0b 00 00       	call   be0 <exit>
    panic("runcmd");
  a5:	83 ec 0c             	sub    $0xc,%esp
  a8:	68 ec 0f 00 00       	push   $0xfec
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
  c1:	e8 52 0b 00 00       	call   c18 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
  c6:	83 c4 0c             	add    $0xc,%esp
  c9:	ff 73 04             	push   0x4(%ebx)
  cc:	68 f3 0f 00 00       	push   $0xff3
  d1:	6a 02                	push   $0x2
  d3:	e8 5d 0c 00 00       	call   d35 <printf>
    break;
  d8:	83 c4 10             	add    $0x10,%esp
  exit();
  db:	e8 00 0b 00 00       	call   be0 <exit>
      exit();
  e0:	e8 fb 0a 00 00       	call   be0 <exit>
    close(rcmd->fd);
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	ff 73 14             	push   0x14(%ebx)
  eb:	e8 18 0b 00 00       	call   c08 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
  f0:	83 c4 08             	add    $0x8,%esp
  f3:	ff 73 10             	push   0x10(%ebx)
  f6:	ff 73 08             	push   0x8(%ebx)
  f9:	e8 22 0b 00 00       	call   c20 <open>
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
 116:	68 03 10 00 00       	push   $0x1003
 11b:	6a 02                	push   $0x2
 11d:	e8 13 0c 00 00       	call   d35 <printf>
      exit();
 122:	e8 b9 0a 00 00       	call   be0 <exit>
    if(fork1() == 0)
 127:	e8 39 ff ff ff       	call   65 <fork1>
 12c:	85 c0                	test   %eax,%eax
 12e:	74 10                	je     140 <runcmd+0xbc>
    wait();
 130:	e8 b3 0a 00 00       	call   be8 <wait>
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
 152:	e8 99 0a 00 00       	call   bf0 <pipe>
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
 176:	e8 8d 0a 00 00       	call   c08 <close>
    close(p[1]);
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 75 f4             	push   -0xc(%ebp)
 181:	e8 82 0a 00 00       	call   c08 <close>
    wait();
 186:	e8 5d 0a 00 00       	call   be8 <wait>
    wait();
 18b:	e8 58 0a 00 00       	call   be8 <wait>
    break;
 190:	83 c4 10             	add    $0x10,%esp
 193:	e9 43 ff ff ff       	jmp    db <runcmd+0x57>
      panic("pipe");
 198:	83 ec 0c             	sub    $0xc,%esp
 19b:	68 13 10 00 00       	push   $0x1013
 1a0:	e8 a6 fe ff ff       	call   4b <panic>
      close(1);
 1a5:	83 ec 0c             	sub    $0xc,%esp
 1a8:	6a 01                	push   $0x1
 1aa:	e8 59 0a 00 00       	call   c08 <close>
      dup(p[1]);
 1af:	83 c4 04             	add    $0x4,%esp
 1b2:	ff 75 f4             	push   -0xc(%ebp)
 1b5:	e8 9e 0a 00 00       	call   c58 <dup>
      close(p[0]);
 1ba:	83 c4 04             	add    $0x4,%esp
 1bd:	ff 75 f0             	push   -0x10(%ebp)
 1c0:	e8 43 0a 00 00       	call   c08 <close>
      close(p[1]);
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 75 f4             	push   -0xc(%ebp)
 1cb:	e8 38 0a 00 00       	call   c08 <close>
      runcmd(pcmd->left);
 1d0:	83 c4 04             	add    $0x4,%esp
 1d3:	ff 73 04             	push   0x4(%ebx)
 1d6:	e8 a9 fe ff ff       	call   84 <runcmd>
      close(0);
 1db:	83 ec 0c             	sub    $0xc,%esp
 1de:	6a 00                	push   $0x0
 1e0:	e8 23 0a 00 00       	call   c08 <close>
      dup(p[0]);
 1e5:	83 c4 04             	add    $0x4,%esp
 1e8:	ff 75 f0             	push   -0x10(%ebp)
 1eb:	e8 68 0a 00 00       	call   c58 <dup>
      close(p[0]);
 1f0:	83 c4 04             	add    $0x4,%esp
 1f3:	ff 75 f0             	push   -0x10(%ebp)
 1f6:	e8 0d 0a 00 00       	call   c08 <close>
      close(p[1]);
 1fb:	83 c4 04             	add    $0x4,%esp
 1fe:	ff 75 f4             	push   -0xc(%ebp)
 201:	e8 02 0a 00 00       	call   c08 <close>
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
 232:	e8 24 0d 00 00       	call   f5b <malloc>
 237:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 239:	83 c4 0c             	add    $0xc,%esp
 23c:	6a 54                	push   $0x54
 23e:	6a 00                	push   $0x0
 240:	50                   	push   %eax
 241:	e8 5f 08 00 00       	call   aa5 <memset>
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
 25c:	e8 fa 0c 00 00       	call   f5b <malloc>
 261:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 263:	83 c4 0c             	add    $0xc,%esp
 266:	6a 18                	push   $0x18
 268:	6a 00                	push   $0x0
 26a:	50                   	push   %eax
 26b:	e8 35 08 00 00       	call   aa5 <memset>
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
 2a4:	e8 b2 0c 00 00       	call   f5b <malloc>
 2a9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 2ab:	83 c4 0c             	add    $0xc,%esp
 2ae:	6a 0c                	push   $0xc
 2b0:	6a 00                	push   $0x0
 2b2:	50                   	push   %eax
 2b3:	e8 ed 07 00 00       	call   aa5 <memset>
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
 2da:	e8 7c 0c 00 00       	call   f5b <malloc>
 2df:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 2e1:	83 c4 0c             	add    $0xc,%esp
 2e4:	6a 0c                	push   $0xc
 2e6:	6a 00                	push   $0x0
 2e8:	50                   	push   %eax
 2e9:	e8 b7 07 00 00       	call   aa5 <memset>
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
 310:	e8 46 0c 00 00       	call   f5b <malloc>
 315:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 317:	83 c4 0c             	add    $0xc,%esp
 31a:	6a 08                	push   $0x8
 31c:	6a 00                	push   $0x0
 31e:	50                   	push   %eax
 31f:	e8 81 07 00 00       	call   aa5 <memset>
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
 35b:	68 74 17 00 00       	push   $0x1774
 360:	e8 59 07 00 00       	call   abe <strchr>
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
 3d2:	68 74 17 00 00       	push   $0x1774
 3d7:	e8 e2 06 00 00       	call   abe <strchr>
 3dc:	83 c4 10             	add    $0x10,%esp
 3df:	85 c0                	test   %eax,%eax
 3e1:	75 26                	jne    409 <gettoken+0xd2>
 3e3:	83 ec 08             	sub    $0x8,%esp
 3e6:	0f be 03             	movsbl (%ebx),%eax
 3e9:	50                   	push   %eax
 3ea:	68 6c 17 00 00       	push   $0x176c
 3ef:	e8 ca 06 00 00       	call   abe <strchr>
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
 41e:	68 74 17 00 00       	push   $0x1774
 423:	e8 96 06 00 00       	call   abe <strchr>
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
 45f:	68 74 17 00 00       	push   $0x1774
 464:	e8 55 06 00 00       	call   abe <strchr>
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
 490:	e8 29 06 00 00       	call   abe <strchr>
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
 4be:	68 18 10 00 00       	push   $0x1018
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
 4e6:	68 35 10 00 00       	push   $0x1035
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
 589:	68 38 10 00 00       	push   $0x1038
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
 5d7:	68 3a 10 00 00       	push   $0x103a
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
 5f7:	68 4f 10 00 00       	push   $0x104f
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
 641:	68 41 10 00 00       	push   $0x1041
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
 67e:	68 54 10 00 00       	push   $0x1054
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
 6f9:	68 56 10 00 00       	push   $0x1056
 6fe:	57                   	push   %edi
 6ff:	56                   	push   %esi
 700:	e8 39 fd ff ff       	call   43e <peek>
 705:	83 c4 10             	add    $0x10,%esp
 708:	85 c0                	test   %eax,%eax
 70a:	75 d2                	jne    6de <parseline+0x1d>
  if(peek(ps, es, ";")){
 70c:	83 ec 04             	sub    $0x4,%esp
 70f:	68 52 10 00 00       	push   $0x1052
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
 761:	68 38 10 00 00       	push   $0x1038
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
 78e:	68 74 10 00 00       	push   $0x1074
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
 7c2:	68 58 10 00 00       	push   $0x1058
 7c7:	e8 7f f8 ff ff       	call   4b <panic>
    panic("syntax - missing )");
 7cc:	83 ec 0c             	sub    $0xc,%esp
 7cf:	68 63 10 00 00       	push   $0x1063
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
 7ee:	ff 24 85 b4 10 00 00 	jmp    *0x10b4(,%eax,4)
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
 87c:	e8 0c 02 00 00       	call   a8d <strlen>
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
 895:	68 02 10 00 00       	push   $0x1002
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
 8c4:	68 76 10 00 00       	push   $0x1076
 8c9:	6a 02                	push   $0x2
 8cb:	e8 65 04 00 00       	call   d35 <printf>
    panic("syntax");
 8d0:	c7 04 24 3a 10 00 00 	movl   $0x103a,(%esp)
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
 8f2:	68 85 10 00 00       	push   $0x1085
 8f7:	e8 24 03 00 00       	call   c20 <open>
 8fc:	83 c4 10             	add    $0x10,%esp
 8ff:	85 c0                	test   %eax,%eax
 901:	78 21                	js     924 <main+0x48>
    if(fd >= 3){
 903:	83 f8 02             	cmp    $0x2,%eax
 906:	7e e5                	jle    8ed <main+0x11>
      close(fd);
 908:	83 ec 0c             	sub    $0xc,%esp
 90b:	50                   	push   %eax
 90c:	e8 f7 02 00 00       	call   c08 <close>
      break;
 911:	83 c4 10             	add    $0x10,%esp
 914:	eb 0e                	jmp    924 <main+0x48>
    if(fork1() == 0)
 916:	e8 4a f7 ff ff       	call   65 <fork1>
 91b:	85 c0                	test   %eax,%eax
 91d:	74 76                	je     995 <main+0xb9>
    wait();
 91f:	e8 c4 02 00 00       	call   be8 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
 924:	83 ec 08             	sub    $0x8,%esp
 927:	6a 64                	push   $0x64
 929:	68 80 17 00 00       	push   $0x1780
 92e:	e8 cd f6 ff ff       	call   0 <getcmd>
 933:	83 c4 10             	add    $0x10,%esp
 936:	85 c0                	test   %eax,%eax
 938:	78 70                	js     9aa <main+0xce>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
 93a:	80 3d 80 17 00 00 63 	cmpb   $0x63,0x1780
 941:	75 d3                	jne    916 <main+0x3a>
 943:	80 3d 81 17 00 00 64 	cmpb   $0x64,0x1781
 94a:	75 ca                	jne    916 <main+0x3a>
 94c:	80 3d 82 17 00 00 20 	cmpb   $0x20,0x1782
 953:	75 c1                	jne    916 <main+0x3a>
      buf[strlen(buf)-1] = 0;  // chop \n
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	68 80 17 00 00       	push   $0x1780
 95d:	e8 2b 01 00 00       	call   a8d <strlen>
 962:	c6 80 7f 17 00 00 00 	movb   $0x0,0x177f(%eax)
      if(chdir(buf+3) < 0)
 969:	c7 04 24 83 17 00 00 	movl   $0x1783,(%esp)
 970:	e8 db 02 00 00       	call   c50 <chdir>
 975:	83 c4 10             	add    $0x10,%esp
 978:	85 c0                	test   %eax,%eax
 97a:	79 a8                	jns    924 <main+0x48>
        printf(2, "cannot cd %s\n", buf+3);
 97c:	83 ec 04             	sub    $0x4,%esp
 97f:	68 83 17 00 00       	push   $0x1783
 984:	68 8d 10 00 00       	push   $0x108d
 989:	6a 02                	push   $0x2
 98b:	e8 a5 03 00 00       	call   d35 <printf>
 990:	83 c4 10             	add    $0x10,%esp
      continue;
 993:	eb 8f                	jmp    924 <main+0x48>
      runcmd(parsecmd(buf));
 995:	83 ec 0c             	sub    $0xc,%esp
 998:	68 80 17 00 00       	push   $0x1780
 99d:	e8 ce fe ff ff       	call   870 <parsecmd>
 9a2:	89 04 24             	mov    %eax,(%esp)
 9a5:	e8 da f6 ff ff       	call   84 <runcmd>
  exit();
 9aa:	e8 31 02 00 00       	call   be0 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 9c6:	68 00 20 00 00       	push   $0x2000
 9cb:	e8 8b 05 00 00       	call   f5b <malloc>
  if(n_stack == 0){
 9d0:	83 c4 10             	add    $0x10,%esp
 9d3:	85 c0                	test   %eax,%eax
 9d5:	74 14                	je     9eb <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 9d7:	50                   	push   %eax
 9d8:	ff 75 10             	push   0x10(%ebp)
 9db:	ff 75 0c             	push   0xc(%ebp)
 9de:	ff 75 08             	push   0x8(%ebp)
 9e1:	e8 9a 02 00 00       	call   c80 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 9e6:	83 c4 10             	add    $0x10,%esp
}
 9e9:	c9                   	leave  
 9ea:	c3                   	ret    
    return -1;
 9eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9f0:	eb f7                	jmp    9e9 <thread_create+0x29>

000009f2 <thread_join>:

int thread_join() {
 9f2:	55                   	push   %ebp
 9f3:	89 e5                	mov    %esp,%ebp
 9f5:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 9f8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 9fb:	50                   	push   %eax
 9fc:	e8 87 02 00 00       	call   c88 <join>
  
  return pid;
}
 a01:	c9                   	leave  
 a02:	c3                   	ret    

00000a03 <lock_acquire>:

void lock_acquire(lock_t *lock){
 a03:	55                   	push   %ebp
 a04:	89 e5                	mov    %esp,%ebp
 a06:	53                   	push   %ebx
 a07:	83 ec 04             	sub    $0x4,%esp
 a0a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 a0d:	83 ec 08             	sub    $0x8,%esp
 a10:	6a 01                	push   $0x1
 a12:	53                   	push   %ebx
 a13:	e8 97 ff ff ff       	call   9af <test_and_set>
 a18:	83 c4 10             	add    $0x10,%esp
 a1b:	83 f8 01             	cmp    $0x1,%eax
 a1e:	74 ed                	je     a0d <lock_acquire+0xa>
    ;
}
 a20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a23:	c9                   	leave  
 a24:	c3                   	ret    

00000a25 <lock_release>:

void lock_release(lock_t *lock) {
 a25:	55                   	push   %ebp
 a26:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 a28:	8b 45 08             	mov    0x8(%ebp),%eax
 a2b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a31:	5d                   	pop    %ebp
 a32:	c3                   	ret    

00000a33 <lock_init>:

void lock_init(lock_t *lock) {
 a33:	55                   	push   %ebp
 a34:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 a36:	8b 45 08             	mov    0x8(%ebp),%eax
 a39:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a3f:	5d                   	pop    %ebp
 a40:	c3                   	ret    

00000a41 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 a41:	55                   	push   %ebp
 a42:	89 e5                	mov    %esp,%ebp
 a44:	56                   	push   %esi
 a45:	53                   	push   %ebx
 a46:	8b 75 08             	mov    0x8(%ebp),%esi
 a49:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 a4c:	89 f0                	mov    %esi,%eax
 a4e:	89 d1                	mov    %edx,%ecx
 a50:	83 c2 01             	add    $0x1,%edx
 a53:	89 c3                	mov    %eax,%ebx
 a55:	83 c0 01             	add    $0x1,%eax
 a58:	0f b6 09             	movzbl (%ecx),%ecx
 a5b:	88 0b                	mov    %cl,(%ebx)
 a5d:	84 c9                	test   %cl,%cl
 a5f:	75 ed                	jne    a4e <strcpy+0xd>
    ;
  return os;
}
 a61:	89 f0                	mov    %esi,%eax
 a63:	5b                   	pop    %ebx
 a64:	5e                   	pop    %esi
 a65:	5d                   	pop    %ebp
 a66:	c3                   	ret    

00000a67 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 a67:	55                   	push   %ebp
 a68:	89 e5                	mov    %esp,%ebp
 a6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a6d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 a70:	eb 06                	jmp    a78 <strcmp+0x11>
    p++, q++;
 a72:	83 c1 01             	add    $0x1,%ecx
 a75:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 a78:	0f b6 01             	movzbl (%ecx),%eax
 a7b:	84 c0                	test   %al,%al
 a7d:	74 04                	je     a83 <strcmp+0x1c>
 a7f:	3a 02                	cmp    (%edx),%al
 a81:	74 ef                	je     a72 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 a83:	0f b6 c0             	movzbl %al,%eax
 a86:	0f b6 12             	movzbl (%edx),%edx
 a89:	29 d0                	sub    %edx,%eax
}
 a8b:	5d                   	pop    %ebp
 a8c:	c3                   	ret    

00000a8d <strlen>:

uint
strlen(const char *s)
{
 a8d:	55                   	push   %ebp
 a8e:	89 e5                	mov    %esp,%ebp
 a90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 a93:	b8 00 00 00 00       	mov    $0x0,%eax
 a98:	eb 03                	jmp    a9d <strlen+0x10>
 a9a:	83 c0 01             	add    $0x1,%eax
 a9d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 aa1:	75 f7                	jne    a9a <strlen+0xd>
    ;
  return n;
}
 aa3:	5d                   	pop    %ebp
 aa4:	c3                   	ret    

00000aa5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 aa5:	55                   	push   %ebp
 aa6:	89 e5                	mov    %esp,%ebp
 aa8:	57                   	push   %edi
 aa9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 aac:	89 d7                	mov    %edx,%edi
 aae:	8b 4d 10             	mov    0x10(%ebp),%ecx
 ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
 ab4:	fc                   	cld    
 ab5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 ab7:	89 d0                	mov    %edx,%eax
 ab9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 abc:	c9                   	leave  
 abd:	c3                   	ret    

00000abe <strchr>:

char*
strchr(const char *s, char c)
{
 abe:	55                   	push   %ebp
 abf:	89 e5                	mov    %esp,%ebp
 ac1:	8b 45 08             	mov    0x8(%ebp),%eax
 ac4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 ac8:	eb 03                	jmp    acd <strchr+0xf>
 aca:	83 c0 01             	add    $0x1,%eax
 acd:	0f b6 10             	movzbl (%eax),%edx
 ad0:	84 d2                	test   %dl,%dl
 ad2:	74 06                	je     ada <strchr+0x1c>
    if(*s == c)
 ad4:	38 ca                	cmp    %cl,%dl
 ad6:	75 f2                	jne    aca <strchr+0xc>
 ad8:	eb 05                	jmp    adf <strchr+0x21>
      return (char*)s;
  return 0;
 ada:	b8 00 00 00 00       	mov    $0x0,%eax
}
 adf:	5d                   	pop    %ebp
 ae0:	c3                   	ret    

00000ae1 <gets>:

char*
gets(char *buf, int max)
{
 ae1:	55                   	push   %ebp
 ae2:	89 e5                	mov    %esp,%ebp
 ae4:	57                   	push   %edi
 ae5:	56                   	push   %esi
 ae6:	53                   	push   %ebx
 ae7:	83 ec 1c             	sub    $0x1c,%esp
 aea:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 aed:	bb 00 00 00 00       	mov    $0x0,%ebx
 af2:	89 de                	mov    %ebx,%esi
 af4:	83 c3 01             	add    $0x1,%ebx
 af7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 afa:	7d 2e                	jge    b2a <gets+0x49>
    cc = read(0, &c, 1);
 afc:	83 ec 04             	sub    $0x4,%esp
 aff:	6a 01                	push   $0x1
 b01:	8d 45 e7             	lea    -0x19(%ebp),%eax
 b04:	50                   	push   %eax
 b05:	6a 00                	push   $0x0
 b07:	e8 ec 00 00 00       	call   bf8 <read>
    if(cc < 1)
 b0c:	83 c4 10             	add    $0x10,%esp
 b0f:	85 c0                	test   %eax,%eax
 b11:	7e 17                	jle    b2a <gets+0x49>
      break;
    buf[i++] = c;
 b13:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 b17:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 b1a:	3c 0a                	cmp    $0xa,%al
 b1c:	0f 94 c2             	sete   %dl
 b1f:	3c 0d                	cmp    $0xd,%al
 b21:	0f 94 c0             	sete   %al
 b24:	08 c2                	or     %al,%dl
 b26:	74 ca                	je     af2 <gets+0x11>
    buf[i++] = c;
 b28:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 b2a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 b2e:	89 f8                	mov    %edi,%eax
 b30:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b33:	5b                   	pop    %ebx
 b34:	5e                   	pop    %esi
 b35:	5f                   	pop    %edi
 b36:	5d                   	pop    %ebp
 b37:	c3                   	ret    

00000b38 <stat>:

int
stat(const char *n, struct stat *st)
{
 b38:	55                   	push   %ebp
 b39:	89 e5                	mov    %esp,%ebp
 b3b:	56                   	push   %esi
 b3c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 b3d:	83 ec 08             	sub    $0x8,%esp
 b40:	6a 00                	push   $0x0
 b42:	ff 75 08             	push   0x8(%ebp)
 b45:	e8 d6 00 00 00       	call   c20 <open>
  if(fd < 0)
 b4a:	83 c4 10             	add    $0x10,%esp
 b4d:	85 c0                	test   %eax,%eax
 b4f:	78 24                	js     b75 <stat+0x3d>
 b51:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 b53:	83 ec 08             	sub    $0x8,%esp
 b56:	ff 75 0c             	push   0xc(%ebp)
 b59:	50                   	push   %eax
 b5a:	e8 d9 00 00 00       	call   c38 <fstat>
 b5f:	89 c6                	mov    %eax,%esi
  close(fd);
 b61:	89 1c 24             	mov    %ebx,(%esp)
 b64:	e8 9f 00 00 00       	call   c08 <close>
  return r;
 b69:	83 c4 10             	add    $0x10,%esp
}
 b6c:	89 f0                	mov    %esi,%eax
 b6e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 b71:	5b                   	pop    %ebx
 b72:	5e                   	pop    %esi
 b73:	5d                   	pop    %ebp
 b74:	c3                   	ret    
    return -1;
 b75:	be ff ff ff ff       	mov    $0xffffffff,%esi
 b7a:	eb f0                	jmp    b6c <stat+0x34>

00000b7c <atoi>:

int
atoi(const char *s)
{
 b7c:	55                   	push   %ebp
 b7d:	89 e5                	mov    %esp,%ebp
 b7f:	53                   	push   %ebx
 b80:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 b83:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 b88:	eb 10                	jmp    b9a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 b8a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 b8d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 b90:	83 c1 01             	add    $0x1,%ecx
 b93:	0f be c0             	movsbl %al,%eax
 b96:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 b9a:	0f b6 01             	movzbl (%ecx),%eax
 b9d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 ba0:	80 fb 09             	cmp    $0x9,%bl
 ba3:	76 e5                	jbe    b8a <atoi+0xe>
  return n;
}
 ba5:	89 d0                	mov    %edx,%eax
 ba7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 baa:	c9                   	leave  
 bab:	c3                   	ret    

00000bac <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 bac:	55                   	push   %ebp
 bad:	89 e5                	mov    %esp,%ebp
 baf:	56                   	push   %esi
 bb0:	53                   	push   %ebx
 bb1:	8b 75 08             	mov    0x8(%ebp),%esi
 bb4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 bb7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 bba:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 bbc:	eb 0d                	jmp    bcb <memmove+0x1f>
    *dst++ = *src++;
 bbe:	0f b6 01             	movzbl (%ecx),%eax
 bc1:	88 02                	mov    %al,(%edx)
 bc3:	8d 49 01             	lea    0x1(%ecx),%ecx
 bc6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 bc9:	89 d8                	mov    %ebx,%eax
 bcb:	8d 58 ff             	lea    -0x1(%eax),%ebx
 bce:	85 c0                	test   %eax,%eax
 bd0:	7f ec                	jg     bbe <memmove+0x12>
  return vdst;
}
 bd2:	89 f0                	mov    %esi,%eax
 bd4:	5b                   	pop    %ebx
 bd5:	5e                   	pop    %esi
 bd6:	5d                   	pop    %ebp
 bd7:	c3                   	ret    

00000bd8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 bd8:	b8 01 00 00 00       	mov    $0x1,%eax
 bdd:	cd 40                	int    $0x40
 bdf:	c3                   	ret    

00000be0 <exit>:
SYSCALL(exit)
 be0:	b8 02 00 00 00       	mov    $0x2,%eax
 be5:	cd 40                	int    $0x40
 be7:	c3                   	ret    

00000be8 <wait>:
SYSCALL(wait)
 be8:	b8 03 00 00 00       	mov    $0x3,%eax
 bed:	cd 40                	int    $0x40
 bef:	c3                   	ret    

00000bf0 <pipe>:
SYSCALL(pipe)
 bf0:	b8 04 00 00 00       	mov    $0x4,%eax
 bf5:	cd 40                	int    $0x40
 bf7:	c3                   	ret    

00000bf8 <read>:
SYSCALL(read)
 bf8:	b8 05 00 00 00       	mov    $0x5,%eax
 bfd:	cd 40                	int    $0x40
 bff:	c3                   	ret    

00000c00 <write>:
SYSCALL(write)
 c00:	b8 10 00 00 00       	mov    $0x10,%eax
 c05:	cd 40                	int    $0x40
 c07:	c3                   	ret    

00000c08 <close>:
SYSCALL(close)
 c08:	b8 15 00 00 00       	mov    $0x15,%eax
 c0d:	cd 40                	int    $0x40
 c0f:	c3                   	ret    

00000c10 <kill>:
SYSCALL(kill)
 c10:	b8 06 00 00 00       	mov    $0x6,%eax
 c15:	cd 40                	int    $0x40
 c17:	c3                   	ret    

00000c18 <exec>:
SYSCALL(exec)
 c18:	b8 07 00 00 00       	mov    $0x7,%eax
 c1d:	cd 40                	int    $0x40
 c1f:	c3                   	ret    

00000c20 <open>:
SYSCALL(open)
 c20:	b8 0f 00 00 00       	mov    $0xf,%eax
 c25:	cd 40                	int    $0x40
 c27:	c3                   	ret    

00000c28 <mknod>:
SYSCALL(mknod)
 c28:	b8 11 00 00 00       	mov    $0x11,%eax
 c2d:	cd 40                	int    $0x40
 c2f:	c3                   	ret    

00000c30 <unlink>:
SYSCALL(unlink)
 c30:	b8 12 00 00 00       	mov    $0x12,%eax
 c35:	cd 40                	int    $0x40
 c37:	c3                   	ret    

00000c38 <fstat>:
SYSCALL(fstat)
 c38:	b8 08 00 00 00       	mov    $0x8,%eax
 c3d:	cd 40                	int    $0x40
 c3f:	c3                   	ret    

00000c40 <link>:
SYSCALL(link)
 c40:	b8 13 00 00 00       	mov    $0x13,%eax
 c45:	cd 40                	int    $0x40
 c47:	c3                   	ret    

00000c48 <mkdir>:
SYSCALL(mkdir)
 c48:	b8 14 00 00 00       	mov    $0x14,%eax
 c4d:	cd 40                	int    $0x40
 c4f:	c3                   	ret    

00000c50 <chdir>:
SYSCALL(chdir)
 c50:	b8 09 00 00 00       	mov    $0x9,%eax
 c55:	cd 40                	int    $0x40
 c57:	c3                   	ret    

00000c58 <dup>:
SYSCALL(dup)
 c58:	b8 0a 00 00 00       	mov    $0xa,%eax
 c5d:	cd 40                	int    $0x40
 c5f:	c3                   	ret    

00000c60 <getpid>:
SYSCALL(getpid)
 c60:	b8 0b 00 00 00       	mov    $0xb,%eax
 c65:	cd 40                	int    $0x40
 c67:	c3                   	ret    

00000c68 <sbrk>:
SYSCALL(sbrk)
 c68:	b8 0c 00 00 00       	mov    $0xc,%eax
 c6d:	cd 40                	int    $0x40
 c6f:	c3                   	ret    

00000c70 <sleep>:
SYSCALL(sleep)
 c70:	b8 0d 00 00 00       	mov    $0xd,%eax
 c75:	cd 40                	int    $0x40
 c77:	c3                   	ret    

00000c78 <uptime>:
SYSCALL(uptime)
 c78:	b8 0e 00 00 00       	mov    $0xe,%eax
 c7d:	cd 40                	int    $0x40
 c7f:	c3                   	ret    

00000c80 <clone>:
SYSCALL(clone)
 c80:	b8 16 00 00 00       	mov    $0x16,%eax
 c85:	cd 40                	int    $0x40
 c87:	c3                   	ret    

00000c88 <join>:
 c88:	b8 17 00 00 00       	mov    $0x17,%eax
 c8d:	cd 40                	int    $0x40
 c8f:	c3                   	ret    

00000c90 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 c90:	55                   	push   %ebp
 c91:	89 e5                	mov    %esp,%ebp
 c93:	83 ec 1c             	sub    $0x1c,%esp
 c96:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 c99:	6a 01                	push   $0x1
 c9b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 c9e:	52                   	push   %edx
 c9f:	50                   	push   %eax
 ca0:	e8 5b ff ff ff       	call   c00 <write>
}
 ca5:	83 c4 10             	add    $0x10,%esp
 ca8:	c9                   	leave  
 ca9:	c3                   	ret    

00000caa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 caa:	55                   	push   %ebp
 cab:	89 e5                	mov    %esp,%ebp
 cad:	57                   	push   %edi
 cae:	56                   	push   %esi
 caf:	53                   	push   %ebx
 cb0:	83 ec 2c             	sub    $0x2c,%esp
 cb3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 cb6:	89 d0                	mov    %edx,%eax
 cb8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 cba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 cbe:	0f 95 c1             	setne  %cl
 cc1:	c1 ea 1f             	shr    $0x1f,%edx
 cc4:	84 d1                	test   %dl,%cl
 cc6:	74 44                	je     d0c <printint+0x62>
    neg = 1;
    x = -xx;
 cc8:	f7 d8                	neg    %eax
 cca:	89 c1                	mov    %eax,%ecx
    neg = 1;
 ccc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 cd3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 cd8:	89 c8                	mov    %ecx,%eax
 cda:	ba 00 00 00 00       	mov    $0x0,%edx
 cdf:	f7 f6                	div    %esi
 ce1:	89 df                	mov    %ebx,%edi
 ce3:	83 c3 01             	add    $0x1,%ebx
 ce6:	0f b6 92 2c 11 00 00 	movzbl 0x112c(%edx),%edx
 ced:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 cf1:	89 ca                	mov    %ecx,%edx
 cf3:	89 c1                	mov    %eax,%ecx
 cf5:	39 d6                	cmp    %edx,%esi
 cf7:	76 df                	jbe    cd8 <printint+0x2e>
  if(neg)
 cf9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 cfd:	74 31                	je     d30 <printint+0x86>
    buf[i++] = '-';
 cff:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 d04:	8d 5f 02             	lea    0x2(%edi),%ebx
 d07:	8b 75 d0             	mov    -0x30(%ebp),%esi
 d0a:	eb 17                	jmp    d23 <printint+0x79>
    x = xx;
 d0c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 d0e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 d15:	eb bc                	jmp    cd3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 d17:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 d1c:	89 f0                	mov    %esi,%eax
 d1e:	e8 6d ff ff ff       	call   c90 <putc>
  while(--i >= 0)
 d23:	83 eb 01             	sub    $0x1,%ebx
 d26:	79 ef                	jns    d17 <printint+0x6d>
}
 d28:	83 c4 2c             	add    $0x2c,%esp
 d2b:	5b                   	pop    %ebx
 d2c:	5e                   	pop    %esi
 d2d:	5f                   	pop    %edi
 d2e:	5d                   	pop    %ebp
 d2f:	c3                   	ret    
 d30:	8b 75 d0             	mov    -0x30(%ebp),%esi
 d33:	eb ee                	jmp    d23 <printint+0x79>

00000d35 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 d35:	55                   	push   %ebp
 d36:	89 e5                	mov    %esp,%ebp
 d38:	57                   	push   %edi
 d39:	56                   	push   %esi
 d3a:	53                   	push   %ebx
 d3b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 d3e:	8d 45 10             	lea    0x10(%ebp),%eax
 d41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 d44:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 d49:	bb 00 00 00 00       	mov    $0x0,%ebx
 d4e:	eb 14                	jmp    d64 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 d50:	89 fa                	mov    %edi,%edx
 d52:	8b 45 08             	mov    0x8(%ebp),%eax
 d55:	e8 36 ff ff ff       	call   c90 <putc>
 d5a:	eb 05                	jmp    d61 <printf+0x2c>
      }
    } else if(state == '%'){
 d5c:	83 fe 25             	cmp    $0x25,%esi
 d5f:	74 25                	je     d86 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 d61:	83 c3 01             	add    $0x1,%ebx
 d64:	8b 45 0c             	mov    0xc(%ebp),%eax
 d67:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 d6b:	84 c0                	test   %al,%al
 d6d:	0f 84 20 01 00 00    	je     e93 <printf+0x15e>
    c = fmt[i] & 0xff;
 d73:	0f be f8             	movsbl %al,%edi
 d76:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 d79:	85 f6                	test   %esi,%esi
 d7b:	75 df                	jne    d5c <printf+0x27>
      if(c == '%'){
 d7d:	83 f8 25             	cmp    $0x25,%eax
 d80:	75 ce                	jne    d50 <printf+0x1b>
        state = '%';
 d82:	89 c6                	mov    %eax,%esi
 d84:	eb db                	jmp    d61 <printf+0x2c>
      if(c == 'd'){
 d86:	83 f8 25             	cmp    $0x25,%eax
 d89:	0f 84 cf 00 00 00    	je     e5e <printf+0x129>
 d8f:	0f 8c dd 00 00 00    	jl     e72 <printf+0x13d>
 d95:	83 f8 78             	cmp    $0x78,%eax
 d98:	0f 8f d4 00 00 00    	jg     e72 <printf+0x13d>
 d9e:	83 f8 63             	cmp    $0x63,%eax
 da1:	0f 8c cb 00 00 00    	jl     e72 <printf+0x13d>
 da7:	83 e8 63             	sub    $0x63,%eax
 daa:	83 f8 15             	cmp    $0x15,%eax
 dad:	0f 87 bf 00 00 00    	ja     e72 <printf+0x13d>
 db3:	ff 24 85 d4 10 00 00 	jmp    *0x10d4(,%eax,4)
        printint(fd, *ap, 10, 1);
 dba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 dbd:	8b 17                	mov    (%edi),%edx
 dbf:	83 ec 0c             	sub    $0xc,%esp
 dc2:	6a 01                	push   $0x1
 dc4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 dc9:	8b 45 08             	mov    0x8(%ebp),%eax
 dcc:	e8 d9 fe ff ff       	call   caa <printint>
        ap++;
 dd1:	83 c7 04             	add    $0x4,%edi
 dd4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 dd7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 dda:	be 00 00 00 00       	mov    $0x0,%esi
 ddf:	eb 80                	jmp    d61 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 de1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 de4:	8b 17                	mov    (%edi),%edx
 de6:	83 ec 0c             	sub    $0xc,%esp
 de9:	6a 00                	push   $0x0
 deb:	b9 10 00 00 00       	mov    $0x10,%ecx
 df0:	8b 45 08             	mov    0x8(%ebp),%eax
 df3:	e8 b2 fe ff ff       	call   caa <printint>
        ap++;
 df8:	83 c7 04             	add    $0x4,%edi
 dfb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 dfe:	83 c4 10             	add    $0x10,%esp
      state = 0;
 e01:	be 00 00 00 00       	mov    $0x0,%esi
 e06:	e9 56 ff ff ff       	jmp    d61 <printf+0x2c>
        s = (char*)*ap;
 e0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 e0e:	8b 30                	mov    (%eax),%esi
        ap++;
 e10:	83 c0 04             	add    $0x4,%eax
 e13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 e16:	85 f6                	test   %esi,%esi
 e18:	75 15                	jne    e2f <printf+0xfa>
          s = "(null)";
 e1a:	be cc 10 00 00       	mov    $0x10cc,%esi
 e1f:	eb 0e                	jmp    e2f <printf+0xfa>
          putc(fd, *s);
 e21:	0f be d2             	movsbl %dl,%edx
 e24:	8b 45 08             	mov    0x8(%ebp),%eax
 e27:	e8 64 fe ff ff       	call   c90 <putc>
          s++;
 e2c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 e2f:	0f b6 16             	movzbl (%esi),%edx
 e32:	84 d2                	test   %dl,%dl
 e34:	75 eb                	jne    e21 <printf+0xec>
      state = 0;
 e36:	be 00 00 00 00       	mov    $0x0,%esi
 e3b:	e9 21 ff ff ff       	jmp    d61 <printf+0x2c>
        putc(fd, *ap);
 e40:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 e43:	0f be 17             	movsbl (%edi),%edx
 e46:	8b 45 08             	mov    0x8(%ebp),%eax
 e49:	e8 42 fe ff ff       	call   c90 <putc>
        ap++;
 e4e:	83 c7 04             	add    $0x4,%edi
 e51:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 e54:	be 00 00 00 00       	mov    $0x0,%esi
 e59:	e9 03 ff ff ff       	jmp    d61 <printf+0x2c>
        putc(fd, c);
 e5e:	89 fa                	mov    %edi,%edx
 e60:	8b 45 08             	mov    0x8(%ebp),%eax
 e63:	e8 28 fe ff ff       	call   c90 <putc>
      state = 0;
 e68:	be 00 00 00 00       	mov    $0x0,%esi
 e6d:	e9 ef fe ff ff       	jmp    d61 <printf+0x2c>
        putc(fd, '%');
 e72:	ba 25 00 00 00       	mov    $0x25,%edx
 e77:	8b 45 08             	mov    0x8(%ebp),%eax
 e7a:	e8 11 fe ff ff       	call   c90 <putc>
        putc(fd, c);
 e7f:	89 fa                	mov    %edi,%edx
 e81:	8b 45 08             	mov    0x8(%ebp),%eax
 e84:	e8 07 fe ff ff       	call   c90 <putc>
      state = 0;
 e89:	be 00 00 00 00       	mov    $0x0,%esi
 e8e:	e9 ce fe ff ff       	jmp    d61 <printf+0x2c>
    }
  }
}
 e93:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e96:	5b                   	pop    %ebx
 e97:	5e                   	pop    %esi
 e98:	5f                   	pop    %edi
 e99:	5d                   	pop    %ebp
 e9a:	c3                   	ret    

00000e9b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 e9b:	55                   	push   %ebp
 e9c:	89 e5                	mov    %esp,%ebp
 e9e:	57                   	push   %edi
 e9f:	56                   	push   %esi
 ea0:	53                   	push   %ebx
 ea1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 ea4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ea7:	a1 e4 17 00 00       	mov    0x17e4,%eax
 eac:	eb 02                	jmp    eb0 <free+0x15>
 eae:	89 d0                	mov    %edx,%eax
 eb0:	39 c8                	cmp    %ecx,%eax
 eb2:	73 04                	jae    eb8 <free+0x1d>
 eb4:	39 08                	cmp    %ecx,(%eax)
 eb6:	77 12                	ja     eca <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 eb8:	8b 10                	mov    (%eax),%edx
 eba:	39 c2                	cmp    %eax,%edx
 ebc:	77 f0                	ja     eae <free+0x13>
 ebe:	39 c8                	cmp    %ecx,%eax
 ec0:	72 08                	jb     eca <free+0x2f>
 ec2:	39 ca                	cmp    %ecx,%edx
 ec4:	77 04                	ja     eca <free+0x2f>
 ec6:	89 d0                	mov    %edx,%eax
 ec8:	eb e6                	jmp    eb0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 eca:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ecd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ed0:	8b 10                	mov    (%eax),%edx
 ed2:	39 d7                	cmp    %edx,%edi
 ed4:	74 19                	je     eef <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ed6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ed9:	8b 50 04             	mov    0x4(%eax),%edx
 edc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 edf:	39 ce                	cmp    %ecx,%esi
 ee1:	74 1b                	je     efe <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ee3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 ee5:	a3 e4 17 00 00       	mov    %eax,0x17e4
}
 eea:	5b                   	pop    %ebx
 eeb:	5e                   	pop    %esi
 eec:	5f                   	pop    %edi
 eed:	5d                   	pop    %ebp
 eee:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 eef:	03 72 04             	add    0x4(%edx),%esi
 ef2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ef5:	8b 10                	mov    (%eax),%edx
 ef7:	8b 12                	mov    (%edx),%edx
 ef9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 efc:	eb db                	jmp    ed9 <free+0x3e>
    p->s.size += bp->s.size;
 efe:	03 53 fc             	add    -0x4(%ebx),%edx
 f01:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 f04:	8b 53 f8             	mov    -0x8(%ebx),%edx
 f07:	89 10                	mov    %edx,(%eax)
 f09:	eb da                	jmp    ee5 <free+0x4a>

00000f0b <morecore>:

static Header*
morecore(uint nu)
{
 f0b:	55                   	push   %ebp
 f0c:	89 e5                	mov    %esp,%ebp
 f0e:	53                   	push   %ebx
 f0f:	83 ec 04             	sub    $0x4,%esp
 f12:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 f14:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 f19:	77 05                	ja     f20 <morecore+0x15>
    nu = 4096;
 f1b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 f20:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 f27:	83 ec 0c             	sub    $0xc,%esp
 f2a:	50                   	push   %eax
 f2b:	e8 38 fd ff ff       	call   c68 <sbrk>
  if(p == (char*)-1)
 f30:	83 c4 10             	add    $0x10,%esp
 f33:	83 f8 ff             	cmp    $0xffffffff,%eax
 f36:	74 1c                	je     f54 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 f38:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 f3b:	83 c0 08             	add    $0x8,%eax
 f3e:	83 ec 0c             	sub    $0xc,%esp
 f41:	50                   	push   %eax
 f42:	e8 54 ff ff ff       	call   e9b <free>
  return freep;
 f47:	a1 e4 17 00 00       	mov    0x17e4,%eax
 f4c:	83 c4 10             	add    $0x10,%esp
}
 f4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f52:	c9                   	leave  
 f53:	c3                   	ret    
    return 0;
 f54:	b8 00 00 00 00       	mov    $0x0,%eax
 f59:	eb f4                	jmp    f4f <morecore+0x44>

00000f5b <malloc>:

void*
malloc(uint nbytes)
{
 f5b:	55                   	push   %ebp
 f5c:	89 e5                	mov    %esp,%ebp
 f5e:	53                   	push   %ebx
 f5f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 f62:	8b 45 08             	mov    0x8(%ebp),%eax
 f65:	8d 58 07             	lea    0x7(%eax),%ebx
 f68:	c1 eb 03             	shr    $0x3,%ebx
 f6b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 f6e:	8b 0d e4 17 00 00    	mov    0x17e4,%ecx
 f74:	85 c9                	test   %ecx,%ecx
 f76:	74 04                	je     f7c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f78:	8b 01                	mov    (%ecx),%eax
 f7a:	eb 4a                	jmp    fc6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 f7c:	c7 05 e4 17 00 00 e8 	movl   $0x17e8,0x17e4
 f83:	17 00 00 
 f86:	c7 05 e8 17 00 00 e8 	movl   $0x17e8,0x17e8
 f8d:	17 00 00 
    base.s.size = 0;
 f90:	c7 05 ec 17 00 00 00 	movl   $0x0,0x17ec
 f97:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 f9a:	b9 e8 17 00 00       	mov    $0x17e8,%ecx
 f9f:	eb d7                	jmp    f78 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 fa1:	74 19                	je     fbc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 fa3:	29 da                	sub    %ebx,%edx
 fa5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 fa8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 fab:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 fae:	89 0d e4 17 00 00    	mov    %ecx,0x17e4
      return (void*)(p + 1);
 fb4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 fb7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 fba:	c9                   	leave  
 fbb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 fbc:	8b 10                	mov    (%eax),%edx
 fbe:	89 11                	mov    %edx,(%ecx)
 fc0:	eb ec                	jmp    fae <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 fc2:	89 c1                	mov    %eax,%ecx
 fc4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 fc6:	8b 50 04             	mov    0x4(%eax),%edx
 fc9:	39 da                	cmp    %ebx,%edx
 fcb:	73 d4                	jae    fa1 <malloc+0x46>
    if(p == freep)
 fcd:	39 05 e4 17 00 00    	cmp    %eax,0x17e4
 fd3:	75 ed                	jne    fc2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 fd5:	89 d8                	mov    %ebx,%eax
 fd7:	e8 2f ff ff ff       	call   f0b <morecore>
 fdc:	85 c0                	test   %eax,%eax
 fde:	75 e2                	jne    fc2 <malloc+0x67>
 fe0:	eb d5                	jmp    fb7 <malloc+0x5c>
