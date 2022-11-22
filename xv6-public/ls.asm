
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
   c:	e8 27 04 00 00       	call   438 <strlen>
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
  2b:	e8 08 04 00 00       	call   438 <strlen>
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
  45:	e8 ee 03 00 00       	call   438 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 20 0e 00 00       	push   $0xe20
  54:	e8 fe 04 00 00       	call   557 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 d7 03 00 00       	call   438 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 cd 03 00 00       	call   438 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 20 0e 00 00       	add    $0xe20,%eax
  7d:	50                   	push   %eax
  7e:	e8 cd 03 00 00       	call   450 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 20 0e 00 00       	mov    $0xe20,%ebx
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
  9f:	e8 27 05 00 00       	call   5cb <open>
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
  bc:	e8 22 05 00 00       	call   5e3 <fstat>
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
 118:	68 b8 09 00 00       	push   $0x9b8
 11d:	6a 01                	push   $0x1
 11f:	e8 bc 05 00 00       	call   6e0 <printf>
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
 12b:	e8 83 04 00 00       	call   5b3 <close>
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
 13f:	68 90 09 00 00       	push   $0x990
 144:	6a 02                	push   $0x2
 146:	e8 95 05 00 00       	call   6e0 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 a4 09 00 00       	push   $0x9a4
 159:	6a 02                	push   $0x2
 15b:	e8 80 05 00 00       	call   6e0 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 4b 04 00 00       	call   5b3 <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 c2 02 00 00       	call   438 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 c5 09 00 00       	push   $0x9c5
 18b:	6a 01                	push   $0x1
 18d:	e8 4e 05 00 00       	call   6e0 <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 45 02 00 00       	call   3ec <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 89 02 00 00       	call   438 <strlen>
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
 1cc:	68 a4 09 00 00       	push   $0x9a4
 1d1:	6a 01                	push   $0x1
 1d3:	e8 08 05 00 00       	call   6e0 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 b6 03 00 00       	call   5a3 <read>
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
 215:	e8 3d 03 00 00       	call   557 <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 af 02 00 00       	call   4e3 <stat>
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
 27f:	68 b8 09 00 00       	push   $0x9b8
 284:	6a 01                	push   $0x1
 286:	e8 55 04 00 00       	call   6e0 <printf>
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
 2bb:	68 d8 09 00 00       	push   $0x9d8
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 c1 02 00 00       	call   58b <exit>
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
 2df:	e8 a7 02 00 00       	call   58b <exit>

000002e4 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

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
  void *n_stack = malloc(PGSIZE*2);
 2fb:	68 00 20 00 00       	push   $0x2000
 300:	e8 01 06 00 00       	call   906 <malloc>
  if(n_stack == 0){
 305:	83 c4 10             	add    $0x10,%esp
 308:	85 c0                	test   %eax,%eax
 30a:	74 4a                	je     356 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 30c:	ba 00 00 00 00       	mov    $0x0,%edx
 311:	eb 03                	jmp    316 <thread_create+0x21>
 313:	83 c2 01             	add    $0x1,%edx
 316:	83 fa 3f             	cmp    $0x3f,%edx
 319:	7f 27                	jg     342 <thread_create+0x4d>
    if(threads[i]->flag==0){
 31b:	8b 0c 95 40 0e 00 00 	mov    0xe40(,%edx,4),%ecx
 322:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 326:	75 eb                	jne    313 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 328:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 32a:	8b 0c 95 40 0e 00 00 	mov    0xe40(,%edx,4),%ecx
 331:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 334:	8b 14 95 40 0e 00 00 	mov    0xe40(,%edx,4),%edx
 33b:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 342:	50                   	push   %eax
 343:	ff 75 10             	push   0x10(%ebp)
 346:	ff 75 0c             	push   0xc(%ebp)
 349:	ff 75 08             	push   0x8(%ebp)
 34c:	e8 da 02 00 00       	call   62b <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 351:	83 c4 10             	add    $0x10,%esp
}
 354:	c9                   	leave  
 355:	c3                   	ret    
    return -1;
 356:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 35b:	eb f7                	jmp    354 <thread_create+0x5f>

0000035d <thread_join>:

//TODO: fix
int thread_join() {
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
 360:	56                   	push   %esi
 361:	53                   	push   %ebx
 362:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 365:	8d 45 f4             	lea    -0xc(%ebp),%eax
 368:	50                   	push   %eax
 369:	e8 c5 02 00 00       	call   633 <join>
 36e:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 370:	83 c4 10             	add    $0x10,%esp
 373:	bb 00 00 00 00       	mov    $0x0,%ebx
 378:	eb 03                	jmp    37d <thread_join+0x20>
 37a:	83 c3 01             	add    $0x1,%ebx
 37d:	83 fb 3f             	cmp    $0x3f,%ebx
 380:	7f 23                	jg     3a5 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 382:	8b 04 9d 40 0e 00 00 	mov    0xe40(,%ebx,4),%eax
 389:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 38d:	75 eb                	jne    37a <thread_join+0x1d>
 38f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 392:	39 50 04             	cmp    %edx,0x4(%eax)
 395:	75 e3                	jne    37a <thread_join+0x1d>
      free(stk_addr);
 397:	83 ec 0c             	sub    $0xc,%esp
 39a:	52                   	push   %edx
 39b:	e8 a6 04 00 00       	call   846 <free>
 3a0:	83 c4 10             	add    $0x10,%esp
 3a3:	eb d5                	jmp    37a <thread_join+0x1d>
    }
  }
  return pid;
}
 3a5:	89 f0                	mov    %esi,%eax
 3a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3aa:	5b                   	pop    %ebx
 3ab:	5e                   	pop    %esi
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <lock_acquire>:

void lock_acquire(lock_t *lock){
 3ae:	55                   	push   %ebp
 3af:	89 e5                	mov    %esp,%ebp
 3b1:	53                   	push   %ebx
 3b2:	83 ec 04             	sub    $0x4,%esp
 3b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3b8:	83 ec 08             	sub    $0x8,%esp
 3bb:	6a 01                	push   $0x1
 3bd:	53                   	push   %ebx
 3be:	e8 21 ff ff ff       	call   2e4 <test_and_set>
 3c3:	83 c4 10             	add    $0x10,%esp
 3c6:	83 f8 01             	cmp    $0x1,%eax
 3c9:	74 ed                	je     3b8 <lock_acquire+0xa>
    ;
}
 3cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ce:	c9                   	leave  
 3cf:	c3                   	ret    

000003d0 <lock_release>:

void lock_release(lock_t *lock) {
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3dc:	5d                   	pop    %ebp
 3dd:	c3                   	ret    

000003de <lock_init>:

void lock_init(lock_t *lock) {
 3de:	55                   	push   %ebp
 3df:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    

000003ec <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	56                   	push   %esi
 3f0:	53                   	push   %ebx
 3f1:	8b 75 08             	mov    0x8(%ebp),%esi
 3f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3f7:	89 f0                	mov    %esi,%eax
 3f9:	89 d1                	mov    %edx,%ecx
 3fb:	83 c2 01             	add    $0x1,%edx
 3fe:	89 c3                	mov    %eax,%ebx
 400:	83 c0 01             	add    $0x1,%eax
 403:	0f b6 09             	movzbl (%ecx),%ecx
 406:	88 0b                	mov    %cl,(%ebx)
 408:	84 c9                	test   %cl,%cl
 40a:	75 ed                	jne    3f9 <strcpy+0xd>
    ;
  return os;
}
 40c:	89 f0                	mov    %esi,%eax
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    

00000412 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	8b 4d 08             	mov    0x8(%ebp),%ecx
 418:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 41b:	eb 06                	jmp    423 <strcmp+0x11>
    p++, q++;
 41d:	83 c1 01             	add    $0x1,%ecx
 420:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 423:	0f b6 01             	movzbl (%ecx),%eax
 426:	84 c0                	test   %al,%al
 428:	74 04                	je     42e <strcmp+0x1c>
 42a:	3a 02                	cmp    (%edx),%al
 42c:	74 ef                	je     41d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 42e:	0f b6 c0             	movzbl %al,%eax
 431:	0f b6 12             	movzbl (%edx),%edx
 434:	29 d0                	sub    %edx,%eax
}
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    

00000438 <strlen>:

uint
strlen(const char *s)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 43e:	b8 00 00 00 00       	mov    $0x0,%eax
 443:	eb 03                	jmp    448 <strlen+0x10>
 445:	83 c0 01             	add    $0x1,%eax
 448:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 44c:	75 f7                	jne    445 <strlen+0xd>
    ;
  return n;
}
 44e:	5d                   	pop    %ebp
 44f:	c3                   	ret    

00000450 <memset>:

void*
memset(void *dst, int c, uint n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 457:	89 d7                	mov    %edx,%edi
 459:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45c:	8b 45 0c             	mov    0xc(%ebp),%eax
 45f:	fc                   	cld    
 460:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 462:	89 d0                	mov    %edx,%eax
 464:	8b 7d fc             	mov    -0x4(%ebp),%edi
 467:	c9                   	leave  
 468:	c3                   	ret    

00000469 <strchr>:

char*
strchr(const char *s, char c)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 473:	eb 03                	jmp    478 <strchr+0xf>
 475:	83 c0 01             	add    $0x1,%eax
 478:	0f b6 10             	movzbl (%eax),%edx
 47b:	84 d2                	test   %dl,%dl
 47d:	74 06                	je     485 <strchr+0x1c>
    if(*s == c)
 47f:	38 ca                	cmp    %cl,%dl
 481:	75 f2                	jne    475 <strchr+0xc>
 483:	eb 05                	jmp    48a <strchr+0x21>
      return (char*)s;
  return 0;
 485:	b8 00 00 00 00       	mov    $0x0,%eax
}
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    

0000048c <gets>:

char*
gets(char *buf, int max)
{
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	53                   	push   %ebx
 492:	83 ec 1c             	sub    $0x1c,%esp
 495:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 498:	bb 00 00 00 00       	mov    $0x0,%ebx
 49d:	89 de                	mov    %ebx,%esi
 49f:	83 c3 01             	add    $0x1,%ebx
 4a2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a5:	7d 2e                	jge    4d5 <gets+0x49>
    cc = read(0, &c, 1);
 4a7:	83 ec 04             	sub    $0x4,%esp
 4aa:	6a 01                	push   $0x1
 4ac:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4af:	50                   	push   %eax
 4b0:	6a 00                	push   $0x0
 4b2:	e8 ec 00 00 00       	call   5a3 <read>
    if(cc < 1)
 4b7:	83 c4 10             	add    $0x10,%esp
 4ba:	85 c0                	test   %eax,%eax
 4bc:	7e 17                	jle    4d5 <gets+0x49>
      break;
    buf[i++] = c;
 4be:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4c5:	3c 0a                	cmp    $0xa,%al
 4c7:	0f 94 c2             	sete   %dl
 4ca:	3c 0d                	cmp    $0xd,%al
 4cc:	0f 94 c0             	sete   %al
 4cf:	08 c2                	or     %al,%dl
 4d1:	74 ca                	je     49d <gets+0x11>
    buf[i++] = c;
 4d3:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4d5:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d9:	89 f8                	mov    %edi,%eax
 4db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4de:	5b                   	pop    %ebx
 4df:	5e                   	pop    %esi
 4e0:	5f                   	pop    %edi
 4e1:	5d                   	pop    %ebp
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	56                   	push   %esi
 4e7:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e8:	83 ec 08             	sub    $0x8,%esp
 4eb:	6a 00                	push   $0x0
 4ed:	ff 75 08             	push   0x8(%ebp)
 4f0:	e8 d6 00 00 00       	call   5cb <open>
  if(fd < 0)
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	85 c0                	test   %eax,%eax
 4fa:	78 24                	js     520 <stat+0x3d>
 4fc:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4fe:	83 ec 08             	sub    $0x8,%esp
 501:	ff 75 0c             	push   0xc(%ebp)
 504:	50                   	push   %eax
 505:	e8 d9 00 00 00       	call   5e3 <fstat>
 50a:	89 c6                	mov    %eax,%esi
  close(fd);
 50c:	89 1c 24             	mov    %ebx,(%esp)
 50f:	e8 9f 00 00 00       	call   5b3 <close>
  return r;
 514:	83 c4 10             	add    $0x10,%esp
}
 517:	89 f0                	mov    %esi,%eax
 519:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    
    return -1;
 520:	be ff ff ff ff       	mov    $0xffffffff,%esi
 525:	eb f0                	jmp    517 <stat+0x34>

00000527 <atoi>:

int
atoi(const char *s)
{
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	53                   	push   %ebx
 52b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 52e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 533:	eb 10                	jmp    545 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 535:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 538:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 53b:	83 c1 01             	add    $0x1,%ecx
 53e:	0f be c0             	movsbl %al,%eax
 541:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 545:	0f b6 01             	movzbl (%ecx),%eax
 548:	8d 58 d0             	lea    -0x30(%eax),%ebx
 54b:	80 fb 09             	cmp    $0x9,%bl
 54e:	76 e5                	jbe    535 <atoi+0xe>
  return n;
}
 550:	89 d0                	mov    %edx,%eax
 552:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 555:	c9                   	leave  
 556:	c3                   	ret    

00000557 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 557:	55                   	push   %ebp
 558:	89 e5                	mov    %esp,%ebp
 55a:	56                   	push   %esi
 55b:	53                   	push   %ebx
 55c:	8b 75 08             	mov    0x8(%ebp),%esi
 55f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 562:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 565:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 567:	eb 0d                	jmp    576 <memmove+0x1f>
    *dst++ = *src++;
 569:	0f b6 01             	movzbl (%ecx),%eax
 56c:	88 02                	mov    %al,(%edx)
 56e:	8d 49 01             	lea    0x1(%ecx),%ecx
 571:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 574:	89 d8                	mov    %ebx,%eax
 576:	8d 58 ff             	lea    -0x1(%eax),%ebx
 579:	85 c0                	test   %eax,%eax
 57b:	7f ec                	jg     569 <memmove+0x12>
  return vdst;
}
 57d:	89 f0                	mov    %esi,%eax
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5d                   	pop    %ebp
 582:	c3                   	ret    

00000583 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 583:	b8 01 00 00 00       	mov    $0x1,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <exit>:
SYSCALL(exit)
 58b:	b8 02 00 00 00       	mov    $0x2,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <wait>:
SYSCALL(wait)
 593:	b8 03 00 00 00       	mov    $0x3,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <pipe>:
SYSCALL(pipe)
 59b:	b8 04 00 00 00       	mov    $0x4,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <read>:
SYSCALL(read)
 5a3:	b8 05 00 00 00       	mov    $0x5,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <write>:
SYSCALL(write)
 5ab:	b8 10 00 00 00       	mov    $0x10,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <close>:
SYSCALL(close)
 5b3:	b8 15 00 00 00       	mov    $0x15,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <kill>:
SYSCALL(kill)
 5bb:	b8 06 00 00 00       	mov    $0x6,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <exec>:
SYSCALL(exec)
 5c3:	b8 07 00 00 00       	mov    $0x7,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <open>:
SYSCALL(open)
 5cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <mknod>:
SYSCALL(mknod)
 5d3:	b8 11 00 00 00       	mov    $0x11,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <unlink>:
SYSCALL(unlink)
 5db:	b8 12 00 00 00       	mov    $0x12,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <fstat>:
SYSCALL(fstat)
 5e3:	b8 08 00 00 00       	mov    $0x8,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <link>:
SYSCALL(link)
 5eb:	b8 13 00 00 00       	mov    $0x13,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <mkdir>:
SYSCALL(mkdir)
 5f3:	b8 14 00 00 00       	mov    $0x14,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <chdir>:
SYSCALL(chdir)
 5fb:	b8 09 00 00 00       	mov    $0x9,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <dup>:
SYSCALL(dup)
 603:	b8 0a 00 00 00       	mov    $0xa,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <getpid>:
SYSCALL(getpid)
 60b:	b8 0b 00 00 00       	mov    $0xb,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <sbrk>:
SYSCALL(sbrk)
 613:	b8 0c 00 00 00       	mov    $0xc,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <sleep>:
SYSCALL(sleep)
 61b:	b8 0d 00 00 00       	mov    $0xd,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <uptime>:
SYSCALL(uptime)
 623:	b8 0e 00 00 00       	mov    $0xe,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <clone>:
SYSCALL(clone)
 62b:	b8 16 00 00 00       	mov    $0x16,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <join>:
 633:	b8 17 00 00 00       	mov    $0x17,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	83 ec 1c             	sub    $0x1c,%esp
 641:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 644:	6a 01                	push   $0x1
 646:	8d 55 f4             	lea    -0xc(%ebp),%edx
 649:	52                   	push   %edx
 64a:	50                   	push   %eax
 64b:	e8 5b ff ff ff       	call   5ab <write>
}
 650:	83 c4 10             	add    $0x10,%esp
 653:	c9                   	leave  
 654:	c3                   	ret    

00000655 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 655:	55                   	push   %ebp
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	83 ec 2c             	sub    $0x2c,%esp
 65e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 661:	89 d0                	mov    %edx,%eax
 663:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 665:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 669:	0f 95 c1             	setne  %cl
 66c:	c1 ea 1f             	shr    $0x1f,%edx
 66f:	84 d1                	test   %dl,%cl
 671:	74 44                	je     6b7 <printint+0x62>
    neg = 1;
    x = -xx;
 673:	f7 d8                	neg    %eax
 675:	89 c1                	mov    %eax,%ecx
    neg = 1;
 677:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 67e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 683:	89 c8                	mov    %ecx,%eax
 685:	ba 00 00 00 00       	mov    $0x0,%edx
 68a:	f7 f6                	div    %esi
 68c:	89 df                	mov    %ebx,%edi
 68e:	83 c3 01             	add    $0x1,%ebx
 691:	0f b6 92 3c 0a 00 00 	movzbl 0xa3c(%edx),%edx
 698:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 69c:	89 ca                	mov    %ecx,%edx
 69e:	89 c1                	mov    %eax,%ecx
 6a0:	39 d6                	cmp    %edx,%esi
 6a2:	76 df                	jbe    683 <printint+0x2e>
  if(neg)
 6a4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6a8:	74 31                	je     6db <printint+0x86>
    buf[i++] = '-';
 6aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6af:	8d 5f 02             	lea    0x2(%edi),%ebx
 6b2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b5:	eb 17                	jmp    6ce <printint+0x79>
    x = xx;
 6b7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6c0:	eb bc                	jmp    67e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6c2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6c7:	89 f0                	mov    %esi,%eax
 6c9:	e8 6d ff ff ff       	call   63b <putc>
  while(--i >= 0)
 6ce:	83 eb 01             	sub    $0x1,%ebx
 6d1:	79 ef                	jns    6c2 <printint+0x6d>
}
 6d3:	83 c4 2c             	add    $0x2c,%esp
 6d6:	5b                   	pop    %ebx
 6d7:	5e                   	pop    %esi
 6d8:	5f                   	pop    %edi
 6d9:	5d                   	pop    %ebp
 6da:	c3                   	ret    
 6db:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6de:	eb ee                	jmp    6ce <printint+0x79>

000006e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e9:	8d 45 10             	lea    0x10(%ebp),%eax
 6ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ef:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6f4:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f9:	eb 14                	jmp    70f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6fb:	89 fa                	mov    %edi,%edx
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	e8 36 ff ff ff       	call   63b <putc>
 705:	eb 05                	jmp    70c <printf+0x2c>
      }
    } else if(state == '%'){
 707:	83 fe 25             	cmp    $0x25,%esi
 70a:	74 25                	je     731 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 70c:	83 c3 01             	add    $0x1,%ebx
 70f:	8b 45 0c             	mov    0xc(%ebp),%eax
 712:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 716:	84 c0                	test   %al,%al
 718:	0f 84 20 01 00 00    	je     83e <printf+0x15e>
    c = fmt[i] & 0xff;
 71e:	0f be f8             	movsbl %al,%edi
 721:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 724:	85 f6                	test   %esi,%esi
 726:	75 df                	jne    707 <printf+0x27>
      if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	75 ce                	jne    6fb <printf+0x1b>
        state = '%';
 72d:	89 c6                	mov    %eax,%esi
 72f:	eb db                	jmp    70c <printf+0x2c>
      if(c == 'd'){
 731:	83 f8 25             	cmp    $0x25,%eax
 734:	0f 84 cf 00 00 00    	je     809 <printf+0x129>
 73a:	0f 8c dd 00 00 00    	jl     81d <printf+0x13d>
 740:	83 f8 78             	cmp    $0x78,%eax
 743:	0f 8f d4 00 00 00    	jg     81d <printf+0x13d>
 749:	83 f8 63             	cmp    $0x63,%eax
 74c:	0f 8c cb 00 00 00    	jl     81d <printf+0x13d>
 752:	83 e8 63             	sub    $0x63,%eax
 755:	83 f8 15             	cmp    $0x15,%eax
 758:	0f 87 bf 00 00 00    	ja     81d <printf+0x13d>
 75e:	ff 24 85 e4 09 00 00 	jmp    *0x9e4(,%eax,4)
        printint(fd, *ap, 10, 1);
 765:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 768:	8b 17                	mov    (%edi),%edx
 76a:	83 ec 0c             	sub    $0xc,%esp
 76d:	6a 01                	push   $0x1
 76f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 d9 fe ff ff       	call   655 <printint>
        ap++;
 77c:	83 c7 04             	add    $0x4,%edi
 77f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 782:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 785:	be 00 00 00 00       	mov    $0x0,%esi
 78a:	eb 80                	jmp    70c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 78c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 78f:	8b 17                	mov    (%edi),%edx
 791:	83 ec 0c             	sub    $0xc,%esp
 794:	6a 00                	push   $0x0
 796:	b9 10 00 00 00       	mov    $0x10,%ecx
 79b:	8b 45 08             	mov    0x8(%ebp),%eax
 79e:	e8 b2 fe ff ff       	call   655 <printint>
        ap++;
 7a3:	83 c7 04             	add    $0x4,%edi
 7a6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ac:	be 00 00 00 00       	mov    $0x0,%esi
 7b1:	e9 56 ff ff ff       	jmp    70c <printf+0x2c>
        s = (char*)*ap;
 7b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b9:	8b 30                	mov    (%eax),%esi
        ap++;
 7bb:	83 c0 04             	add    $0x4,%eax
 7be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7c1:	85 f6                	test   %esi,%esi
 7c3:	75 15                	jne    7da <printf+0xfa>
          s = "(null)";
 7c5:	be da 09 00 00       	mov    $0x9da,%esi
 7ca:	eb 0e                	jmp    7da <printf+0xfa>
          putc(fd, *s);
 7cc:	0f be d2             	movsbl %dl,%edx
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	e8 64 fe ff ff       	call   63b <putc>
          s++;
 7d7:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7da:	0f b6 16             	movzbl (%esi),%edx
 7dd:	84 d2                	test   %dl,%dl
 7df:	75 eb                	jne    7cc <printf+0xec>
      state = 0;
 7e1:	be 00 00 00 00       	mov    $0x0,%esi
 7e6:	e9 21 ff ff ff       	jmp    70c <printf+0x2c>
        putc(fd, *ap);
 7eb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ee:	0f be 17             	movsbl (%edi),%edx
 7f1:	8b 45 08             	mov    0x8(%ebp),%eax
 7f4:	e8 42 fe ff ff       	call   63b <putc>
        ap++;
 7f9:	83 c7 04             	add    $0x4,%edi
 7fc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7ff:	be 00 00 00 00       	mov    $0x0,%esi
 804:	e9 03 ff ff ff       	jmp    70c <printf+0x2c>
        putc(fd, c);
 809:	89 fa                	mov    %edi,%edx
 80b:	8b 45 08             	mov    0x8(%ebp),%eax
 80e:	e8 28 fe ff ff       	call   63b <putc>
      state = 0;
 813:	be 00 00 00 00       	mov    $0x0,%esi
 818:	e9 ef fe ff ff       	jmp    70c <printf+0x2c>
        putc(fd, '%');
 81d:	ba 25 00 00 00       	mov    $0x25,%edx
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	e8 11 fe ff ff       	call   63b <putc>
        putc(fd, c);
 82a:	89 fa                	mov    %edi,%edx
 82c:	8b 45 08             	mov    0x8(%ebp),%eax
 82f:	e8 07 fe ff ff       	call   63b <putc>
      state = 0;
 834:	be 00 00 00 00       	mov    $0x0,%esi
 839:	e9 ce fe ff ff       	jmp    70c <printf+0x2c>
    }
  }
}
 83e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 841:	5b                   	pop    %ebx
 842:	5e                   	pop    %esi
 843:	5f                   	pop    %edi
 844:	5d                   	pop    %ebp
 845:	c3                   	ret    

00000846 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 846:	55                   	push   %ebp
 847:	89 e5                	mov    %esp,%ebp
 849:	57                   	push   %edi
 84a:	56                   	push   %esi
 84b:	53                   	push   %ebx
 84c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 84f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 852:	a1 40 0f 00 00       	mov    0xf40,%eax
 857:	eb 02                	jmp    85b <free+0x15>
 859:	89 d0                	mov    %edx,%eax
 85b:	39 c8                	cmp    %ecx,%eax
 85d:	73 04                	jae    863 <free+0x1d>
 85f:	39 08                	cmp    %ecx,(%eax)
 861:	77 12                	ja     875 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 863:	8b 10                	mov    (%eax),%edx
 865:	39 c2                	cmp    %eax,%edx
 867:	77 f0                	ja     859 <free+0x13>
 869:	39 c8                	cmp    %ecx,%eax
 86b:	72 08                	jb     875 <free+0x2f>
 86d:	39 ca                	cmp    %ecx,%edx
 86f:	77 04                	ja     875 <free+0x2f>
 871:	89 d0                	mov    %edx,%eax
 873:	eb e6                	jmp    85b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 875:	8b 73 fc             	mov    -0x4(%ebx),%esi
 878:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87b:	8b 10                	mov    (%eax),%edx
 87d:	39 d7                	cmp    %edx,%edi
 87f:	74 19                	je     89a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 881:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 884:	8b 50 04             	mov    0x4(%eax),%edx
 887:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 88a:	39 ce                	cmp    %ecx,%esi
 88c:	74 1b                	je     8a9 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 88e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 890:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 895:	5b                   	pop    %ebx
 896:	5e                   	pop    %esi
 897:	5f                   	pop    %edi
 898:	5d                   	pop    %ebp
 899:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 89a:	03 72 04             	add    0x4(%edx),%esi
 89d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a0:	8b 10                	mov    (%eax),%edx
 8a2:	8b 12                	mov    (%edx),%edx
 8a4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8a7:	eb db                	jmp    884 <free+0x3e>
    p->s.size += bp->s.size;
 8a9:	03 53 fc             	add    -0x4(%ebx),%edx
 8ac:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8af:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8b2:	89 10                	mov    %edx,(%eax)
 8b4:	eb da                	jmp    890 <free+0x4a>

000008b6 <morecore>:

static Header*
morecore(uint nu)
{
 8b6:	55                   	push   %ebp
 8b7:	89 e5                	mov    %esp,%ebp
 8b9:	53                   	push   %ebx
 8ba:	83 ec 04             	sub    $0x4,%esp
 8bd:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8bf:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8c4:	77 05                	ja     8cb <morecore+0x15>
    nu = 4096;
 8c6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8cb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8d2:	83 ec 0c             	sub    $0xc,%esp
 8d5:	50                   	push   %eax
 8d6:	e8 38 fd ff ff       	call   613 <sbrk>
  if(p == (char*)-1)
 8db:	83 c4 10             	add    $0x10,%esp
 8de:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e1:	74 1c                	je     8ff <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8e3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8e6:	83 c0 08             	add    $0x8,%eax
 8e9:	83 ec 0c             	sub    $0xc,%esp
 8ec:	50                   	push   %eax
 8ed:	e8 54 ff ff ff       	call   846 <free>
  return freep;
 8f2:	a1 40 0f 00 00       	mov    0xf40,%eax
 8f7:	83 c4 10             	add    $0x10,%esp
}
 8fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8fd:	c9                   	leave  
 8fe:	c3                   	ret    
    return 0;
 8ff:	b8 00 00 00 00       	mov    $0x0,%eax
 904:	eb f4                	jmp    8fa <morecore+0x44>

00000906 <malloc>:

void*
malloc(uint nbytes)
{
 906:	55                   	push   %ebp
 907:	89 e5                	mov    %esp,%ebp
 909:	53                   	push   %ebx
 90a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90d:	8b 45 08             	mov    0x8(%ebp),%eax
 910:	8d 58 07             	lea    0x7(%eax),%ebx
 913:	c1 eb 03             	shr    $0x3,%ebx
 916:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 919:	8b 0d 40 0f 00 00    	mov    0xf40,%ecx
 91f:	85 c9                	test   %ecx,%ecx
 921:	74 04                	je     927 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 923:	8b 01                	mov    (%ecx),%eax
 925:	eb 4a                	jmp    971 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 927:	c7 05 40 0f 00 00 44 	movl   $0xf44,0xf40
 92e:	0f 00 00 
 931:	c7 05 44 0f 00 00 44 	movl   $0xf44,0xf44
 938:	0f 00 00 
    base.s.size = 0;
 93b:	c7 05 48 0f 00 00 00 	movl   $0x0,0xf48
 942:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 945:	b9 44 0f 00 00       	mov    $0xf44,%ecx
 94a:	eb d7                	jmp    923 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 94c:	74 19                	je     967 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 94e:	29 da                	sub    %ebx,%edx
 950:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 953:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 956:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 959:	89 0d 40 0f 00 00    	mov    %ecx,0xf40
      return (void*)(p + 1);
 95f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 962:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 965:	c9                   	leave  
 966:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 967:	8b 10                	mov    (%eax),%edx
 969:	89 11                	mov    %edx,(%ecx)
 96b:	eb ec                	jmp    959 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96d:	89 c1                	mov    %eax,%ecx
 96f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 971:	8b 50 04             	mov    0x4(%eax),%edx
 974:	39 da                	cmp    %ebx,%edx
 976:	73 d4                	jae    94c <malloc+0x46>
    if(p == freep)
 978:	39 05 40 0f 00 00    	cmp    %eax,0xf40
 97e:	75 ed                	jne    96d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 980:	89 d8                	mov    %ebx,%eax
 982:	e8 2f ff ff ff       	call   8b6 <morecore>
 987:	85 c0                	test   %eax,%eax
 989:	75 e2                	jne    96d <malloc+0x67>
 98b:	eb d5                	jmp    962 <malloc+0x5c>
