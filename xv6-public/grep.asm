
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
<<<<<<< HEAD
 137:	e8 e1 02 00 00       	call   41d <strchr>
=======
 137:	e8 ca 02 00 00       	call   406 <strchr>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
 168:	e8 f2 03 00 00       	call   55f <write>
=======
 168:	e8 db 03 00 00       	call   548 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe 00 0e 00 00    	cmp    $0xe00,%esi
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
 18f:	8d 81 00 0e 00 00    	lea    0xe00(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
<<<<<<< HEAD
 199:	e8 b9 03 00 00       	call   557 <read>
=======
 199:	e8 a2 03 00 00       	call   540 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 00 0e 00 00 00 	movb   $0x0,0xe00(%edx)
    p = buf;
 1b2:	be 00 0e 00 00       	mov    $0xe00,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d 00 0e 00 00       	sub    $0xe00,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 00 0e 00 00       	push   $0xe00
<<<<<<< HEAD
 1d2:	e8 34 03 00 00       	call   50b <memmove>
=======
 1d2:	e8 1d 03 00 00       	call   4f4 <memmove>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
 237:	e8 43 03 00 00       	call   57f <open>
=======
 237:	e8 2c 03 00 00       	call   568 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
 254:	e8 0e 03 00 00       	call   567 <close>
=======
 254:	e8 f7 02 00 00       	call   550 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
 264:	68 44 09 00 00       	push   $0x944
 269:	6a 02                	push   $0x2
 26b:	e8 24 04 00 00       	call   694 <printf>
    exit();
 270:	e8 ca 02 00 00       	call   53f <exit>
=======
 264:	68 2c 09 00 00       	push   $0x92c
 269:	6a 02                	push   $0x2
 26b:	e8 0d 04 00 00       	call   67d <printf>
    exit();
 270:	e8 b3 02 00 00       	call   528 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
<<<<<<< HEAD
 280:	e8 ba 02 00 00       	call   53f <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 64 09 00 00       	push   $0x964
 28f:	6a 01                	push   $0x1
 291:	e8 fe 03 00 00       	call   694 <printf>
      exit();
 296:	e8 a4 02 00 00       	call   53f <exit>
  exit();
 29b:	e8 9f 02 00 00       	call   53f <exit>
=======
 280:	e8 a3 02 00 00       	call   528 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 4c 09 00 00       	push   $0x94c
 28f:	6a 01                	push   $0x1
 291:	e8 e7 03 00 00       	call   67d <printf>
      exit();
 296:	e8 8d 02 00 00       	call   528 <exit>
  exit();
 29b:	e8 88 02 00 00       	call   528 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000002a0 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

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
 2b4:	53                   	push   %ebx
 2b5:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2b8:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 2bd:	e8 f8 05 00 00       	call   8ba <malloc>
  if(n_stack == 0){
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	74 41                	je     30a <thread_create+0x59>
 2c9:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 2cb:	50                   	push   %eax
 2cc:	ff 75 10             	push   0x10(%ebp)
 2cf:	ff 75 0c             	push   0xc(%ebp)
 2d2:	ff 75 08             	push   0x8(%ebp)
 2d5:	e8 05 03 00 00       	call   5df <clone>
=======
 2bd:	e8 e1 05 00 00       	call   8a3 <malloc>
  if(n_stack == 0){
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	74 57                	je     320 <thread_create+0x6f>
 2c9:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2cb:	b8 00 00 00 00       	mov    $0x0,%eax
 2d0:	eb 03                	jmp    2d5 <thread_create+0x24>
 2d2:	83 c0 01             	add    $0x1,%eax
 2d5:	83 f8 3f             	cmp    $0x3f,%eax
 2d8:	7f 2f                	jg     309 <thread_create+0x58>
    if(threads[i].flag==0){
 2da:	8d 14 40             	lea    (%eax,%eax,2),%edx
 2dd:	83 3c 95 08 12 00 00 	cmpl   $0x0,0x1208(,%edx,4)
 2e4:	00 
 2e5:	75 eb                	jne    2d2 <thread_create+0x21>
      threads[i].maddr = n_stack;
 2e7:	8d 14 00             	lea    (%eax,%eax,1),%edx
 2ea:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 2ed:	c1 e3 02             	shl    $0x2,%ebx
 2f0:	89 8b 00 12 00 00    	mov    %ecx,0x1200(%ebx)
      threads[i].pg1addr = n_stack;
 2f6:	89 8b 04 12 00 00    	mov    %ecx,0x1204(%ebx)
      threads[i].flag = 1;
 2fc:	01 c2                	add    %eax,%edx
 2fe:	c7 04 95 08 12 00 00 	movl   $0x1,0x1208(,%edx,4)
 305:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 309:	51                   	push   %ecx
 30a:	ff 75 10             	push   0x10(%ebp)
 30d:	ff 75 0c             	push   0xc(%ebp)
 310:	ff 75 08             	push   0x8(%ebp)
 313:	e8 b0 02 00 00       	call   5c8 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 2da:	83 c4 10             	add    $0x10,%esp
 2dd:	ba 00 00 00 00       	mov    $0x0,%edx
 2e2:	eb 03                	jmp    2e7 <thread_create+0x36>
 2e4:	83 c2 01             	add    $0x1,%edx
 2e7:	83 fa 3f             	cmp    $0x3f,%edx
 2ea:	7f 19                	jg     305 <thread_create+0x54>
    if(threads[i]->flag==0){
 2ec:	8b 0c 95 00 12 00 00 	mov    0x1200(,%edx,4),%ecx
 2f3:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2f7:	75 eb                	jne    2e4 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 2f9:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 2fb:	8b 14 95 00 12 00 00 	mov    0x1200(,%edx,4),%edx
 302:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	c9                   	leave  
 309:	c3                   	ret    
    return -1;
 30a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 30f:	eb f4                	jmp    305 <thread_create+0x54>

00000311 <thread_join>:
=======
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 31e:	c9                   	leave  
 31f:	c3                   	ret    
    return -1;
 320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 325:	eb f4                	jmp    31b <thread_create+0x6a>

00000327 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 319:	8d 45 f4             	lea    -0xc(%ebp),%eax
 31c:	50                   	push   %eax
 31d:	e8 c5 02 00 00       	call   5e7 <join>
 322:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 324:	83 c4 10             	add    $0x10,%esp
 327:	bb 00 00 00 00       	mov    $0x0,%ebx
 32c:	eb 03                	jmp    331 <thread_join+0x20>
 32e:	83 c3 01             	add    $0x1,%ebx
 331:	83 fb 3f             	cmp    $0x3f,%ebx
 334:	7f 23                	jg     359 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 336:	8b 04 9d 00 12 00 00 	mov    0x1200(,%ebx,4),%eax
 33d:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 341:	75 eb                	jne    32e <thread_join+0x1d>
 343:	8b 55 f4             	mov    -0xc(%ebp),%edx
 346:	39 50 04             	cmp    %edx,0x4(%eax)
 349:	75 e3                	jne    32e <thread_join+0x1d>
      free(stk_addr);
 34b:	83 ec 0c             	sub    $0xc,%esp
 34e:	52                   	push   %edx
 34f:	e8 a6 04 00 00       	call   7fa <free>
 354:	83 c4 10             	add    $0x10,%esp
 357:	eb d5                	jmp    32e <thread_join+0x1d>
    }
  }
  return pid;
}
 359:	89 f0                	mov    %esi,%eax
 35b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 35e:	5b                   	pop    %ebx
 35f:	5e                   	pop    %esi
 360:	5d                   	pop    %ebp
 361:	c3                   	ret    

00000362 <lock_acquire>:

void lock_acquire(lock_t *lock){
 362:	55                   	push   %ebp
 363:	89 e5                	mov    %esp,%ebp
 365:	53                   	push   %ebx
 366:	83 ec 04             	sub    $0x4,%esp
 369:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 36c:	83 ec 08             	sub    $0x8,%esp
 36f:	6a 01                	push   $0x1
 371:	53                   	push   %ebx
 372:	e8 29 ff ff ff       	call   2a0 <test_and_set>
 377:	83 c4 10             	add    $0x10,%esp
 37a:	83 f8 01             	cmp    $0x1,%eax
 37d:	74 ed                	je     36c <lock_acquire+0xa>
    ;
}
 37f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 382:	c9                   	leave  
 383:	c3                   	ret    

00000384 <lock_release>:

void lock_release(lock_t *lock) {
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <lock_init>:

void lock_init(lock_t *lock) {
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 395:	8b 45 08             	mov    0x8(%ebp),%eax
 398:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    

000003a0 <strcpy>:
=======
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	53                   	push   %ebx
 32b:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 32e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 331:	50                   	push   %eax
 332:	e8 99 02 00 00       	call   5d0 <join>
 337:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 75 f4             	push   -0xc(%ebp)
 33f:	e8 9f 04 00 00       	call   7e3 <free>
  return pid;
}
 344:	89 d8                	mov    %ebx,%eax
 346:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 349:	c9                   	leave  
 34a:	c3                   	ret    

0000034b <lock_acquire>:

void lock_acquire(lock_t *lock){
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	83 ec 04             	sub    $0x4,%esp
 352:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 01                	push   $0x1
 35a:	53                   	push   %ebx
 35b:	e8 40 ff ff ff       	call   2a0 <test_and_set>
 360:	83 c4 10             	add    $0x10,%esp
 363:	83 f8 01             	cmp    $0x1,%eax
 366:	74 ed                	je     355 <lock_acquire+0xa>
    ;
}
 368:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 36b:	c9                   	leave  
 36c:	c3                   	ret    

0000036d <lock_release>:

void lock_release(lock_t *lock) {
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 370:	8b 45 08             	mov    0x8(%ebp),%eax
 373:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    

0000037b <lock_init>:

void lock_init(lock_t *lock) {
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 37e:	8b 45 08             	mov    0x8(%ebp),%eax
 381:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	8b 75 08             	mov    0x8(%ebp),%esi
 3a8:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	56                   	push   %esi
 38d:	53                   	push   %ebx
 38e:	8b 75 08             	mov    0x8(%ebp),%esi
 391:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 3ab:	89 f0                	mov    %esi,%eax
 3ad:	89 d1                	mov    %edx,%ecx
 3af:	83 c2 01             	add    $0x1,%edx
 3b2:	89 c3                	mov    %eax,%ebx
 3b4:	83 c0 01             	add    $0x1,%eax
 3b7:	0f b6 09             	movzbl (%ecx),%ecx
 3ba:	88 0b                	mov    %cl,(%ebx)
 3bc:	84 c9                	test   %cl,%cl
 3be:	75 ed                	jne    3ad <strcpy+0xd>
    ;
  return os;
}
 3c0:	89 f0                	mov    %esi,%eax
 3c2:	5b                   	pop    %ebx
 3c3:	5e                   	pop    %esi
 3c4:	5d                   	pop    %ebp
 3c5:	c3                   	ret    

000003c6 <strcmp>:
=======
 394:	89 f0                	mov    %esi,%eax
 396:	89 d1                	mov    %edx,%ecx
 398:	83 c2 01             	add    $0x1,%edx
 39b:	89 c3                	mov    %eax,%ebx
 39d:	83 c0 01             	add    $0x1,%eax
 3a0:	0f b6 09             	movzbl (%ecx),%ecx
 3a3:	88 0b                	mov    %cl,(%ebx)
 3a5:	84 c9                	test   %cl,%cl
 3a7:	75 ed                	jne    396 <strcpy+0xd>
    ;
  return os;
}
 3a9:	89 f0                	mov    %esi,%eax
 3ab:	5b                   	pop    %ebx
 3ac:	5e                   	pop    %esi
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    

000003af <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 3c6:	55                   	push   %ebp
 3c7:	89 e5                	mov    %esp,%ebp
 3c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3cf:	eb 06                	jmp    3d7 <strcmp+0x11>
    p++, q++;
 3d1:	83 c1 01             	add    $0x1,%ecx
 3d4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3d7:	0f b6 01             	movzbl (%ecx),%eax
 3da:	84 c0                	test   %al,%al
 3dc:	74 04                	je     3e2 <strcmp+0x1c>
 3de:	3a 02                	cmp    (%edx),%al
 3e0:	74 ef                	je     3d1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3e2:	0f b6 c0             	movzbl %al,%eax
 3e5:	0f b6 12             	movzbl (%edx),%edx
 3e8:	29 d0                	sub    %edx,%eax
}
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    

000003ec <strlen>:
=======
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3b8:	eb 06                	jmp    3c0 <strcmp+0x11>
    p++, q++;
 3ba:	83 c1 01             	add    $0x1,%ecx
 3bd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3c0:	0f b6 01             	movzbl (%ecx),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 04                	je     3cb <strcmp+0x1c>
 3c7:	3a 02                	cmp    (%edx),%al
 3c9:	74 ef                	je     3ba <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3cb:	0f b6 c0             	movzbl %al,%eax
 3ce:	0f b6 12             	movzbl (%edx),%edx
 3d1:	29 d0                	sub    %edx,%eax
}
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    

000003d5 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3f2:	b8 00 00 00 00       	mov    $0x0,%eax
 3f7:	eb 03                	jmp    3fc <strlen+0x10>
 3f9:	83 c0 01             	add    $0x1,%eax
 3fc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 400:	75 f7                	jne    3f9 <strlen+0xd>
    ;
  return n;
}
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    

00000404 <memset>:
=======
 3d5:	55                   	push   %ebp
 3d6:	89 e5                	mov    %esp,%ebp
 3d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3db:	b8 00 00 00 00       	mov    $0x0,%eax
 3e0:	eb 03                	jmp    3e5 <strlen+0x10>
 3e2:	83 c0 01             	add    $0x1,%eax
 3e5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3e9:	75 f7                	jne    3e2 <strlen+0xd>
    ;
  return n;
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    

000003ed <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	57                   	push   %edi
 3f1:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 40b:	89 d7                	mov    %edx,%edi
 40d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 410:	8b 45 0c             	mov    0xc(%ebp),%eax
 413:	fc                   	cld    
 414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 416:	89 d0                	mov    %edx,%eax
 418:	8b 7d fc             	mov    -0x4(%ebp),%edi
 41b:	c9                   	leave  
 41c:	c3                   	ret    

0000041d <strchr>:
=======
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	fc                   	cld    
 3fd:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ff:	89 d0                	mov    %edx,%eax
 401:	8b 7d fc             	mov    -0x4(%ebp),%edi
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 41d:	55                   	push   %ebp
 41e:	89 e5                	mov    %esp,%ebp
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 427:	eb 03                	jmp    42c <strchr+0xf>
 429:	83 c0 01             	add    $0x1,%eax
 42c:	0f b6 10             	movzbl (%eax),%edx
 42f:	84 d2                	test   %dl,%dl
 431:	74 06                	je     439 <strchr+0x1c>
    if(*s == c)
 433:	38 ca                	cmp    %cl,%dl
 435:	75 f2                	jne    429 <strchr+0xc>
 437:	eb 05                	jmp    43e <strchr+0x21>
      return (char*)s;
  return 0;
 439:	b8 00 00 00 00       	mov    $0x0,%eax
}
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    

00000440 <gets>:
=======
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 45 08             	mov    0x8(%ebp),%eax
 40c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 410:	eb 03                	jmp    415 <strchr+0xf>
 412:	83 c0 01             	add    $0x1,%eax
 415:	0f b6 10             	movzbl (%eax),%edx
 418:	84 d2                	test   %dl,%dl
 41a:	74 06                	je     422 <strchr+0x1c>
    if(*s == c)
 41c:	38 ca                	cmp    %cl,%dl
 41e:	75 f2                	jne    412 <strchr+0xc>
 420:	eb 05                	jmp    427 <strchr+0x21>
      return (char*)s;
  return 0;
 422:	b8 00 00 00 00       	mov    $0x0,%eax
}
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 1c             	sub    $0x1c,%esp
 449:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	57                   	push   %edi
 42d:	56                   	push   %esi
 42e:	53                   	push   %ebx
 42f:	83 ec 1c             	sub    $0x1c,%esp
 432:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 44c:	bb 00 00 00 00       	mov    $0x0,%ebx
 451:	89 de                	mov    %ebx,%esi
 453:	83 c3 01             	add    $0x1,%ebx
 456:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 459:	7d 2e                	jge    489 <gets+0x49>
    cc = read(0, &c, 1);
 45b:	83 ec 04             	sub    $0x4,%esp
 45e:	6a 01                	push   $0x1
 460:	8d 45 e7             	lea    -0x19(%ebp),%eax
 463:	50                   	push   %eax
 464:	6a 00                	push   $0x0
 466:	e8 ec 00 00 00       	call   557 <read>
    if(cc < 1)
 46b:	83 c4 10             	add    $0x10,%esp
 46e:	85 c0                	test   %eax,%eax
 470:	7e 17                	jle    489 <gets+0x49>
      break;
    buf[i++] = c;
 472:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 476:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 479:	3c 0a                	cmp    $0xa,%al
 47b:	0f 94 c2             	sete   %dl
 47e:	3c 0d                	cmp    $0xd,%al
 480:	0f 94 c0             	sete   %al
 483:	08 c2                	or     %al,%dl
 485:	74 ca                	je     451 <gets+0x11>
    buf[i++] = c;
 487:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 489:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 48d:	89 f8                	mov    %edi,%eax
 48f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 492:	5b                   	pop    %ebx
 493:	5e                   	pop    %esi
 494:	5f                   	pop    %edi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    

00000497 <stat>:
=======
 435:	bb 00 00 00 00       	mov    $0x0,%ebx
 43a:	89 de                	mov    %ebx,%esi
 43c:	83 c3 01             	add    $0x1,%ebx
 43f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 442:	7d 2e                	jge    472 <gets+0x49>
    cc = read(0, &c, 1);
 444:	83 ec 04             	sub    $0x4,%esp
 447:	6a 01                	push   $0x1
 449:	8d 45 e7             	lea    -0x19(%ebp),%eax
 44c:	50                   	push   %eax
 44d:	6a 00                	push   $0x0
 44f:	e8 ec 00 00 00       	call   540 <read>
    if(cc < 1)
 454:	83 c4 10             	add    $0x10,%esp
 457:	85 c0                	test   %eax,%eax
 459:	7e 17                	jle    472 <gets+0x49>
      break;
    buf[i++] = c;
 45b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 45f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 462:	3c 0a                	cmp    $0xa,%al
 464:	0f 94 c2             	sete   %dl
 467:	3c 0d                	cmp    $0xd,%al
 469:	0f 94 c0             	sete   %al
 46c:	08 c2                	or     %al,%dl
 46e:	74 ca                	je     43a <gets+0x11>
    buf[i++] = c;
 470:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 472:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 476:	89 f8                	mov    %edi,%eax
 478:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47b:	5b                   	pop    %ebx
 47c:	5e                   	pop    %esi
 47d:	5f                   	pop    %edi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	56                   	push   %esi
 49b:	53                   	push   %ebx
=======
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 49c:	83 ec 08             	sub    $0x8,%esp
 49f:	6a 00                	push   $0x0
 4a1:	ff 75 08             	push   0x8(%ebp)
 4a4:	e8 d6 00 00 00       	call   57f <open>
  if(fd < 0)
 4a9:	83 c4 10             	add    $0x10,%esp
 4ac:	85 c0                	test   %eax,%eax
 4ae:	78 24                	js     4d4 <stat+0x3d>
 4b0:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4b2:	83 ec 08             	sub    $0x8,%esp
 4b5:	ff 75 0c             	push   0xc(%ebp)
 4b8:	50                   	push   %eax
 4b9:	e8 d9 00 00 00       	call   597 <fstat>
 4be:	89 c6                	mov    %eax,%esi
  close(fd);
 4c0:	89 1c 24             	mov    %ebx,(%esp)
 4c3:	e8 9f 00 00 00       	call   567 <close>
  return r;
 4c8:	83 c4 10             	add    $0x10,%esp
}
 4cb:	89 f0                	mov    %esi,%eax
 4cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d0:	5b                   	pop    %ebx
 4d1:	5e                   	pop    %esi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
    return -1;
 4d4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d9:	eb f0                	jmp    4cb <stat+0x34>

000004db <atoi>:
=======
 485:	83 ec 08             	sub    $0x8,%esp
 488:	6a 00                	push   $0x0
 48a:	ff 75 08             	push   0x8(%ebp)
 48d:	e8 d6 00 00 00       	call   568 <open>
  if(fd < 0)
 492:	83 c4 10             	add    $0x10,%esp
 495:	85 c0                	test   %eax,%eax
 497:	78 24                	js     4bd <stat+0x3d>
 499:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 49b:	83 ec 08             	sub    $0x8,%esp
 49e:	ff 75 0c             	push   0xc(%ebp)
 4a1:	50                   	push   %eax
 4a2:	e8 d9 00 00 00       	call   580 <fstat>
 4a7:	89 c6                	mov    %eax,%esi
  close(fd);
 4a9:	89 1c 24             	mov    %ebx,(%esp)
 4ac:	e8 9f 00 00 00       	call   550 <close>
  return r;
 4b1:	83 c4 10             	add    $0x10,%esp
}
 4b4:	89 f0                	mov    %esi,%eax
 4b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4b9:	5b                   	pop    %ebx
 4ba:	5e                   	pop    %esi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
    return -1;
 4bd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4c2:	eb f0                	jmp    4b4 <stat+0x34>

000004c4 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 4db:	55                   	push   %ebp
 4dc:	89 e5                	mov    %esp,%ebp
 4de:	53                   	push   %ebx
 4df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4e2:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4e7:	eb 10                	jmp    4f9 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4e9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4ec:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ef:	83 c1 01             	add    $0x1,%ecx
 4f2:	0f be c0             	movsbl %al,%eax
 4f5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4f9:	0f b6 01             	movzbl (%ecx),%eax
 4fc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4ff:	80 fb 09             	cmp    $0x9,%bl
 502:	76 e5                	jbe    4e9 <atoi+0xe>
  return n;
}
 504:	89 d0                	mov    %edx,%eax
 506:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <memmove>:
=======
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	53                   	push   %ebx
 4c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4cb:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4d0:	eb 10                	jmp    4e2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4d2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4d5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4d8:	83 c1 01             	add    $0x1,%ecx
 4db:	0f be c0             	movsbl %al,%eax
 4de:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4e2:	0f b6 01             	movzbl (%ecx),%eax
 4e5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4e8:	80 fb 09             	cmp    $0x9,%bl
 4eb:	76 e5                	jbe    4d2 <atoi+0xe>
  return n;
}
 4ed:	89 d0                	mov    %edx,%eax
 4ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f2:	c9                   	leave  
 4f3:	c3                   	ret    

000004f4 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	56                   	push   %esi
 50f:	53                   	push   %ebx
 510:	8b 75 08             	mov    0x8(%ebp),%esi
 513:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 516:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	56                   	push   %esi
 4f8:	53                   	push   %ebx
 4f9:	8b 75 08             	mov    0x8(%ebp),%esi
 4fc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ff:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 519:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 51b:	eb 0d                	jmp    52a <memmove+0x1f>
    *dst++ = *src++;
 51d:	0f b6 01             	movzbl (%ecx),%eax
 520:	88 02                	mov    %al,(%edx)
 522:	8d 49 01             	lea    0x1(%ecx),%ecx
 525:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 528:	89 d8                	mov    %ebx,%eax
 52a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 52d:	85 c0                	test   %eax,%eax
 52f:	7f ec                	jg     51d <memmove+0x12>
  return vdst;
}
 531:	89 f0                	mov    %esi,%eax
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    

00000537 <fork>:
=======
 502:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 504:	eb 0d                	jmp    513 <memmove+0x1f>
    *dst++ = *src++;
 506:	0f b6 01             	movzbl (%ecx),%eax
 509:	88 02                	mov    %al,(%edx)
 50b:	8d 49 01             	lea    0x1(%ecx),%ecx
 50e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 511:	89 d8                	mov    %ebx,%eax
 513:	8d 58 ff             	lea    -0x1(%eax),%ebx
 516:	85 c0                	test   %eax,%eax
 518:	7f ec                	jg     506 <memmove+0x12>
  return vdst;
}
 51a:	89 f0                	mov    %esi,%eax
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    

00000520 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 537:	b8 01 00 00 00       	mov    $0x1,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <exit>:
SYSCALL(exit)
 53f:	b8 02 00 00 00       	mov    $0x2,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <wait>:
SYSCALL(wait)
 547:	b8 03 00 00 00       	mov    $0x3,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <pipe>:
SYSCALL(pipe)
 54f:	b8 04 00 00 00       	mov    $0x4,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <read>:
SYSCALL(read)
 557:	b8 05 00 00 00       	mov    $0x5,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <write>:
SYSCALL(write)
 55f:	b8 10 00 00 00       	mov    $0x10,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <close>:
SYSCALL(close)
 567:	b8 15 00 00 00       	mov    $0x15,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <kill>:
SYSCALL(kill)
 56f:	b8 06 00 00 00       	mov    $0x6,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <exec>:
SYSCALL(exec)
 577:	b8 07 00 00 00       	mov    $0x7,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <open>:
SYSCALL(open)
 57f:	b8 0f 00 00 00       	mov    $0xf,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <mknod>:
SYSCALL(mknod)
 587:	b8 11 00 00 00       	mov    $0x11,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <unlink>:
SYSCALL(unlink)
 58f:	b8 12 00 00 00       	mov    $0x12,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <fstat>:
SYSCALL(fstat)
 597:	b8 08 00 00 00       	mov    $0x8,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <link>:
SYSCALL(link)
 59f:	b8 13 00 00 00       	mov    $0x13,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <mkdir>:
SYSCALL(mkdir)
 5a7:	b8 14 00 00 00       	mov    $0x14,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <chdir>:
SYSCALL(chdir)
 5af:	b8 09 00 00 00       	mov    $0x9,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <dup>:
SYSCALL(dup)
 5b7:	b8 0a 00 00 00       	mov    $0xa,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <getpid>:
SYSCALL(getpid)
 5bf:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <sbrk>:
SYSCALL(sbrk)
 5c7:	b8 0c 00 00 00       	mov    $0xc,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <sleep>:
SYSCALL(sleep)
 5cf:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <uptime>:
SYSCALL(uptime)
 5d7:	b8 0e 00 00 00       	mov    $0xe,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <clone>:
SYSCALL(clone)
 5df:	b8 16 00 00 00       	mov    $0x16,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <join>:
 5e7:	b8 17 00 00 00       	mov    $0x17,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <putc>:
=======
 520:	b8 01 00 00 00       	mov    $0x1,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <exit>:
SYSCALL(exit)
 528:	b8 02 00 00 00       	mov    $0x2,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <wait>:
SYSCALL(wait)
 530:	b8 03 00 00 00       	mov    $0x3,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <pipe>:
SYSCALL(pipe)
 538:	b8 04 00 00 00       	mov    $0x4,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <read>:
SYSCALL(read)
 540:	b8 05 00 00 00       	mov    $0x5,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <write>:
SYSCALL(write)
 548:	b8 10 00 00 00       	mov    $0x10,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <close>:
SYSCALL(close)
 550:	b8 15 00 00 00       	mov    $0x15,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <kill>:
SYSCALL(kill)
 558:	b8 06 00 00 00       	mov    $0x6,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <exec>:
SYSCALL(exec)
 560:	b8 07 00 00 00       	mov    $0x7,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <open>:
SYSCALL(open)
 568:	b8 0f 00 00 00       	mov    $0xf,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <mknod>:
SYSCALL(mknod)
 570:	b8 11 00 00 00       	mov    $0x11,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <unlink>:
SYSCALL(unlink)
 578:	b8 12 00 00 00       	mov    $0x12,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <fstat>:
SYSCALL(fstat)
 580:	b8 08 00 00 00       	mov    $0x8,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <link>:
SYSCALL(link)
 588:	b8 13 00 00 00       	mov    $0x13,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <mkdir>:
SYSCALL(mkdir)
 590:	b8 14 00 00 00       	mov    $0x14,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <chdir>:
SYSCALL(chdir)
 598:	b8 09 00 00 00       	mov    $0x9,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <dup>:
SYSCALL(dup)
 5a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <getpid>:
SYSCALL(getpid)
 5a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <sbrk>:
SYSCALL(sbrk)
 5b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <sleep>:
SYSCALL(sleep)
 5b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <uptime>:
SYSCALL(uptime)
 5c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <clone>:
SYSCALL(clone)
 5c8:	b8 16 00 00 00       	mov    $0x16,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <join>:
 5d0:	b8 17 00 00 00       	mov    $0x17,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 5ef:	55                   	push   %ebp
 5f0:	89 e5                	mov    %esp,%ebp
 5f2:	83 ec 1c             	sub    $0x1c,%esp
 5f5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
 5fa:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5fd:	52                   	push   %edx
 5fe:	50                   	push   %eax
 5ff:	e8 5b ff ff ff       	call   55f <write>
}
 604:	83 c4 10             	add    $0x10,%esp
 607:	c9                   	leave  
 608:	c3                   	ret    

00000609 <printint>:
=======
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	83 ec 1c             	sub    $0x1c,%esp
 5de:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5e1:	6a 01                	push   $0x1
 5e3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5e6:	52                   	push   %edx
 5e7:	50                   	push   %eax
 5e8:	e8 5b ff ff ff       	call   548 <write>
}
 5ed:	83 c4 10             	add    $0x10,%esp
 5f0:	c9                   	leave  
 5f1:	c3                   	ret    

000005f2 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 609:	55                   	push   %ebp
 60a:	89 e5                	mov    %esp,%ebp
 60c:	57                   	push   %edi
 60d:	56                   	push   %esi
 60e:	53                   	push   %ebx
 60f:	83 ec 2c             	sub    $0x2c,%esp
 612:	89 45 d0             	mov    %eax,-0x30(%ebp)
 615:	89 d0                	mov    %edx,%eax
 617:	89 ce                	mov    %ecx,%esi
=======
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	57                   	push   %edi
 5f6:	56                   	push   %esi
 5f7:	53                   	push   %ebx
 5f8:	83 ec 2c             	sub    $0x2c,%esp
 5fb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5fe:	89 d0                	mov    %edx,%eax
 600:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 619:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 61d:	0f 95 c1             	setne  %cl
 620:	c1 ea 1f             	shr    $0x1f,%edx
 623:	84 d1                	test   %dl,%cl
 625:	74 44                	je     66b <printint+0x62>
    neg = 1;
    x = -xx;
 627:	f7 d8                	neg    %eax
 629:	89 c1                	mov    %eax,%ecx
    neg = 1;
 62b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 602:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 606:	0f 95 c1             	setne  %cl
 609:	c1 ea 1f             	shr    $0x1f,%edx
 60c:	84 d1                	test   %dl,%cl
 60e:	74 44                	je     654 <printint+0x62>
    neg = 1;
    x = -xx;
 610:	f7 d8                	neg    %eax
 612:	89 c1                	mov    %eax,%ecx
    neg = 1;
 614:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 632:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 637:	89 c8                	mov    %ecx,%eax
 639:	ba 00 00 00 00       	mov    $0x0,%edx
 63e:	f7 f6                	div    %esi
 640:	89 df                	mov    %ebx,%edi
 642:	83 c3 01             	add    $0x1,%ebx
 645:	0f b6 92 dc 09 00 00 	movzbl 0x9dc(%edx),%edx
 64c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 650:	89 ca                	mov    %ecx,%edx
 652:	89 c1                	mov    %eax,%ecx
 654:	39 d6                	cmp    %edx,%esi
 656:	76 df                	jbe    637 <printint+0x2e>
  if(neg)
 658:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 65c:	74 31                	je     68f <printint+0x86>
    buf[i++] = '-';
 65e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 663:	8d 5f 02             	lea    0x2(%edi),%ebx
 666:	8b 75 d0             	mov    -0x30(%ebp),%esi
 669:	eb 17                	jmp    682 <printint+0x79>
    x = xx;
 66b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 66d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 674:	eb bc                	jmp    632 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 676:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 67b:	89 f0                	mov    %esi,%eax
 67d:	e8 6d ff ff ff       	call   5ef <putc>
  while(--i >= 0)
 682:	83 eb 01             	sub    $0x1,%ebx
 685:	79 ef                	jns    676 <printint+0x6d>
}
 687:	83 c4 2c             	add    $0x2c,%esp
 68a:	5b                   	pop    %ebx
 68b:	5e                   	pop    %esi
 68c:	5f                   	pop    %edi
 68d:	5d                   	pop    %ebp
 68e:	c3                   	ret    
 68f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 692:	eb ee                	jmp    682 <printint+0x79>

00000694 <printf>:
=======
 61b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 620:	89 c8                	mov    %ecx,%eax
 622:	ba 00 00 00 00       	mov    $0x0,%edx
 627:	f7 f6                	div    %esi
 629:	89 df                	mov    %ebx,%edi
 62b:	83 c3 01             	add    $0x1,%ebx
 62e:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 635:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 639:	89 ca                	mov    %ecx,%edx
 63b:	89 c1                	mov    %eax,%ecx
 63d:	39 d6                	cmp    %edx,%esi
 63f:	76 df                	jbe    620 <printint+0x2e>
  if(neg)
 641:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 645:	74 31                	je     678 <printint+0x86>
    buf[i++] = '-';
 647:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 64c:	8d 5f 02             	lea    0x2(%edi),%ebx
 64f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 652:	eb 17                	jmp    66b <printint+0x79>
    x = xx;
 654:	89 c1                	mov    %eax,%ecx
  neg = 0;
 656:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 65d:	eb bc                	jmp    61b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 65f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 664:	89 f0                	mov    %esi,%eax
 666:	e8 6d ff ff ff       	call   5d8 <putc>
  while(--i >= 0)
 66b:	83 eb 01             	sub    $0x1,%ebx
 66e:	79 ef                	jns    65f <printint+0x6d>
}
 670:	83 c4 2c             	add    $0x2c,%esp
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67b:	eb ee                	jmp    66b <printint+0x79>

0000067d <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	57                   	push   %edi
 698:	56                   	push   %esi
 699:	53                   	push   %ebx
 69a:	83 ec 1c             	sub    $0x1c,%esp
=======
 67d:	55                   	push   %ebp
 67e:	89 e5                	mov    %esp,%ebp
 680:	57                   	push   %edi
 681:	56                   	push   %esi
 682:	53                   	push   %ebx
 683:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 69d:	8d 45 10             	lea    0x10(%ebp),%eax
 6a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6a3:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6a8:	bb 00 00 00 00       	mov    $0x0,%ebx
 6ad:	eb 14                	jmp    6c3 <printf+0x2f>
=======
 686:	8d 45 10             	lea    0x10(%ebp),%eax
 689:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 68c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 691:	bb 00 00 00 00       	mov    $0x0,%ebx
 696:	eb 14                	jmp    6ac <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 6af:	89 fa                	mov    %edi,%edx
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	e8 36 ff ff ff       	call   5ef <putc>
 6b9:	eb 05                	jmp    6c0 <printf+0x2c>
      }
    } else if(state == '%'){
 6bb:	83 fe 25             	cmp    $0x25,%esi
 6be:	74 25                	je     6e5 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6c0:	83 c3 01             	add    $0x1,%ebx
 6c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6ca:	84 c0                	test   %al,%al
 6cc:	0f 84 20 01 00 00    	je     7f2 <printf+0x15e>
    c = fmt[i] & 0xff;
 6d2:	0f be f8             	movsbl %al,%edi
 6d5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6d8:	85 f6                	test   %esi,%esi
 6da:	75 df                	jne    6bb <printf+0x27>
      if(c == '%'){
 6dc:	83 f8 25             	cmp    $0x25,%eax
 6df:	75 ce                	jne    6af <printf+0x1b>
        state = '%';
 6e1:	89 c6                	mov    %eax,%esi
 6e3:	eb db                	jmp    6c0 <printf+0x2c>
      if(c == 'd'){
 6e5:	83 f8 25             	cmp    $0x25,%eax
 6e8:	0f 84 cf 00 00 00    	je     7bd <printf+0x129>
 6ee:	0f 8c dd 00 00 00    	jl     7d1 <printf+0x13d>
 6f4:	83 f8 78             	cmp    $0x78,%eax
 6f7:	0f 8f d4 00 00 00    	jg     7d1 <printf+0x13d>
 6fd:	83 f8 63             	cmp    $0x63,%eax
 700:	0f 8c cb 00 00 00    	jl     7d1 <printf+0x13d>
 706:	83 e8 63             	sub    $0x63,%eax
 709:	83 f8 15             	cmp    $0x15,%eax
 70c:	0f 87 bf 00 00 00    	ja     7d1 <printf+0x13d>
 712:	ff 24 85 84 09 00 00 	jmp    *0x984(,%eax,4)
        printint(fd, *ap, 10, 1);
 719:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71c:	8b 17                	mov    (%edi),%edx
 71e:	83 ec 0c             	sub    $0xc,%esp
 721:	6a 01                	push   $0x1
 723:	b9 0a 00 00 00       	mov    $0xa,%ecx
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	e8 d9 fe ff ff       	call   609 <printint>
        ap++;
 730:	83 c7 04             	add    $0x4,%edi
 733:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 736:	83 c4 10             	add    $0x10,%esp
=======
 698:	89 fa                	mov    %edi,%edx
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	e8 36 ff ff ff       	call   5d8 <putc>
 6a2:	eb 05                	jmp    6a9 <printf+0x2c>
      }
    } else if(state == '%'){
 6a4:	83 fe 25             	cmp    $0x25,%esi
 6a7:	74 25                	je     6ce <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6a9:	83 c3 01             	add    $0x1,%ebx
 6ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 6af:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6b3:	84 c0                	test   %al,%al
 6b5:	0f 84 20 01 00 00    	je     7db <printf+0x15e>
    c = fmt[i] & 0xff;
 6bb:	0f be f8             	movsbl %al,%edi
 6be:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6c1:	85 f6                	test   %esi,%esi
 6c3:	75 df                	jne    6a4 <printf+0x27>
      if(c == '%'){
 6c5:	83 f8 25             	cmp    $0x25,%eax
 6c8:	75 ce                	jne    698 <printf+0x1b>
        state = '%';
 6ca:	89 c6                	mov    %eax,%esi
 6cc:	eb db                	jmp    6a9 <printf+0x2c>
      if(c == 'd'){
 6ce:	83 f8 25             	cmp    $0x25,%eax
 6d1:	0f 84 cf 00 00 00    	je     7a6 <printf+0x129>
 6d7:	0f 8c dd 00 00 00    	jl     7ba <printf+0x13d>
 6dd:	83 f8 78             	cmp    $0x78,%eax
 6e0:	0f 8f d4 00 00 00    	jg     7ba <printf+0x13d>
 6e6:	83 f8 63             	cmp    $0x63,%eax
 6e9:	0f 8c cb 00 00 00    	jl     7ba <printf+0x13d>
 6ef:	83 e8 63             	sub    $0x63,%eax
 6f2:	83 f8 15             	cmp    $0x15,%eax
 6f5:	0f 87 bf 00 00 00    	ja     7ba <printf+0x13d>
 6fb:	ff 24 85 6c 09 00 00 	jmp    *0x96c(,%eax,4)
        printint(fd, *ap, 10, 1);
 702:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 705:	8b 17                	mov    (%edi),%edx
 707:	83 ec 0c             	sub    $0xc,%esp
 70a:	6a 01                	push   $0x1
 70c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	e8 d9 fe ff ff       	call   5f2 <printint>
        ap++;
 719:	83 c7 04             	add    $0x4,%edi
 71c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 71f:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 739:	be 00 00 00 00       	mov    $0x0,%esi
 73e:	eb 80                	jmp    6c0 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 740:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 743:	8b 17                	mov    (%edi),%edx
 745:	83 ec 0c             	sub    $0xc,%esp
 748:	6a 00                	push   $0x0
 74a:	b9 10 00 00 00       	mov    $0x10,%ecx
 74f:	8b 45 08             	mov    0x8(%ebp),%eax
 752:	e8 b2 fe ff ff       	call   609 <printint>
        ap++;
 757:	83 c7 04             	add    $0x4,%edi
 75a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 75d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	e9 56 ff ff ff       	jmp    6c0 <printf+0x2c>
        s = (char*)*ap;
 76a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 76d:	8b 30                	mov    (%eax),%esi
        ap++;
 76f:	83 c0 04             	add    $0x4,%eax
 772:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 775:	85 f6                	test   %esi,%esi
 777:	75 15                	jne    78e <printf+0xfa>
          s = "(null)";
 779:	be 7a 09 00 00       	mov    $0x97a,%esi
 77e:	eb 0e                	jmp    78e <printf+0xfa>
          putc(fd, *s);
 780:	0f be d2             	movsbl %dl,%edx
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	e8 64 fe ff ff       	call   5ef <putc>
          s++;
 78b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 78e:	0f b6 16             	movzbl (%esi),%edx
 791:	84 d2                	test   %dl,%dl
 793:	75 eb                	jne    780 <printf+0xec>
      state = 0;
 795:	be 00 00 00 00       	mov    $0x0,%esi
 79a:	e9 21 ff ff ff       	jmp    6c0 <printf+0x2c>
        putc(fd, *ap);
 79f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7a2:	0f be 17             	movsbl (%edi),%edx
 7a5:	8b 45 08             	mov    0x8(%ebp),%eax
 7a8:	e8 42 fe ff ff       	call   5ef <putc>
        ap++;
 7ad:	83 c7 04             	add    $0x4,%edi
 7b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7b3:	be 00 00 00 00       	mov    $0x0,%esi
 7b8:	e9 03 ff ff ff       	jmp    6c0 <printf+0x2c>
        putc(fd, c);
 7bd:	89 fa                	mov    %edi,%edx
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	e8 28 fe ff ff       	call   5ef <putc>
      state = 0;
 7c7:	be 00 00 00 00       	mov    $0x0,%esi
 7cc:	e9 ef fe ff ff       	jmp    6c0 <printf+0x2c>
        putc(fd, '%');
 7d1:	ba 25 00 00 00       	mov    $0x25,%edx
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	e8 11 fe ff ff       	call   5ef <putc>
        putc(fd, c);
 7de:	89 fa                	mov    %edi,%edx
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	e8 07 fe ff ff       	call   5ef <putc>
      state = 0;
 7e8:	be 00 00 00 00       	mov    $0x0,%esi
 7ed:	e9 ce fe ff ff       	jmp    6c0 <printf+0x2c>
    }
  }
}
 7f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7f5:	5b                   	pop    %ebx
 7f6:	5e                   	pop    %esi
 7f7:	5f                   	pop    %edi
 7f8:	5d                   	pop    %ebp
 7f9:	c3                   	ret    

000007fa <free>:
=======
 722:	be 00 00 00 00       	mov    $0x0,%esi
 727:	eb 80                	jmp    6a9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 729:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 72c:	8b 17                	mov    (%edi),%edx
 72e:	83 ec 0c             	sub    $0xc,%esp
 731:	6a 00                	push   $0x0
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	e8 b2 fe ff ff       	call   5f2 <printint>
        ap++;
 740:	83 c7 04             	add    $0x4,%edi
 743:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 746:	83 c4 10             	add    $0x10,%esp
      state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
 74e:	e9 56 ff ff ff       	jmp    6a9 <printf+0x2c>
        s = (char*)*ap;
 753:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 756:	8b 30                	mov    (%eax),%esi
        ap++;
 758:	83 c0 04             	add    $0x4,%eax
 75b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 75e:	85 f6                	test   %esi,%esi
 760:	75 15                	jne    777 <printf+0xfa>
          s = "(null)";
 762:	be 62 09 00 00       	mov    $0x962,%esi
 767:	eb 0e                	jmp    777 <printf+0xfa>
          putc(fd, *s);
 769:	0f be d2             	movsbl %dl,%edx
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	e8 64 fe ff ff       	call   5d8 <putc>
          s++;
 774:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 777:	0f b6 16             	movzbl (%esi),%edx
 77a:	84 d2                	test   %dl,%dl
 77c:	75 eb                	jne    769 <printf+0xec>
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 21 ff ff ff       	jmp    6a9 <printf+0x2c>
        putc(fd, *ap);
 788:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 78b:	0f be 17             	movsbl (%edi),%edx
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	e8 42 fe ff ff       	call   5d8 <putc>
        ap++;
 796:	83 c7 04             	add    $0x4,%edi
 799:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 79c:	be 00 00 00 00       	mov    $0x0,%esi
 7a1:	e9 03 ff ff ff       	jmp    6a9 <printf+0x2c>
        putc(fd, c);
 7a6:	89 fa                	mov    %edi,%edx
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	e8 28 fe ff ff       	call   5d8 <putc>
      state = 0;
 7b0:	be 00 00 00 00       	mov    $0x0,%esi
 7b5:	e9 ef fe ff ff       	jmp    6a9 <printf+0x2c>
        putc(fd, '%');
 7ba:	ba 25 00 00 00       	mov    $0x25,%edx
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	e8 11 fe ff ff       	call   5d8 <putc>
        putc(fd, c);
 7c7:	89 fa                	mov    %edi,%edx
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	e8 07 fe ff ff       	call   5d8 <putc>
      state = 0;
 7d1:	be 00 00 00 00       	mov    $0x0,%esi
 7d6:	e9 ce fe ff ff       	jmp    6a9 <printf+0x2c>
    }
  }
}
 7db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7de:	5b                   	pop    %ebx
 7df:	5e                   	pop    %esi
 7e0:	5f                   	pop    %edi
 7e1:	5d                   	pop    %ebp
 7e2:	c3                   	ret    

000007e3 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 7fa:	55                   	push   %ebp
 7fb:	89 e5                	mov    %esp,%ebp
 7fd:	57                   	push   %edi
 7fe:	56                   	push   %esi
 7ff:	53                   	push   %ebx
 800:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 803:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 806:	a1 00 13 00 00       	mov    0x1300,%eax
 80b:	eb 02                	jmp    80f <free+0x15>
 80d:	89 d0                	mov    %edx,%eax
 80f:	39 c8                	cmp    %ecx,%eax
 811:	73 04                	jae    817 <free+0x1d>
 813:	39 08                	cmp    %ecx,(%eax)
 815:	77 12                	ja     829 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 817:	8b 10                	mov    (%eax),%edx
 819:	39 c2                	cmp    %eax,%edx
 81b:	77 f0                	ja     80d <free+0x13>
 81d:	39 c8                	cmp    %ecx,%eax
 81f:	72 08                	jb     829 <free+0x2f>
 821:	39 ca                	cmp    %ecx,%edx
 823:	77 04                	ja     829 <free+0x2f>
 825:	89 d0                	mov    %edx,%eax
 827:	eb e6                	jmp    80f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 829:	8b 73 fc             	mov    -0x4(%ebx),%esi
 82c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 82f:	8b 10                	mov    (%eax),%edx
 831:	39 d7                	cmp    %edx,%edi
 833:	74 19                	je     84e <free+0x54>
=======
 7e3:	55                   	push   %ebp
 7e4:	89 e5                	mov    %esp,%ebp
 7e6:	57                   	push   %edi
 7e7:	56                   	push   %esi
 7e8:	53                   	push   %ebx
 7e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ec:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ef:	a1 00 15 00 00       	mov    0x1500,%eax
 7f4:	eb 02                	jmp    7f8 <free+0x15>
 7f6:	89 d0                	mov    %edx,%eax
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	73 04                	jae    800 <free+0x1d>
 7fc:	39 08                	cmp    %ecx,(%eax)
 7fe:	77 12                	ja     812 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 800:	8b 10                	mov    (%eax),%edx
 802:	39 c2                	cmp    %eax,%edx
 804:	77 f0                	ja     7f6 <free+0x13>
 806:	39 c8                	cmp    %ecx,%eax
 808:	72 08                	jb     812 <free+0x2f>
 80a:	39 ca                	cmp    %ecx,%edx
 80c:	77 04                	ja     812 <free+0x2f>
 80e:	89 d0                	mov    %edx,%eax
 810:	eb e6                	jmp    7f8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 812:	8b 73 fc             	mov    -0x4(%ebx),%esi
 815:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 818:	8b 10                	mov    (%eax),%edx
 81a:	39 d7                	cmp    %edx,%edi
 81c:	74 19                	je     837 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 835:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 838:	8b 50 04             	mov    0x4(%eax),%edx
 83b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 83e:	39 ce                	cmp    %ecx,%esi
 840:	74 1b                	je     85d <free+0x63>
=======
 81e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 821:	8b 50 04             	mov    0x4(%eax),%edx
 824:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 827:	39 ce                	cmp    %ecx,%esi
 829:	74 1b                	je     846 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 842:	89 08                	mov    %ecx,(%eax)
  freep = p;
 844:	a3 00 13 00 00       	mov    %eax,0x1300
}
 849:	5b                   	pop    %ebx
 84a:	5e                   	pop    %esi
 84b:	5f                   	pop    %edi
 84c:	5d                   	pop    %ebp
 84d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 84e:	03 72 04             	add    0x4(%edx),%esi
 851:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 854:	8b 10                	mov    (%eax),%edx
 856:	8b 12                	mov    (%edx),%edx
 858:	89 53 f8             	mov    %edx,-0x8(%ebx)
 85b:	eb db                	jmp    838 <free+0x3e>
    p->s.size += bp->s.size;
 85d:	03 53 fc             	add    -0x4(%ebx),%edx
 860:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 863:	8b 53 f8             	mov    -0x8(%ebx),%edx
 866:	89 10                	mov    %edx,(%eax)
 868:	eb da                	jmp    844 <free+0x4a>

0000086a <morecore>:
=======
 82b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 82d:	a3 00 15 00 00       	mov    %eax,0x1500
}
 832:	5b                   	pop    %ebx
 833:	5e                   	pop    %esi
 834:	5f                   	pop    %edi
 835:	5d                   	pop    %ebp
 836:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 837:	03 72 04             	add    0x4(%edx),%esi
 83a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 83d:	8b 10                	mov    (%eax),%edx
 83f:	8b 12                	mov    (%edx),%edx
 841:	89 53 f8             	mov    %edx,-0x8(%ebx)
 844:	eb db                	jmp    821 <free+0x3e>
    p->s.size += bp->s.size;
 846:	03 53 fc             	add    -0x4(%ebx),%edx
 849:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 84c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 84f:	89 10                	mov    %edx,(%eax)
 851:	eb da                	jmp    82d <free+0x4a>

00000853 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 86a:	55                   	push   %ebp
 86b:	89 e5                	mov    %esp,%ebp
 86d:	53                   	push   %ebx
 86e:	83 ec 04             	sub    $0x4,%esp
 871:	89 c3                	mov    %eax,%ebx
=======
 853:	55                   	push   %ebp
 854:	89 e5                	mov    %esp,%ebp
 856:	53                   	push   %ebx
 857:	83 ec 04             	sub    $0x4,%esp
 85a:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 873:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 878:	77 05                	ja     87f <morecore+0x15>
    nu = 4096;
 87a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 87f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 886:	83 ec 0c             	sub    $0xc,%esp
 889:	50                   	push   %eax
 88a:	e8 38 fd ff ff       	call   5c7 <sbrk>
  if(p == (char*)-1)
 88f:	83 c4 10             	add    $0x10,%esp
 892:	83 f8 ff             	cmp    $0xffffffff,%eax
 895:	74 1c                	je     8b3 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 897:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 89a:	83 c0 08             	add    $0x8,%eax
 89d:	83 ec 0c             	sub    $0xc,%esp
 8a0:	50                   	push   %eax
 8a1:	e8 54 ff ff ff       	call   7fa <free>
  return freep;
 8a6:	a1 00 13 00 00       	mov    0x1300,%eax
 8ab:	83 c4 10             	add    $0x10,%esp
}
 8ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b1:	c9                   	leave  
 8b2:	c3                   	ret    
    return 0;
 8b3:	b8 00 00 00 00       	mov    $0x0,%eax
 8b8:	eb f4                	jmp    8ae <morecore+0x44>

000008ba <malloc>:
=======
 85c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 861:	77 05                	ja     868 <morecore+0x15>
    nu = 4096;
 863:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 868:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 86f:	83 ec 0c             	sub    $0xc,%esp
 872:	50                   	push   %eax
 873:	e8 38 fd ff ff       	call   5b0 <sbrk>
  if(p == (char*)-1)
 878:	83 c4 10             	add    $0x10,%esp
 87b:	83 f8 ff             	cmp    $0xffffffff,%eax
 87e:	74 1c                	je     89c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 880:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 883:	83 c0 08             	add    $0x8,%eax
 886:	83 ec 0c             	sub    $0xc,%esp
 889:	50                   	push   %eax
 88a:	e8 54 ff ff ff       	call   7e3 <free>
  return freep;
 88f:	a1 00 15 00 00       	mov    0x1500,%eax
 894:	83 c4 10             	add    $0x10,%esp
}
 897:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 89a:	c9                   	leave  
 89b:	c3                   	ret    
    return 0;
 89c:	b8 00 00 00 00       	mov    $0x0,%eax
 8a1:	eb f4                	jmp    897 <morecore+0x44>

000008a3 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 8ba:	55                   	push   %ebp
 8bb:	89 e5                	mov    %esp,%ebp
 8bd:	53                   	push   %ebx
 8be:	83 ec 04             	sub    $0x4,%esp
=======
 8a3:	55                   	push   %ebp
 8a4:	89 e5                	mov    %esp,%ebp
 8a6:	53                   	push   %ebx
 8a7:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 8c1:	8b 45 08             	mov    0x8(%ebp),%eax
 8c4:	8d 58 07             	lea    0x7(%eax),%ebx
 8c7:	c1 eb 03             	shr    $0x3,%ebx
 8ca:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8cd:	8b 0d 00 13 00 00    	mov    0x1300,%ecx
 8d3:	85 c9                	test   %ecx,%ecx
 8d5:	74 04                	je     8db <malloc+0x21>
=======
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	8d 58 07             	lea    0x7(%eax),%ebx
 8b0:	c1 eb 03             	shr    $0x3,%ebx
 8b3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8b6:	8b 0d 00 15 00 00    	mov    0x1500,%ecx
 8bc:	85 c9                	test   %ecx,%ecx
 8be:	74 04                	je     8c4 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 8d7:	8b 01                	mov    (%ecx),%eax
 8d9:	eb 4a                	jmp    925 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8db:	c7 05 00 13 00 00 04 	movl   $0x1304,0x1300
 8e2:	13 00 00 
 8e5:	c7 05 04 13 00 00 04 	movl   $0x1304,0x1304
 8ec:	13 00 00 
    base.s.size = 0;
 8ef:	c7 05 08 13 00 00 00 	movl   $0x0,0x1308
 8f6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8f9:	b9 04 13 00 00       	mov    $0x1304,%ecx
 8fe:	eb d7                	jmp    8d7 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 900:	74 19                	je     91b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 902:	29 da                	sub    %ebx,%edx
 904:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 907:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 90a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 90d:	89 0d 00 13 00 00    	mov    %ecx,0x1300
      return (void*)(p + 1);
 913:	83 c0 08             	add    $0x8,%eax
=======
 8c0:	8b 01                	mov    (%ecx),%eax
 8c2:	eb 4a                	jmp    90e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8c4:	c7 05 00 15 00 00 04 	movl   $0x1504,0x1500
 8cb:	15 00 00 
 8ce:	c7 05 04 15 00 00 04 	movl   $0x1504,0x1504
 8d5:	15 00 00 
    base.s.size = 0;
 8d8:	c7 05 08 15 00 00 00 	movl   $0x0,0x1508
 8df:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8e2:	b9 04 15 00 00       	mov    $0x1504,%ecx
 8e7:	eb d7                	jmp    8c0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8e9:	74 19                	je     904 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8eb:	29 da                	sub    %ebx,%edx
 8ed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8f3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8f6:	89 0d 00 15 00 00    	mov    %ecx,0x1500
      return (void*)(p + 1);
 8fc:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 919:	c9                   	leave  
 91a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 91b:	8b 10                	mov    (%eax),%edx
 91d:	89 11                	mov    %edx,(%ecx)
 91f:	eb ec                	jmp    90d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 921:	89 c1                	mov    %eax,%ecx
 923:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 925:	8b 50 04             	mov    0x4(%eax),%edx
 928:	39 da                	cmp    %ebx,%edx
 92a:	73 d4                	jae    900 <malloc+0x46>
    if(p == freep)
 92c:	39 05 00 13 00 00    	cmp    %eax,0x1300
 932:	75 ed                	jne    921 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 934:	89 d8                	mov    %ebx,%eax
 936:	e8 2f ff ff ff       	call   86a <morecore>
 93b:	85 c0                	test   %eax,%eax
 93d:	75 e2                	jne    921 <malloc+0x67>
 93f:	eb d5                	jmp    916 <malloc+0x5c>
=======
 8ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 902:	c9                   	leave  
 903:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 904:	8b 10                	mov    (%eax),%edx
 906:	89 11                	mov    %edx,(%ecx)
 908:	eb ec                	jmp    8f6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90a:	89 c1                	mov    %eax,%ecx
 90c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 90e:	8b 50 04             	mov    0x4(%eax),%edx
 911:	39 da                	cmp    %ebx,%edx
 913:	73 d4                	jae    8e9 <malloc+0x46>
    if(p == freep)
 915:	39 05 00 15 00 00    	cmp    %eax,0x1500
 91b:	75 ed                	jne    90a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 91d:	89 d8                	mov    %ebx,%eax
 91f:	e8 2f ff ff ff       	call   853 <morecore>
 924:	85 c0                	test   %eax,%eax
 926:	75 e2                	jne    90a <malloc+0x67>
 928:	eb d5                	jmp    8ff <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
