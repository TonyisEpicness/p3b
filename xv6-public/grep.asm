
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
 137:	e8 3c 02 00 00       	call   378 <strchr>
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
 168:	e8 4d 03 00 00       	call   4ba <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe 40 0d 00 00    	cmp    $0xd40,%esi
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
 18f:	8d 81 40 0d 00 00    	lea    0xd40(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
 199:	e8 14 03 00 00       	call   4b2 <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 40 0d 00 00 00 	movb   $0x0,0xd40(%edx)
    p = buf;
 1b2:	be 40 0d 00 00       	mov    $0xd40,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d 40 0d 00 00       	sub    $0xd40,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 40 0d 00 00       	push   $0xd40
 1d2:	e8 8f 02 00 00       	call   466 <memmove>
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
 237:	e8 9e 02 00 00       	call   4da <open>
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
 254:	e8 69 02 00 00       	call   4c2 <close>
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 9c 08 00 00       	push   $0x89c
 269:	6a 02                	push   $0x2
 26b:	e8 7f 03 00 00       	call   5ef <printf>
    exit();
 270:	e8 25 02 00 00       	call   49a <exit>
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
 280:	e8 15 02 00 00       	call   49a <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 bc 08 00 00       	push   $0x8bc
 28f:	6a 01                	push   $0x1
 291:	e8 59 03 00 00       	call   5ef <printf>
      exit();
 296:	e8 ff 01 00 00       	call   49a <exit>
  exit();
 29b:	e8 fa 01 00 00       	call   49a <exit>

000002a0 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 2b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2b6:	c3                   	ret    

000002b7 <thread_join>:

int thread_join() {
  return 0;
}
 2b7:	b8 00 00 00 00       	mov    $0x0,%eax
 2bc:	c3                   	ret    

000002bd <lock_acquire>:

void lock_acquire(lock_t *lock){
 2bd:	55                   	push   %ebp
 2be:	89 e5                	mov    %esp,%ebp
 2c0:	53                   	push   %ebx
 2c1:	83 ec 04             	sub    $0x4,%esp
 2c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2c7:	83 ec 08             	sub    $0x8,%esp
 2ca:	6a 01                	push   $0x1
 2cc:	53                   	push   %ebx
 2cd:	e8 ce ff ff ff       	call   2a0 <test_and_set>
 2d2:	83 c4 10             	add    $0x10,%esp
 2d5:	83 f8 01             	cmp    $0x1,%eax
 2d8:	74 ed                	je     2c7 <lock_acquire+0xa>
    ;
}
 2da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <lock_release>:

void lock_release(lock_t *lock) {
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
 2e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    

000002ed <lock_init>:

void lock_init(lock_t *lock) {
 2ed:	55                   	push   %ebp
 2ee:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    

000002fb <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2fb:	55                   	push   %ebp
 2fc:	89 e5                	mov    %esp,%ebp
 2fe:	56                   	push   %esi
 2ff:	53                   	push   %ebx
 300:	8b 75 08             	mov    0x8(%ebp),%esi
 303:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 306:	89 f0                	mov    %esi,%eax
 308:	89 d1                	mov    %edx,%ecx
 30a:	83 c2 01             	add    $0x1,%edx
 30d:	89 c3                	mov    %eax,%ebx
 30f:	83 c0 01             	add    $0x1,%eax
 312:	0f b6 09             	movzbl (%ecx),%ecx
 315:	88 0b                	mov    %cl,(%ebx)
 317:	84 c9                	test   %cl,%cl
 319:	75 ed                	jne    308 <strcpy+0xd>
    ;
  return os;
}
 31b:	89 f0                	mov    %esi,%eax
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
 327:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 32a:	eb 06                	jmp    332 <strcmp+0x11>
    p++, q++;
 32c:	83 c1 01             	add    $0x1,%ecx
 32f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 332:	0f b6 01             	movzbl (%ecx),%eax
 335:	84 c0                	test   %al,%al
 337:	74 04                	je     33d <strcmp+0x1c>
 339:	3a 02                	cmp    (%edx),%al
 33b:	74 ef                	je     32c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 33d:	0f b6 c0             	movzbl %al,%eax
 340:	0f b6 12             	movzbl (%edx),%edx
 343:	29 d0                	sub    %edx,%eax
}
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <strlen>:

uint
strlen(const char *s)
{
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 34d:	b8 00 00 00 00       	mov    $0x0,%eax
 352:	eb 03                	jmp    357 <strlen+0x10>
 354:	83 c0 01             	add    $0x1,%eax
 357:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 35b:	75 f7                	jne    354 <strlen+0xd>
    ;
  return n;
}
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    

0000035f <memset>:

void*
memset(void *dst, int c, uint n)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	57                   	push   %edi
 363:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 366:	89 d7                	mov    %edx,%edi
 368:	8b 4d 10             	mov    0x10(%ebp),%ecx
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	fc                   	cld    
 36f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 371:	89 d0                	mov    %edx,%eax
 373:	8b 7d fc             	mov    -0x4(%ebp),%edi
 376:	c9                   	leave  
 377:	c3                   	ret    

00000378 <strchr>:

char*
strchr(const char *s, char c)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 382:	eb 03                	jmp    387 <strchr+0xf>
 384:	83 c0 01             	add    $0x1,%eax
 387:	0f b6 10             	movzbl (%eax),%edx
 38a:	84 d2                	test   %dl,%dl
 38c:	74 06                	je     394 <strchr+0x1c>
    if(*s == c)
 38e:	38 ca                	cmp    %cl,%dl
 390:	75 f2                	jne    384 <strchr+0xc>
 392:	eb 05                	jmp    399 <strchr+0x21>
      return (char*)s;
  return 0;
 394:	b8 00 00 00 00       	mov    $0x0,%eax
}
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    

0000039b <gets>:

char*
gets(char *buf, int max)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	56                   	push   %esi
 3a0:	53                   	push   %ebx
 3a1:	83 ec 1c             	sub    $0x1c,%esp
 3a4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a7:	bb 00 00 00 00       	mov    $0x0,%ebx
 3ac:	89 de                	mov    %ebx,%esi
 3ae:	83 c3 01             	add    $0x1,%ebx
 3b1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3b4:	7d 2e                	jge    3e4 <gets+0x49>
    cc = read(0, &c, 1);
 3b6:	83 ec 04             	sub    $0x4,%esp
 3b9:	6a 01                	push   $0x1
 3bb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3be:	50                   	push   %eax
 3bf:	6a 00                	push   $0x0
 3c1:	e8 ec 00 00 00       	call   4b2 <read>
    if(cc < 1)
 3c6:	83 c4 10             	add    $0x10,%esp
 3c9:	85 c0                	test   %eax,%eax
 3cb:	7e 17                	jle    3e4 <gets+0x49>
      break;
    buf[i++] = c;
 3cd:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3d1:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3d4:	3c 0a                	cmp    $0xa,%al
 3d6:	0f 94 c2             	sete   %dl
 3d9:	3c 0d                	cmp    $0xd,%al
 3db:	0f 94 c0             	sete   %al
 3de:	08 c2                	or     %al,%dl
 3e0:	74 ca                	je     3ac <gets+0x11>
    buf[i++] = c;
 3e2:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3e4:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3e8:	89 f8                	mov    %edi,%eax
 3ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ed:	5b                   	pop    %ebx
 3ee:	5e                   	pop    %esi
 3ef:	5f                   	pop    %edi
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret    

000003f2 <stat>:

int
stat(const char *n, struct stat *st)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	56                   	push   %esi
 3f6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f7:	83 ec 08             	sub    $0x8,%esp
 3fa:	6a 00                	push   $0x0
 3fc:	ff 75 08             	push   0x8(%ebp)
 3ff:	e8 d6 00 00 00       	call   4da <open>
  if(fd < 0)
 404:	83 c4 10             	add    $0x10,%esp
 407:	85 c0                	test   %eax,%eax
 409:	78 24                	js     42f <stat+0x3d>
 40b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 40d:	83 ec 08             	sub    $0x8,%esp
 410:	ff 75 0c             	push   0xc(%ebp)
 413:	50                   	push   %eax
 414:	e8 d9 00 00 00       	call   4f2 <fstat>
 419:	89 c6                	mov    %eax,%esi
  close(fd);
 41b:	89 1c 24             	mov    %ebx,(%esp)
 41e:	e8 9f 00 00 00       	call   4c2 <close>
  return r;
 423:	83 c4 10             	add    $0x10,%esp
}
 426:	89 f0                	mov    %esi,%eax
 428:	8d 65 f8             	lea    -0x8(%ebp),%esp
 42b:	5b                   	pop    %ebx
 42c:	5e                   	pop    %esi
 42d:	5d                   	pop    %ebp
 42e:	c3                   	ret    
    return -1;
 42f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 434:	eb f0                	jmp    426 <stat+0x34>

00000436 <atoi>:

int
atoi(const char *s)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	53                   	push   %ebx
 43a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 43d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 442:	eb 10                	jmp    454 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 444:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 447:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 44a:	83 c1 01             	add    $0x1,%ecx
 44d:	0f be c0             	movsbl %al,%eax
 450:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 454:	0f b6 01             	movzbl (%ecx),%eax
 457:	8d 58 d0             	lea    -0x30(%eax),%ebx
 45a:	80 fb 09             	cmp    $0x9,%bl
 45d:	76 e5                	jbe    444 <atoi+0xe>
  return n;
}
 45f:	89 d0                	mov    %edx,%eax
 461:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 464:	c9                   	leave  
 465:	c3                   	ret    

00000466 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	56                   	push   %esi
 46a:	53                   	push   %ebx
 46b:	8b 75 08             	mov    0x8(%ebp),%esi
 46e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 471:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 474:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 476:	eb 0d                	jmp    485 <memmove+0x1f>
    *dst++ = *src++;
 478:	0f b6 01             	movzbl (%ecx),%eax
 47b:	88 02                	mov    %al,(%edx)
 47d:	8d 49 01             	lea    0x1(%ecx),%ecx
 480:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 483:	89 d8                	mov    %ebx,%eax
 485:	8d 58 ff             	lea    -0x1(%eax),%ebx
 488:	85 c0                	test   %eax,%eax
 48a:	7f ec                	jg     478 <memmove+0x12>
  return vdst;
}
 48c:	89 f0                	mov    %esi,%eax
 48e:	5b                   	pop    %ebx
 48f:	5e                   	pop    %esi
 490:	5d                   	pop    %ebp
 491:	c3                   	ret    

00000492 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 492:	b8 01 00 00 00       	mov    $0x1,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <exit>:
SYSCALL(exit)
 49a:	b8 02 00 00 00       	mov    $0x2,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <wait>:
SYSCALL(wait)
 4a2:	b8 03 00 00 00       	mov    $0x3,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <pipe>:
SYSCALL(pipe)
 4aa:	b8 04 00 00 00       	mov    $0x4,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <read>:
SYSCALL(read)
 4b2:	b8 05 00 00 00       	mov    $0x5,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <write>:
SYSCALL(write)
 4ba:	b8 10 00 00 00       	mov    $0x10,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <close>:
SYSCALL(close)
 4c2:	b8 15 00 00 00       	mov    $0x15,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <kill>:
SYSCALL(kill)
 4ca:	b8 06 00 00 00       	mov    $0x6,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <exec>:
SYSCALL(exec)
 4d2:	b8 07 00 00 00       	mov    $0x7,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <open>:
SYSCALL(open)
 4da:	b8 0f 00 00 00       	mov    $0xf,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <mknod>:
SYSCALL(mknod)
 4e2:	b8 11 00 00 00       	mov    $0x11,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <unlink>:
SYSCALL(unlink)
 4ea:	b8 12 00 00 00       	mov    $0x12,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <fstat>:
SYSCALL(fstat)
 4f2:	b8 08 00 00 00       	mov    $0x8,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <link>:
SYSCALL(link)
 4fa:	b8 13 00 00 00       	mov    $0x13,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <mkdir>:
SYSCALL(mkdir)
 502:	b8 14 00 00 00       	mov    $0x14,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <chdir>:
SYSCALL(chdir)
 50a:	b8 09 00 00 00       	mov    $0x9,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <dup>:
SYSCALL(dup)
 512:	b8 0a 00 00 00       	mov    $0xa,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <getpid>:
SYSCALL(getpid)
 51a:	b8 0b 00 00 00       	mov    $0xb,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <sbrk>:
SYSCALL(sbrk)
 522:	b8 0c 00 00 00       	mov    $0xc,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <sleep>:
SYSCALL(sleep)
 52a:	b8 0d 00 00 00       	mov    $0xd,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <uptime>:
SYSCALL(uptime)
 532:	b8 0e 00 00 00       	mov    $0xe,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <clone>:
SYSCALL(clone)
 53a:	b8 16 00 00 00       	mov    $0x16,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <join>:
 542:	b8 17 00 00 00       	mov    $0x17,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 54a:	55                   	push   %ebp
 54b:	89 e5                	mov    %esp,%ebp
 54d:	83 ec 1c             	sub    $0x1c,%esp
 550:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 553:	6a 01                	push   $0x1
 555:	8d 55 f4             	lea    -0xc(%ebp),%edx
 558:	52                   	push   %edx
 559:	50                   	push   %eax
 55a:	e8 5b ff ff ff       	call   4ba <write>
}
 55f:	83 c4 10             	add    $0x10,%esp
 562:	c9                   	leave  
 563:	c3                   	ret    

00000564 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
 56a:	83 ec 2c             	sub    $0x2c,%esp
 56d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 570:	89 d0                	mov    %edx,%eax
 572:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 574:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 578:	0f 95 c1             	setne  %cl
 57b:	c1 ea 1f             	shr    $0x1f,%edx
 57e:	84 d1                	test   %dl,%cl
 580:	74 44                	je     5c6 <printint+0x62>
    neg = 1;
    x = -xx;
 582:	f7 d8                	neg    %eax
 584:	89 c1                	mov    %eax,%ecx
    neg = 1;
 586:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 58d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 592:	89 c8                	mov    %ecx,%eax
 594:	ba 00 00 00 00       	mov    $0x0,%edx
 599:	f7 f6                	div    %esi
 59b:	89 df                	mov    %ebx,%edi
 59d:	83 c3 01             	add    $0x1,%ebx
 5a0:	0f b6 92 34 09 00 00 	movzbl 0x934(%edx),%edx
 5a7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5ab:	89 ca                	mov    %ecx,%edx
 5ad:	89 c1                	mov    %eax,%ecx
 5af:	39 d6                	cmp    %edx,%esi
 5b1:	76 df                	jbe    592 <printint+0x2e>
  if(neg)
 5b3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5b7:	74 31                	je     5ea <printint+0x86>
    buf[i++] = '-';
 5b9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5be:	8d 5f 02             	lea    0x2(%edi),%ebx
 5c1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5c4:	eb 17                	jmp    5dd <printint+0x79>
    x = xx;
 5c6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5c8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5cf:	eb bc                	jmp    58d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5d1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5d6:	89 f0                	mov    %esi,%eax
 5d8:	e8 6d ff ff ff       	call   54a <putc>
  while(--i >= 0)
 5dd:	83 eb 01             	sub    $0x1,%ebx
 5e0:	79 ef                	jns    5d1 <printint+0x6d>
}
 5e2:	83 c4 2c             	add    $0x2c,%esp
 5e5:	5b                   	pop    %ebx
 5e6:	5e                   	pop    %esi
 5e7:	5f                   	pop    %edi
 5e8:	5d                   	pop    %ebp
 5e9:	c3                   	ret    
 5ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ed:	eb ee                	jmp    5dd <printint+0x79>

000005ef <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ef:	55                   	push   %ebp
 5f0:	89 e5                	mov    %esp,%ebp
 5f2:	57                   	push   %edi
 5f3:	56                   	push   %esi
 5f4:	53                   	push   %ebx
 5f5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5f8:	8d 45 10             	lea    0x10(%ebp),%eax
 5fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5fe:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 603:	bb 00 00 00 00       	mov    $0x0,%ebx
 608:	eb 14                	jmp    61e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 60a:	89 fa                	mov    %edi,%edx
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	e8 36 ff ff ff       	call   54a <putc>
 614:	eb 05                	jmp    61b <printf+0x2c>
      }
    } else if(state == '%'){
 616:	83 fe 25             	cmp    $0x25,%esi
 619:	74 25                	je     640 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 61b:	83 c3 01             	add    $0x1,%ebx
 61e:	8b 45 0c             	mov    0xc(%ebp),%eax
 621:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 625:	84 c0                	test   %al,%al
 627:	0f 84 20 01 00 00    	je     74d <printf+0x15e>
    c = fmt[i] & 0xff;
 62d:	0f be f8             	movsbl %al,%edi
 630:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 633:	85 f6                	test   %esi,%esi
 635:	75 df                	jne    616 <printf+0x27>
      if(c == '%'){
 637:	83 f8 25             	cmp    $0x25,%eax
 63a:	75 ce                	jne    60a <printf+0x1b>
        state = '%';
 63c:	89 c6                	mov    %eax,%esi
 63e:	eb db                	jmp    61b <printf+0x2c>
      if(c == 'd'){
 640:	83 f8 25             	cmp    $0x25,%eax
 643:	0f 84 cf 00 00 00    	je     718 <printf+0x129>
 649:	0f 8c dd 00 00 00    	jl     72c <printf+0x13d>
 64f:	83 f8 78             	cmp    $0x78,%eax
 652:	0f 8f d4 00 00 00    	jg     72c <printf+0x13d>
 658:	83 f8 63             	cmp    $0x63,%eax
 65b:	0f 8c cb 00 00 00    	jl     72c <printf+0x13d>
 661:	83 e8 63             	sub    $0x63,%eax
 664:	83 f8 15             	cmp    $0x15,%eax
 667:	0f 87 bf 00 00 00    	ja     72c <printf+0x13d>
 66d:	ff 24 85 dc 08 00 00 	jmp    *0x8dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 674:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 677:	8b 17                	mov    (%edi),%edx
 679:	83 ec 0c             	sub    $0xc,%esp
 67c:	6a 01                	push   $0x1
 67e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	e8 d9 fe ff ff       	call   564 <printint>
        ap++;
 68b:	83 c7 04             	add    $0x4,%edi
 68e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 691:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 694:	be 00 00 00 00       	mov    $0x0,%esi
 699:	eb 80                	jmp    61b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 69b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 69e:	8b 17                	mov    (%edi),%edx
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	6a 00                	push   $0x0
 6a5:	b9 10 00 00 00       	mov    $0x10,%ecx
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	e8 b2 fe ff ff       	call   564 <printint>
        ap++;
 6b2:	83 c7 04             	add    $0x4,%edi
 6b5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bb:	be 00 00 00 00       	mov    $0x0,%esi
 6c0:	e9 56 ff ff ff       	jmp    61b <printf+0x2c>
        s = (char*)*ap;
 6c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c8:	8b 30                	mov    (%eax),%esi
        ap++;
 6ca:	83 c0 04             	add    $0x4,%eax
 6cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6d0:	85 f6                	test   %esi,%esi
 6d2:	75 15                	jne    6e9 <printf+0xfa>
          s = "(null)";
 6d4:	be d2 08 00 00       	mov    $0x8d2,%esi
 6d9:	eb 0e                	jmp    6e9 <printf+0xfa>
          putc(fd, *s);
 6db:	0f be d2             	movsbl %dl,%edx
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	e8 64 fe ff ff       	call   54a <putc>
          s++;
 6e6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6e9:	0f b6 16             	movzbl (%esi),%edx
 6ec:	84 d2                	test   %dl,%dl
 6ee:	75 eb                	jne    6db <printf+0xec>
      state = 0;
 6f0:	be 00 00 00 00       	mov    $0x0,%esi
 6f5:	e9 21 ff ff ff       	jmp    61b <printf+0x2c>
        putc(fd, *ap);
 6fa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6fd:	0f be 17             	movsbl (%edi),%edx
 700:	8b 45 08             	mov    0x8(%ebp),%eax
 703:	e8 42 fe ff ff       	call   54a <putc>
        ap++;
 708:	83 c7 04             	add    $0x4,%edi
 70b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 70e:	be 00 00 00 00       	mov    $0x0,%esi
 713:	e9 03 ff ff ff       	jmp    61b <printf+0x2c>
        putc(fd, c);
 718:	89 fa                	mov    %edi,%edx
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	e8 28 fe ff ff       	call   54a <putc>
      state = 0;
 722:	be 00 00 00 00       	mov    $0x0,%esi
 727:	e9 ef fe ff ff       	jmp    61b <printf+0x2c>
        putc(fd, '%');
 72c:	ba 25 00 00 00       	mov    $0x25,%edx
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	e8 11 fe ff ff       	call   54a <putc>
        putc(fd, c);
 739:	89 fa                	mov    %edi,%edx
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	e8 07 fe ff ff       	call   54a <putc>
      state = 0;
 743:	be 00 00 00 00       	mov    $0x0,%esi
 748:	e9 ce fe ff ff       	jmp    61b <printf+0x2c>
    }
  }
}
 74d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 750:	5b                   	pop    %ebx
 751:	5e                   	pop    %esi
 752:	5f                   	pop    %edi
 753:	5d                   	pop    %ebp
 754:	c3                   	ret    

00000755 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 755:	55                   	push   %ebp
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 40 11 00 00       	mov    0x1140,%eax
 766:	eb 02                	jmp    76a <free+0x15>
 768:	89 d0                	mov    %edx,%eax
 76a:	39 c8                	cmp    %ecx,%eax
 76c:	73 04                	jae    772 <free+0x1d>
 76e:	39 08                	cmp    %ecx,(%eax)
 770:	77 12                	ja     784 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 772:	8b 10                	mov    (%eax),%edx
 774:	39 c2                	cmp    %eax,%edx
 776:	77 f0                	ja     768 <free+0x13>
 778:	39 c8                	cmp    %ecx,%eax
 77a:	72 08                	jb     784 <free+0x2f>
 77c:	39 ca                	cmp    %ecx,%edx
 77e:	77 04                	ja     784 <free+0x2f>
 780:	89 d0                	mov    %edx,%eax
 782:	eb e6                	jmp    76a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 784:	8b 73 fc             	mov    -0x4(%ebx),%esi
 787:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78a:	8b 10                	mov    (%eax),%edx
 78c:	39 d7                	cmp    %edx,%edi
 78e:	74 19                	je     7a9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 790:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 793:	8b 50 04             	mov    0x4(%eax),%edx
 796:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 799:	39 ce                	cmp    %ecx,%esi
 79b:	74 1b                	je     7b8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 79d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 79f:	a3 40 11 00 00       	mov    %eax,0x1140
}
 7a4:	5b                   	pop    %ebx
 7a5:	5e                   	pop    %esi
 7a6:	5f                   	pop    %edi
 7a7:	5d                   	pop    %ebp
 7a8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7a9:	03 72 04             	add    0x4(%edx),%esi
 7ac:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7af:	8b 10                	mov    (%eax),%edx
 7b1:	8b 12                	mov    (%edx),%edx
 7b3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7b6:	eb db                	jmp    793 <free+0x3e>
    p->s.size += bp->s.size;
 7b8:	03 53 fc             	add    -0x4(%ebx),%edx
 7bb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7be:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c1:	89 10                	mov    %edx,(%eax)
 7c3:	eb da                	jmp    79f <free+0x4a>

000007c5 <morecore>:

static Header*
morecore(uint nu)
{
 7c5:	55                   	push   %ebp
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	53                   	push   %ebx
 7c9:	83 ec 04             	sub    $0x4,%esp
 7cc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7ce:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7d3:	77 05                	ja     7da <morecore+0x15>
    nu = 4096;
 7d5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7da:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7e1:	83 ec 0c             	sub    $0xc,%esp
 7e4:	50                   	push   %eax
 7e5:	e8 38 fd ff ff       	call   522 <sbrk>
  if(p == (char*)-1)
 7ea:	83 c4 10             	add    $0x10,%esp
 7ed:	83 f8 ff             	cmp    $0xffffffff,%eax
 7f0:	74 1c                	je     80e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7f2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f5:	83 c0 08             	add    $0x8,%eax
 7f8:	83 ec 0c             	sub    $0xc,%esp
 7fb:	50                   	push   %eax
 7fc:	e8 54 ff ff ff       	call   755 <free>
  return freep;
 801:	a1 40 11 00 00       	mov    0x1140,%eax
 806:	83 c4 10             	add    $0x10,%esp
}
 809:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80c:	c9                   	leave  
 80d:	c3                   	ret    
    return 0;
 80e:	b8 00 00 00 00       	mov    $0x0,%eax
 813:	eb f4                	jmp    809 <morecore+0x44>

00000815 <malloc>:

void*
malloc(uint nbytes)
{
 815:	55                   	push   %ebp
 816:	89 e5                	mov    %esp,%ebp
 818:	53                   	push   %ebx
 819:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81c:	8b 45 08             	mov    0x8(%ebp),%eax
 81f:	8d 58 07             	lea    0x7(%eax),%ebx
 822:	c1 eb 03             	shr    $0x3,%ebx
 825:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 828:	8b 0d 40 11 00 00    	mov    0x1140,%ecx
 82e:	85 c9                	test   %ecx,%ecx
 830:	74 04                	je     836 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 832:	8b 01                	mov    (%ecx),%eax
 834:	eb 4a                	jmp    880 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 836:	c7 05 40 11 00 00 44 	movl   $0x1144,0x1140
 83d:	11 00 00 
 840:	c7 05 44 11 00 00 44 	movl   $0x1144,0x1144
 847:	11 00 00 
    base.s.size = 0;
 84a:	c7 05 48 11 00 00 00 	movl   $0x0,0x1148
 851:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 854:	b9 44 11 00 00       	mov    $0x1144,%ecx
 859:	eb d7                	jmp    832 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 85b:	74 19                	je     876 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 85d:	29 da                	sub    %ebx,%edx
 85f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 862:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 865:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 868:	89 0d 40 11 00 00    	mov    %ecx,0x1140
      return (void*)(p + 1);
 86e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 871:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 874:	c9                   	leave  
 875:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 876:	8b 10                	mov    (%eax),%edx
 878:	89 11                	mov    %edx,(%ecx)
 87a:	eb ec                	jmp    868 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87c:	89 c1                	mov    %eax,%ecx
 87e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 880:	8b 50 04             	mov    0x4(%eax),%edx
 883:	39 da                	cmp    %ebx,%edx
 885:	73 d4                	jae    85b <malloc+0x46>
    if(p == freep)
 887:	39 05 40 11 00 00    	cmp    %eax,0x1140
 88d:	75 ed                	jne    87c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 88f:	89 d8                	mov    %ebx,%eax
 891:	e8 2f ff ff ff       	call   7c5 <morecore>
 896:	85 c0                	test   %eax,%eax
 898:	75 e2                	jne    87c <malloc+0x67>
 89a:	eb d5                	jmp    871 <malloc+0x5c>
