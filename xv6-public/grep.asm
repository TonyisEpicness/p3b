
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  12:	83 ec 08             	sub    $0x8,%esp
  15:	53                   	push   %ebx
  16:	57                   	push   %edi
  17:	e8 2c 00 00 00       	call   48 <matchhere>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	75 18                	jne    3b <matchstar+0x3b>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  23:	0f b6 13             	movzbl (%ebx),%edx
  26:	84 d2                	test   %dl,%dl
  28:	74 16                	je     40 <matchstar+0x40>
  2a:	83 c3 01             	add    $0x1,%ebx
  2d:	0f be d2             	movsbl %dl,%edx
  30:	39 f2                	cmp    %esi,%edx
  32:	74 de                	je     12 <matchstar+0x12>
  34:	83 fe 2e             	cmp    $0x2e,%esi
  37:	74 d9                	je     12 <matchstar+0x12>
  39:	eb 05                	jmp    40 <matchstar+0x40>
      return 1;
  3b:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <matchhere>:
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  51:	0f b6 02             	movzbl (%edx),%eax
  54:	84 c0                	test   %al,%al
  56:	74 68                	je     c0 <matchhere+0x78>
  if(re[1] == '*')
  58:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  5c:	80 f9 2a             	cmp    $0x2a,%cl
  5f:	74 1d                	je     7e <matchhere+0x36>
  if(re[0] == '$' && re[1] == '\0')
  61:	3c 24                	cmp    $0x24,%al
  63:	74 31                	je     96 <matchhere+0x4e>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	84 c9                	test   %cl,%cl
  6d:	74 58                	je     c7 <matchhere+0x7f>
  6f:	3c 2e                	cmp    $0x2e,%al
  71:	74 35                	je     a8 <matchhere+0x60>
  73:	38 c8                	cmp    %cl,%al
  75:	74 31                	je     a8 <matchhere+0x60>
  return 0;
  77:	b8 00 00 00 00       	mov    $0x0,%eax
  7c:	eb 47                	jmp    c5 <matchhere+0x7d>
    return matchstar(re[0], re+2, text);
  7e:	83 ec 04             	sub    $0x4,%esp
  81:	ff 75 0c             	push   0xc(%ebp)
  84:	83 c2 02             	add    $0x2,%edx
  87:	52                   	push   %edx
  88:	0f be c0             	movsbl %al,%eax
  8b:	50                   	push   %eax
  8c:	e8 6f ff ff ff       	call   0 <matchstar>
  91:	83 c4 10             	add    $0x10,%esp
  94:	eb 2f                	jmp    c5 <matchhere+0x7d>
  if(re[0] == '$' && re[1] == '\0')
  96:	84 c9                	test   %cl,%cl
  98:	75 cb                	jne    65 <matchhere+0x1d>
    return *text == '\0';
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	80 38 00             	cmpb   $0x0,(%eax)
  a0:	0f 94 c0             	sete   %al
  a3:	0f b6 c0             	movzbl %al,%eax
  a6:	eb 1d                	jmp    c5 <matchhere+0x7d>
    return matchhere(re+1, text+1);
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	50                   	push   %eax
  b2:	83 c2 01             	add    $0x1,%edx
  b5:	52                   	push   %edx
  b6:	e8 8d ff ff ff       	call   48 <matchhere>
  bb:	83 c4 10             	add    $0x10,%esp
  be:	eb 05                	jmp    c5 <matchhere+0x7d>
    return 1;
  c0:	b8 01 00 00 00       	mov    $0x1,%eax
}
  c5:	c9                   	leave  
  c6:	c3                   	ret    
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
  cc:	eb f7                	jmp    c5 <matchhere+0x7d>

000000ce <match>:
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	56                   	push   %esi
  d2:	53                   	push   %ebx
  d3:	8b 75 08             	mov    0x8(%ebp),%esi
  d6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  d9:	80 3e 5e             	cmpb   $0x5e,(%esi)
  dc:	75 14                	jne    f2 <match+0x24>
    return matchhere(re+1, text);
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	53                   	push   %ebx
  e2:	83 c6 01             	add    $0x1,%esi
  e5:	56                   	push   %esi
  e6:	e8 5d ff ff ff       	call   48 <matchhere>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	eb 22                	jmp    112 <match+0x44>
  }while(*text++ != '\0');
  f0:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  f2:	83 ec 08             	sub    $0x8,%esp
  f5:	53                   	push   %ebx
  f6:	56                   	push   %esi
  f7:	e8 4c ff ff ff       	call   48 <matchhere>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	85 c0                	test   %eax,%eax
 101:	75 0a                	jne    10d <match+0x3f>
  }while(*text++ != '\0');
 103:	8d 53 01             	lea    0x1(%ebx),%edx
 106:	80 3b 00             	cmpb   $0x0,(%ebx)
 109:	75 e5                	jne    f0 <match+0x22>
 10b:	eb 05                	jmp    112 <match+0x44>
      return 1;
 10d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 112:	8d 65 f8             	lea    -0x8(%ebp),%esp
 115:	5b                   	pop    %ebx
 116:	5e                   	pop    %esi
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <grep>:
{
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	57                   	push   %edi
 11d:	56                   	push   %esi
 11e:	53                   	push   %ebx
 11f:	83 ec 1c             	sub    $0x1c,%esp
 122:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 125:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 12c:	eb 53                	jmp    181 <grep+0x68>
      p = q+1;
 12e:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 131:	83 ec 08             	sub    $0x8,%esp
 134:	6a 0a                	push   $0xa
 136:	56                   	push   %esi
 137:	e8 e9 02 00 00       	call   425 <strchr>
 13c:	89 c3                	mov    %eax,%ebx
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	74 2d                	je     172 <grep+0x59>
      *q = 0;
 145:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	56                   	push   %esi
 14c:	57                   	push   %edi
 14d:	e8 7c ff ff ff       	call   ce <match>
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	74 d5                	je     12e <grep+0x15>
        *q = '\n';
 159:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 15c:	8d 43 01             	lea    0x1(%ebx),%eax
 15f:	83 ec 04             	sub    $0x4,%esp
 162:	29 f0                	sub    %esi,%eax
 164:	50                   	push   %eax
 165:	56                   	push   %esi
 166:	6a 01                	push   $0x1
 168:	e8 fa 03 00 00       	call   567 <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe 20 0e 00 00    	cmp    $0xe20,%esi
 178:	74 62                	je     1dc <grep+0xc3>
    if(m > 0){
 17a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 17d:	85 c9                	test   %ecx,%ecx
 17f:	7f 3b                	jg     1bc <grep+0xa3>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 181:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 189:	29 c8                	sub    %ecx,%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	50                   	push   %eax
 18f:	8d 81 20 0e 00 00    	lea    0xe20(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
 199:	e8 c1 03 00 00       	call   55f <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 20 0e 00 00 00 	movb   $0x0,0xe20(%edx)
    p = buf;
 1b2:	be 20 0e 00 00       	mov    $0xe20,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d 20 0e 00 00       	sub    $0xe20,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 20 0e 00 00       	push   $0xe20
 1d2:	e8 3c 03 00 00       	call   513 <memmove>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	eb a5                	jmp    181 <grep+0x68>
      m = 0;
 1dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1e3:	eb 9c                	jmp    181 <grep+0x68>
}
 1e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5f                   	pop    %edi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    

000001ed <main>:
{
 1ed:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1f1:	83 e4 f0             	and    $0xfffffff0,%esp
 1f4:	ff 71 fc             	push   -0x4(%ecx)
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	57                   	push   %edi
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	51                   	push   %ecx
 1fe:	83 ec 18             	sub    $0x18,%esp
 201:	8b 01                	mov    (%ecx),%eax
 203:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 206:	8b 51 04             	mov    0x4(%ecx),%edx
 209:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 20c:	83 f8 01             	cmp    $0x1,%eax
 20f:	7e 50                	jle    261 <main+0x74>
  pattern = argv[1];
 211:	8b 45 e0             	mov    -0x20(%ebp),%eax
 214:	8b 40 04             	mov    0x4(%eax),%eax
 217:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 21a:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 21e:	7e 55                	jle    275 <main+0x88>
  for(i = 2; i < argc; i++){
 220:	be 02 00 00 00       	mov    $0x2,%esi
 225:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 228:	7d 71                	jge    29b <main+0xae>
    if((fd = open(argv[i], 0)) < 0){
 22a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22d:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 00                	push   $0x0
 235:	ff 37                	push   (%edi)
 237:	e8 4b 03 00 00       	call   587 <open>
 23c:	89 c3                	mov    %eax,%ebx
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	78 40                	js     285 <main+0x98>
    grep(pattern, fd);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	50                   	push   %eax
 249:	ff 75 dc             	push   -0x24(%ebp)
 24c:	e8 c8 fe ff ff       	call   119 <grep>
    close(fd);
 251:	89 1c 24             	mov    %ebx,(%esp)
 254:	e8 16 03 00 00       	call   56f <close>
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 4c 09 00 00       	push   $0x94c
 269:	6a 02                	push   $0x2
 26b:	e8 2c 04 00 00       	call   69c <printf>
    exit();
 270:	e8 d2 02 00 00       	call   547 <exit>
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
 280:	e8 c2 02 00 00       	call   547 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 6c 09 00 00       	push   $0x96c
 28f:	6a 01                	push   $0x1
 291:	e8 06 04 00 00       	call   69c <printf>
      exit();
 296:	e8 ac 02 00 00       	call   547 <exit>
  exit();
 29b:	e8 a7 02 00 00       	call   547 <exit>

000002a0 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2a6:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ab:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2ad:	89 d0                	mov    %edx,%eax
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    

000002b1 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2b1:	55                   	push   %ebp
 2b2:	89 e5                	mov    %esp,%ebp
 2b4:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2b7:	68 00 20 00 00       	push   $0x2000
 2bc:	e8 01 06 00 00       	call   8c2 <malloc>
  if(n_stack == 0){
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	85 c0                	test   %eax,%eax
 2c6:	74 4a                	je     312 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2c8:	ba 00 00 00 00       	mov    $0x0,%edx
 2cd:	eb 03                	jmp    2d2 <thread_create+0x21>
 2cf:	83 c2 01             	add    $0x1,%edx
 2d2:	83 fa 3f             	cmp    $0x3f,%edx
 2d5:	7f 27                	jg     2fe <thread_create+0x4d>
    if(threads[i]->flag==0){
 2d7:	8b 0c 95 20 12 00 00 	mov    0x1220(,%edx,4),%ecx
 2de:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2e2:	75 eb                	jne    2cf <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 2e4:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 2e6:	8b 0c 95 20 12 00 00 	mov    0x1220(,%edx,4),%ecx
 2ed:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 2f0:	8b 14 95 20 12 00 00 	mov    0x1220(,%edx,4),%edx
 2f7:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2fe:	50                   	push   %eax
 2ff:	ff 75 10             	push   0x10(%ebp)
 302:	ff 75 0c             	push   0xc(%ebp)
 305:	ff 75 08             	push   0x8(%ebp)
 308:	e8 da 02 00 00       	call   5e7 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 30d:	83 c4 10             	add    $0x10,%esp
}
 310:	c9                   	leave  
 311:	c3                   	ret    
    return -1;
 312:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 317:	eb f7                	jmp    310 <thread_create+0x5f>

00000319 <thread_join>:

//TODO: fix
int thread_join() {
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	56                   	push   %esi
 31d:	53                   	push   %ebx
 31e:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 321:	8d 45 f4             	lea    -0xc(%ebp),%eax
 324:	50                   	push   %eax
 325:	e8 c5 02 00 00       	call   5ef <join>
 32a:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 32c:	83 c4 10             	add    $0x10,%esp
 32f:	bb 00 00 00 00       	mov    $0x0,%ebx
 334:	eb 03                	jmp    339 <thread_join+0x20>
 336:	83 c3 01             	add    $0x1,%ebx
 339:	83 fb 3f             	cmp    $0x3f,%ebx
 33c:	7f 23                	jg     361 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 33e:	8b 04 9d 20 12 00 00 	mov    0x1220(,%ebx,4),%eax
 345:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 349:	75 eb                	jne    336 <thread_join+0x1d>
 34b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 34e:	39 50 04             	cmp    %edx,0x4(%eax)
 351:	75 e3                	jne    336 <thread_join+0x1d>
      free(stk_addr);
 353:	83 ec 0c             	sub    $0xc,%esp
 356:	52                   	push   %edx
 357:	e8 a6 04 00 00       	call   802 <free>
 35c:	83 c4 10             	add    $0x10,%esp
 35f:	eb d5                	jmp    336 <thread_join+0x1d>
    }
  }
  return pid;
}
 361:	89 f0                	mov    %esi,%eax
 363:	8d 65 f8             	lea    -0x8(%ebp),%esp
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    

0000036a <lock_acquire>:

void lock_acquire(lock_t *lock){
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	53                   	push   %ebx
 36e:	83 ec 04             	sub    $0x4,%esp
 371:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 374:	83 ec 08             	sub    $0x8,%esp
 377:	6a 01                	push   $0x1
 379:	53                   	push   %ebx
 37a:	e8 21 ff ff ff       	call   2a0 <test_and_set>
 37f:	83 c4 10             	add    $0x10,%esp
 382:	83 f8 01             	cmp    $0x1,%eax
 385:	74 ed                	je     374 <lock_acquire+0xa>
    ;
}
 387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38a:	c9                   	leave  
 38b:	c3                   	ret    

0000038c <lock_release>:

void lock_release(lock_t *lock) {
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 38f:	8b 45 08             	mov    0x8(%ebp),%eax
 392:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <lock_init>:

void lock_init(lock_t *lock) {
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
 3a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    

000003a8 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	56                   	push   %esi
 3ac:	53                   	push   %ebx
 3ad:	8b 75 08             	mov    0x8(%ebp),%esi
 3b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3b3:	89 f0                	mov    %esi,%eax
 3b5:	89 d1                	mov    %edx,%ecx
 3b7:	83 c2 01             	add    $0x1,%edx
 3ba:	89 c3                	mov    %eax,%ebx
 3bc:	83 c0 01             	add    $0x1,%eax
 3bf:	0f b6 09             	movzbl (%ecx),%ecx
 3c2:	88 0b                	mov    %cl,(%ebx)
 3c4:	84 c9                	test   %cl,%cl
 3c6:	75 ed                	jne    3b5 <strcpy+0xd>
    ;
  return os;
}
 3c8:	89 f0                	mov    %esi,%eax
 3ca:	5b                   	pop    %ebx
 3cb:	5e                   	pop    %esi
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3d4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3d7:	eb 06                	jmp    3df <strcmp+0x11>
    p++, q++;
 3d9:	83 c1 01             	add    $0x1,%ecx
 3dc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3df:	0f b6 01             	movzbl (%ecx),%eax
 3e2:	84 c0                	test   %al,%al
 3e4:	74 04                	je     3ea <strcmp+0x1c>
 3e6:	3a 02                	cmp    (%edx),%al
 3e8:	74 ef                	je     3d9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3ea:	0f b6 c0             	movzbl %al,%eax
 3ed:	0f b6 12             	movzbl (%edx),%edx
 3f0:	29 d0                	sub    %edx,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strlen>:

uint
strlen(const char *s)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3fa:	b8 00 00 00 00       	mov    $0x0,%eax
 3ff:	eb 03                	jmp    404 <strlen+0x10>
 401:	83 c0 01             	add    $0x1,%eax
 404:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 408:	75 f7                	jne    401 <strlen+0xd>
    ;
  return n;
}
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    

0000040c <memset>:

void*
memset(void *dst, int c, uint n)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	57                   	push   %edi
 410:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 413:	89 d7                	mov    %edx,%edi
 415:	8b 4d 10             	mov    0x10(%ebp),%ecx
 418:	8b 45 0c             	mov    0xc(%ebp),%eax
 41b:	fc                   	cld    
 41c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 41e:	89 d0                	mov    %edx,%eax
 420:	8b 7d fc             	mov    -0x4(%ebp),%edi
 423:	c9                   	leave  
 424:	c3                   	ret    

00000425 <strchr>:

char*
strchr(const char *s, char c)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42f:	eb 03                	jmp    434 <strchr+0xf>
 431:	83 c0 01             	add    $0x1,%eax
 434:	0f b6 10             	movzbl (%eax),%edx
 437:	84 d2                	test   %dl,%dl
 439:	74 06                	je     441 <strchr+0x1c>
    if(*s == c)
 43b:	38 ca                	cmp    %cl,%dl
 43d:	75 f2                	jne    431 <strchr+0xc>
 43f:	eb 05                	jmp    446 <strchr+0x21>
      return (char*)s;
  return 0;
 441:	b8 00 00 00 00       	mov    $0x0,%eax
}
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    

00000448 <gets>:

char*
gets(char *buf, int max)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	57                   	push   %edi
 44c:	56                   	push   %esi
 44d:	53                   	push   %ebx
 44e:	83 ec 1c             	sub    $0x1c,%esp
 451:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 454:	bb 00 00 00 00       	mov    $0x0,%ebx
 459:	89 de                	mov    %ebx,%esi
 45b:	83 c3 01             	add    $0x1,%ebx
 45e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 461:	7d 2e                	jge    491 <gets+0x49>
    cc = read(0, &c, 1);
 463:	83 ec 04             	sub    $0x4,%esp
 466:	6a 01                	push   $0x1
 468:	8d 45 e7             	lea    -0x19(%ebp),%eax
 46b:	50                   	push   %eax
 46c:	6a 00                	push   $0x0
 46e:	e8 ec 00 00 00       	call   55f <read>
    if(cc < 1)
 473:	83 c4 10             	add    $0x10,%esp
 476:	85 c0                	test   %eax,%eax
 478:	7e 17                	jle    491 <gets+0x49>
      break;
    buf[i++] = c;
 47a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 47e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 481:	3c 0a                	cmp    $0xa,%al
 483:	0f 94 c2             	sete   %dl
 486:	3c 0d                	cmp    $0xd,%al
 488:	0f 94 c0             	sete   %al
 48b:	08 c2                	or     %al,%dl
 48d:	74 ca                	je     459 <gets+0x11>
    buf[i++] = c;
 48f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 491:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 495:	89 f8                	mov    %edi,%eax
 497:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49a:	5b                   	pop    %ebx
 49b:	5e                   	pop    %esi
 49c:	5f                   	pop    %edi
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    

0000049f <stat>:

int
stat(const char *n, struct stat *st)
{
 49f:	55                   	push   %ebp
 4a0:	89 e5                	mov    %esp,%ebp
 4a2:	56                   	push   %esi
 4a3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a4:	83 ec 08             	sub    $0x8,%esp
 4a7:	6a 00                	push   $0x0
 4a9:	ff 75 08             	push   0x8(%ebp)
 4ac:	e8 d6 00 00 00       	call   587 <open>
  if(fd < 0)
 4b1:	83 c4 10             	add    $0x10,%esp
 4b4:	85 c0                	test   %eax,%eax
 4b6:	78 24                	js     4dc <stat+0x3d>
 4b8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ba:	83 ec 08             	sub    $0x8,%esp
 4bd:	ff 75 0c             	push   0xc(%ebp)
 4c0:	50                   	push   %eax
 4c1:	e8 d9 00 00 00       	call   59f <fstat>
 4c6:	89 c6                	mov    %eax,%esi
  close(fd);
 4c8:	89 1c 24             	mov    %ebx,(%esp)
 4cb:	e8 9f 00 00 00       	call   56f <close>
  return r;
 4d0:	83 c4 10             	add    $0x10,%esp
}
 4d3:	89 f0                	mov    %esi,%eax
 4d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    
    return -1;
 4dc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4e1:	eb f0                	jmp    4d3 <stat+0x34>

000004e3 <atoi>:

int
atoi(const char *s)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	53                   	push   %ebx
 4e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4ea:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4ef:	eb 10                	jmp    501 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4f1:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4f4:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4f7:	83 c1 01             	add    $0x1,%ecx
 4fa:	0f be c0             	movsbl %al,%eax
 4fd:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 501:	0f b6 01             	movzbl (%ecx),%eax
 504:	8d 58 d0             	lea    -0x30(%eax),%ebx
 507:	80 fb 09             	cmp    $0x9,%bl
 50a:	76 e5                	jbe    4f1 <atoi+0xe>
  return n;
}
 50c:	89 d0                	mov    %edx,%eax
 50e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 511:	c9                   	leave  
 512:	c3                   	ret    

00000513 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	56                   	push   %esi
 517:	53                   	push   %ebx
 518:	8b 75 08             	mov    0x8(%ebp),%esi
 51b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 51e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 521:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 523:	eb 0d                	jmp    532 <memmove+0x1f>
    *dst++ = *src++;
 525:	0f b6 01             	movzbl (%ecx),%eax
 528:	88 02                	mov    %al,(%edx)
 52a:	8d 49 01             	lea    0x1(%ecx),%ecx
 52d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 530:	89 d8                	mov    %ebx,%eax
 532:	8d 58 ff             	lea    -0x1(%eax),%ebx
 535:	85 c0                	test   %eax,%eax
 537:	7f ec                	jg     525 <memmove+0x12>
  return vdst;
}
 539:	89 f0                	mov    %esi,%eax
 53b:	5b                   	pop    %ebx
 53c:	5e                   	pop    %esi
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    

0000053f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 53f:	b8 01 00 00 00       	mov    $0x1,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <exit>:
SYSCALL(exit)
 547:	b8 02 00 00 00       	mov    $0x2,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <wait>:
SYSCALL(wait)
 54f:	b8 03 00 00 00       	mov    $0x3,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <pipe>:
SYSCALL(pipe)
 557:	b8 04 00 00 00       	mov    $0x4,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <read>:
SYSCALL(read)
 55f:	b8 05 00 00 00       	mov    $0x5,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <write>:
SYSCALL(write)
 567:	b8 10 00 00 00       	mov    $0x10,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <close>:
SYSCALL(close)
 56f:	b8 15 00 00 00       	mov    $0x15,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <kill>:
SYSCALL(kill)
 577:	b8 06 00 00 00       	mov    $0x6,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <exec>:
SYSCALL(exec)
 57f:	b8 07 00 00 00       	mov    $0x7,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <open>:
SYSCALL(open)
 587:	b8 0f 00 00 00       	mov    $0xf,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <mknod>:
SYSCALL(mknod)
 58f:	b8 11 00 00 00       	mov    $0x11,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <unlink>:
SYSCALL(unlink)
 597:	b8 12 00 00 00       	mov    $0x12,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <fstat>:
SYSCALL(fstat)
 59f:	b8 08 00 00 00       	mov    $0x8,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <link>:
SYSCALL(link)
 5a7:	b8 13 00 00 00       	mov    $0x13,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <mkdir>:
SYSCALL(mkdir)
 5af:	b8 14 00 00 00       	mov    $0x14,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <chdir>:
SYSCALL(chdir)
 5b7:	b8 09 00 00 00       	mov    $0x9,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <dup>:
SYSCALL(dup)
 5bf:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <getpid>:
SYSCALL(getpid)
 5c7:	b8 0b 00 00 00       	mov    $0xb,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <sbrk>:
SYSCALL(sbrk)
 5cf:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <sleep>:
SYSCALL(sleep)
 5d7:	b8 0d 00 00 00       	mov    $0xd,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <uptime>:
SYSCALL(uptime)
 5df:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <clone>:
SYSCALL(clone)
 5e7:	b8 16 00 00 00       	mov    $0x16,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <join>:
 5ef:	b8 17 00 00 00       	mov    $0x17,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5f7:	55                   	push   %ebp
 5f8:	89 e5                	mov    %esp,%ebp
 5fa:	83 ec 1c             	sub    $0x1c,%esp
 5fd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 600:	6a 01                	push   $0x1
 602:	8d 55 f4             	lea    -0xc(%ebp),%edx
 605:	52                   	push   %edx
 606:	50                   	push   %eax
 607:	e8 5b ff ff ff       	call   567 <write>
}
 60c:	83 c4 10             	add    $0x10,%esp
 60f:	c9                   	leave  
 610:	c3                   	ret    

00000611 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 611:	55                   	push   %ebp
 612:	89 e5                	mov    %esp,%ebp
 614:	57                   	push   %edi
 615:	56                   	push   %esi
 616:	53                   	push   %ebx
 617:	83 ec 2c             	sub    $0x2c,%esp
 61a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 61d:	89 d0                	mov    %edx,%eax
 61f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 621:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 625:	0f 95 c1             	setne  %cl
 628:	c1 ea 1f             	shr    $0x1f,%edx
 62b:	84 d1                	test   %dl,%cl
 62d:	74 44                	je     673 <printint+0x62>
    neg = 1;
    x = -xx;
 62f:	f7 d8                	neg    %eax
 631:	89 c1                	mov    %eax,%ecx
    neg = 1;
 633:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 63a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 63f:	89 c8                	mov    %ecx,%eax
 641:	ba 00 00 00 00       	mov    $0x0,%edx
 646:	f7 f6                	div    %esi
 648:	89 df                	mov    %ebx,%edi
 64a:	83 c3 01             	add    $0x1,%ebx
 64d:	0f b6 92 e4 09 00 00 	movzbl 0x9e4(%edx),%edx
 654:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 658:	89 ca                	mov    %ecx,%edx
 65a:	89 c1                	mov    %eax,%ecx
 65c:	39 d6                	cmp    %edx,%esi
 65e:	76 df                	jbe    63f <printint+0x2e>
  if(neg)
 660:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 664:	74 31                	je     697 <printint+0x86>
    buf[i++] = '-';
 666:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 66b:	8d 5f 02             	lea    0x2(%edi),%ebx
 66e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 671:	eb 17                	jmp    68a <printint+0x79>
    x = xx;
 673:	89 c1                	mov    %eax,%ecx
  neg = 0;
 675:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 67c:	eb bc                	jmp    63a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 67e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 683:	89 f0                	mov    %esi,%eax
 685:	e8 6d ff ff ff       	call   5f7 <putc>
  while(--i >= 0)
 68a:	83 eb 01             	sub    $0x1,%ebx
 68d:	79 ef                	jns    67e <printint+0x6d>
}
 68f:	83 c4 2c             	add    $0x2c,%esp
 692:	5b                   	pop    %ebx
 693:	5e                   	pop    %esi
 694:	5f                   	pop    %edi
 695:	5d                   	pop    %ebp
 696:	c3                   	ret    
 697:	8b 75 d0             	mov    -0x30(%ebp),%esi
 69a:	eb ee                	jmp    68a <printint+0x79>

0000069c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 69c:	55                   	push   %ebp
 69d:	89 e5                	mov    %esp,%ebp
 69f:	57                   	push   %edi
 6a0:	56                   	push   %esi
 6a1:	53                   	push   %ebx
 6a2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6a5:	8d 45 10             	lea    0x10(%ebp),%eax
 6a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ab:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 6b5:	eb 14                	jmp    6cb <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6b7:	89 fa                	mov    %edi,%edx
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	e8 36 ff ff ff       	call   5f7 <putc>
 6c1:	eb 05                	jmp    6c8 <printf+0x2c>
      }
    } else if(state == '%'){
 6c3:	83 fe 25             	cmp    $0x25,%esi
 6c6:	74 25                	je     6ed <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6c8:	83 c3 01             	add    $0x1,%ebx
 6cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ce:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6d2:	84 c0                	test   %al,%al
 6d4:	0f 84 20 01 00 00    	je     7fa <printf+0x15e>
    c = fmt[i] & 0xff;
 6da:	0f be f8             	movsbl %al,%edi
 6dd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6e0:	85 f6                	test   %esi,%esi
 6e2:	75 df                	jne    6c3 <printf+0x27>
      if(c == '%'){
 6e4:	83 f8 25             	cmp    $0x25,%eax
 6e7:	75 ce                	jne    6b7 <printf+0x1b>
        state = '%';
 6e9:	89 c6                	mov    %eax,%esi
 6eb:	eb db                	jmp    6c8 <printf+0x2c>
      if(c == 'd'){
 6ed:	83 f8 25             	cmp    $0x25,%eax
 6f0:	0f 84 cf 00 00 00    	je     7c5 <printf+0x129>
 6f6:	0f 8c dd 00 00 00    	jl     7d9 <printf+0x13d>
 6fc:	83 f8 78             	cmp    $0x78,%eax
 6ff:	0f 8f d4 00 00 00    	jg     7d9 <printf+0x13d>
 705:	83 f8 63             	cmp    $0x63,%eax
 708:	0f 8c cb 00 00 00    	jl     7d9 <printf+0x13d>
 70e:	83 e8 63             	sub    $0x63,%eax
 711:	83 f8 15             	cmp    $0x15,%eax
 714:	0f 87 bf 00 00 00    	ja     7d9 <printf+0x13d>
 71a:	ff 24 85 8c 09 00 00 	jmp    *0x98c(,%eax,4)
        printint(fd, *ap, 10, 1);
 721:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 724:	8b 17                	mov    (%edi),%edx
 726:	83 ec 0c             	sub    $0xc,%esp
 729:	6a 01                	push   $0x1
 72b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	e8 d9 fe ff ff       	call   611 <printint>
        ap++;
 738:	83 c7 04             	add    $0x4,%edi
 73b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 73e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 741:	be 00 00 00 00       	mov    $0x0,%esi
 746:	eb 80                	jmp    6c8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 748:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74b:	8b 17                	mov    (%edi),%edx
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	6a 00                	push   $0x0
 752:	b9 10 00 00 00       	mov    $0x10,%ecx
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	e8 b2 fe ff ff       	call   611 <printint>
        ap++;
 75f:	83 c7 04             	add    $0x4,%edi
 762:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 765:	83 c4 10             	add    $0x10,%esp
      state = 0;
 768:	be 00 00 00 00       	mov    $0x0,%esi
 76d:	e9 56 ff ff ff       	jmp    6c8 <printf+0x2c>
        s = (char*)*ap;
 772:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 775:	8b 30                	mov    (%eax),%esi
        ap++;
 777:	83 c0 04             	add    $0x4,%eax
 77a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 77d:	85 f6                	test   %esi,%esi
 77f:	75 15                	jne    796 <printf+0xfa>
          s = "(null)";
 781:	be 82 09 00 00       	mov    $0x982,%esi
 786:	eb 0e                	jmp    796 <printf+0xfa>
          putc(fd, *s);
 788:	0f be d2             	movsbl %dl,%edx
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	e8 64 fe ff ff       	call   5f7 <putc>
          s++;
 793:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 796:	0f b6 16             	movzbl (%esi),%edx
 799:	84 d2                	test   %dl,%dl
 79b:	75 eb                	jne    788 <printf+0xec>
      state = 0;
 79d:	be 00 00 00 00       	mov    $0x0,%esi
 7a2:	e9 21 ff ff ff       	jmp    6c8 <printf+0x2c>
        putc(fd, *ap);
 7a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7aa:	0f be 17             	movsbl (%edi),%edx
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	e8 42 fe ff ff       	call   5f7 <putc>
        ap++;
 7b5:	83 c7 04             	add    $0x4,%edi
 7b8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7bb:	be 00 00 00 00       	mov    $0x0,%esi
 7c0:	e9 03 ff ff ff       	jmp    6c8 <printf+0x2c>
        putc(fd, c);
 7c5:	89 fa                	mov    %edi,%edx
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	e8 28 fe ff ff       	call   5f7 <putc>
      state = 0;
 7cf:	be 00 00 00 00       	mov    $0x0,%esi
 7d4:	e9 ef fe ff ff       	jmp    6c8 <printf+0x2c>
        putc(fd, '%');
 7d9:	ba 25 00 00 00       	mov    $0x25,%edx
 7de:	8b 45 08             	mov    0x8(%ebp),%eax
 7e1:	e8 11 fe ff ff       	call   5f7 <putc>
        putc(fd, c);
 7e6:	89 fa                	mov    %edi,%edx
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	e8 07 fe ff ff       	call   5f7 <putc>
      state = 0;
 7f0:	be 00 00 00 00       	mov    $0x0,%esi
 7f5:	e9 ce fe ff ff       	jmp    6c8 <printf+0x2c>
    }
  }
}
 7fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7fd:	5b                   	pop    %ebx
 7fe:	5e                   	pop    %esi
 7ff:	5f                   	pop    %edi
 800:	5d                   	pop    %ebp
 801:	c3                   	ret    

00000802 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 802:	55                   	push   %ebp
 803:	89 e5                	mov    %esp,%ebp
 805:	57                   	push   %edi
 806:	56                   	push   %esi
 807:	53                   	push   %ebx
 808:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 80b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80e:	a1 20 13 00 00       	mov    0x1320,%eax
 813:	eb 02                	jmp    817 <free+0x15>
 815:	89 d0                	mov    %edx,%eax
 817:	39 c8                	cmp    %ecx,%eax
 819:	73 04                	jae    81f <free+0x1d>
 81b:	39 08                	cmp    %ecx,(%eax)
 81d:	77 12                	ja     831 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81f:	8b 10                	mov    (%eax),%edx
 821:	39 c2                	cmp    %eax,%edx
 823:	77 f0                	ja     815 <free+0x13>
 825:	39 c8                	cmp    %ecx,%eax
 827:	72 08                	jb     831 <free+0x2f>
 829:	39 ca                	cmp    %ecx,%edx
 82b:	77 04                	ja     831 <free+0x2f>
 82d:	89 d0                	mov    %edx,%eax
 82f:	eb e6                	jmp    817 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 831:	8b 73 fc             	mov    -0x4(%ebx),%esi
 834:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 837:	8b 10                	mov    (%eax),%edx
 839:	39 d7                	cmp    %edx,%edi
 83b:	74 19                	je     856 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 83d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 840:	8b 50 04             	mov    0x4(%eax),%edx
 843:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 846:	39 ce                	cmp    %ecx,%esi
 848:	74 1b                	je     865 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 84a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 84c:	a3 20 13 00 00       	mov    %eax,0x1320
}
 851:	5b                   	pop    %ebx
 852:	5e                   	pop    %esi
 853:	5f                   	pop    %edi
 854:	5d                   	pop    %ebp
 855:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 856:	03 72 04             	add    0x4(%edx),%esi
 859:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 85c:	8b 10                	mov    (%eax),%edx
 85e:	8b 12                	mov    (%edx),%edx
 860:	89 53 f8             	mov    %edx,-0x8(%ebx)
 863:	eb db                	jmp    840 <free+0x3e>
    p->s.size += bp->s.size;
 865:	03 53 fc             	add    -0x4(%ebx),%edx
 868:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 86e:	89 10                	mov    %edx,(%eax)
 870:	eb da                	jmp    84c <free+0x4a>

00000872 <morecore>:

static Header*
morecore(uint nu)
{
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	53                   	push   %ebx
 876:	83 ec 04             	sub    $0x4,%esp
 879:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 87b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 880:	77 05                	ja     887 <morecore+0x15>
    nu = 4096;
 882:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 887:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 88e:	83 ec 0c             	sub    $0xc,%esp
 891:	50                   	push   %eax
 892:	e8 38 fd ff ff       	call   5cf <sbrk>
  if(p == (char*)-1)
 897:	83 c4 10             	add    $0x10,%esp
 89a:	83 f8 ff             	cmp    $0xffffffff,%eax
 89d:	74 1c                	je     8bb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 89f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a2:	83 c0 08             	add    $0x8,%eax
 8a5:	83 ec 0c             	sub    $0xc,%esp
 8a8:	50                   	push   %eax
 8a9:	e8 54 ff ff ff       	call   802 <free>
  return freep;
 8ae:	a1 20 13 00 00       	mov    0x1320,%eax
 8b3:	83 c4 10             	add    $0x10,%esp
}
 8b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b9:	c9                   	leave  
 8ba:	c3                   	ret    
    return 0;
 8bb:	b8 00 00 00 00       	mov    $0x0,%eax
 8c0:	eb f4                	jmp    8b6 <morecore+0x44>

000008c2 <malloc>:

void*
malloc(uint nbytes)
{
 8c2:	55                   	push   %ebp
 8c3:	89 e5                	mov    %esp,%ebp
 8c5:	53                   	push   %ebx
 8c6:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	8d 58 07             	lea    0x7(%eax),%ebx
 8cf:	c1 eb 03             	shr    $0x3,%ebx
 8d2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8d5:	8b 0d 20 13 00 00    	mov    0x1320,%ecx
 8db:	85 c9                	test   %ecx,%ecx
 8dd:	74 04                	je     8e3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8df:	8b 01                	mov    (%ecx),%eax
 8e1:	eb 4a                	jmp    92d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8e3:	c7 05 20 13 00 00 24 	movl   $0x1324,0x1320
 8ea:	13 00 00 
 8ed:	c7 05 24 13 00 00 24 	movl   $0x1324,0x1324
 8f4:	13 00 00 
    base.s.size = 0;
 8f7:	c7 05 28 13 00 00 00 	movl   $0x0,0x1328
 8fe:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 901:	b9 24 13 00 00       	mov    $0x1324,%ecx
 906:	eb d7                	jmp    8df <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 908:	74 19                	je     923 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 90a:	29 da                	sub    %ebx,%edx
 90c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 90f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 912:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 915:	89 0d 20 13 00 00    	mov    %ecx,0x1320
      return (void*)(p + 1);
 91b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 91e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 921:	c9                   	leave  
 922:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 923:	8b 10                	mov    (%eax),%edx
 925:	89 11                	mov    %edx,(%ecx)
 927:	eb ec                	jmp    915 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 929:	89 c1                	mov    %eax,%ecx
 92b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 92d:	8b 50 04             	mov    0x4(%eax),%edx
 930:	39 da                	cmp    %ebx,%edx
 932:	73 d4                	jae    908 <malloc+0x46>
    if(p == freep)
 934:	39 05 20 13 00 00    	cmp    %eax,0x1320
 93a:	75 ed                	jne    929 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 93c:	89 d8                	mov    %ebx,%eax
 93e:	e8 2f ff ff ff       	call   872 <morecore>
 943:	85 c0                	test   %eax,%eax
 945:	75 e2                	jne    929 <malloc+0x67>
 947:	eb d5                	jmp    91e <malloc+0x5c>
