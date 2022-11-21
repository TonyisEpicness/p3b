
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 7a 03 00 00       	call   38b <strlen>
  11:	01 d8                	add    %ebx,%eax
  13:	83 c4 10             	add    $0x10,%esp
  16:	eb 03                	jmp    1b <fmtname+0x1b>
  18:	83 e8 01             	sub    $0x1,%eax
  1b:	39 d8                	cmp    %ebx,%eax
  1d:	72 05                	jb     24 <fmtname+0x24>
  1f:	80 38 2f             	cmpb   $0x2f,(%eax)
  22:	75 f4                	jne    18 <fmtname+0x18>
    ;
  p++;
  24:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	53                   	push   %ebx
  2b:	e8 5b 03 00 00       	call   38b <strlen>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0d             	cmp    $0xd,%eax
  36:	76 09                	jbe    41 <fmtname+0x41>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  38:	89 d8                	mov    %ebx,%eax
  3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3d:	5b                   	pop    %ebx
  3e:	5e                   	pop    %esi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret    
  memmove(buf, p, strlen(p));
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 41 03 00 00       	call   38b <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 40 0d 00 00       	push   $0xd40
  54:	e8 51 04 00 00       	call   4aa <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 2a 03 00 00       	call   38b <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 20 03 00 00       	call   38b <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 40 0d 00 00       	add    $0xd40,%eax
  7d:	50                   	push   %eax
  7e:	e8 20 03 00 00       	call   3a3 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 40 0d 00 00       	mov    $0xd40,%ebx
  8b:	eb ab                	jmp    38 <fmtname+0x38>

0000008d <ls>:

void
ls(char *path)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	53                   	push   %ebx
  93:	81 ec 54 02 00 00    	sub    $0x254,%esp
  99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  9c:	6a 00                	push   $0x0
  9e:	53                   	push   %ebx
  9f:	e8 7a 04 00 00       	call   51e <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	85 c0                	test   %eax,%eax
  a9:	0f 88 8c 00 00 00    	js     13b <ls+0xae>
  af:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b1:	83 ec 08             	sub    $0x8,%esp
  b4:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  ba:	50                   	push   %eax
  bb:	57                   	push   %edi
  bc:	e8 75 04 00 00       	call   536 <fstat>
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	0f 88 84 00 00 00    	js     150 <ls+0xc3>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  cc:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  d3:	0f bf f0             	movswl %ax,%esi
  d6:	66 83 f8 01          	cmp    $0x1,%ax
  da:	0f 84 8d 00 00 00    	je     16d <ls+0xe0>
  e0:	66 83 f8 02          	cmp    $0x2,%ax
  e4:	75 41                	jne    127 <ls+0x9a>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  e6:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  ec:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  f2:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
  f8:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
  fe:	83 ec 0c             	sub    $0xc,%esp
 101:	53                   	push   %ebx
 102:	e8 f9 fe ff ff       	call   0 <fmtname>
 107:	83 c4 08             	add    $0x8,%esp
 10a:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 110:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 116:	56                   	push   %esi
 117:	50                   	push   %eax
 118:	68 08 09 00 00       	push   $0x908
 11d:	6a 01                	push   $0x1
 11f:	e8 0f 05 00 00       	call   633 <printf>
    break;
 124:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	57                   	push   %edi
 12b:	e8 d6 03 00 00       	call   506 <close>
 130:	83 c4 10             	add    $0x10,%esp
}
 133:	8d 65 f4             	lea    -0xc(%ebp),%esp
 136:	5b                   	pop    %ebx
 137:	5e                   	pop    %esi
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	53                   	push   %ebx
 13f:	68 e0 08 00 00       	push   $0x8e0
 144:	6a 02                	push   $0x2
 146:	e8 e8 04 00 00       	call   633 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 f4 08 00 00       	push   $0x8f4
 159:	6a 02                	push   $0x2
 15b:	e8 d3 04 00 00       	call   633 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 9e 03 00 00       	call   506 <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 15 02 00 00       	call   38b <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 15 09 00 00       	push   $0x915
 18b:	6a 01                	push   $0x1
 18d:	e8 a1 04 00 00       	call   633 <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 98 01 00 00       	call   33f <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 dc 01 00 00       	call   38b <strlen>
 1af:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b1:	8d 46 01             	lea    0x1(%esi),%eax
 1b4:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1ba:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	eb 19                	jmp    1db <ls+0x14e>
        printf(1, "ls: cannot stat %s\n", buf);
 1c2:	83 ec 04             	sub    $0x4,%esp
 1c5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1cb:	50                   	push   %eax
 1cc:	68 f4 08 00 00       	push   $0x8f4
 1d1:	6a 01                	push   $0x1
 1d3:	e8 5b 04 00 00       	call   633 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 09 03 00 00       	call   4f6 <read>
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	83 f8 10             	cmp    $0x10,%eax
 1f3:	0f 85 2e ff ff ff    	jne    127 <ls+0x9a>
      if(de.inum == 0)
 1f9:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 200:	00 
 201:	74 d8                	je     1db <ls+0x14e>
      memmove(p, de.name, DIRSIZ);
 203:	83 ec 04             	sub    $0x4,%esp
 206:	6a 0e                	push   $0xe
 208:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 20e:	50                   	push   %eax
 20f:	ff b5 ac fd ff ff    	push   -0x254(%ebp)
 215:	e8 90 02 00 00       	call   4aa <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 02 02 00 00       	call   436 <stat>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	78 87                	js     1c2 <ls+0x135>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 23b:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 241:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 247:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24d:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 254:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 25b:	83 ec 0c             	sub    $0xc,%esp
 25e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 264:	50                   	push   %eax
 265:	e8 96 fd ff ff       	call   0 <fmtname>
 26a:	89 c2                	mov    %eax,%edx
 26c:	83 c4 08             	add    $0x8,%esp
 26f:	53                   	push   %ebx
 270:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 276:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 27d:	50                   	push   %eax
 27e:	52                   	push   %edx
 27f:	68 08 09 00 00       	push   $0x908
 284:	6a 01                	push   $0x1
 286:	e8 a8 03 00 00       	call   633 <printf>
 28b:	83 c4 20             	add    $0x20,%esp
 28e:	e9 48 ff ff ff       	jmp    1db <ls+0x14e>

00000293 <main>:

int
main(int argc, char *argv[])
{
 293:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 297:	83 e4 f0             	and    $0xfffffff0,%esp
 29a:	ff 71 fc             	push   -0x4(%ecx)
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	57                   	push   %edi
 2a1:	56                   	push   %esi
 2a2:	53                   	push   %ebx
 2a3:	51                   	push   %ecx
 2a4:	83 ec 08             	sub    $0x8,%esp
 2a7:	8b 31                	mov    (%ecx),%esi
 2a9:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2ac:	83 fe 01             	cmp    $0x1,%esi
 2af:	7e 07                	jle    2b8 <main+0x25>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2b1:	bb 01 00 00 00       	mov    $0x1,%ebx
 2b6:	eb 23                	jmp    2db <main+0x48>
    ls(".");
 2b8:	83 ec 0c             	sub    $0xc,%esp
 2bb:	68 28 09 00 00       	push   $0x928
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 14 02 00 00       	call   4de <exit>
    ls(argv[i]);
 2ca:	83 ec 0c             	sub    $0xc,%esp
 2cd:	ff 34 9f             	push   (%edi,%ebx,4)
 2d0:	e8 b8 fd ff ff       	call   8d <ls>
  for(i=1; i<argc; i++)
 2d5:	83 c3 01             	add    $0x1,%ebx
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	39 f3                	cmp    %esi,%ebx
 2dd:	7c eb                	jl     2ca <main+0x37>
  exit();
 2df:	e8 fa 01 00 00       	call   4de <exit>

000002e4 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2ea:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ef:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2f1:	89 d0                	mov    %edx,%eax
 2f3:	5d                   	pop    %ebp
 2f4:	c3                   	ret    

000002f5 <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 2f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2fa:	c3                   	ret    

000002fb <thread_join>:

int thread_join() {
  return 0;
}
 2fb:	b8 00 00 00 00       	mov    $0x0,%eax
 300:	c3                   	ret    

00000301 <lock_acquire>:

void lock_acquire(lock_t *lock){
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	53                   	push   %ebx
 305:	83 ec 04             	sub    $0x4,%esp
 308:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 30b:	83 ec 08             	sub    $0x8,%esp
 30e:	6a 01                	push   $0x1
 310:	53                   	push   %ebx
 311:	e8 ce ff ff ff       	call   2e4 <test_and_set>
 316:	83 c4 10             	add    $0x10,%esp
 319:	83 f8 01             	cmp    $0x1,%eax
 31c:	74 ed                	je     30b <lock_acquire+0xa>
    ;
}
 31e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 321:	c9                   	leave  
 322:	c3                   	ret    

00000323 <lock_release>:

void lock_release(lock_t *lock) {
 323:	55                   	push   %ebp
 324:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    

00000331 <lock_init>:

void lock_init(lock_t *lock) {
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 33d:	5d                   	pop    %ebp
 33e:	c3                   	ret    

0000033f <strcpy>:

char*
strcpy(char *s, const char *t)
{
 33f:	55                   	push   %ebp
 340:	89 e5                	mov    %esp,%ebp
 342:	56                   	push   %esi
 343:	53                   	push   %ebx
 344:	8b 75 08             	mov    0x8(%ebp),%esi
 347:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 34a:	89 f0                	mov    %esi,%eax
 34c:	89 d1                	mov    %edx,%ecx
 34e:	83 c2 01             	add    $0x1,%edx
 351:	89 c3                	mov    %eax,%ebx
 353:	83 c0 01             	add    $0x1,%eax
 356:	0f b6 09             	movzbl (%ecx),%ecx
 359:	88 0b                	mov    %cl,(%ebx)
 35b:	84 c9                	test   %cl,%cl
 35d:	75 ed                	jne    34c <strcpy+0xd>
    ;
  return os;
}
 35f:	89 f0                	mov    %esi,%eax
 361:	5b                   	pop    %ebx
 362:	5e                   	pop    %esi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    

00000365 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	8b 4d 08             	mov    0x8(%ebp),%ecx
 36b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 36e:	eb 06                	jmp    376 <strcmp+0x11>
    p++, q++;
 370:	83 c1 01             	add    $0x1,%ecx
 373:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 376:	0f b6 01             	movzbl (%ecx),%eax
 379:	84 c0                	test   %al,%al
 37b:	74 04                	je     381 <strcmp+0x1c>
 37d:	3a 02                	cmp    (%edx),%al
 37f:	74 ef                	je     370 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 381:	0f b6 c0             	movzbl %al,%eax
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	29 d0                	sub    %edx,%eax
}
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <strlen>:

uint
strlen(const char *s)
{
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 391:	b8 00 00 00 00       	mov    $0x0,%eax
 396:	eb 03                	jmp    39b <strlen+0x10>
 398:	83 c0 01             	add    $0x1,%eax
 39b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 39f:	75 f7                	jne    398 <strlen+0xd>
    ;
  return n;
}
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret    

000003a3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3a3:	55                   	push   %ebp
 3a4:	89 e5                	mov    %esp,%ebp
 3a6:	57                   	push   %edi
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3aa:	89 d7                	mov    %edx,%edi
 3ac:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3af:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b2:	fc                   	cld    
 3b3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3b5:	89 d0                	mov    %edx,%eax
 3b7:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    

000003bc <strchr>:

char*
strchr(const char *s, char c)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3c6:	eb 03                	jmp    3cb <strchr+0xf>
 3c8:	83 c0 01             	add    $0x1,%eax
 3cb:	0f b6 10             	movzbl (%eax),%edx
 3ce:	84 d2                	test   %dl,%dl
 3d0:	74 06                	je     3d8 <strchr+0x1c>
    if(*s == c)
 3d2:	38 ca                	cmp    %cl,%dl
 3d4:	75 f2                	jne    3c8 <strchr+0xc>
 3d6:	eb 05                	jmp    3dd <strchr+0x21>
      return (char*)s;
  return 0;
 3d8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    

000003df <gets>:

char*
gets(char *buf, int max)
{
 3df:	55                   	push   %ebp
 3e0:	89 e5                	mov    %esp,%ebp
 3e2:	57                   	push   %edi
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
 3e5:	83 ec 1c             	sub    $0x1c,%esp
 3e8:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f0:	89 de                	mov    %ebx,%esi
 3f2:	83 c3 01             	add    $0x1,%ebx
 3f5:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3f8:	7d 2e                	jge    428 <gets+0x49>
    cc = read(0, &c, 1);
 3fa:	83 ec 04             	sub    $0x4,%esp
 3fd:	6a 01                	push   $0x1
 3ff:	8d 45 e7             	lea    -0x19(%ebp),%eax
 402:	50                   	push   %eax
 403:	6a 00                	push   $0x0
 405:	e8 ec 00 00 00       	call   4f6 <read>
    if(cc < 1)
 40a:	83 c4 10             	add    $0x10,%esp
 40d:	85 c0                	test   %eax,%eax
 40f:	7e 17                	jle    428 <gets+0x49>
      break;
    buf[i++] = c;
 411:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 415:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 418:	3c 0a                	cmp    $0xa,%al
 41a:	0f 94 c2             	sete   %dl
 41d:	3c 0d                	cmp    $0xd,%al
 41f:	0f 94 c0             	sete   %al
 422:	08 c2                	or     %al,%dl
 424:	74 ca                	je     3f0 <gets+0x11>
    buf[i++] = c;
 426:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 428:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 42c:	89 f8                	mov    %edi,%eax
 42e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 431:	5b                   	pop    %ebx
 432:	5e                   	pop    %esi
 433:	5f                   	pop    %edi
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <stat>:

int
stat(const char *n, struct stat *st)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	56                   	push   %esi
 43a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 43b:	83 ec 08             	sub    $0x8,%esp
 43e:	6a 00                	push   $0x0
 440:	ff 75 08             	push   0x8(%ebp)
 443:	e8 d6 00 00 00       	call   51e <open>
  if(fd < 0)
 448:	83 c4 10             	add    $0x10,%esp
 44b:	85 c0                	test   %eax,%eax
 44d:	78 24                	js     473 <stat+0x3d>
 44f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 451:	83 ec 08             	sub    $0x8,%esp
 454:	ff 75 0c             	push   0xc(%ebp)
 457:	50                   	push   %eax
 458:	e8 d9 00 00 00       	call   536 <fstat>
 45d:	89 c6                	mov    %eax,%esi
  close(fd);
 45f:	89 1c 24             	mov    %ebx,(%esp)
 462:	e8 9f 00 00 00       	call   506 <close>
  return r;
 467:	83 c4 10             	add    $0x10,%esp
}
 46a:	89 f0                	mov    %esi,%eax
 46c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 46f:	5b                   	pop    %ebx
 470:	5e                   	pop    %esi
 471:	5d                   	pop    %ebp
 472:	c3                   	ret    
    return -1;
 473:	be ff ff ff ff       	mov    $0xffffffff,%esi
 478:	eb f0                	jmp    46a <stat+0x34>

0000047a <atoi>:

int
atoi(const char *s)
{
 47a:	55                   	push   %ebp
 47b:	89 e5                	mov    %esp,%ebp
 47d:	53                   	push   %ebx
 47e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 481:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 486:	eb 10                	jmp    498 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 488:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 48b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 48e:	83 c1 01             	add    $0x1,%ecx
 491:	0f be c0             	movsbl %al,%eax
 494:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 498:	0f b6 01             	movzbl (%ecx),%eax
 49b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 49e:	80 fb 09             	cmp    $0x9,%bl
 4a1:	76 e5                	jbe    488 <atoi+0xe>
  return n;
}
 4a3:	89 d0                	mov    %edx,%eax
 4a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a8:	c9                   	leave  
 4a9:	c3                   	ret    

000004aa <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	56                   	push   %esi
 4ae:	53                   	push   %ebx
 4af:	8b 75 08             	mov    0x8(%ebp),%esi
 4b2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4b5:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4b8:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4ba:	eb 0d                	jmp    4c9 <memmove+0x1f>
    *dst++ = *src++;
 4bc:	0f b6 01             	movzbl (%ecx),%eax
 4bf:	88 02                	mov    %al,(%edx)
 4c1:	8d 49 01             	lea    0x1(%ecx),%ecx
 4c4:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4c7:	89 d8                	mov    %ebx,%eax
 4c9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4cc:	85 c0                	test   %eax,%eax
 4ce:	7f ec                	jg     4bc <memmove+0x12>
  return vdst;
}
 4d0:	89 f0                	mov    %esi,%eax
 4d2:	5b                   	pop    %ebx
 4d3:	5e                   	pop    %esi
 4d4:	5d                   	pop    %ebp
 4d5:	c3                   	ret    

000004d6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d6:	b8 01 00 00 00       	mov    $0x1,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <exit>:
SYSCALL(exit)
 4de:	b8 02 00 00 00       	mov    $0x2,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <wait>:
SYSCALL(wait)
 4e6:	b8 03 00 00 00       	mov    $0x3,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <pipe>:
SYSCALL(pipe)
 4ee:	b8 04 00 00 00       	mov    $0x4,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <read>:
SYSCALL(read)
 4f6:	b8 05 00 00 00       	mov    $0x5,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <write>:
SYSCALL(write)
 4fe:	b8 10 00 00 00       	mov    $0x10,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <close>:
SYSCALL(close)
 506:	b8 15 00 00 00       	mov    $0x15,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <kill>:
SYSCALL(kill)
 50e:	b8 06 00 00 00       	mov    $0x6,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <exec>:
SYSCALL(exec)
 516:	b8 07 00 00 00       	mov    $0x7,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <open>:
SYSCALL(open)
 51e:	b8 0f 00 00 00       	mov    $0xf,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <mknod>:
SYSCALL(mknod)
 526:	b8 11 00 00 00       	mov    $0x11,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <unlink>:
SYSCALL(unlink)
 52e:	b8 12 00 00 00       	mov    $0x12,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <fstat>:
SYSCALL(fstat)
 536:	b8 08 00 00 00       	mov    $0x8,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <link>:
SYSCALL(link)
 53e:	b8 13 00 00 00       	mov    $0x13,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <mkdir>:
SYSCALL(mkdir)
 546:	b8 14 00 00 00       	mov    $0x14,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <chdir>:
SYSCALL(chdir)
 54e:	b8 09 00 00 00       	mov    $0x9,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <dup>:
SYSCALL(dup)
 556:	b8 0a 00 00 00       	mov    $0xa,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <getpid>:
SYSCALL(getpid)
 55e:	b8 0b 00 00 00       	mov    $0xb,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <sbrk>:
SYSCALL(sbrk)
 566:	b8 0c 00 00 00       	mov    $0xc,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <sleep>:
SYSCALL(sleep)
 56e:	b8 0d 00 00 00       	mov    $0xd,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <uptime>:
SYSCALL(uptime)
 576:	b8 0e 00 00 00       	mov    $0xe,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <clone>:
SYSCALL(clone)
 57e:	b8 16 00 00 00       	mov    $0x16,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <join>:
 586:	b8 17 00 00 00       	mov    $0x17,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 58e:	55                   	push   %ebp
 58f:	89 e5                	mov    %esp,%ebp
 591:	83 ec 1c             	sub    $0x1c,%esp
 594:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 597:	6a 01                	push   $0x1
 599:	8d 55 f4             	lea    -0xc(%ebp),%edx
 59c:	52                   	push   %edx
 59d:	50                   	push   %eax
 59e:	e8 5b ff ff ff       	call   4fe <write>
}
 5a3:	83 c4 10             	add    $0x10,%esp
 5a6:	c9                   	leave  
 5a7:	c3                   	ret    

000005a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a8:	55                   	push   %ebp
 5a9:	89 e5                	mov    %esp,%ebp
 5ab:	57                   	push   %edi
 5ac:	56                   	push   %esi
 5ad:	53                   	push   %ebx
 5ae:	83 ec 2c             	sub    $0x2c,%esp
 5b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b4:	89 d0                	mov    %edx,%eax
 5b6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5b8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5bc:	0f 95 c1             	setne  %cl
 5bf:	c1 ea 1f             	shr    $0x1f,%edx
 5c2:	84 d1                	test   %dl,%cl
 5c4:	74 44                	je     60a <printint+0x62>
    neg = 1;
    x = -xx;
 5c6:	f7 d8                	neg    %eax
 5c8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ca:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5d1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5d6:	89 c8                	mov    %ecx,%eax
 5d8:	ba 00 00 00 00       	mov    $0x0,%edx
 5dd:	f7 f6                	div    %esi
 5df:	89 df                	mov    %ebx,%edi
 5e1:	83 c3 01             	add    $0x1,%ebx
 5e4:	0f b6 92 8c 09 00 00 	movzbl 0x98c(%edx),%edx
 5eb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5ef:	89 ca                	mov    %ecx,%edx
 5f1:	89 c1                	mov    %eax,%ecx
 5f3:	39 d6                	cmp    %edx,%esi
 5f5:	76 df                	jbe    5d6 <printint+0x2e>
  if(neg)
 5f7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5fb:	74 31                	je     62e <printint+0x86>
    buf[i++] = '-';
 5fd:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 602:	8d 5f 02             	lea    0x2(%edi),%ebx
 605:	8b 75 d0             	mov    -0x30(%ebp),%esi
 608:	eb 17                	jmp    621 <printint+0x79>
    x = xx;
 60a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 60c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 613:	eb bc                	jmp    5d1 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 615:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 61a:	89 f0                	mov    %esi,%eax
 61c:	e8 6d ff ff ff       	call   58e <putc>
  while(--i >= 0)
 621:	83 eb 01             	sub    $0x1,%ebx
 624:	79 ef                	jns    615 <printint+0x6d>
}
 626:	83 c4 2c             	add    $0x2c,%esp
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5f                   	pop    %edi
 62c:	5d                   	pop    %ebp
 62d:	c3                   	ret    
 62e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 631:	eb ee                	jmp    621 <printint+0x79>

00000633 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 633:	55                   	push   %ebp
 634:	89 e5                	mov    %esp,%ebp
 636:	57                   	push   %edi
 637:	56                   	push   %esi
 638:	53                   	push   %ebx
 639:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 63c:	8d 45 10             	lea    0x10(%ebp),%eax
 63f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 642:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 647:	bb 00 00 00 00       	mov    $0x0,%ebx
 64c:	eb 14                	jmp    662 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 64e:	89 fa                	mov    %edi,%edx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	e8 36 ff ff ff       	call   58e <putc>
 658:	eb 05                	jmp    65f <printf+0x2c>
      }
    } else if(state == '%'){
 65a:	83 fe 25             	cmp    $0x25,%esi
 65d:	74 25                	je     684 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 65f:	83 c3 01             	add    $0x1,%ebx
 662:	8b 45 0c             	mov    0xc(%ebp),%eax
 665:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 669:	84 c0                	test   %al,%al
 66b:	0f 84 20 01 00 00    	je     791 <printf+0x15e>
    c = fmt[i] & 0xff;
 671:	0f be f8             	movsbl %al,%edi
 674:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 677:	85 f6                	test   %esi,%esi
 679:	75 df                	jne    65a <printf+0x27>
      if(c == '%'){
 67b:	83 f8 25             	cmp    $0x25,%eax
 67e:	75 ce                	jne    64e <printf+0x1b>
        state = '%';
 680:	89 c6                	mov    %eax,%esi
 682:	eb db                	jmp    65f <printf+0x2c>
      if(c == 'd'){
 684:	83 f8 25             	cmp    $0x25,%eax
 687:	0f 84 cf 00 00 00    	je     75c <printf+0x129>
 68d:	0f 8c dd 00 00 00    	jl     770 <printf+0x13d>
 693:	83 f8 78             	cmp    $0x78,%eax
 696:	0f 8f d4 00 00 00    	jg     770 <printf+0x13d>
 69c:	83 f8 63             	cmp    $0x63,%eax
 69f:	0f 8c cb 00 00 00    	jl     770 <printf+0x13d>
 6a5:	83 e8 63             	sub    $0x63,%eax
 6a8:	83 f8 15             	cmp    $0x15,%eax
 6ab:	0f 87 bf 00 00 00    	ja     770 <printf+0x13d>
 6b1:	ff 24 85 34 09 00 00 	jmp    *0x934(,%eax,4)
        printint(fd, *ap, 10, 1);
 6b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6bb:	8b 17                	mov    (%edi),%edx
 6bd:	83 ec 0c             	sub    $0xc,%esp
 6c0:	6a 01                	push   $0x1
 6c2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	e8 d9 fe ff ff       	call   5a8 <printint>
        ap++;
 6cf:	83 c7 04             	add    $0x4,%edi
 6d2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6d5:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
 6dd:	eb 80                	jmp    65f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6df:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e2:	8b 17                	mov    (%edi),%edx
 6e4:	83 ec 0c             	sub    $0xc,%esp
 6e7:	6a 00                	push   $0x0
 6e9:	b9 10 00 00 00       	mov    $0x10,%ecx
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	e8 b2 fe ff ff       	call   5a8 <printint>
        ap++;
 6f6:	83 c7 04             	add    $0x4,%edi
 6f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ff:	be 00 00 00 00       	mov    $0x0,%esi
 704:	e9 56 ff ff ff       	jmp    65f <printf+0x2c>
        s = (char*)*ap;
 709:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70c:	8b 30                	mov    (%eax),%esi
        ap++;
 70e:	83 c0 04             	add    $0x4,%eax
 711:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 714:	85 f6                	test   %esi,%esi
 716:	75 15                	jne    72d <printf+0xfa>
          s = "(null)";
 718:	be 2a 09 00 00       	mov    $0x92a,%esi
 71d:	eb 0e                	jmp    72d <printf+0xfa>
          putc(fd, *s);
 71f:	0f be d2             	movsbl %dl,%edx
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	e8 64 fe ff ff       	call   58e <putc>
          s++;
 72a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 72d:	0f b6 16             	movzbl (%esi),%edx
 730:	84 d2                	test   %dl,%dl
 732:	75 eb                	jne    71f <printf+0xec>
      state = 0;
 734:	be 00 00 00 00       	mov    $0x0,%esi
 739:	e9 21 ff ff ff       	jmp    65f <printf+0x2c>
        putc(fd, *ap);
 73e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 741:	0f be 17             	movsbl (%edi),%edx
 744:	8b 45 08             	mov    0x8(%ebp),%eax
 747:	e8 42 fe ff ff       	call   58e <putc>
        ap++;
 74c:	83 c7 04             	add    $0x4,%edi
 74f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 752:	be 00 00 00 00       	mov    $0x0,%esi
 757:	e9 03 ff ff ff       	jmp    65f <printf+0x2c>
        putc(fd, c);
 75c:	89 fa                	mov    %edi,%edx
 75e:	8b 45 08             	mov    0x8(%ebp),%eax
 761:	e8 28 fe ff ff       	call   58e <putc>
      state = 0;
 766:	be 00 00 00 00       	mov    $0x0,%esi
 76b:	e9 ef fe ff ff       	jmp    65f <printf+0x2c>
        putc(fd, '%');
 770:	ba 25 00 00 00       	mov    $0x25,%edx
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	e8 11 fe ff ff       	call   58e <putc>
        putc(fd, c);
 77d:	89 fa                	mov    %edi,%edx
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	e8 07 fe ff ff       	call   58e <putc>
      state = 0;
 787:	be 00 00 00 00       	mov    $0x0,%esi
 78c:	e9 ce fe ff ff       	jmp    65f <printf+0x2c>
    }
  }
}
 791:	8d 65 f4             	lea    -0xc(%ebp),%esp
 794:	5b                   	pop    %ebx
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret    

00000799 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 799:	55                   	push   %ebp
 79a:	89 e5                	mov    %esp,%ebp
 79c:	57                   	push   %edi
 79d:	56                   	push   %esi
 79e:	53                   	push   %ebx
 79f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a5:	a1 50 0d 00 00       	mov    0xd50,%eax
 7aa:	eb 02                	jmp    7ae <free+0x15>
 7ac:	89 d0                	mov    %edx,%eax
 7ae:	39 c8                	cmp    %ecx,%eax
 7b0:	73 04                	jae    7b6 <free+0x1d>
 7b2:	39 08                	cmp    %ecx,(%eax)
 7b4:	77 12                	ja     7c8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	39 c2                	cmp    %eax,%edx
 7ba:	77 f0                	ja     7ac <free+0x13>
 7bc:	39 c8                	cmp    %ecx,%eax
 7be:	72 08                	jb     7c8 <free+0x2f>
 7c0:	39 ca                	cmp    %ecx,%edx
 7c2:	77 04                	ja     7c8 <free+0x2f>
 7c4:	89 d0                	mov    %edx,%eax
 7c6:	eb e6                	jmp    7ae <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ce:	8b 10                	mov    (%eax),%edx
 7d0:	39 d7                	cmp    %edx,%edi
 7d2:	74 19                	je     7ed <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7d4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7d7:	8b 50 04             	mov    0x4(%eax),%edx
 7da:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7dd:	39 ce                	cmp    %ecx,%esi
 7df:	74 1b                	je     7fc <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7e1:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7e3:	a3 50 0d 00 00       	mov    %eax,0xd50
}
 7e8:	5b                   	pop    %ebx
 7e9:	5e                   	pop    %esi
 7ea:	5f                   	pop    %edi
 7eb:	5d                   	pop    %ebp
 7ec:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7ed:	03 72 04             	add    0x4(%edx),%esi
 7f0:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f3:	8b 10                	mov    (%eax),%edx
 7f5:	8b 12                	mov    (%edx),%edx
 7f7:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7fa:	eb db                	jmp    7d7 <free+0x3e>
    p->s.size += bp->s.size;
 7fc:	03 53 fc             	add    -0x4(%ebx),%edx
 7ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 802:	8b 53 f8             	mov    -0x8(%ebx),%edx
 805:	89 10                	mov    %edx,(%eax)
 807:	eb da                	jmp    7e3 <free+0x4a>

00000809 <morecore>:

static Header*
morecore(uint nu)
{
 809:	55                   	push   %ebp
 80a:	89 e5                	mov    %esp,%ebp
 80c:	53                   	push   %ebx
 80d:	83 ec 04             	sub    $0x4,%esp
 810:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 812:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 817:	77 05                	ja     81e <morecore+0x15>
    nu = 4096;
 819:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 81e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 825:	83 ec 0c             	sub    $0xc,%esp
 828:	50                   	push   %eax
 829:	e8 38 fd ff ff       	call   566 <sbrk>
  if(p == (char*)-1)
 82e:	83 c4 10             	add    $0x10,%esp
 831:	83 f8 ff             	cmp    $0xffffffff,%eax
 834:	74 1c                	je     852 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 836:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 839:	83 c0 08             	add    $0x8,%eax
 83c:	83 ec 0c             	sub    $0xc,%esp
 83f:	50                   	push   %eax
 840:	e8 54 ff ff ff       	call   799 <free>
  return freep;
 845:	a1 50 0d 00 00       	mov    0xd50,%eax
 84a:	83 c4 10             	add    $0x10,%esp
}
 84d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 850:	c9                   	leave  
 851:	c3                   	ret    
    return 0;
 852:	b8 00 00 00 00       	mov    $0x0,%eax
 857:	eb f4                	jmp    84d <morecore+0x44>

00000859 <malloc>:

void*
malloc(uint nbytes)
{
 859:	55                   	push   %ebp
 85a:	89 e5                	mov    %esp,%ebp
 85c:	53                   	push   %ebx
 85d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	8d 58 07             	lea    0x7(%eax),%ebx
 866:	c1 eb 03             	shr    $0x3,%ebx
 869:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 86c:	8b 0d 50 0d 00 00    	mov    0xd50,%ecx
 872:	85 c9                	test   %ecx,%ecx
 874:	74 04                	je     87a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 876:	8b 01                	mov    (%ecx),%eax
 878:	eb 4a                	jmp    8c4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 87a:	c7 05 50 0d 00 00 54 	movl   $0xd54,0xd50
 881:	0d 00 00 
 884:	c7 05 54 0d 00 00 54 	movl   $0xd54,0xd54
 88b:	0d 00 00 
    base.s.size = 0;
 88e:	c7 05 58 0d 00 00 00 	movl   $0x0,0xd58
 895:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 898:	b9 54 0d 00 00       	mov    $0xd54,%ecx
 89d:	eb d7                	jmp    876 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 89f:	74 19                	je     8ba <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8a1:	29 da                	sub    %ebx,%edx
 8a3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8a6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8a9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8ac:	89 0d 50 0d 00 00    	mov    %ecx,0xd50
      return (void*)(p + 1);
 8b2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b8:	c9                   	leave  
 8b9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8ba:	8b 10                	mov    (%eax),%edx
 8bc:	89 11                	mov    %edx,(%ecx)
 8be:	eb ec                	jmp    8ac <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	89 c1                	mov    %eax,%ecx
 8c2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8c4:	8b 50 04             	mov    0x4(%eax),%edx
 8c7:	39 da                	cmp    %ebx,%edx
 8c9:	73 d4                	jae    89f <malloc+0x46>
    if(p == freep)
 8cb:	39 05 50 0d 00 00    	cmp    %eax,0xd50
 8d1:	75 ed                	jne    8c0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8d3:	89 d8                	mov    %ebx,%eax
 8d5:	e8 2f ff ff ff       	call   809 <morecore>
 8da:	85 c0                	test   %eax,%eax
 8dc:	75 e2                	jne    8c0 <malloc+0x67>
 8de:	eb d5                	jmp    8b5 <malloc+0x5c>
