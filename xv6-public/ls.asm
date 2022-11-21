
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
   c:	e8 a6 03 00 00       	call   3b7 <strlen>
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
  2b:	e8 87 03 00 00       	call   3b7 <strlen>
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
  45:	e8 6d 03 00 00       	call   3b7 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 7c 0d 00 00       	push   $0xd7c
  54:	e8 7d 04 00 00       	call   4d6 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 56 03 00 00       	call   3b7 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 4c 03 00 00       	call   3b7 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 7c 0d 00 00       	add    $0xd7c,%eax
  7d:	50                   	push   %eax
  7e:	e8 4c 03 00 00       	call   3cf <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 7c 0d 00 00       	mov    $0xd7c,%ebx
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
  9f:	e8 a6 04 00 00       	call   54a <open>
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
  bc:	e8 a1 04 00 00       	call   562 <fstat>
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
 118:	68 34 09 00 00       	push   $0x934
 11d:	6a 01                	push   $0x1
 11f:	e8 3b 05 00 00       	call   65f <printf>
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
 12b:	e8 02 04 00 00       	call   532 <close>
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
 13f:	68 0c 09 00 00       	push   $0x90c
 144:	6a 02                	push   $0x2
 146:	e8 14 05 00 00       	call   65f <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 20 09 00 00       	push   $0x920
 159:	6a 02                	push   $0x2
 15b:	e8 ff 04 00 00       	call   65f <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 ca 03 00 00       	call   532 <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 41 02 00 00       	call   3b7 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 41 09 00 00       	push   $0x941
 18b:	6a 01                	push   $0x1
 18d:	e8 cd 04 00 00       	call   65f <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 c4 01 00 00       	call   36b <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 08 02 00 00       	call   3b7 <strlen>
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
 1cc:	68 20 09 00 00       	push   $0x920
 1d1:	6a 01                	push   $0x1
 1d3:	e8 87 04 00 00       	call   65f <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 35 03 00 00       	call   522 <read>
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
 215:	e8 bc 02 00 00       	call   4d6 <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 2e 02 00 00       	call   462 <stat>
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
 27f:	68 34 09 00 00       	push   $0x934
 284:	6a 01                	push   $0x1
 286:	e8 d4 03 00 00       	call   65f <printf>
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
 2bb:	68 54 09 00 00       	push   $0x954
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 40 02 00 00       	call   50a <exit>
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
 2df:	e8 26 02 00 00       	call   50a <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 2fb:	68 00 10 00 00       	push   $0x1000
 300:	e8 80 05 00 00       	call   885 <malloc>
  if(n_stack == 0){
 305:	83 c4 10             	add    $0x10,%esp
 308:	85 c0                	test   %eax,%eax
 30a:	74 14                	je     320 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 30c:	50                   	push   %eax
 30d:	ff 75 10             	push   0x10(%ebp)
 310:	ff 75 0c             	push   0xc(%ebp)
 313:	ff 75 08             	push   0x8(%ebp)
 316:	e8 8f 02 00 00       	call   5aa <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 31b:	83 c4 10             	add    $0x10,%esp
}
 31e:	c9                   	leave  
 31f:	c3                   	ret    
    return -1;
 320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 325:	eb f7                	jmp    31e <thread_create+0x29>

00000327 <thread_join>:

int thread_join() {
  return 0;
}
 327:	b8 00 00 00 00       	mov    $0x0,%eax
 32c:	c3                   	ret    

0000032d <lock_acquire>:

void lock_acquire(lock_t *lock){
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	53                   	push   %ebx
 331:	83 ec 04             	sub    $0x4,%esp
 334:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 337:	83 ec 08             	sub    $0x8,%esp
 33a:	6a 01                	push   $0x1
 33c:	53                   	push   %ebx
 33d:	e8 a2 ff ff ff       	call   2e4 <test_and_set>
 342:	83 c4 10             	add    $0x10,%esp
 345:	83 f8 01             	cmp    $0x1,%eax
 348:	74 ed                	je     337 <lock_acquire+0xa>
    ;
}
 34a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34d:	c9                   	leave  
 34e:	c3                   	ret    

0000034f <lock_release>:

void lock_release(lock_t *lock) {
 34f:	55                   	push   %ebp
 350:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 352:	8b 45 08             	mov    0x8(%ebp),%eax
 355:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    

0000035d <lock_init>:

void lock_init(lock_t *lock) {
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 360:	8b 45 08             	mov    0x8(%ebp),%eax
 363:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    

0000036b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	56                   	push   %esi
 36f:	53                   	push   %ebx
 370:	8b 75 08             	mov    0x8(%ebp),%esi
 373:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 376:	89 f0                	mov    %esi,%eax
 378:	89 d1                	mov    %edx,%ecx
 37a:	83 c2 01             	add    $0x1,%edx
 37d:	89 c3                	mov    %eax,%ebx
 37f:	83 c0 01             	add    $0x1,%eax
 382:	0f b6 09             	movzbl (%ecx),%ecx
 385:	88 0b                	mov    %cl,(%ebx)
 387:	84 c9                	test   %cl,%cl
 389:	75 ed                	jne    378 <strcpy+0xd>
    ;
  return os;
}
 38b:	89 f0                	mov    %esi,%eax
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    

00000391 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
 397:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 39a:	eb 06                	jmp    3a2 <strcmp+0x11>
    p++, q++;
 39c:	83 c1 01             	add    $0x1,%ecx
 39f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3a2:	0f b6 01             	movzbl (%ecx),%eax
 3a5:	84 c0                	test   %al,%al
 3a7:	74 04                	je     3ad <strcmp+0x1c>
 3a9:	3a 02                	cmp    (%edx),%al
 3ab:	74 ef                	je     39c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3ad:	0f b6 c0             	movzbl %al,%eax
 3b0:	0f b6 12             	movzbl (%edx),%edx
 3b3:	29 d0                	sub    %edx,%eax
}
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    

000003b7 <strlen>:

uint
strlen(const char *s)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3bd:	b8 00 00 00 00       	mov    $0x0,%eax
 3c2:	eb 03                	jmp    3c7 <strlen+0x10>
 3c4:	83 c0 01             	add    $0x1,%eax
 3c7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3cb:	75 f7                	jne    3c4 <strlen+0xd>
    ;
  return n;
}
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    

000003cf <memset>:

void*
memset(void *dst, int c, uint n)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	57                   	push   %edi
 3d3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3d6:	89 d7                	mov    %edx,%edi
 3d8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	fc                   	cld    
 3df:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3e1:	89 d0                	mov    %edx,%eax
 3e3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3e6:	c9                   	leave  
 3e7:	c3                   	ret    

000003e8 <strchr>:

char*
strchr(const char *s, char c)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ee:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3f2:	eb 03                	jmp    3f7 <strchr+0xf>
 3f4:	83 c0 01             	add    $0x1,%eax
 3f7:	0f b6 10             	movzbl (%eax),%edx
 3fa:	84 d2                	test   %dl,%dl
 3fc:	74 06                	je     404 <strchr+0x1c>
    if(*s == c)
 3fe:	38 ca                	cmp    %cl,%dl
 400:	75 f2                	jne    3f4 <strchr+0xc>
 402:	eb 05                	jmp    409 <strchr+0x21>
      return (char*)s;
  return 0;
 404:	b8 00 00 00 00       	mov    $0x0,%eax
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <gets>:

char*
gets(char *buf, int max)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	57                   	push   %edi
 40f:	56                   	push   %esi
 410:	53                   	push   %ebx
 411:	83 ec 1c             	sub    $0x1c,%esp
 414:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 417:	bb 00 00 00 00       	mov    $0x0,%ebx
 41c:	89 de                	mov    %ebx,%esi
 41e:	83 c3 01             	add    $0x1,%ebx
 421:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 424:	7d 2e                	jge    454 <gets+0x49>
    cc = read(0, &c, 1);
 426:	83 ec 04             	sub    $0x4,%esp
 429:	6a 01                	push   $0x1
 42b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 42e:	50                   	push   %eax
 42f:	6a 00                	push   $0x0
 431:	e8 ec 00 00 00       	call   522 <read>
    if(cc < 1)
 436:	83 c4 10             	add    $0x10,%esp
 439:	85 c0                	test   %eax,%eax
 43b:	7e 17                	jle    454 <gets+0x49>
      break;
    buf[i++] = c;
 43d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 441:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 444:	3c 0a                	cmp    $0xa,%al
 446:	0f 94 c2             	sete   %dl
 449:	3c 0d                	cmp    $0xd,%al
 44b:	0f 94 c0             	sete   %al
 44e:	08 c2                	or     %al,%dl
 450:	74 ca                	je     41c <gets+0x11>
    buf[i++] = c;
 452:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 454:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 458:	89 f8                	mov    %edi,%eax
 45a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5f                   	pop    %edi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    

00000462 <stat>:

int
stat(const char *n, struct stat *st)
{
 462:	55                   	push   %ebp
 463:	89 e5                	mov    %esp,%ebp
 465:	56                   	push   %esi
 466:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 467:	83 ec 08             	sub    $0x8,%esp
 46a:	6a 00                	push   $0x0
 46c:	ff 75 08             	push   0x8(%ebp)
 46f:	e8 d6 00 00 00       	call   54a <open>
  if(fd < 0)
 474:	83 c4 10             	add    $0x10,%esp
 477:	85 c0                	test   %eax,%eax
 479:	78 24                	js     49f <stat+0x3d>
 47b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 47d:	83 ec 08             	sub    $0x8,%esp
 480:	ff 75 0c             	push   0xc(%ebp)
 483:	50                   	push   %eax
 484:	e8 d9 00 00 00       	call   562 <fstat>
 489:	89 c6                	mov    %eax,%esi
  close(fd);
 48b:	89 1c 24             	mov    %ebx,(%esp)
 48e:	e8 9f 00 00 00       	call   532 <close>
  return r;
 493:	83 c4 10             	add    $0x10,%esp
}
 496:	89 f0                	mov    %esi,%eax
 498:	8d 65 f8             	lea    -0x8(%ebp),%esp
 49b:	5b                   	pop    %ebx
 49c:	5e                   	pop    %esi
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    
    return -1;
 49f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4a4:	eb f0                	jmp    496 <stat+0x34>

000004a6 <atoi>:

int
atoi(const char *s)
{
 4a6:	55                   	push   %ebp
 4a7:	89 e5                	mov    %esp,%ebp
 4a9:	53                   	push   %ebx
 4aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4ad:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4b2:	eb 10                	jmp    4c4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4b4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4b7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ba:	83 c1 01             	add    $0x1,%ecx
 4bd:	0f be c0             	movsbl %al,%eax
 4c0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4c4:	0f b6 01             	movzbl (%ecx),%eax
 4c7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4ca:	80 fb 09             	cmp    $0x9,%bl
 4cd:	76 e5                	jbe    4b4 <atoi+0xe>
  return n;
}
 4cf:	89 d0                	mov    %edx,%eax
 4d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d4:	c9                   	leave  
 4d5:	c3                   	ret    

000004d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	56                   	push   %esi
 4da:	53                   	push   %ebx
 4db:	8b 75 08             	mov    0x8(%ebp),%esi
 4de:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4e1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4e4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4e6:	eb 0d                	jmp    4f5 <memmove+0x1f>
    *dst++ = *src++;
 4e8:	0f b6 01             	movzbl (%ecx),%eax
 4eb:	88 02                	mov    %al,(%edx)
 4ed:	8d 49 01             	lea    0x1(%ecx),%ecx
 4f0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4f3:	89 d8                	mov    %ebx,%eax
 4f5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4f8:	85 c0                	test   %eax,%eax
 4fa:	7f ec                	jg     4e8 <memmove+0x12>
  return vdst;
}
 4fc:	89 f0                	mov    %esi,%eax
 4fe:	5b                   	pop    %ebx
 4ff:	5e                   	pop    %esi
 500:	5d                   	pop    %ebp
 501:	c3                   	ret    

00000502 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 502:	b8 01 00 00 00       	mov    $0x1,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <exit>:
SYSCALL(exit)
 50a:	b8 02 00 00 00       	mov    $0x2,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <wait>:
SYSCALL(wait)
 512:	b8 03 00 00 00       	mov    $0x3,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <pipe>:
SYSCALL(pipe)
 51a:	b8 04 00 00 00       	mov    $0x4,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <read>:
SYSCALL(read)
 522:	b8 05 00 00 00       	mov    $0x5,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <write>:
SYSCALL(write)
 52a:	b8 10 00 00 00       	mov    $0x10,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <close>:
SYSCALL(close)
 532:	b8 15 00 00 00       	mov    $0x15,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <kill>:
SYSCALL(kill)
 53a:	b8 06 00 00 00       	mov    $0x6,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <exec>:
SYSCALL(exec)
 542:	b8 07 00 00 00       	mov    $0x7,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <open>:
SYSCALL(open)
 54a:	b8 0f 00 00 00       	mov    $0xf,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <mknod>:
SYSCALL(mknod)
 552:	b8 11 00 00 00       	mov    $0x11,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <unlink>:
SYSCALL(unlink)
 55a:	b8 12 00 00 00       	mov    $0x12,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <fstat>:
SYSCALL(fstat)
 562:	b8 08 00 00 00       	mov    $0x8,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <link>:
SYSCALL(link)
 56a:	b8 13 00 00 00       	mov    $0x13,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <mkdir>:
SYSCALL(mkdir)
 572:	b8 14 00 00 00       	mov    $0x14,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <chdir>:
SYSCALL(chdir)
 57a:	b8 09 00 00 00       	mov    $0x9,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <dup>:
SYSCALL(dup)
 582:	b8 0a 00 00 00       	mov    $0xa,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <getpid>:
SYSCALL(getpid)
 58a:	b8 0b 00 00 00       	mov    $0xb,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sbrk>:
SYSCALL(sbrk)
 592:	b8 0c 00 00 00       	mov    $0xc,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <sleep>:
SYSCALL(sleep)
 59a:	b8 0d 00 00 00       	mov    $0xd,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <uptime>:
SYSCALL(uptime)
 5a2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <clone>:
SYSCALL(clone)
 5aa:	b8 16 00 00 00       	mov    $0x16,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <join>:
 5b2:	b8 17 00 00 00       	mov    $0x17,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	83 ec 1c             	sub    $0x1c,%esp
 5c0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5c3:	6a 01                	push   $0x1
 5c5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c8:	52                   	push   %edx
 5c9:	50                   	push   %eax
 5ca:	e8 5b ff ff ff       	call   52a <write>
}
 5cf:	83 c4 10             	add    $0x10,%esp
 5d2:	c9                   	leave  
 5d3:	c3                   	ret    

000005d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	56                   	push   %esi
 5d9:	53                   	push   %ebx
 5da:	83 ec 2c             	sub    $0x2c,%esp
 5dd:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e8:	0f 95 c1             	setne  %cl
 5eb:	c1 ea 1f             	shr    $0x1f,%edx
 5ee:	84 d1                	test   %dl,%cl
 5f0:	74 44                	je     636 <printint+0x62>
    neg = 1;
    x = -xx;
 5f2:	f7 d8                	neg    %eax
 5f4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5f6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5fd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 602:	89 c8                	mov    %ecx,%eax
 604:	ba 00 00 00 00       	mov    $0x0,%edx
 609:	f7 f6                	div    %esi
 60b:	89 df                	mov    %ebx,%edi
 60d:	83 c3 01             	add    $0x1,%ebx
 610:	0f b6 92 b8 09 00 00 	movzbl 0x9b8(%edx),%edx
 617:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 61b:	89 ca                	mov    %ecx,%edx
 61d:	89 c1                	mov    %eax,%ecx
 61f:	39 d6                	cmp    %edx,%esi
 621:	76 df                	jbe    602 <printint+0x2e>
  if(neg)
 623:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 627:	74 31                	je     65a <printint+0x86>
    buf[i++] = '-';
 629:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 62e:	8d 5f 02             	lea    0x2(%edi),%ebx
 631:	8b 75 d0             	mov    -0x30(%ebp),%esi
 634:	eb 17                	jmp    64d <printint+0x79>
    x = xx;
 636:	89 c1                	mov    %eax,%ecx
  neg = 0;
 638:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 63f:	eb bc                	jmp    5fd <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 641:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 646:	89 f0                	mov    %esi,%eax
 648:	e8 6d ff ff ff       	call   5ba <putc>
  while(--i >= 0)
 64d:	83 eb 01             	sub    $0x1,%ebx
 650:	79 ef                	jns    641 <printint+0x6d>
}
 652:	83 c4 2c             	add    $0x2c,%esp
 655:	5b                   	pop    %ebx
 656:	5e                   	pop    %esi
 657:	5f                   	pop    %edi
 658:	5d                   	pop    %ebp
 659:	c3                   	ret    
 65a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65d:	eb ee                	jmp    64d <printint+0x79>

0000065f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 65f:	55                   	push   %ebp
 660:	89 e5                	mov    %esp,%ebp
 662:	57                   	push   %edi
 663:	56                   	push   %esi
 664:	53                   	push   %ebx
 665:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 668:	8d 45 10             	lea    0x10(%ebp),%eax
 66b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 66e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 673:	bb 00 00 00 00       	mov    $0x0,%ebx
 678:	eb 14                	jmp    68e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 67a:	89 fa                	mov    %edi,%edx
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	e8 36 ff ff ff       	call   5ba <putc>
 684:	eb 05                	jmp    68b <printf+0x2c>
      }
    } else if(state == '%'){
 686:	83 fe 25             	cmp    $0x25,%esi
 689:	74 25                	je     6b0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 68b:	83 c3 01             	add    $0x1,%ebx
 68e:	8b 45 0c             	mov    0xc(%ebp),%eax
 691:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 695:	84 c0                	test   %al,%al
 697:	0f 84 20 01 00 00    	je     7bd <printf+0x15e>
    c = fmt[i] & 0xff;
 69d:	0f be f8             	movsbl %al,%edi
 6a0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6a3:	85 f6                	test   %esi,%esi
 6a5:	75 df                	jne    686 <printf+0x27>
      if(c == '%'){
 6a7:	83 f8 25             	cmp    $0x25,%eax
 6aa:	75 ce                	jne    67a <printf+0x1b>
        state = '%';
 6ac:	89 c6                	mov    %eax,%esi
 6ae:	eb db                	jmp    68b <printf+0x2c>
      if(c == 'd'){
 6b0:	83 f8 25             	cmp    $0x25,%eax
 6b3:	0f 84 cf 00 00 00    	je     788 <printf+0x129>
 6b9:	0f 8c dd 00 00 00    	jl     79c <printf+0x13d>
 6bf:	83 f8 78             	cmp    $0x78,%eax
 6c2:	0f 8f d4 00 00 00    	jg     79c <printf+0x13d>
 6c8:	83 f8 63             	cmp    $0x63,%eax
 6cb:	0f 8c cb 00 00 00    	jl     79c <printf+0x13d>
 6d1:	83 e8 63             	sub    $0x63,%eax
 6d4:	83 f8 15             	cmp    $0x15,%eax
 6d7:	0f 87 bf 00 00 00    	ja     79c <printf+0x13d>
 6dd:	ff 24 85 60 09 00 00 	jmp    *0x960(,%eax,4)
        printint(fd, *ap, 10, 1);
 6e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e7:	8b 17                	mov    (%edi),%edx
 6e9:	83 ec 0c             	sub    $0xc,%esp
 6ec:	6a 01                	push   $0x1
 6ee:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 d9 fe ff ff       	call   5d4 <printint>
        ap++;
 6fb:	83 c7 04             	add    $0x4,%edi
 6fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 701:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 704:	be 00 00 00 00       	mov    $0x0,%esi
 709:	eb 80                	jmp    68b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 70b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70e:	8b 17                	mov    (%edi),%edx
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	6a 00                	push   $0x0
 715:	b9 10 00 00 00       	mov    $0x10,%ecx
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	e8 b2 fe ff ff       	call   5d4 <printint>
        ap++;
 722:	83 c7 04             	add    $0x4,%edi
 725:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72b:	be 00 00 00 00       	mov    $0x0,%esi
 730:	e9 56 ff ff ff       	jmp    68b <printf+0x2c>
        s = (char*)*ap;
 735:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 738:	8b 30                	mov    (%eax),%esi
        ap++;
 73a:	83 c0 04             	add    $0x4,%eax
 73d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 740:	85 f6                	test   %esi,%esi
 742:	75 15                	jne    759 <printf+0xfa>
          s = "(null)";
 744:	be 56 09 00 00       	mov    $0x956,%esi
 749:	eb 0e                	jmp    759 <printf+0xfa>
          putc(fd, *s);
 74b:	0f be d2             	movsbl %dl,%edx
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	e8 64 fe ff ff       	call   5ba <putc>
          s++;
 756:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 759:	0f b6 16             	movzbl (%esi),%edx
 75c:	84 d2                	test   %dl,%dl
 75e:	75 eb                	jne    74b <printf+0xec>
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	e9 21 ff ff ff       	jmp    68b <printf+0x2c>
        putc(fd, *ap);
 76a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76d:	0f be 17             	movsbl (%edi),%edx
 770:	8b 45 08             	mov    0x8(%ebp),%eax
 773:	e8 42 fe ff ff       	call   5ba <putc>
        ap++;
 778:	83 c7 04             	add    $0x4,%edi
 77b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 03 ff ff ff       	jmp    68b <printf+0x2c>
        putc(fd, c);
 788:	89 fa                	mov    %edi,%edx
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	e8 28 fe ff ff       	call   5ba <putc>
      state = 0;
 792:	be 00 00 00 00       	mov    $0x0,%esi
 797:	e9 ef fe ff ff       	jmp    68b <printf+0x2c>
        putc(fd, '%');
 79c:	ba 25 00 00 00       	mov    $0x25,%edx
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	e8 11 fe ff ff       	call   5ba <putc>
        putc(fd, c);
 7a9:	89 fa                	mov    %edi,%edx
 7ab:	8b 45 08             	mov    0x8(%ebp),%eax
 7ae:	e8 07 fe ff ff       	call   5ba <putc>
      state = 0;
 7b3:	be 00 00 00 00       	mov    $0x0,%esi
 7b8:	e9 ce fe ff ff       	jmp    68b <printf+0x2c>
    }
  }
}
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c0:	5b                   	pop    %ebx
 7c1:	5e                   	pop    %esi
 7c2:	5f                   	pop    %edi
 7c3:	5d                   	pop    %ebp
 7c4:	c3                   	ret    

000007c5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c5:	55                   	push   %ebp
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	a1 8c 0d 00 00       	mov    0xd8c,%eax
 7d6:	eb 02                	jmp    7da <free+0x15>
 7d8:	89 d0                	mov    %edx,%eax
 7da:	39 c8                	cmp    %ecx,%eax
 7dc:	73 04                	jae    7e2 <free+0x1d>
 7de:	39 08                	cmp    %ecx,(%eax)
 7e0:	77 12                	ja     7f4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e2:	8b 10                	mov    (%eax),%edx
 7e4:	39 c2                	cmp    %eax,%edx
 7e6:	77 f0                	ja     7d8 <free+0x13>
 7e8:	39 c8                	cmp    %ecx,%eax
 7ea:	72 08                	jb     7f4 <free+0x2f>
 7ec:	39 ca                	cmp    %ecx,%edx
 7ee:	77 04                	ja     7f4 <free+0x2f>
 7f0:	89 d0                	mov    %edx,%eax
 7f2:	eb e6                	jmp    7da <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fa:	8b 10                	mov    (%eax),%edx
 7fc:	39 d7                	cmp    %edx,%edi
 7fe:	74 19                	je     819 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 800:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 803:	8b 50 04             	mov    0x4(%eax),%edx
 806:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 809:	39 ce                	cmp    %ecx,%esi
 80b:	74 1b                	je     828 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 80f:	a3 8c 0d 00 00       	mov    %eax,0xd8c
}
 814:	5b                   	pop    %ebx
 815:	5e                   	pop    %esi
 816:	5f                   	pop    %edi
 817:	5d                   	pop    %ebp
 818:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 819:	03 72 04             	add    0x4(%edx),%esi
 81c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 81f:	8b 10                	mov    (%eax),%edx
 821:	8b 12                	mov    (%edx),%edx
 823:	89 53 f8             	mov    %edx,-0x8(%ebx)
 826:	eb db                	jmp    803 <free+0x3e>
    p->s.size += bp->s.size;
 828:	03 53 fc             	add    -0x4(%ebx),%edx
 82b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 82e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 831:	89 10                	mov    %edx,(%eax)
 833:	eb da                	jmp    80f <free+0x4a>

00000835 <morecore>:

static Header*
morecore(uint nu)
{
 835:	55                   	push   %ebp
 836:	89 e5                	mov    %esp,%ebp
 838:	53                   	push   %ebx
 839:	83 ec 04             	sub    $0x4,%esp
 83c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 83e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 843:	77 05                	ja     84a <morecore+0x15>
    nu = 4096;
 845:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 84a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 851:	83 ec 0c             	sub    $0xc,%esp
 854:	50                   	push   %eax
 855:	e8 38 fd ff ff       	call   592 <sbrk>
  if(p == (char*)-1)
 85a:	83 c4 10             	add    $0x10,%esp
 85d:	83 f8 ff             	cmp    $0xffffffff,%eax
 860:	74 1c                	je     87e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 862:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 865:	83 c0 08             	add    $0x8,%eax
 868:	83 ec 0c             	sub    $0xc,%esp
 86b:	50                   	push   %eax
 86c:	e8 54 ff ff ff       	call   7c5 <free>
  return freep;
 871:	a1 8c 0d 00 00       	mov    0xd8c,%eax
 876:	83 c4 10             	add    $0x10,%esp
}
 879:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 87c:	c9                   	leave  
 87d:	c3                   	ret    
    return 0;
 87e:	b8 00 00 00 00       	mov    $0x0,%eax
 883:	eb f4                	jmp    879 <morecore+0x44>

00000885 <malloc>:

void*
malloc(uint nbytes)
{
 885:	55                   	push   %ebp
 886:	89 e5                	mov    %esp,%ebp
 888:	53                   	push   %ebx
 889:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88c:	8b 45 08             	mov    0x8(%ebp),%eax
 88f:	8d 58 07             	lea    0x7(%eax),%ebx
 892:	c1 eb 03             	shr    $0x3,%ebx
 895:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 898:	8b 0d 8c 0d 00 00    	mov    0xd8c,%ecx
 89e:	85 c9                	test   %ecx,%ecx
 8a0:	74 04                	je     8a6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a2:	8b 01                	mov    (%ecx),%eax
 8a4:	eb 4a                	jmp    8f0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8a6:	c7 05 8c 0d 00 00 90 	movl   $0xd90,0xd8c
 8ad:	0d 00 00 
 8b0:	c7 05 90 0d 00 00 90 	movl   $0xd90,0xd90
 8b7:	0d 00 00 
    base.s.size = 0;
 8ba:	c7 05 94 0d 00 00 00 	movl   $0x0,0xd94
 8c1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8c4:	b9 90 0d 00 00       	mov    $0xd90,%ecx
 8c9:	eb d7                	jmp    8a2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8cb:	74 19                	je     8e6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8cd:	29 da                	sub    %ebx,%edx
 8cf:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d8:	89 0d 8c 0d 00 00    	mov    %ecx,0xd8c
      return (void*)(p + 1);
 8de:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e4:	c9                   	leave  
 8e5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8e6:	8b 10                	mov    (%eax),%edx
 8e8:	89 11                	mov    %edx,(%ecx)
 8ea:	eb ec                	jmp    8d8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ec:	89 c1                	mov    %eax,%ecx
 8ee:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f0:	8b 50 04             	mov    0x4(%eax),%edx
 8f3:	39 da                	cmp    %ebx,%edx
 8f5:	73 d4                	jae    8cb <malloc+0x46>
    if(p == freep)
 8f7:	39 05 8c 0d 00 00    	cmp    %eax,0xd8c
 8fd:	75 ed                	jne    8ec <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ff:	89 d8                	mov    %ebx,%eax
 901:	e8 2f ff ff ff       	call   835 <morecore>
 906:	85 c0                	test   %eax,%eax
 908:	75 e2                	jne    8ec <malloc+0x67>
 90a:	eb d5                	jmp    8e1 <malloc+0x5c>
