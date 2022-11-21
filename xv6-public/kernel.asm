
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 54 11 80       	mov    $0x801154d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 34 2a 10 80       	mov    $0x80102a34,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax

80100034 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	57                   	push   %edi
80100038:	56                   	push   %esi
80100039:	53                   	push   %ebx
8010003a:	83 ec 18             	sub    $0x18,%esp
8010003d:	89 c6                	mov    %eax,%esi
8010003f:	89 d7                	mov    %edx,%edi
  struct buf *b;

  acquire(&bcache.lock);
<<<<<<< HEAD
80100041:	68 20 a5 10 80       	push   $0x8010a520
80100046:	e8 fa 3b 00 00       	call   80103c45 <acquire>
=======
80100041:	68 20 95 10 80       	push   $0x80109520
80100046:	e8 a6 3b 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
8010004b:	8b 1d 70 ec 10 80    	mov    0x8010ec70,%ebx
80100051:	83 c4 10             	add    $0x10,%esp
80100054:	eb 03                	jmp    80100059 <bget+0x25>
80100056:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100059:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
8010005f:	74 30                	je     80100091 <bget+0x5d>
    if(b->dev == dev && b->blockno == blockno){
80100061:	39 73 04             	cmp    %esi,0x4(%ebx)
80100064:	75 f0                	jne    80100056 <bget+0x22>
80100066:	39 7b 08             	cmp    %edi,0x8(%ebx)
80100069:	75 eb                	jne    80100056 <bget+0x22>
      b->refcnt++;
8010006b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010006e:	83 c0 01             	add    $0x1,%eax
80100071:	89 43 4c             	mov    %eax,0x4c(%ebx)
      release(&bcache.lock);
80100074:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100077:	68 20 a5 10 80       	push   $0x8010a520
8010007c:	e8 29 3c 00 00       	call   80103caa <release>
      acquiresleep(&b->lock);
80100081:	8d 43 0c             	lea    0xc(%ebx),%eax
80100084:	89 04 24             	mov    %eax,(%esp)
80100087:	e8 a5 39 00 00       	call   80103a31 <acquiresleep>
=======
80100077:	68 20 95 10 80       	push   $0x80109520
8010007c:	e8 d5 3b 00 00       	call   80103c56 <release>
      acquiresleep(&b->lock);
80100081:	8d 43 0c             	lea    0xc(%ebx),%eax
80100084:	89 04 24             	mov    %eax,(%esp)
80100087:	e8 51 39 00 00       	call   801039dd <acquiresleep>
>>>>>>> d669a6c (ulib and makefile)
      return b;
8010008c:	83 c4 10             	add    $0x10,%esp
8010008f:	eb 4c                	jmp    801000dd <bget+0xa9>
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100091:	8b 1d 6c ec 10 80    	mov    0x8010ec6c,%ebx
80100097:	eb 03                	jmp    8010009c <bget+0x68>
80100099:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010009c:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000a2:	74 43                	je     801000e7 <bget+0xb3>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
801000a4:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
801000a8:	75 ef                	jne    80100099 <bget+0x65>
801000aa:	f6 03 04             	testb  $0x4,(%ebx)
801000ad:	75 ea                	jne    80100099 <bget+0x65>
      b->dev = dev;
801000af:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
801000b2:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
801000b5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
801000bb:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
801000c2:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801000c5:	68 20 a5 10 80       	push   $0x8010a520
801000ca:	e8 db 3b 00 00       	call   80103caa <release>
      acquiresleep(&b->lock);
801000cf:	8d 43 0c             	lea    0xc(%ebx),%eax
801000d2:	89 04 24             	mov    %eax,(%esp)
801000d5:	e8 57 39 00 00       	call   80103a31 <acquiresleep>
=======
801000c5:	68 20 95 10 80       	push   $0x80109520
801000ca:	e8 87 3b 00 00       	call   80103c56 <release>
      acquiresleep(&b->lock);
801000cf:	8d 43 0c             	lea    0xc(%ebx),%eax
801000d2:	89 04 24             	mov    %eax,(%esp)
801000d5:	e8 03 39 00 00       	call   801039dd <acquiresleep>
>>>>>>> d669a6c (ulib and makefile)
      return b;
801000da:	83 c4 10             	add    $0x10,%esp
    }
  }
  panic("bget: no buffers");
}
801000dd:	89 d8                	mov    %ebx,%eax
801000df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801000e2:	5b                   	pop    %ebx
801000e3:	5e                   	pop    %esi
801000e4:	5f                   	pop    %edi
801000e5:	5d                   	pop    %ebp
801000e6:	c3                   	ret    
  panic("bget: no buffers");
801000e7:	83 ec 0c             	sub    $0xc,%esp
801000ea:	68 60 66 10 80       	push   $0x80106660
801000ef:	e8 54 02 00 00       	call   80100348 <panic>

801000f4 <binit>:
{
801000f4:	55                   	push   %ebp
801000f5:	89 e5                	mov    %esp,%ebp
801000f7:	53                   	push   %ebx
801000f8:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
<<<<<<< HEAD
801000fb:	68 71 66 10 80       	push   $0x80106671
80100100:	68 20 a5 10 80       	push   $0x8010a520
80100105:	e8 ff 39 00 00       	call   80103b09 <initlock>
=======
801000fb:	68 31 66 10 80       	push   $0x80106631
80100100:	68 20 95 10 80       	push   $0x80109520
80100105:	e8 ab 39 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
  bcache.head.prev = &bcache.head;
8010010a:	c7 05 6c ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec6c
80100111:	ec 10 80 
  bcache.head.next = &bcache.head;
80100114:	c7 05 70 ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec70
8010011b:	ec 10 80 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
8010011e:	83 c4 10             	add    $0x10,%esp
80100121:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
80100126:	eb 37                	jmp    8010015f <binit+0x6b>
    b->next = bcache.head.next;
80100128:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010012d:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
80100130:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100137:	83 ec 08             	sub    $0x8,%esp
8010013a:	68 78 66 10 80       	push   $0x80106678
8010013f:	8d 43 0c             	lea    0xc(%ebx),%eax
80100142:	50                   	push   %eax
<<<<<<< HEAD
80100143:	e8 b6 38 00 00       	call   801039fe <initsleeplock>
=======
80100143:	e8 62 38 00 00       	call   801039aa <initsleeplock>
>>>>>>> d669a6c (ulib and makefile)
    bcache.head.next->prev = b;
80100148:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010014d:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100150:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100156:	81 c3 5c 02 00 00    	add    $0x25c,%ebx
8010015c:	83 c4 10             	add    $0x10,%esp
8010015f:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100165:	72 c1                	jb     80100128 <binit+0x34>
}
80100167:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010016a:	c9                   	leave  
8010016b:	c3                   	ret    

8010016c <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
8010016c:	55                   	push   %ebp
8010016d:	89 e5                	mov    %esp,%ebp
8010016f:	53                   	push   %ebx
80100170:	83 ec 04             	sub    $0x4,%esp
  struct buf *b;

  b = bget(dev, blockno);
80100173:	8b 55 0c             	mov    0xc(%ebp),%edx
80100176:	8b 45 08             	mov    0x8(%ebp),%eax
80100179:	e8 b6 fe ff ff       	call   80100034 <bget>
8010017e:	89 c3                	mov    %eax,%ebx
  if((b->flags & B_VALID) == 0) {
80100180:	f6 00 02             	testb  $0x2,(%eax)
80100183:	74 07                	je     8010018c <bread+0x20>
    iderw(b);
  }
  return b;
}
80100185:	89 d8                	mov    %ebx,%eax
80100187:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010018a:	c9                   	leave  
8010018b:	c3                   	ret    
    iderw(b);
8010018c:	83 ec 0c             	sub    $0xc,%esp
8010018f:	50                   	push   %eax
80100190:	e8 62 1c 00 00       	call   80101df7 <iderw>
80100195:	83 c4 10             	add    $0x10,%esp
  return b;
80100198:	eb eb                	jmp    80100185 <bread+0x19>

8010019a <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
8010019a:	55                   	push   %ebp
8010019b:	89 e5                	mov    %esp,%ebp
8010019d:	53                   	push   %ebx
8010019e:	83 ec 10             	sub    $0x10,%esp
801001a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001a4:	8d 43 0c             	lea    0xc(%ebx),%eax
801001a7:	50                   	push   %eax
<<<<<<< HEAD
801001a8:	e8 0e 39 00 00       	call   80103abb <holdingsleep>
=======
801001a8:	e8 ba 38 00 00       	call   80103a67 <holdingsleep>
>>>>>>> d669a6c (ulib and makefile)
801001ad:	83 c4 10             	add    $0x10,%esp
801001b0:	85 c0                	test   %eax,%eax
801001b2:	74 14                	je     801001c8 <bwrite+0x2e>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001b4:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001b7:	83 ec 0c             	sub    $0xc,%esp
801001ba:	53                   	push   %ebx
801001bb:	e8 37 1c 00 00       	call   80101df7 <iderw>
}
801001c0:	83 c4 10             	add    $0x10,%esp
801001c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c6:	c9                   	leave  
801001c7:	c3                   	ret    
    panic("bwrite");
801001c8:	83 ec 0c             	sub    $0xc,%esp
801001cb:	68 7f 66 10 80       	push   $0x8010667f
801001d0:	e8 73 01 00 00       	call   80100348 <panic>

801001d5 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001d5:	55                   	push   %ebp
801001d6:	89 e5                	mov    %esp,%ebp
801001d8:	56                   	push   %esi
801001d9:	53                   	push   %ebx
801001da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001dd:	8d 73 0c             	lea    0xc(%ebx),%esi
801001e0:	83 ec 0c             	sub    $0xc,%esp
801001e3:	56                   	push   %esi
<<<<<<< HEAD
801001e4:	e8 d2 38 00 00       	call   80103abb <holdingsleep>
=======
801001e4:	e8 7e 38 00 00       	call   80103a67 <holdingsleep>
>>>>>>> d669a6c (ulib and makefile)
801001e9:	83 c4 10             	add    $0x10,%esp
801001ec:	85 c0                	test   %eax,%eax
801001ee:	74 6b                	je     8010025b <brelse+0x86>
    panic("brelse");

  releasesleep(&b->lock);
801001f0:	83 ec 0c             	sub    $0xc,%esp
801001f3:	56                   	push   %esi
<<<<<<< HEAD
801001f4:	e8 87 38 00 00       	call   80103a80 <releasesleep>

  acquire(&bcache.lock);
801001f9:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100200:	e8 40 3a 00 00       	call   80103c45 <acquire>
=======
801001f4:	e8 33 38 00 00       	call   80103a2c <releasesleep>

  acquire(&bcache.lock);
801001f9:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
80100200:	e8 ec 39 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  b->refcnt--;
80100205:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100208:	83 e8 01             	sub    $0x1,%eax
8010020b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010020e:	83 c4 10             	add    $0x10,%esp
80100211:	85 c0                	test   %eax,%eax
80100213:	75 2f                	jne    80100244 <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100215:	8b 43 54             	mov    0x54(%ebx),%eax
80100218:	8b 53 50             	mov    0x50(%ebx),%edx
8010021b:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
8010021e:	8b 43 50             	mov    0x50(%ebx),%eax
80100221:	8b 53 54             	mov    0x54(%ebx),%edx
80100224:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100227:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010022c:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
8010022f:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
    bcache.head.next->prev = b;
80100236:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010023b:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
8010023e:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
  }
  
  release(&bcache.lock);
80100244:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100247:	68 20 a5 10 80       	push   $0x8010a520
8010024c:	e8 59 3a 00 00       	call   80103caa <release>
=======
80100247:	68 20 95 10 80       	push   $0x80109520
8010024c:	e8 05 3a 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
80100251:	83 c4 10             	add    $0x10,%esp
80100254:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100257:	5b                   	pop    %ebx
80100258:	5e                   	pop    %esi
80100259:	5d                   	pop    %ebp
8010025a:	c3                   	ret    
    panic("brelse");
8010025b:	83 ec 0c             	sub    $0xc,%esp
8010025e:	68 86 66 10 80       	push   $0x80106686
80100263:	e8 e0 00 00 00       	call   80100348 <panic>

80100268 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100268:	55                   	push   %ebp
80100269:	89 e5                	mov    %esp,%ebp
8010026b:	57                   	push   %edi
8010026c:	56                   	push   %esi
8010026d:	53                   	push   %ebx
8010026e:	83 ec 28             	sub    $0x28,%esp
80100271:	8b 7d 08             	mov    0x8(%ebp),%edi
80100274:	8b 75 0c             	mov    0xc(%ebp),%esi
80100277:	8b 5d 10             	mov    0x10(%ebp),%ebx
  uint target;
  int c;

  iunlock(ip);
8010027a:	57                   	push   %edi
8010027b:	e8 b1 13 00 00       	call   80101631 <iunlock>
  target = n;
80100280:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  acquire(&cons.lock);
<<<<<<< HEAD
80100283:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
8010028a:	e8 b6 39 00 00       	call   80103c45 <acquire>
=======
80100283:	c7 04 24 20 df 10 80 	movl   $0x8010df20,(%esp)
8010028a:	e8 62 39 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  while(n > 0){
8010028f:	83 c4 10             	add    $0x10,%esp
80100292:	85 db                	test   %ebx,%ebx
80100294:	0f 8e 8f 00 00 00    	jle    80100329 <consoleread+0xc1>
    while(input.r == input.w){
8010029a:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010029f:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002a5:	75 47                	jne    801002ee <consoleread+0x86>
      if(myproc()->killed){
801002a7:	e8 09 2f 00 00       	call   801031b5 <myproc>
801002ac:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
801002b0:	75 17                	jne    801002c9 <consoleread+0x61>
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b2:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
801002b5:	68 20 ef 10 80       	push   $0x8010ef20
801002ba:	68 00 ef 10 80       	push   $0x8010ef00
801002bf:	e8 86 34 00 00       	call   8010374a <sleep>
=======
801002b5:	68 20 df 10 80       	push   $0x8010df20
801002ba:	68 00 df 10 80       	push   $0x8010df00
801002bf:	e8 32 34 00 00       	call   801036f6 <sleep>
>>>>>>> d669a6c (ulib and makefile)
801002c4:	83 c4 10             	add    $0x10,%esp
801002c7:	eb d1                	jmp    8010029a <consoleread+0x32>
        release(&cons.lock);
801002c9:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801002cc:	68 20 ef 10 80       	push   $0x8010ef20
801002d1:	e8 d4 39 00 00       	call   80103caa <release>
=======
801002cc:	68 20 df 10 80       	push   $0x8010df20
801002d1:	e8 80 39 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
        ilock(ip);
801002d6:	89 3c 24             	mov    %edi,(%esp)
801002d9:	e8 91 12 00 00       	call   8010156f <ilock>
        return -1;
801002de:	83 c4 10             	add    $0x10,%esp
801002e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002e9:	5b                   	pop    %ebx
801002ea:	5e                   	pop    %esi
801002eb:	5f                   	pop    %edi
801002ec:	5d                   	pop    %ebp
801002ed:	c3                   	ret    
    c = input.buf[input.r++ % INPUT_BUF];
801002ee:	8d 50 01             	lea    0x1(%eax),%edx
801002f1:	89 15 00 ef 10 80    	mov    %edx,0x8010ef00
801002f7:	89 c2                	mov    %eax,%edx
801002f9:	83 e2 7f             	and    $0x7f,%edx
801002fc:	0f b6 92 80 ee 10 80 	movzbl -0x7fef1180(%edx),%edx
80100303:	0f be ca             	movsbl %dl,%ecx
    if(c == C('D')){  // EOF
80100306:	80 fa 04             	cmp    $0x4,%dl
80100309:	74 14                	je     8010031f <consoleread+0xb7>
    *dst++ = c;
8010030b:	8d 46 01             	lea    0x1(%esi),%eax
8010030e:	88 16                	mov    %dl,(%esi)
    --n;
80100310:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100313:	83 f9 0a             	cmp    $0xa,%ecx
80100316:	74 11                	je     80100329 <consoleread+0xc1>
    *dst++ = c;
80100318:	89 c6                	mov    %eax,%esi
8010031a:	e9 73 ff ff ff       	jmp    80100292 <consoleread+0x2a>
      if(n < target){
8010031f:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
80100322:	73 05                	jae    80100329 <consoleread+0xc1>
        input.r--;
80100324:	a3 00 ef 10 80       	mov    %eax,0x8010ef00
  release(&cons.lock);
80100329:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010032c:	68 20 ef 10 80       	push   $0x8010ef20
80100331:	e8 74 39 00 00       	call   80103caa <release>
=======
8010032c:	68 20 df 10 80       	push   $0x8010df20
80100331:	e8 20 39 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  ilock(ip);
80100336:	89 3c 24             	mov    %edi,(%esp)
80100339:	e8 31 12 00 00       	call   8010156f <ilock>
  return target - n;
8010033e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100341:	29 d8                	sub    %ebx,%eax
80100343:	83 c4 10             	add    $0x10,%esp
80100346:	eb 9e                	jmp    801002e6 <consoleread+0x7e>

80100348 <panic>:
{
80100348:	55                   	push   %ebp
80100349:	89 e5                	mov    %esp,%ebp
8010034b:	53                   	push   %ebx
8010034c:	83 ec 34             	sub    $0x34,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
8010034f:	fa                   	cli    
  cons.locking = 0;
80100350:	c7 05 54 ef 10 80 00 	movl   $0x0,0x8010ef54
80100357:	00 00 00 
  cprintf("lapicid %d: panic: ", lapicid());
8010035a:	e8 01 20 00 00       	call   80102360 <lapicid>
8010035f:	83 ec 08             	sub    $0x8,%esp
80100362:	50                   	push   %eax
80100363:	68 8d 66 10 80       	push   $0x8010668d
80100368:	e8 9a 02 00 00       	call   80100607 <cprintf>
  cprintf(s);
8010036d:	83 c4 04             	add    $0x4,%esp
80100370:	ff 75 08             	push   0x8(%ebp)
80100373:	e8 8f 02 00 00       	call   80100607 <cprintf>
  cprintf("\n");
80100378:	c7 04 24 bf 6f 10 80 	movl   $0x80106fbf,(%esp)
8010037f:	e8 83 02 00 00       	call   80100607 <cprintf>
  getcallerpcs(&s, pcs);
80100384:	83 c4 08             	add    $0x8,%esp
80100387:	8d 45 d0             	lea    -0x30(%ebp),%eax
8010038a:	50                   	push   %eax
8010038b:	8d 45 08             	lea    0x8(%ebp),%eax
8010038e:	50                   	push   %eax
<<<<<<< HEAD
8010038f:	e8 90 37 00 00       	call   80103b24 <getcallerpcs>
=======
8010038f:	e8 3c 37 00 00       	call   80103ad0 <getcallerpcs>
>>>>>>> d669a6c (ulib and makefile)
  for(i=0; i<10; i++)
80100394:	83 c4 10             	add    $0x10,%esp
80100397:	bb 00 00 00 00       	mov    $0x0,%ebx
8010039c:	eb 17                	jmp    801003b5 <panic+0x6d>
    cprintf(" %p", pcs[i]);
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	ff 74 9d d0          	push   -0x30(%ebp,%ebx,4)
801003a5:	68 a1 66 10 80       	push   $0x801066a1
801003aa:	e8 58 02 00 00       	call   80100607 <cprintf>
  for(i=0; i<10; i++)
801003af:	83 c3 01             	add    $0x1,%ebx
801003b2:	83 c4 10             	add    $0x10,%esp
801003b5:	83 fb 09             	cmp    $0x9,%ebx
801003b8:	7e e4                	jle    8010039e <panic+0x56>
  panicked = 1; // freeze other CPU
801003ba:	c7 05 58 ef 10 80 01 	movl   $0x1,0x8010ef58
801003c1:	00 00 00 
  for(;;)
801003c4:	eb fe                	jmp    801003c4 <panic+0x7c>

801003c6 <cgaputc>:
{
801003c6:	55                   	push   %ebp
801003c7:	89 e5                	mov    %esp,%ebp
801003c9:	57                   	push   %edi
801003ca:	56                   	push   %esi
801003cb:	53                   	push   %ebx
801003cc:	83 ec 0c             	sub    $0xc,%esp
801003cf:	89 c3                	mov    %eax,%ebx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801003d1:	bf d4 03 00 00       	mov    $0x3d4,%edi
801003d6:	b8 0e 00 00 00       	mov    $0xe,%eax
801003db:	89 fa                	mov    %edi,%edx
801003dd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801003de:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801003e3:	89 ca                	mov    %ecx,%edx
801003e5:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
801003e6:	0f b6 f0             	movzbl %al,%esi
801003e9:	c1 e6 08             	shl    $0x8,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801003ec:	b8 0f 00 00 00       	mov    $0xf,%eax
801003f1:	89 fa                	mov    %edi,%edx
801003f3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801003f4:	89 ca                	mov    %ecx,%edx
801003f6:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
801003f7:	0f b6 c8             	movzbl %al,%ecx
801003fa:	09 f1                	or     %esi,%ecx
  if(c == '\n')
801003fc:	83 fb 0a             	cmp    $0xa,%ebx
801003ff:	74 60                	je     80100461 <cgaputc+0x9b>
  else if(c == BACKSPACE){
80100401:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
80100407:	74 79                	je     80100482 <cgaputc+0xbc>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100409:	0f b6 c3             	movzbl %bl,%eax
8010040c:	8d 59 01             	lea    0x1(%ecx),%ebx
8010040f:	80 cc 07             	or     $0x7,%ah
80100412:	66 89 84 09 00 80 0b 	mov    %ax,-0x7ff48000(%ecx,%ecx,1)
80100419:	80 
  if(pos < 0 || pos > 25*80)
8010041a:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
80100420:	77 6d                	ja     8010048f <cgaputc+0xc9>
  if((pos/80) >= 24){  // Scroll up.
80100422:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
80100428:	7f 72                	jg     8010049c <cgaputc+0xd6>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010042a:	be d4 03 00 00       	mov    $0x3d4,%esi
8010042f:	b8 0e 00 00 00       	mov    $0xe,%eax
80100434:	89 f2                	mov    %esi,%edx
80100436:	ee                   	out    %al,(%dx)
  outb(CRTPORT+1, pos>>8);
80100437:	0f b6 c7             	movzbl %bh,%eax
8010043a:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
8010043f:	89 ca                	mov    %ecx,%edx
80100441:	ee                   	out    %al,(%dx)
80100442:	b8 0f 00 00 00       	mov    $0xf,%eax
80100447:	89 f2                	mov    %esi,%edx
80100449:	ee                   	out    %al,(%dx)
8010044a:	89 d8                	mov    %ebx,%eax
8010044c:	89 ca                	mov    %ecx,%edx
8010044e:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
8010044f:	66 c7 84 1b 00 80 0b 	movw   $0x720,-0x7ff48000(%ebx,%ebx,1)
80100456:	80 20 07 
}
80100459:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010045c:	5b                   	pop    %ebx
8010045d:	5e                   	pop    %esi
8010045e:	5f                   	pop    %edi
8010045f:	5d                   	pop    %ebp
80100460:	c3                   	ret    
    pos += 80 - pos%80;
80100461:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100466:	89 c8                	mov    %ecx,%eax
80100468:	f7 ea                	imul   %edx
8010046a:	c1 fa 05             	sar    $0x5,%edx
8010046d:	8d 04 92             	lea    (%edx,%edx,4),%eax
80100470:	c1 e0 04             	shl    $0x4,%eax
80100473:	89 ca                	mov    %ecx,%edx
80100475:	29 c2                	sub    %eax,%edx
80100477:	bb 50 00 00 00       	mov    $0x50,%ebx
8010047c:	29 d3                	sub    %edx,%ebx
8010047e:	01 cb                	add    %ecx,%ebx
80100480:	eb 98                	jmp    8010041a <cgaputc+0x54>
    if(pos > 0) --pos;
80100482:	85 c9                	test   %ecx,%ecx
80100484:	7e 05                	jle    8010048b <cgaputc+0xc5>
80100486:	8d 59 ff             	lea    -0x1(%ecx),%ebx
80100489:	eb 8f                	jmp    8010041a <cgaputc+0x54>
  pos |= inb(CRTPORT+1);
8010048b:	89 cb                	mov    %ecx,%ebx
8010048d:	eb 8b                	jmp    8010041a <cgaputc+0x54>
    panic("pos under/overflow");
8010048f:	83 ec 0c             	sub    $0xc,%esp
80100492:	68 a5 66 10 80       	push   $0x801066a5
80100497:	e8 ac fe ff ff       	call   80100348 <panic>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010049c:	83 ec 04             	sub    $0x4,%esp
8010049f:	68 60 0e 00 00       	push   $0xe60
801004a4:	68 a0 80 0b 80       	push   $0x800b80a0
801004a9:	68 00 80 0b 80       	push   $0x800b8000
<<<<<<< HEAD
801004ae:	e8 b6 38 00 00       	call   80103d69 <memmove>
=======
801004ae:	e8 62 38 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    pos -= 80;
801004b3:	83 eb 50             	sub    $0x50,%ebx
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004b6:	b8 80 07 00 00       	mov    $0x780,%eax
801004bb:	29 d8                	sub    %ebx,%eax
801004bd:	8d 94 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%edx
801004c4:	83 c4 0c             	add    $0xc,%esp
801004c7:	01 c0                	add    %eax,%eax
801004c9:	50                   	push   %eax
801004ca:	6a 00                	push   $0x0
801004cc:	52                   	push   %edx
<<<<<<< HEAD
801004cd:	e8 1f 38 00 00       	call   80103cf1 <memset>
=======
801004cd:	e8 cb 37 00 00       	call   80103c9d <memset>
>>>>>>> d669a6c (ulib and makefile)
801004d2:	83 c4 10             	add    $0x10,%esp
801004d5:	e9 50 ff ff ff       	jmp    8010042a <cgaputc+0x64>

801004da <consputc>:
  if(panicked){
801004da:	83 3d 58 ef 10 80 00 	cmpl   $0x0,0x8010ef58
801004e1:	74 03                	je     801004e6 <consputc+0xc>
  asm volatile("cli");
801004e3:	fa                   	cli    
    for(;;)
801004e4:	eb fe                	jmp    801004e4 <consputc+0xa>
{
801004e6:	55                   	push   %ebp
801004e7:	89 e5                	mov    %esp,%ebp
801004e9:	53                   	push   %ebx
801004ea:	83 ec 04             	sub    $0x4,%esp
801004ed:	89 c3                	mov    %eax,%ebx
  if(c == BACKSPACE){
801004ef:	3d 00 01 00 00       	cmp    $0x100,%eax
801004f4:	74 18                	je     8010050e <consputc+0x34>
    uartputc(c);
801004f6:	83 ec 0c             	sub    $0xc,%esp
801004f9:	50                   	push   %eax
<<<<<<< HEAD
801004fa:	e8 e5 4b 00 00       	call   801050e4 <uartputc>
=======
801004fa:	e8 91 4b 00 00       	call   80105090 <uartputc>
>>>>>>> d669a6c (ulib and makefile)
801004ff:	83 c4 10             	add    $0x10,%esp
  cgaputc(c);
80100502:	89 d8                	mov    %ebx,%eax
80100504:	e8 bd fe ff ff       	call   801003c6 <cgaputc>
}
80100509:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010050c:	c9                   	leave  
8010050d:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
8010050e:	83 ec 0c             	sub    $0xc,%esp
80100511:	6a 08                	push   $0x8
<<<<<<< HEAD
80100513:	e8 cc 4b 00 00       	call   801050e4 <uartputc>
80100518:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
8010051f:	e8 c0 4b 00 00       	call   801050e4 <uartputc>
80100524:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010052b:	e8 b4 4b 00 00       	call   801050e4 <uartputc>
=======
80100513:	e8 78 4b 00 00       	call   80105090 <uartputc>
80100518:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
8010051f:	e8 6c 4b 00 00       	call   80105090 <uartputc>
80100524:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010052b:	e8 60 4b 00 00       	call   80105090 <uartputc>
>>>>>>> d669a6c (ulib and makefile)
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	eb cd                	jmp    80100502 <consputc+0x28>

80100535 <printint>:
{
80100535:	55                   	push   %ebp
80100536:	89 e5                	mov    %esp,%ebp
80100538:	57                   	push   %edi
80100539:	56                   	push   %esi
8010053a:	53                   	push   %ebx
8010053b:	83 ec 2c             	sub    $0x2c,%esp
8010053e:	89 d6                	mov    %edx,%esi
80100540:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
80100543:	85 c9                	test   %ecx,%ecx
80100545:	74 0c                	je     80100553 <printint+0x1e>
80100547:	89 c7                	mov    %eax,%edi
80100549:	c1 ef 1f             	shr    $0x1f,%edi
8010054c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010054f:	85 c0                	test   %eax,%eax
80100551:	78 38                	js     8010058b <printint+0x56>
    x = xx;
80100553:	89 c1                	mov    %eax,%ecx
  i = 0;
80100555:	bb 00 00 00 00       	mov    $0x0,%ebx
    buf[i++] = digits[x % base];
8010055a:	89 c8                	mov    %ecx,%eax
8010055c:	ba 00 00 00 00       	mov    $0x0,%edx
80100561:	f7 f6                	div    %esi
80100563:	89 df                	mov    %ebx,%edi
80100565:	83 c3 01             	add    $0x1,%ebx
80100568:	0f b6 92 d0 66 10 80 	movzbl -0x7fef9930(%edx),%edx
8010056f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
80100573:	89 ca                	mov    %ecx,%edx
80100575:	89 c1                	mov    %eax,%ecx
80100577:	39 d6                	cmp    %edx,%esi
80100579:	76 df                	jbe    8010055a <printint+0x25>
  if(sign)
8010057b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
8010057f:	74 1a                	je     8010059b <printint+0x66>
    buf[i++] = '-';
80100581:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
80100586:	8d 5f 02             	lea    0x2(%edi),%ebx
80100589:	eb 10                	jmp    8010059b <printint+0x66>
    x = -xx;
8010058b:	f7 d8                	neg    %eax
8010058d:	89 c1                	mov    %eax,%ecx
8010058f:	eb c4                	jmp    80100555 <printint+0x20>
    consputc(buf[i]);
80100591:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
80100596:	e8 3f ff ff ff       	call   801004da <consputc>
  while(--i >= 0)
8010059b:	83 eb 01             	sub    $0x1,%ebx
8010059e:	79 f1                	jns    80100591 <printint+0x5c>
}
801005a0:	83 c4 2c             	add    $0x2c,%esp
801005a3:	5b                   	pop    %ebx
801005a4:	5e                   	pop    %esi
801005a5:	5f                   	pop    %edi
801005a6:	5d                   	pop    %ebp
801005a7:	c3                   	ret    

801005a8 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005a8:	55                   	push   %ebp
801005a9:	89 e5                	mov    %esp,%ebp
801005ab:	57                   	push   %edi
801005ac:	56                   	push   %esi
801005ad:	53                   	push   %ebx
801005ae:	83 ec 18             	sub    $0x18,%esp
801005b1:	8b 7d 0c             	mov    0xc(%ebp),%edi
801005b4:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
801005b7:	ff 75 08             	push   0x8(%ebp)
801005ba:	e8 72 10 00 00       	call   80101631 <iunlock>
  acquire(&cons.lock);
<<<<<<< HEAD
801005bf:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801005c6:	e8 7a 36 00 00       	call   80103c45 <acquire>
=======
801005bf:	c7 04 24 20 df 10 80 	movl   $0x8010df20,(%esp)
801005c6:	e8 26 36 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  for(i = 0; i < n; i++)
801005cb:	83 c4 10             	add    $0x10,%esp
801005ce:	bb 00 00 00 00       	mov    $0x0,%ebx
801005d3:	eb 0c                	jmp    801005e1 <consolewrite+0x39>
    consputc(buf[i] & 0xff);
801005d5:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801005d9:	e8 fc fe ff ff       	call   801004da <consputc>
  for(i = 0; i < n; i++)
801005de:	83 c3 01             	add    $0x1,%ebx
801005e1:	39 f3                	cmp    %esi,%ebx
801005e3:	7c f0                	jl     801005d5 <consolewrite+0x2d>
  release(&cons.lock);
801005e5:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801005e8:	68 20 ef 10 80       	push   $0x8010ef20
801005ed:	e8 b8 36 00 00       	call   80103caa <release>
=======
801005e8:	68 20 df 10 80       	push   $0x8010df20
801005ed:	e8 64 36 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  ilock(ip);
801005f2:	83 c4 04             	add    $0x4,%esp
801005f5:	ff 75 08             	push   0x8(%ebp)
801005f8:	e8 72 0f 00 00       	call   8010156f <ilock>

  return n;
}
801005fd:	89 f0                	mov    %esi,%eax
801005ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100602:	5b                   	pop    %ebx
80100603:	5e                   	pop    %esi
80100604:	5f                   	pop    %edi
80100605:	5d                   	pop    %ebp
80100606:	c3                   	ret    

80100607 <cprintf>:
{
80100607:	55                   	push   %ebp
80100608:	89 e5                	mov    %esp,%ebp
8010060a:	57                   	push   %edi
8010060b:	56                   	push   %esi
8010060c:	53                   	push   %ebx
8010060d:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100610:	a1 54 ef 10 80       	mov    0x8010ef54,%eax
80100615:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100618:	85 c0                	test   %eax,%eax
8010061a:	75 10                	jne    8010062c <cprintf+0x25>
  if (fmt == 0)
8010061c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80100620:	74 1c                	je     8010063e <cprintf+0x37>
  argp = (uint*)(void*)(&fmt + 1);
80100622:	8d 7d 0c             	lea    0xc(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100625:	be 00 00 00 00       	mov    $0x0,%esi
8010062a:	eb 27                	jmp    80100653 <cprintf+0x4c>
    acquire(&cons.lock);
8010062c:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010062f:	68 20 ef 10 80       	push   $0x8010ef20
80100634:	e8 0c 36 00 00       	call   80103c45 <acquire>
=======
8010062f:	68 20 df 10 80       	push   $0x8010df20
80100634:	e8 b8 35 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
80100639:	83 c4 10             	add    $0x10,%esp
8010063c:	eb de                	jmp    8010061c <cprintf+0x15>
    panic("null fmt");
8010063e:	83 ec 0c             	sub    $0xc,%esp
80100641:	68 bf 66 10 80       	push   $0x801066bf
80100646:	e8 fd fc ff ff       	call   80100348 <panic>
      consputc(c);
8010064b:	e8 8a fe ff ff       	call   801004da <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100650:	83 c6 01             	add    $0x1,%esi
80100653:	8b 55 08             	mov    0x8(%ebp),%edx
80100656:	0f b6 04 32          	movzbl (%edx,%esi,1),%eax
8010065a:	85 c0                	test   %eax,%eax
8010065c:	0f 84 b1 00 00 00    	je     80100713 <cprintf+0x10c>
    if(c != '%'){
80100662:	83 f8 25             	cmp    $0x25,%eax
80100665:	75 e4                	jne    8010064b <cprintf+0x44>
    c = fmt[++i] & 0xff;
80100667:	83 c6 01             	add    $0x1,%esi
8010066a:	0f b6 1c 32          	movzbl (%edx,%esi,1),%ebx
    if(c == 0)
8010066e:	85 db                	test   %ebx,%ebx
80100670:	0f 84 9d 00 00 00    	je     80100713 <cprintf+0x10c>
    switch(c){
80100676:	83 fb 70             	cmp    $0x70,%ebx
80100679:	74 2e                	je     801006a9 <cprintf+0xa2>
8010067b:	7f 22                	jg     8010069f <cprintf+0x98>
8010067d:	83 fb 25             	cmp    $0x25,%ebx
80100680:	74 6c                	je     801006ee <cprintf+0xe7>
80100682:	83 fb 64             	cmp    $0x64,%ebx
80100685:	75 76                	jne    801006fd <cprintf+0xf6>
      printint(*argp++, 10, 1);
80100687:	8d 5f 04             	lea    0x4(%edi),%ebx
8010068a:	8b 07                	mov    (%edi),%eax
8010068c:	b9 01 00 00 00       	mov    $0x1,%ecx
80100691:	ba 0a 00 00 00       	mov    $0xa,%edx
80100696:	e8 9a fe ff ff       	call   80100535 <printint>
8010069b:	89 df                	mov    %ebx,%edi
      break;
8010069d:	eb b1                	jmp    80100650 <cprintf+0x49>
    switch(c){
8010069f:	83 fb 73             	cmp    $0x73,%ebx
801006a2:	74 1d                	je     801006c1 <cprintf+0xba>
801006a4:	83 fb 78             	cmp    $0x78,%ebx
801006a7:	75 54                	jne    801006fd <cprintf+0xf6>
      printint(*argp++, 16, 0);
801006a9:	8d 5f 04             	lea    0x4(%edi),%ebx
801006ac:	8b 07                	mov    (%edi),%eax
801006ae:	b9 00 00 00 00       	mov    $0x0,%ecx
801006b3:	ba 10 00 00 00       	mov    $0x10,%edx
801006b8:	e8 78 fe ff ff       	call   80100535 <printint>
801006bd:	89 df                	mov    %ebx,%edi
      break;
801006bf:	eb 8f                	jmp    80100650 <cprintf+0x49>
      if((s = (char*)*argp++) == 0)
801006c1:	8d 47 04             	lea    0x4(%edi),%eax
801006c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006c7:	8b 1f                	mov    (%edi),%ebx
801006c9:	85 db                	test   %ebx,%ebx
801006cb:	75 12                	jne    801006df <cprintf+0xd8>
        s = "(null)";
801006cd:	bb b8 66 10 80       	mov    $0x801066b8,%ebx
801006d2:	eb 0b                	jmp    801006df <cprintf+0xd8>
        consputc(*s);
801006d4:	0f be c0             	movsbl %al,%eax
801006d7:	e8 fe fd ff ff       	call   801004da <consputc>
      for(; *s; s++)
801006dc:	83 c3 01             	add    $0x1,%ebx
801006df:	0f b6 03             	movzbl (%ebx),%eax
801006e2:	84 c0                	test   %al,%al
801006e4:	75 ee                	jne    801006d4 <cprintf+0xcd>
      if((s = (char*)*argp++) == 0)
801006e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801006e9:	e9 62 ff ff ff       	jmp    80100650 <cprintf+0x49>
      consputc('%');
801006ee:	b8 25 00 00 00       	mov    $0x25,%eax
801006f3:	e8 e2 fd ff ff       	call   801004da <consputc>
      break;
801006f8:	e9 53 ff ff ff       	jmp    80100650 <cprintf+0x49>
      consputc('%');
801006fd:	b8 25 00 00 00       	mov    $0x25,%eax
80100702:	e8 d3 fd ff ff       	call   801004da <consputc>
      consputc(c);
80100707:	89 d8                	mov    %ebx,%eax
80100709:	e8 cc fd ff ff       	call   801004da <consputc>
      break;
8010070e:	e9 3d ff ff ff       	jmp    80100650 <cprintf+0x49>
  if(locking)
80100713:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80100717:	75 08                	jne    80100721 <cprintf+0x11a>
}
80100719:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010071c:	5b                   	pop    %ebx
8010071d:	5e                   	pop    %esi
8010071e:	5f                   	pop    %edi
8010071f:	5d                   	pop    %ebp
80100720:	c3                   	ret    
    release(&cons.lock);
80100721:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100724:	68 20 ef 10 80       	push   $0x8010ef20
80100729:	e8 7c 35 00 00       	call   80103caa <release>
=======
80100724:	68 20 df 10 80       	push   $0x8010df20
80100729:	e8 28 35 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
8010072e:	83 c4 10             	add    $0x10,%esp
}
80100731:	eb e6                	jmp    80100719 <cprintf+0x112>

80100733 <consoleintr>:
{
80100733:	55                   	push   %ebp
80100734:	89 e5                	mov    %esp,%ebp
80100736:	57                   	push   %edi
80100737:	56                   	push   %esi
80100738:	53                   	push   %ebx
80100739:	83 ec 18             	sub    $0x18,%esp
8010073c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
<<<<<<< HEAD
8010073f:	68 20 ef 10 80       	push   $0x8010ef20
80100744:	e8 fc 34 00 00       	call   80103c45 <acquire>
=======
8010073f:	68 20 df 10 80       	push   $0x8010df20
80100744:	e8 a8 34 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  while((c = getc()) >= 0){
80100749:	83 c4 10             	add    $0x10,%esp
  int c, doprocdump = 0;
8010074c:	be 00 00 00 00       	mov    $0x0,%esi
  while((c = getc()) >= 0){
80100751:	eb 13                	jmp    80100766 <consoleintr+0x33>
    switch(c){
80100753:	83 ff 08             	cmp    $0x8,%edi
80100756:	0f 84 d9 00 00 00    	je     80100835 <consoleintr+0x102>
8010075c:	83 ff 10             	cmp    $0x10,%edi
8010075f:	75 25                	jne    80100786 <consoleintr+0x53>
80100761:	be 01 00 00 00       	mov    $0x1,%esi
  while((c = getc()) >= 0){
80100766:	ff d3                	call   *%ebx
80100768:	89 c7                	mov    %eax,%edi
8010076a:	85 c0                	test   %eax,%eax
8010076c:	0f 88 f5 00 00 00    	js     80100867 <consoleintr+0x134>
    switch(c){
80100772:	83 ff 15             	cmp    $0x15,%edi
80100775:	0f 84 93 00 00 00    	je     8010080e <consoleintr+0xdb>
8010077b:	7e d6                	jle    80100753 <consoleintr+0x20>
8010077d:	83 ff 7f             	cmp    $0x7f,%edi
80100780:	0f 84 af 00 00 00    	je     80100835 <consoleintr+0x102>
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100786:	85 ff                	test   %edi,%edi
80100788:	74 dc                	je     80100766 <consoleintr+0x33>
8010078a:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
8010078f:	89 c2                	mov    %eax,%edx
80100791:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
80100797:	83 fa 7f             	cmp    $0x7f,%edx
8010079a:	77 ca                	ja     80100766 <consoleintr+0x33>
        c = (c == '\r') ? '\n' : c;
8010079c:	83 ff 0d             	cmp    $0xd,%edi
8010079f:	0f 84 b8 00 00 00    	je     8010085d <consoleintr+0x12a>
        input.buf[input.e++ % INPUT_BUF] = c;
801007a5:	8d 50 01             	lea    0x1(%eax),%edx
801007a8:	89 15 08 ef 10 80    	mov    %edx,0x8010ef08
801007ae:	83 e0 7f             	and    $0x7f,%eax
801007b1:	89 f9                	mov    %edi,%ecx
801007b3:	88 88 80 ee 10 80    	mov    %cl,-0x7fef1180(%eax)
        consputc(c);
801007b9:	89 f8                	mov    %edi,%eax
801007bb:	e8 1a fd ff ff       	call   801004da <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801007c0:	83 ff 0a             	cmp    $0xa,%edi
801007c3:	0f 94 c0             	sete   %al
801007c6:	83 ff 04             	cmp    $0x4,%edi
801007c9:	0f 94 c2             	sete   %dl
801007cc:	08 d0                	or     %dl,%al
801007ce:	75 10                	jne    801007e0 <consoleintr+0xad>
801007d0:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801007d5:	83 e8 80             	sub    $0xffffff80,%eax
801007d8:	39 05 08 ef 10 80    	cmp    %eax,0x8010ef08
801007de:	75 86                	jne    80100766 <consoleintr+0x33>
          input.w = input.e;
801007e0:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801007e5:	a3 04 ef 10 80       	mov    %eax,0x8010ef04
          wakeup(&input.r);
801007ea:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801007ed:	68 00 ef 10 80       	push   $0x8010ef00
801007f2:	e8 b8 30 00 00       	call   801038af <wakeup>
=======
801007ed:	68 00 df 10 80       	push   $0x8010df00
801007f2:	e8 64 30 00 00       	call   8010385b <wakeup>
>>>>>>> d669a6c (ulib and makefile)
801007f7:	83 c4 10             	add    $0x10,%esp
801007fa:	e9 67 ff ff ff       	jmp    80100766 <consoleintr+0x33>
        input.e--;
801007ff:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
        consputc(BACKSPACE);
80100804:	b8 00 01 00 00       	mov    $0x100,%eax
80100809:	e8 cc fc ff ff       	call   801004da <consputc>
      while(input.e != input.w &&
8010080e:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100813:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
80100819:	0f 84 47 ff ff ff    	je     80100766 <consoleintr+0x33>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
8010081f:	83 e8 01             	sub    $0x1,%eax
80100822:	89 c2                	mov    %eax,%edx
80100824:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100827:	80 ba 80 ee 10 80 0a 	cmpb   $0xa,-0x7fef1180(%edx)
8010082e:	75 cf                	jne    801007ff <consoleintr+0xcc>
80100830:	e9 31 ff ff ff       	jmp    80100766 <consoleintr+0x33>
      if(input.e != input.w){
80100835:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
8010083a:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
80100840:	0f 84 20 ff ff ff    	je     80100766 <consoleintr+0x33>
        input.e--;
80100846:	83 e8 01             	sub    $0x1,%eax
80100849:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
        consputc(BACKSPACE);
8010084e:	b8 00 01 00 00       	mov    $0x100,%eax
80100853:	e8 82 fc ff ff       	call   801004da <consputc>
80100858:	e9 09 ff ff ff       	jmp    80100766 <consoleintr+0x33>
        c = (c == '\r') ? '\n' : c;
8010085d:	bf 0a 00 00 00       	mov    $0xa,%edi
80100862:	e9 3e ff ff ff       	jmp    801007a5 <consoleintr+0x72>
  release(&cons.lock);
80100867:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010086a:	68 20 ef 10 80       	push   $0x8010ef20
8010086f:	e8 36 34 00 00       	call   80103caa <release>
=======
8010086a:	68 20 df 10 80       	push   $0x8010df20
8010086f:	e8 e2 33 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  if(doprocdump) {
80100874:	83 c4 10             	add    $0x10,%esp
80100877:	85 f6                	test   %esi,%esi
80100879:	75 08                	jne    80100883 <consoleintr+0x150>
}
8010087b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087e:	5b                   	pop    %ebx
8010087f:	5e                   	pop    %esi
80100880:	5f                   	pop    %edi
80100881:	5d                   	pop    %ebp
80100882:	c3                   	ret    
    procdump();  // now call procdump() wo. cons.lock held
<<<<<<< HEAD
80100883:	e8 c4 30 00 00       	call   8010394c <procdump>
=======
80100883:	e8 70 30 00 00       	call   801038f8 <procdump>
>>>>>>> d669a6c (ulib and makefile)
}
80100888:	eb f1                	jmp    8010087b <consoleintr+0x148>

8010088a <consoleinit>:

void
consoleinit(void)
{
8010088a:	55                   	push   %ebp
8010088b:	89 e5                	mov    %esp,%ebp
8010088d:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
<<<<<<< HEAD
80100890:	68 c8 66 10 80       	push   $0x801066c8
80100895:	68 20 ef 10 80       	push   $0x8010ef20
8010089a:	e8 6a 32 00 00       	call   80103b09 <initlock>
=======
80100890:	68 88 66 10 80       	push   $0x80106688
80100895:	68 20 df 10 80       	push   $0x8010df20
8010089a:	e8 16 32 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)

  devsw[CONSOLE].write = consolewrite;
8010089f:	c7 05 0c f9 10 80 a8 	movl   $0x801005a8,0x8010f90c
801008a6:	05 10 80 
  devsw[CONSOLE].read = consoleread;
801008a9:	c7 05 08 f9 10 80 68 	movl   $0x80100268,0x8010f908
801008b0:	02 10 80 
  cons.locking = 1;
801008b3:	c7 05 54 ef 10 80 01 	movl   $0x1,0x8010ef54
801008ba:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801008bd:	83 c4 08             	add    $0x8,%esp
801008c0:	6a 00                	push   $0x0
801008c2:	6a 01                	push   $0x1
801008c4:	e8 98 16 00 00       	call   80101f61 <ioapicenable>
}
801008c9:	83 c4 10             	add    $0x10,%esp
801008cc:	c9                   	leave  
801008cd:	c3                   	ret    

801008ce <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801008ce:	55                   	push   %ebp
801008cf:	89 e5                	mov    %esp,%ebp
801008d1:	57                   	push   %edi
801008d2:	56                   	push   %esi
801008d3:	53                   	push   %ebx
801008d4:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801008da:	e8 d6 28 00 00       	call   801031b5 <myproc>
801008df:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
801008e5:	e8 94 1e 00 00       	call   8010277e <begin_op>

  if((ip = namei(path)) == 0){
801008ea:	83 ec 0c             	sub    $0xc,%esp
801008ed:	ff 75 08             	push   0x8(%ebp)
801008f0:	e8 d8 12 00 00       	call   80101bcd <namei>
801008f5:	83 c4 10             	add    $0x10,%esp
801008f8:	85 c0                	test   %eax,%eax
801008fa:	74 56                	je     80100952 <exec+0x84>
801008fc:	89 c3                	mov    %eax,%ebx
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
801008fe:	83 ec 0c             	sub    $0xc,%esp
80100901:	50                   	push   %eax
80100902:	e8 68 0c 00 00       	call   8010156f <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100907:	6a 34                	push   $0x34
80100909:	6a 00                	push   $0x0
8010090b:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100911:	50                   	push   %eax
80100912:	53                   	push   %ebx
80100913:	e8 49 0e 00 00       	call   80101761 <readi>
80100918:	83 c4 20             	add    $0x20,%esp
8010091b:	83 f8 34             	cmp    $0x34,%eax
8010091e:	75 0c                	jne    8010092c <exec+0x5e>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100920:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100927:	45 4c 46 
8010092a:	74 42                	je     8010096e <exec+0xa0>
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
8010092c:	85 db                	test   %ebx,%ebx
8010092e:	0f 84 c5 02 00 00    	je     80100bf9 <exec+0x32b>
    iunlockput(ip);
80100934:	83 ec 0c             	sub    $0xc,%esp
80100937:	53                   	push   %ebx
80100938:	e8 d9 0d 00 00       	call   80101716 <iunlockput>
    end_op();
8010093d:	e8 b6 1e 00 00       	call   801027f8 <end_op>
80100942:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100945:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010094a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010094d:	5b                   	pop    %ebx
8010094e:	5e                   	pop    %esi
8010094f:	5f                   	pop    %edi
80100950:	5d                   	pop    %ebp
80100951:	c3                   	ret    
    end_op();
80100952:	e8 a1 1e 00 00       	call   801027f8 <end_op>
    cprintf("exec: fail\n");
80100957:	83 ec 0c             	sub    $0xc,%esp
8010095a:	68 e1 66 10 80       	push   $0x801066e1
8010095f:	e8 a3 fc ff ff       	call   80100607 <cprintf>
    return -1;
80100964:	83 c4 10             	add    $0x10,%esp
80100967:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010096c:	eb dc                	jmp    8010094a <exec+0x7c>
  if((pgdir = setupkvm()) == 0)
<<<<<<< HEAD
8010096e:	e8 99 5a 00 00       	call   8010640c <setupkvm>
=======
8010096e:	e8 45 5a 00 00       	call   801063b8 <setupkvm>
>>>>>>> d669a6c (ulib and makefile)
80100973:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100979:	85 c0                	test   %eax,%eax
8010097b:	0f 84 09 01 00 00    	je     80100a8a <exec+0x1bc>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100981:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
  sz = 0;
80100987:	bf 00 00 00 00       	mov    $0x0,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
8010098c:	be 00 00 00 00       	mov    $0x0,%esi
80100991:	eb 0c                	jmp    8010099f <exec+0xd1>
80100993:	83 c6 01             	add    $0x1,%esi
80100996:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
8010099c:	83 c0 20             	add    $0x20,%eax
8010099f:	0f b7 95 50 ff ff ff 	movzwl -0xb0(%ebp),%edx
801009a6:	39 f2                	cmp    %esi,%edx
801009a8:	0f 8e 98 00 00 00    	jle    80100a46 <exec+0x178>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
801009ae:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
801009b4:	6a 20                	push   $0x20
801009b6:	50                   	push   %eax
801009b7:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
801009bd:	50                   	push   %eax
801009be:	53                   	push   %ebx
801009bf:	e8 9d 0d 00 00       	call   80101761 <readi>
801009c4:	83 c4 10             	add    $0x10,%esp
801009c7:	83 f8 20             	cmp    $0x20,%eax
801009ca:	0f 85 ba 00 00 00    	jne    80100a8a <exec+0x1bc>
    if(ph.type != ELF_PROG_LOAD)
801009d0:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
801009d7:	75 ba                	jne    80100993 <exec+0xc5>
    if(ph.memsz < ph.filesz)
801009d9:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
801009df:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
801009e5:	0f 82 9f 00 00 00    	jb     80100a8a <exec+0x1bc>
    if(ph.vaddr + ph.memsz < ph.vaddr)
801009eb:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
801009f1:	0f 82 93 00 00 00    	jb     80100a8a <exec+0x1bc>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
801009f7:	83 ec 04             	sub    $0x4,%esp
801009fa:	50                   	push   %eax
801009fb:	57                   	push   %edi
801009fc:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
<<<<<<< HEAD
80100a02:	e8 ab 58 00 00       	call   801062b2 <allocuvm>
=======
80100a02:	e8 57 58 00 00       	call   8010625e <allocuvm>
>>>>>>> d669a6c (ulib and makefile)
80100a07:	89 c7                	mov    %eax,%edi
80100a09:	83 c4 10             	add    $0x10,%esp
80100a0c:	85 c0                	test   %eax,%eax
80100a0e:	74 7a                	je     80100a8a <exec+0x1bc>
    if(ph.vaddr % PGSIZE != 0)
80100a10:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100a16:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100a1b:	75 6d                	jne    80100a8a <exec+0x1bc>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100a1d:	83 ec 0c             	sub    $0xc,%esp
80100a20:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100a26:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100a2c:	53                   	push   %ebx
80100a2d:	50                   	push   %eax
80100a2e:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
<<<<<<< HEAD
80100a34:	e8 4c 57 00 00       	call   80106185 <loaduvm>
=======
80100a34:	e8 f8 56 00 00       	call   80106131 <loaduvm>
>>>>>>> d669a6c (ulib and makefile)
80100a39:	83 c4 20             	add    $0x20,%esp
80100a3c:	85 c0                	test   %eax,%eax
80100a3e:	0f 89 4f ff ff ff    	jns    80100993 <exec+0xc5>
80100a44:	eb 44                	jmp    80100a8a <exec+0x1bc>
  iunlockput(ip);
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 c7 0c 00 00       	call   80101716 <iunlockput>
  end_op();
80100a4f:	e8 a4 1d 00 00       	call   801027f8 <end_op>
  sz = PGROUNDUP(sz);
80100a54:	8d 87 ff 0f 00 00    	lea    0xfff(%edi),%eax
80100a5a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100a5f:	83 c4 0c             	add    $0xc,%esp
80100a62:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100a68:	52                   	push   %edx
80100a69:	50                   	push   %eax
80100a6a:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100a70:	57                   	push   %edi
<<<<<<< HEAD
80100a71:	e8 3c 58 00 00       	call   801062b2 <allocuvm>
=======
80100a71:	e8 e8 57 00 00       	call   8010625e <allocuvm>
>>>>>>> d669a6c (ulib and makefile)
80100a76:	89 c6                	mov    %eax,%esi
80100a78:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a7e:	83 c4 10             	add    $0x10,%esp
80100a81:	85 c0                	test   %eax,%eax
80100a83:	75 24                	jne    80100aa9 <exec+0x1db>
  ip = 0;
80100a85:	bb 00 00 00 00       	mov    $0x0,%ebx
  if(pgdir)
80100a8a:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100a90:	85 c0                	test   %eax,%eax
80100a92:	0f 84 94 fe ff ff    	je     8010092c <exec+0x5e>
    freevm(pgdir);
80100a98:	83 ec 0c             	sub    $0xc,%esp
80100a9b:	50                   	push   %eax
<<<<<<< HEAD
80100a9c:	e8 fb 58 00 00       	call   8010639c <freevm>
=======
80100a9c:	e8 a7 58 00 00       	call   80106348 <freevm>
>>>>>>> d669a6c (ulib and makefile)
80100aa1:	83 c4 10             	add    $0x10,%esp
80100aa4:	e9 83 fe ff ff       	jmp    8010092c <exec+0x5e>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100aa9:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100aaf:	83 ec 08             	sub    $0x8,%esp
80100ab2:	50                   	push   %eax
80100ab3:	57                   	push   %edi
<<<<<<< HEAD
80100ab4:	e8 d8 59 00 00       	call   80106491 <clearpteu>
=======
80100ab4:	e8 84 59 00 00       	call   8010643d <clearpteu>
>>>>>>> d669a6c (ulib and makefile)
  for(argc = 0; argv[argc]; argc++) {
80100ab9:	83 c4 10             	add    $0x10,%esp
80100abc:	bf 00 00 00 00       	mov    $0x0,%edi
80100ac1:	eb 0a                	jmp    80100acd <exec+0x1ff>
    ustack[3+argc] = sp;
80100ac3:	89 b4 bd 64 ff ff ff 	mov    %esi,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100aca:	83 c7 01             	add    $0x1,%edi
80100acd:	8b 45 0c             	mov    0xc(%ebp),%eax
80100ad0:	8d 1c b8             	lea    (%eax,%edi,4),%ebx
80100ad3:	8b 03                	mov    (%ebx),%eax
80100ad5:	85 c0                	test   %eax,%eax
80100ad7:	74 47                	je     80100b20 <exec+0x252>
    if(argc >= MAXARG)
80100ad9:	83 ff 1f             	cmp    $0x1f,%edi
80100adc:	0f 87 0d 01 00 00    	ja     80100bef <exec+0x321>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	50                   	push   %eax
<<<<<<< HEAD
80100ae6:	e8 af 33 00 00       	call   80103e9a <strlen>
=======
80100ae6:	e8 5b 33 00 00       	call   80103e46 <strlen>
>>>>>>> d669a6c (ulib and makefile)
80100aeb:	29 c6                	sub    %eax,%esi
80100aed:	83 ee 01             	sub    $0x1,%esi
80100af0:	83 e6 fc             	and    $0xfffffffc,%esi
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100af3:	83 c4 04             	add    $0x4,%esp
80100af6:	ff 33                	push   (%ebx)
<<<<<<< HEAD
80100af8:	e8 9d 33 00 00       	call   80103e9a <strlen>
=======
80100af8:	e8 49 33 00 00       	call   80103e46 <strlen>
>>>>>>> d669a6c (ulib and makefile)
80100afd:	83 c0 01             	add    $0x1,%eax
80100b00:	50                   	push   %eax
80100b01:	ff 33                	push   (%ebx)
80100b03:	56                   	push   %esi
80100b04:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
<<<<<<< HEAD
80100b0a:	e8 d0 5a 00 00       	call   801065df <copyout>
=======
80100b0a:	e8 7c 5a 00 00       	call   8010658b <copyout>
>>>>>>> d669a6c (ulib and makefile)
80100b0f:	83 c4 20             	add    $0x20,%esp
80100b12:	85 c0                	test   %eax,%eax
80100b14:	79 ad                	jns    80100ac3 <exec+0x1f5>
  ip = 0;
80100b16:	bb 00 00 00 00       	mov    $0x0,%ebx
80100b1b:	e9 6a ff ff ff       	jmp    80100a8a <exec+0x1bc>
  ustack[3+argc] = 0;
80100b20:	89 f1                	mov    %esi,%ecx
80100b22:	89 c3                	mov    %eax,%ebx
80100b24:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100b2b:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100b2f:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100b36:	ff ff ff 
  ustack[1] = argc;
80100b39:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100b3f:	8d 14 bd 04 00 00 00 	lea    0x4(,%edi,4),%edx
80100b46:	89 f0                	mov    %esi,%eax
80100b48:	29 d0                	sub    %edx,%eax
80100b4a:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  sp -= (3+argc+1) * 4;
80100b50:	8d 04 bd 10 00 00 00 	lea    0x10(,%edi,4),%eax
80100b57:	29 c1                	sub    %eax,%ecx
80100b59:	89 ce                	mov    %ecx,%esi
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100b5b:	50                   	push   %eax
80100b5c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
80100b62:	50                   	push   %eax
80100b63:	51                   	push   %ecx
80100b64:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
<<<<<<< HEAD
80100b6a:	e8 70 5a 00 00       	call   801065df <copyout>
=======
80100b6a:	e8 1c 5a 00 00       	call   8010658b <copyout>
>>>>>>> d669a6c (ulib and makefile)
80100b6f:	83 c4 10             	add    $0x10,%esp
80100b72:	85 c0                	test   %eax,%eax
80100b74:	0f 88 10 ff ff ff    	js     80100a8a <exec+0x1bc>
  for(last=s=path; *s; s++)
80100b7a:	8b 55 08             	mov    0x8(%ebp),%edx
80100b7d:	89 d0                	mov    %edx,%eax
80100b7f:	eb 03                	jmp    80100b84 <exec+0x2b6>
80100b81:	83 c0 01             	add    $0x1,%eax
80100b84:	0f b6 08             	movzbl (%eax),%ecx
80100b87:	84 c9                	test   %cl,%cl
80100b89:	74 0a                	je     80100b95 <exec+0x2c7>
    if(*s == '/')
80100b8b:	80 f9 2f             	cmp    $0x2f,%cl
80100b8e:	75 f1                	jne    80100b81 <exec+0x2b3>
      last = s+1;
80100b90:	8d 50 01             	lea    0x1(%eax),%edx
80100b93:	eb ec                	jmp    80100b81 <exec+0x2b3>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100b95:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
80100b9b:	89 f8                	mov    %edi,%eax
80100b9d:	83 c0 6c             	add    $0x6c,%eax
80100ba0:	83 ec 04             	sub    $0x4,%esp
80100ba3:	6a 10                	push   $0x10
80100ba5:	52                   	push   %edx
80100ba6:	50                   	push   %eax
<<<<<<< HEAD
80100ba7:	e8 b1 32 00 00       	call   80103e5d <safestrcpy>
=======
80100ba7:	e8 5d 32 00 00       	call   80103e09 <safestrcpy>
>>>>>>> d669a6c (ulib and makefile)
  oldpgdir = curproc->pgdir;
80100bac:	8b 5f 04             	mov    0x4(%edi),%ebx
  curproc->pgdir = pgdir;
80100baf:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100bb5:	89 4f 04             	mov    %ecx,0x4(%edi)
  curproc->sz = sz;
80100bb8:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100bbe:	89 0f                	mov    %ecx,(%edi)
  curproc->tf->eip = elf.entry;  // main
80100bc0:	8b 47 18             	mov    0x18(%edi),%eax
80100bc3:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100bc9:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100bcc:	8b 47 18             	mov    0x18(%edi),%eax
80100bcf:	89 70 44             	mov    %esi,0x44(%eax)
  switchuvm(curproc);
80100bd2:	89 3c 24             	mov    %edi,(%esp)
<<<<<<< HEAD
80100bd5:	e8 e2 53 00 00       	call   80105fbc <switchuvm>
  freevm(oldpgdir);
80100bda:	89 1c 24             	mov    %ebx,(%esp)
80100bdd:	e8 ba 57 00 00       	call   8010639c <freevm>
=======
80100bd5:	e8 8e 53 00 00       	call   80105f68 <switchuvm>
  freevm(oldpgdir);
80100bda:	89 1c 24             	mov    %ebx,(%esp)
80100bdd:	e8 66 57 00 00       	call   80106348 <freevm>
>>>>>>> d669a6c (ulib and makefile)
  return 0;
80100be2:	83 c4 10             	add    $0x10,%esp
80100be5:	b8 00 00 00 00       	mov    $0x0,%eax
80100bea:	e9 5b fd ff ff       	jmp    8010094a <exec+0x7c>
  ip = 0;
80100bef:	bb 00 00 00 00       	mov    $0x0,%ebx
80100bf4:	e9 91 fe ff ff       	jmp    80100a8a <exec+0x1bc>
  return -1;
80100bf9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bfe:	e9 47 fd ff ff       	jmp    8010094a <exec+0x7c>

80100c03 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100c03:	55                   	push   %ebp
80100c04:	89 e5                	mov    %esp,%ebp
80100c06:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
<<<<<<< HEAD
80100c09:	68 ed 66 10 80       	push   $0x801066ed
80100c0e:	68 60 ef 10 80       	push   $0x8010ef60
80100c13:	e8 f1 2e 00 00       	call   80103b09 <initlock>
=======
80100c09:	68 ad 66 10 80       	push   $0x801066ad
80100c0e:	68 60 df 10 80       	push   $0x8010df60
80100c13:	e8 9d 2e 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
}
80100c18:	83 c4 10             	add    $0x10,%esp
80100c1b:	c9                   	leave  
80100c1c:	c3                   	ret    

80100c1d <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100c1d:	55                   	push   %ebp
80100c1e:	89 e5                	mov    %esp,%ebp
80100c20:	53                   	push   %ebx
80100c21:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
<<<<<<< HEAD
80100c24:	68 60 ef 10 80       	push   $0x8010ef60
80100c29:	e8 17 30 00 00       	call   80103c45 <acquire>
=======
80100c24:	68 60 df 10 80       	push   $0x8010df60
80100c29:	e8 c3 2f 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100c2e:	83 c4 10             	add    $0x10,%esp
80100c31:	bb 94 ef 10 80       	mov    $0x8010ef94,%ebx
80100c36:	81 fb f4 f8 10 80    	cmp    $0x8010f8f4,%ebx
80100c3c:	73 29                	jae    80100c67 <filealloc+0x4a>
    if(f->ref == 0){
80100c3e:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
80100c42:	74 05                	je     80100c49 <filealloc+0x2c>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100c44:	83 c3 18             	add    $0x18,%ebx
80100c47:	eb ed                	jmp    80100c36 <filealloc+0x19>
      f->ref = 1;
80100c49:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100c50:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100c53:	68 60 ef 10 80       	push   $0x8010ef60
80100c58:	e8 4d 30 00 00       	call   80103caa <release>
=======
80100c53:	68 60 df 10 80       	push   $0x8010df60
80100c58:	e8 f9 2f 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
      return f;
80100c5d:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100c60:	89 d8                	mov    %ebx,%eax
80100c62:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100c65:	c9                   	leave  
80100c66:	c3                   	ret    
  release(&ftable.lock);
80100c67:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100c6a:	68 60 ef 10 80       	push   $0x8010ef60
80100c6f:	e8 36 30 00 00       	call   80103caa <release>
=======
80100c6a:	68 60 df 10 80       	push   $0x8010df60
80100c6f:	e8 e2 2f 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  return 0;
80100c74:	83 c4 10             	add    $0x10,%esp
80100c77:	bb 00 00 00 00       	mov    $0x0,%ebx
80100c7c:	eb e2                	jmp    80100c60 <filealloc+0x43>

80100c7e <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100c7e:	55                   	push   %ebp
80100c7f:	89 e5                	mov    %esp,%ebp
80100c81:	53                   	push   %ebx
80100c82:	83 ec 10             	sub    $0x10,%esp
80100c85:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
<<<<<<< HEAD
80100c88:	68 60 ef 10 80       	push   $0x8010ef60
80100c8d:	e8 b3 2f 00 00       	call   80103c45 <acquire>
=======
80100c88:	68 60 df 10 80       	push   $0x8010df60
80100c8d:	e8 5f 2f 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  if(f->ref < 1)
80100c92:	8b 43 04             	mov    0x4(%ebx),%eax
80100c95:	83 c4 10             	add    $0x10,%esp
80100c98:	85 c0                	test   %eax,%eax
80100c9a:	7e 1a                	jle    80100cb6 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100c9c:	83 c0 01             	add    $0x1,%eax
80100c9f:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100ca2:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100ca5:	68 60 ef 10 80       	push   $0x8010ef60
80100caa:	e8 fb 2f 00 00       	call   80103caa <release>
=======
80100ca5:	68 60 df 10 80       	push   $0x8010df60
80100caa:	e8 a7 2f 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  return f;
}
80100caf:	89 d8                	mov    %ebx,%eax
80100cb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100cb4:	c9                   	leave  
80100cb5:	c3                   	ret    
    panic("filedup");
80100cb6:	83 ec 0c             	sub    $0xc,%esp
80100cb9:	68 f4 66 10 80       	push   $0x801066f4
80100cbe:	e8 85 f6 ff ff       	call   80100348 <panic>

80100cc3 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100cc3:	55                   	push   %ebp
80100cc4:	89 e5                	mov    %esp,%ebp
80100cc6:	53                   	push   %ebx
80100cc7:	83 ec 30             	sub    $0x30,%esp
80100cca:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
<<<<<<< HEAD
80100ccd:	68 60 ef 10 80       	push   $0x8010ef60
80100cd2:	e8 6e 2f 00 00       	call   80103c45 <acquire>
=======
80100ccd:	68 60 df 10 80       	push   $0x8010df60
80100cd2:	e8 1a 2f 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  if(f->ref < 1)
80100cd7:	8b 43 04             	mov    0x4(%ebx),%eax
80100cda:	83 c4 10             	add    $0x10,%esp
80100cdd:	85 c0                	test   %eax,%eax
80100cdf:	7e 71                	jle    80100d52 <fileclose+0x8f>
    panic("fileclose");
  if(--f->ref > 0){
80100ce1:	83 e8 01             	sub    $0x1,%eax
80100ce4:	89 43 04             	mov    %eax,0x4(%ebx)
80100ce7:	85 c0                	test   %eax,%eax
80100ce9:	7f 74                	jg     80100d5f <fileclose+0x9c>
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100ceb:	8b 03                	mov    (%ebx),%eax
80100ced:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100cf0:	8b 43 04             	mov    0x4(%ebx),%eax
80100cf3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100cf6:	8b 43 08             	mov    0x8(%ebx),%eax
80100cf9:	89 45 e8             	mov    %eax,-0x18(%ebp)
80100cfc:	8b 43 0c             	mov    0xc(%ebx),%eax
80100cff:	89 45 ec             	mov    %eax,-0x14(%ebp)
80100d02:	8b 43 10             	mov    0x10(%ebx),%eax
80100d05:	89 45 f0             	mov    %eax,-0x10(%ebp)
80100d08:	8b 43 14             	mov    0x14(%ebx),%eax
80100d0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
80100d0e:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  f->type = FD_NONE;
80100d15:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  release(&ftable.lock);
80100d1b:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100d1e:	68 60 ef 10 80       	push   $0x8010ef60
80100d23:	e8 82 2f 00 00       	call   80103caa <release>
=======
80100d1e:	68 60 df 10 80       	push   $0x8010df60
80100d23:	e8 2e 2f 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)

  if(ff.type == FD_PIPE)
80100d28:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d2b:	83 c4 10             	add    $0x10,%esp
80100d2e:	83 f8 01             	cmp    $0x1,%eax
80100d31:	74 41                	je     80100d74 <fileclose+0xb1>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100d33:	83 f8 02             	cmp    $0x2,%eax
80100d36:	75 37                	jne    80100d6f <fileclose+0xac>
    begin_op();
80100d38:	e8 41 1a 00 00       	call   8010277e <begin_op>
    iput(ff.ip);
80100d3d:	83 ec 0c             	sub    $0xc,%esp
80100d40:	ff 75 f0             	push   -0x10(%ebp)
80100d43:	e8 2e 09 00 00       	call   80101676 <iput>
    end_op();
80100d48:	e8 ab 1a 00 00       	call   801027f8 <end_op>
80100d4d:	83 c4 10             	add    $0x10,%esp
80100d50:	eb 1d                	jmp    80100d6f <fileclose+0xac>
    panic("fileclose");
80100d52:	83 ec 0c             	sub    $0xc,%esp
80100d55:	68 fc 66 10 80       	push   $0x801066fc
80100d5a:	e8 e9 f5 ff ff       	call   80100348 <panic>
    release(&ftable.lock);
80100d5f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80100d62:	68 60 ef 10 80       	push   $0x8010ef60
80100d67:	e8 3e 2f 00 00       	call   80103caa <release>
=======
80100d62:	68 60 df 10 80       	push   $0x8010df60
80100d67:	e8 ea 2e 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
    return;
80100d6c:	83 c4 10             	add    $0x10,%esp
  }
}
80100d6f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d72:	c9                   	leave  
80100d73:	c3                   	ret    
    pipeclose(ff.pipe, ff.writable);
80100d74:	83 ec 08             	sub    $0x8,%esp
80100d77:	0f be 45 e9          	movsbl -0x17(%ebp),%eax
80100d7b:	50                   	push   %eax
80100d7c:	ff 75 ec             	push   -0x14(%ebp)
80100d7f:	e8 6d 20 00 00       	call   80102df1 <pipeclose>
80100d84:	83 c4 10             	add    $0x10,%esp
80100d87:	eb e6                	jmp    80100d6f <fileclose+0xac>

80100d89 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100d89:	55                   	push   %ebp
80100d8a:	89 e5                	mov    %esp,%ebp
80100d8c:	53                   	push   %ebx
80100d8d:	83 ec 04             	sub    $0x4,%esp
80100d90:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100d93:	83 3b 02             	cmpl   $0x2,(%ebx)
80100d96:	75 31                	jne    80100dc9 <filestat+0x40>
    ilock(f->ip);
80100d98:	83 ec 0c             	sub    $0xc,%esp
80100d9b:	ff 73 10             	push   0x10(%ebx)
80100d9e:	e8 cc 07 00 00       	call   8010156f <ilock>
    stati(f->ip, st);
80100da3:	83 c4 08             	add    $0x8,%esp
80100da6:	ff 75 0c             	push   0xc(%ebp)
80100da9:	ff 73 10             	push   0x10(%ebx)
80100dac:	e8 85 09 00 00       	call   80101736 <stati>
    iunlock(f->ip);
80100db1:	83 c4 04             	add    $0x4,%esp
80100db4:	ff 73 10             	push   0x10(%ebx)
80100db7:	e8 75 08 00 00       	call   80101631 <iunlock>
    return 0;
80100dbc:	83 c4 10             	add    $0x10,%esp
80100dbf:	b8 00 00 00 00       	mov    $0x0,%eax
  }
  return -1;
}
80100dc4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc7:	c9                   	leave  
80100dc8:	c3                   	ret    
  return -1;
80100dc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dce:	eb f4                	jmp    80100dc4 <filestat+0x3b>

80100dd0 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	56                   	push   %esi
80100dd4:	53                   	push   %ebx
80100dd5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;

  if(f->readable == 0)
80100dd8:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100ddc:	74 70                	je     80100e4e <fileread+0x7e>
    return -1;
  if(f->type == FD_PIPE)
80100dde:	8b 03                	mov    (%ebx),%eax
80100de0:	83 f8 01             	cmp    $0x1,%eax
80100de3:	74 44                	je     80100e29 <fileread+0x59>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100de5:	83 f8 02             	cmp    $0x2,%eax
80100de8:	75 57                	jne    80100e41 <fileread+0x71>
    ilock(f->ip);
80100dea:	83 ec 0c             	sub    $0xc,%esp
80100ded:	ff 73 10             	push   0x10(%ebx)
80100df0:	e8 7a 07 00 00       	call   8010156f <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100df5:	ff 75 10             	push   0x10(%ebp)
80100df8:	ff 73 14             	push   0x14(%ebx)
80100dfb:	ff 75 0c             	push   0xc(%ebp)
80100dfe:	ff 73 10             	push   0x10(%ebx)
80100e01:	e8 5b 09 00 00       	call   80101761 <readi>
80100e06:	89 c6                	mov    %eax,%esi
80100e08:	83 c4 20             	add    $0x20,%esp
80100e0b:	85 c0                	test   %eax,%eax
80100e0d:	7e 03                	jle    80100e12 <fileread+0x42>
      f->off += r;
80100e0f:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100e12:	83 ec 0c             	sub    $0xc,%esp
80100e15:	ff 73 10             	push   0x10(%ebx)
80100e18:	e8 14 08 00 00       	call   80101631 <iunlock>
    return r;
80100e1d:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100e20:	89 f0                	mov    %esi,%eax
80100e22:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100e25:	5b                   	pop    %ebx
80100e26:	5e                   	pop    %esi
80100e27:	5d                   	pop    %ebp
80100e28:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80100e29:	83 ec 04             	sub    $0x4,%esp
80100e2c:	ff 75 10             	push   0x10(%ebp)
80100e2f:	ff 75 0c             	push   0xc(%ebp)
80100e32:	ff 73 0c             	push   0xc(%ebx)
80100e35:	e8 08 21 00 00       	call   80102f42 <piperead>
80100e3a:	89 c6                	mov    %eax,%esi
80100e3c:	83 c4 10             	add    $0x10,%esp
80100e3f:	eb df                	jmp    80100e20 <fileread+0x50>
  panic("fileread");
80100e41:	83 ec 0c             	sub    $0xc,%esp
80100e44:	68 06 67 10 80       	push   $0x80106706
80100e49:	e8 fa f4 ff ff       	call   80100348 <panic>
    return -1;
80100e4e:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100e53:	eb cb                	jmp    80100e20 <fileread+0x50>

80100e55 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100e55:	55                   	push   %ebp
80100e56:	89 e5                	mov    %esp,%ebp
80100e58:	57                   	push   %edi
80100e59:	56                   	push   %esi
80100e5a:	53                   	push   %ebx
80100e5b:	83 ec 1c             	sub    $0x1c,%esp
80100e5e:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;

  if(f->writable == 0)
80100e61:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100e65:	0f 84 d0 00 00 00    	je     80100f3b <filewrite+0xe6>
    return -1;
  if(f->type == FD_PIPE)
80100e6b:	8b 06                	mov    (%esi),%eax
80100e6d:	83 f8 01             	cmp    $0x1,%eax
80100e70:	74 12                	je     80100e84 <filewrite+0x2f>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100e72:	83 f8 02             	cmp    $0x2,%eax
80100e75:	0f 85 b3 00 00 00    	jne    80100f2e <filewrite+0xd9>
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
80100e7b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80100e82:	eb 66                	jmp    80100eea <filewrite+0x95>
    return pipewrite(f->pipe, addr, n);
80100e84:	83 ec 04             	sub    $0x4,%esp
80100e87:	ff 75 10             	push   0x10(%ebp)
80100e8a:	ff 75 0c             	push   0xc(%ebp)
80100e8d:	ff 76 0c             	push   0xc(%esi)
80100e90:	e8 e8 1f 00 00       	call   80102e7d <pipewrite>
80100e95:	83 c4 10             	add    $0x10,%esp
80100e98:	e9 84 00 00 00       	jmp    80100f21 <filewrite+0xcc>
    while(i < n){
      int n1 = n - i;
      if(n1 > max)
        n1 = max;

      begin_op();
80100e9d:	e8 dc 18 00 00       	call   8010277e <begin_op>
      ilock(f->ip);
80100ea2:	83 ec 0c             	sub    $0xc,%esp
80100ea5:	ff 76 10             	push   0x10(%esi)
80100ea8:	e8 c2 06 00 00       	call   8010156f <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80100ead:	57                   	push   %edi
80100eae:	ff 76 14             	push   0x14(%esi)
80100eb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100eb4:	03 45 0c             	add    0xc(%ebp),%eax
80100eb7:	50                   	push   %eax
80100eb8:	ff 76 10             	push   0x10(%esi)
80100ebb:	e8 9e 09 00 00       	call   8010185e <writei>
80100ec0:	89 c3                	mov    %eax,%ebx
80100ec2:	83 c4 20             	add    $0x20,%esp
80100ec5:	85 c0                	test   %eax,%eax
80100ec7:	7e 03                	jle    80100ecc <filewrite+0x77>
        f->off += r;
80100ec9:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
80100ecc:	83 ec 0c             	sub    $0xc,%esp
80100ecf:	ff 76 10             	push   0x10(%esi)
80100ed2:	e8 5a 07 00 00       	call   80101631 <iunlock>
      end_op();
80100ed7:	e8 1c 19 00 00       	call   801027f8 <end_op>

      if(r < 0)
80100edc:	83 c4 10             	add    $0x10,%esp
80100edf:	85 db                	test   %ebx,%ebx
80100ee1:	78 31                	js     80100f14 <filewrite+0xbf>
        break;
      if(r != n1)
80100ee3:	39 df                	cmp    %ebx,%edi
80100ee5:	75 20                	jne    80100f07 <filewrite+0xb2>
        panic("short filewrite");
      i += r;
80100ee7:	01 5d e4             	add    %ebx,-0x1c(%ebp)
    while(i < n){
80100eea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100eed:	3b 45 10             	cmp    0x10(%ebp),%eax
80100ef0:	7d 22                	jge    80100f14 <filewrite+0xbf>
      int n1 = n - i;
80100ef2:	8b 7d 10             	mov    0x10(%ebp),%edi
80100ef5:	2b 7d e4             	sub    -0x1c(%ebp),%edi
      if(n1 > max)
80100ef8:	81 ff 00 06 00 00    	cmp    $0x600,%edi
80100efe:	7e 9d                	jle    80100e9d <filewrite+0x48>
        n1 = max;
80100f00:	bf 00 06 00 00       	mov    $0x600,%edi
80100f05:	eb 96                	jmp    80100e9d <filewrite+0x48>
        panic("short filewrite");
80100f07:	83 ec 0c             	sub    $0xc,%esp
80100f0a:	68 0f 67 10 80       	push   $0x8010670f
80100f0f:	e8 34 f4 ff ff       	call   80100348 <panic>
    }
    return i == n ? n : -1;
80100f14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100f17:	3b 45 10             	cmp    0x10(%ebp),%eax
80100f1a:	74 0d                	je     80100f29 <filewrite+0xd4>
80100f1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
80100f21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f24:	5b                   	pop    %ebx
80100f25:	5e                   	pop    %esi
80100f26:	5f                   	pop    %edi
80100f27:	5d                   	pop    %ebp
80100f28:	c3                   	ret    
    return i == n ? n : -1;
80100f29:	8b 45 10             	mov    0x10(%ebp),%eax
80100f2c:	eb f3                	jmp    80100f21 <filewrite+0xcc>
  panic("filewrite");
80100f2e:	83 ec 0c             	sub    $0xc,%esp
80100f31:	68 15 67 10 80       	push   $0x80106715
80100f36:	e8 0d f4 ff ff       	call   80100348 <panic>
    return -1;
80100f3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f40:	eb df                	jmp    80100f21 <filewrite+0xcc>

80100f42 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
80100f42:	55                   	push   %ebp
80100f43:	89 e5                	mov    %esp,%ebp
80100f45:	57                   	push   %edi
80100f46:	56                   	push   %esi
80100f47:	53                   	push   %ebx
80100f48:	83 ec 0c             	sub    $0xc,%esp
80100f4b:	89 d6                	mov    %edx,%esi
  char *s;
  int len;

  while(*path == '/')
80100f4d:	eb 03                	jmp    80100f52 <skipelem+0x10>
    path++;
80100f4f:	83 c0 01             	add    $0x1,%eax
  while(*path == '/')
80100f52:	0f b6 10             	movzbl (%eax),%edx
80100f55:	80 fa 2f             	cmp    $0x2f,%dl
80100f58:	74 f5                	je     80100f4f <skipelem+0xd>
  if(*path == 0)
80100f5a:	84 d2                	test   %dl,%dl
80100f5c:	74 53                	je     80100fb1 <skipelem+0x6f>
80100f5e:	89 c3                	mov    %eax,%ebx
80100f60:	eb 03                	jmp    80100f65 <skipelem+0x23>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80100f62:	83 c3 01             	add    $0x1,%ebx
  while(*path != '/' && *path != 0)
80100f65:	0f b6 13             	movzbl (%ebx),%edx
80100f68:	80 fa 2f             	cmp    $0x2f,%dl
80100f6b:	74 04                	je     80100f71 <skipelem+0x2f>
80100f6d:	84 d2                	test   %dl,%dl
80100f6f:	75 f1                	jne    80100f62 <skipelem+0x20>
  len = path - s;
80100f71:	89 df                	mov    %ebx,%edi
80100f73:	29 c7                	sub    %eax,%edi
  if(len >= DIRSIZ)
80100f75:	83 ff 0d             	cmp    $0xd,%edi
80100f78:	7e 11                	jle    80100f8b <skipelem+0x49>
    memmove(name, s, DIRSIZ);
80100f7a:	83 ec 04             	sub    $0x4,%esp
80100f7d:	6a 0e                	push   $0xe
80100f7f:	50                   	push   %eax
80100f80:	56                   	push   %esi
<<<<<<< HEAD
80100f81:	e8 e3 2d 00 00       	call   80103d69 <memmove>
=======
80100f81:	e8 8f 2d 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
80100f86:	83 c4 10             	add    $0x10,%esp
80100f89:	eb 17                	jmp    80100fa2 <skipelem+0x60>
  else {
    memmove(name, s, len);
80100f8b:	83 ec 04             	sub    $0x4,%esp
80100f8e:	57                   	push   %edi
80100f8f:	50                   	push   %eax
80100f90:	56                   	push   %esi
<<<<<<< HEAD
80100f91:	e8 d3 2d 00 00       	call   80103d69 <memmove>
=======
80100f91:	e8 7f 2d 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    name[len] = 0;
80100f96:	c6 04 3e 00          	movb   $0x0,(%esi,%edi,1)
80100f9a:	83 c4 10             	add    $0x10,%esp
80100f9d:	eb 03                	jmp    80100fa2 <skipelem+0x60>
  }
  while(*path == '/')
    path++;
80100f9f:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80100fa2:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80100fa5:	74 f8                	je     80100f9f <skipelem+0x5d>
  return path;
}
80100fa7:	89 d8                	mov    %ebx,%eax
80100fa9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fac:	5b                   	pop    %ebx
80100fad:	5e                   	pop    %esi
80100fae:	5f                   	pop    %edi
80100faf:	5d                   	pop    %ebp
80100fb0:	c3                   	ret    
    return 0;
80100fb1:	bb 00 00 00 00       	mov    $0x0,%ebx
80100fb6:	eb ef                	jmp    80100fa7 <skipelem+0x65>

80100fb8 <bzero>:
{
80100fb8:	55                   	push   %ebp
80100fb9:	89 e5                	mov    %esp,%ebp
80100fbb:	53                   	push   %ebx
80100fbc:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, bno);
80100fbf:	52                   	push   %edx
80100fc0:	50                   	push   %eax
80100fc1:	e8 a6 f1 ff ff       	call   8010016c <bread>
80100fc6:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80100fc8:	8d 40 5c             	lea    0x5c(%eax),%eax
80100fcb:	83 c4 0c             	add    $0xc,%esp
80100fce:	68 00 02 00 00       	push   $0x200
80100fd3:	6a 00                	push   $0x0
80100fd5:	50                   	push   %eax
<<<<<<< HEAD
80100fd6:	e8 16 2d 00 00       	call   80103cf1 <memset>
=======
80100fd6:	e8 c2 2c 00 00       	call   80103c9d <memset>
>>>>>>> d669a6c (ulib and makefile)
  log_write(bp);
80100fdb:	89 1c 24             	mov    %ebx,(%esp)
80100fde:	e8 c4 18 00 00       	call   801028a7 <log_write>
  brelse(bp);
80100fe3:	89 1c 24             	mov    %ebx,(%esp)
80100fe6:	e8 ea f1 ff ff       	call   801001d5 <brelse>
}
80100feb:	83 c4 10             	add    $0x10,%esp
80100fee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ff1:	c9                   	leave  
80100ff2:	c3                   	ret    

80100ff3 <bfree>:
{
80100ff3:	55                   	push   %ebp
80100ff4:	89 e5                	mov    %esp,%ebp
80100ff6:	56                   	push   %esi
80100ff7:	53                   	push   %ebx
80100ff8:	89 c3                	mov    %eax,%ebx
80100ffa:	89 d6                	mov    %edx,%esi
  bp = bread(dev, BBLOCK(b, sb));
80100ffc:	89 d0                	mov    %edx,%eax
80100ffe:	c1 e8 0c             	shr    $0xc,%eax
80101001:	83 ec 08             	sub    $0x8,%esp
80101004:	03 05 cc 15 11 80    	add    0x801115cc,%eax
8010100a:	50                   	push   %eax
8010100b:	53                   	push   %ebx
8010100c:	e8 5b f1 ff ff       	call   8010016c <bread>
80101011:	89 c3                	mov    %eax,%ebx
  bi = b % BPB;
80101013:	89 f2                	mov    %esi,%edx
80101015:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  m = 1 << (bi % 8);
8010101b:	89 f1                	mov    %esi,%ecx
8010101d:	83 e1 07             	and    $0x7,%ecx
80101020:	b8 01 00 00 00       	mov    $0x1,%eax
80101025:	d3 e0                	shl    %cl,%eax
  if((bp->data[bi/8] & m) == 0)
80101027:	83 c4 10             	add    $0x10,%esp
8010102a:	c1 fa 03             	sar    $0x3,%edx
8010102d:	0f b6 4c 13 5c       	movzbl 0x5c(%ebx,%edx,1),%ecx
80101032:	0f b6 f1             	movzbl %cl,%esi
80101035:	85 c6                	test   %eax,%esi
80101037:	74 23                	je     8010105c <bfree+0x69>
  bp->data[bi/8] &= ~m;
80101039:	f7 d0                	not    %eax
8010103b:	21 c8                	and    %ecx,%eax
8010103d:	88 44 13 5c          	mov    %al,0x5c(%ebx,%edx,1)
  log_write(bp);
80101041:	83 ec 0c             	sub    $0xc,%esp
80101044:	53                   	push   %ebx
80101045:	e8 5d 18 00 00       	call   801028a7 <log_write>
  brelse(bp);
8010104a:	89 1c 24             	mov    %ebx,(%esp)
8010104d:	e8 83 f1 ff ff       	call   801001d5 <brelse>
}
80101052:	83 c4 10             	add    $0x10,%esp
80101055:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101058:	5b                   	pop    %ebx
80101059:	5e                   	pop    %esi
8010105a:	5d                   	pop    %ebp
8010105b:	c3                   	ret    
    panic("freeing free block");
8010105c:	83 ec 0c             	sub    $0xc,%esp
8010105f:	68 1f 67 10 80       	push   $0x8010671f
80101064:	e8 df f2 ff ff       	call   80100348 <panic>

80101069 <balloc>:
{
80101069:	55                   	push   %ebp
8010106a:	89 e5                	mov    %esp,%ebp
8010106c:	57                   	push   %edi
8010106d:	56                   	push   %esi
8010106e:	53                   	push   %ebx
8010106f:	83 ec 1c             	sub    $0x1c,%esp
80101072:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101075:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010107c:	eb 15                	jmp    80101093 <balloc+0x2a>
    brelse(bp);
8010107e:	83 ec 0c             	sub    $0xc,%esp
80101081:	ff 75 e0             	push   -0x20(%ebp)
80101084:	e8 4c f1 ff ff       	call   801001d5 <brelse>
  for(b = 0; b < sb.size; b += BPB){
80101089:	81 45 e4 00 10 00 00 	addl   $0x1000,-0x1c(%ebp)
80101090:	83 c4 10             	add    $0x10,%esp
80101093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101096:	39 05 b4 15 11 80    	cmp    %eax,0x801115b4
8010109c:	76 75                	jbe    80101113 <balloc+0xaa>
    bp = bread(dev, BBLOCK(b, sb));
8010109e:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010a1:	8d 83 ff 0f 00 00    	lea    0xfff(%ebx),%eax
801010a7:	85 db                	test   %ebx,%ebx
801010a9:	0f 49 c3             	cmovns %ebx,%eax
801010ac:	c1 f8 0c             	sar    $0xc,%eax
801010af:	83 ec 08             	sub    $0x8,%esp
801010b2:	03 05 cc 15 11 80    	add    0x801115cc,%eax
801010b8:	50                   	push   %eax
801010b9:	ff 75 d8             	push   -0x28(%ebp)
801010bc:	e8 ab f0 ff ff       	call   8010016c <bread>
801010c1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801010c4:	83 c4 10             	add    $0x10,%esp
801010c7:	b8 00 00 00 00       	mov    $0x0,%eax
801010cc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
801010d1:	7f ab                	jg     8010107e <balloc+0x15>
801010d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801010d6:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
801010d9:	3b 1d b4 15 11 80    	cmp    0x801115b4,%ebx
801010df:	73 9d                	jae    8010107e <balloc+0x15>
      m = 1 << (bi % 8);
801010e1:	89 c1                	mov    %eax,%ecx
801010e3:	83 e1 07             	and    $0x7,%ecx
801010e6:	ba 01 00 00 00       	mov    $0x1,%edx
801010eb:	d3 e2                	shl    %cl,%edx
801010ed:	89 d1                	mov    %edx,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801010ef:	8d 50 07             	lea    0x7(%eax),%edx
801010f2:	85 c0                	test   %eax,%eax
801010f4:	0f 49 d0             	cmovns %eax,%edx
801010f7:	c1 fa 03             	sar    $0x3,%edx
801010fa:	89 55 dc             	mov    %edx,-0x24(%ebp)
801010fd:	8b 75 e0             	mov    -0x20(%ebp),%esi
80101100:	0f b6 74 16 5c       	movzbl 0x5c(%esi,%edx,1),%esi
80101105:	89 f2                	mov    %esi,%edx
80101107:	0f b6 fa             	movzbl %dl,%edi
8010110a:	85 cf                	test   %ecx,%edi
8010110c:	74 12                	je     80101120 <balloc+0xb7>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010110e:	83 c0 01             	add    $0x1,%eax
80101111:	eb b9                	jmp    801010cc <balloc+0x63>
  panic("balloc: out of blocks");
80101113:	83 ec 0c             	sub    $0xc,%esp
80101116:	68 32 67 10 80       	push   $0x80106732
8010111b:	e8 28 f2 ff ff       	call   80100348 <panic>
        bp->data[bi/8] |= m;  // Mark block in use.
80101120:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101123:	09 f1                	or     %esi,%ecx
80101125:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101128:	88 4c 17 5c          	mov    %cl,0x5c(%edi,%edx,1)
        log_write(bp);
8010112c:	83 ec 0c             	sub    $0xc,%esp
8010112f:	57                   	push   %edi
80101130:	e8 72 17 00 00       	call   801028a7 <log_write>
        brelse(bp);
80101135:	89 3c 24             	mov    %edi,(%esp)
80101138:	e8 98 f0 ff ff       	call   801001d5 <brelse>
        bzero(dev, b + bi);
8010113d:	89 da                	mov    %ebx,%edx
8010113f:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101142:	e8 71 fe ff ff       	call   80100fb8 <bzero>
}
80101147:	89 d8                	mov    %ebx,%eax
80101149:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010114c:	5b                   	pop    %ebx
8010114d:	5e                   	pop    %esi
8010114e:	5f                   	pop    %edi
8010114f:	5d                   	pop    %ebp
80101150:	c3                   	ret    

80101151 <bmap>:
{
80101151:	55                   	push   %ebp
80101152:	89 e5                	mov    %esp,%ebp
80101154:	57                   	push   %edi
80101155:	56                   	push   %esi
80101156:	53                   	push   %ebx
80101157:	83 ec 1c             	sub    $0x1c,%esp
8010115a:	89 c3                	mov    %eax,%ebx
8010115c:	89 d7                	mov    %edx,%edi
  if(bn < NDIRECT){
8010115e:	83 fa 0b             	cmp    $0xb,%edx
80101161:	76 45                	jbe    801011a8 <bmap+0x57>
  bn -= NDIRECT;
80101163:	8d 72 f4             	lea    -0xc(%edx),%esi
  if(bn < NINDIRECT){
80101166:	83 fe 7f             	cmp    $0x7f,%esi
80101169:	77 7f                	ja     801011ea <bmap+0x99>
    if((addr = ip->addrs[NDIRECT]) == 0)
8010116b:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101171:	85 c0                	test   %eax,%eax
80101173:	74 4a                	je     801011bf <bmap+0x6e>
    bp = bread(ip->dev, addr);
80101175:	83 ec 08             	sub    $0x8,%esp
80101178:	50                   	push   %eax
80101179:	ff 33                	push   (%ebx)
8010117b:	e8 ec ef ff ff       	call   8010016c <bread>
80101180:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
80101182:	8d 44 b0 5c          	lea    0x5c(%eax,%esi,4),%eax
80101186:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101189:	8b 30                	mov    (%eax),%esi
8010118b:	83 c4 10             	add    $0x10,%esp
8010118e:	85 f6                	test   %esi,%esi
80101190:	74 3c                	je     801011ce <bmap+0x7d>
    brelse(bp);
80101192:	83 ec 0c             	sub    $0xc,%esp
80101195:	57                   	push   %edi
80101196:	e8 3a f0 ff ff       	call   801001d5 <brelse>
    return addr;
8010119b:	83 c4 10             	add    $0x10,%esp
}
8010119e:	89 f0                	mov    %esi,%eax
801011a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011a3:	5b                   	pop    %ebx
801011a4:	5e                   	pop    %esi
801011a5:	5f                   	pop    %edi
801011a6:	5d                   	pop    %ebp
801011a7:	c3                   	ret    
    if((addr = ip->addrs[bn]) == 0)
801011a8:	8b 74 90 5c          	mov    0x5c(%eax,%edx,4),%esi
801011ac:	85 f6                	test   %esi,%esi
801011ae:	75 ee                	jne    8010119e <bmap+0x4d>
      ip->addrs[bn] = addr = balloc(ip->dev);
801011b0:	8b 00                	mov    (%eax),%eax
801011b2:	e8 b2 fe ff ff       	call   80101069 <balloc>
801011b7:	89 c6                	mov    %eax,%esi
801011b9:	89 44 bb 5c          	mov    %eax,0x5c(%ebx,%edi,4)
    return addr;
801011bd:	eb df                	jmp    8010119e <bmap+0x4d>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801011bf:	8b 03                	mov    (%ebx),%eax
801011c1:	e8 a3 fe ff ff       	call   80101069 <balloc>
801011c6:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
801011cc:	eb a7                	jmp    80101175 <bmap+0x24>
      a[bn] = addr = balloc(ip->dev);
801011ce:	8b 03                	mov    (%ebx),%eax
801011d0:	e8 94 fe ff ff       	call   80101069 <balloc>
801011d5:	89 c6                	mov    %eax,%esi
801011d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801011da:	89 30                	mov    %esi,(%eax)
      log_write(bp);
801011dc:	83 ec 0c             	sub    $0xc,%esp
801011df:	57                   	push   %edi
801011e0:	e8 c2 16 00 00       	call   801028a7 <log_write>
801011e5:	83 c4 10             	add    $0x10,%esp
801011e8:	eb a8                	jmp    80101192 <bmap+0x41>
  panic("bmap: out of range");
801011ea:	83 ec 0c             	sub    $0xc,%esp
801011ed:	68 48 67 10 80       	push   $0x80106748
801011f2:	e8 51 f1 ff ff       	call   80100348 <panic>

801011f7 <iget>:
{
801011f7:	55                   	push   %ebp
801011f8:	89 e5                	mov    %esp,%ebp
801011fa:	57                   	push   %edi
801011fb:	56                   	push   %esi
801011fc:	53                   	push   %ebx
801011fd:	83 ec 28             	sub    $0x28,%esp
80101200:	89 c7                	mov    %eax,%edi
80101202:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
<<<<<<< HEAD
80101205:	68 60 f9 10 80       	push   $0x8010f960
8010120a:	e8 36 2a 00 00       	call   80103c45 <acquire>
=======
80101205:	68 60 e9 10 80       	push   $0x8010e960
8010120a:	e8 e2 29 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010120f:	83 c4 10             	add    $0x10,%esp
  empty = 0;
80101212:	be 00 00 00 00       	mov    $0x0,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101217:	bb 94 f9 10 80       	mov    $0x8010f994,%ebx
8010121c:	eb 0a                	jmp    80101228 <iget+0x31>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
8010121e:	85 f6                	test   %esi,%esi
80101220:	74 3b                	je     8010125d <iget+0x66>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101222:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101228:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
8010122e:	73 35                	jae    80101265 <iget+0x6e>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101230:	8b 43 08             	mov    0x8(%ebx),%eax
80101233:	85 c0                	test   %eax,%eax
80101235:	7e e7                	jle    8010121e <iget+0x27>
80101237:	39 3b                	cmp    %edi,(%ebx)
80101239:	75 e3                	jne    8010121e <iget+0x27>
8010123b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010123e:	39 4b 04             	cmp    %ecx,0x4(%ebx)
80101241:	75 db                	jne    8010121e <iget+0x27>
      ip->ref++;
80101243:	83 c0 01             	add    $0x1,%eax
80101246:	89 43 08             	mov    %eax,0x8(%ebx)
      release(&icache.lock);
80101249:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010124c:	68 60 f9 10 80       	push   $0x8010f960
80101251:	e8 54 2a 00 00       	call   80103caa <release>
=======
8010124c:	68 60 e9 10 80       	push   $0x8010e960
80101251:	e8 00 2a 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
      return ip;
80101256:	83 c4 10             	add    $0x10,%esp
80101259:	89 de                	mov    %ebx,%esi
8010125b:	eb 32                	jmp    8010128f <iget+0x98>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
8010125d:	85 c0                	test   %eax,%eax
8010125f:	75 c1                	jne    80101222 <iget+0x2b>
      empty = ip;
80101261:	89 de                	mov    %ebx,%esi
80101263:	eb bd                	jmp    80101222 <iget+0x2b>
  if(empty == 0)
80101265:	85 f6                	test   %esi,%esi
80101267:	74 30                	je     80101299 <iget+0xa2>
  ip->dev = dev;
80101269:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
8010126b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010126e:	89 46 04             	mov    %eax,0x4(%esi)
  ip->ref = 1;
80101271:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101278:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010127f:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101282:	68 60 f9 10 80       	push   $0x8010f960
80101287:	e8 1e 2a 00 00       	call   80103caa <release>
=======
80101282:	68 60 e9 10 80       	push   $0x8010e960
80101287:	e8 ca 29 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  return ip;
8010128c:	83 c4 10             	add    $0x10,%esp
}
8010128f:	89 f0                	mov    %esi,%eax
80101291:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101294:	5b                   	pop    %ebx
80101295:	5e                   	pop    %esi
80101296:	5f                   	pop    %edi
80101297:	5d                   	pop    %ebp
80101298:	c3                   	ret    
    panic("iget: no inodes");
80101299:	83 ec 0c             	sub    $0xc,%esp
8010129c:	68 5b 67 10 80       	push   $0x8010675b
801012a1:	e8 a2 f0 ff ff       	call   80100348 <panic>

801012a6 <readsb>:
{
801012a6:	55                   	push   %ebp
801012a7:	89 e5                	mov    %esp,%ebp
801012a9:	53                   	push   %ebx
801012aa:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, 1);
801012ad:	6a 01                	push   $0x1
801012af:	ff 75 08             	push   0x8(%ebp)
801012b2:	e8 b5 ee ff ff       	call   8010016c <bread>
801012b7:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801012b9:	8d 40 5c             	lea    0x5c(%eax),%eax
801012bc:	83 c4 0c             	add    $0xc,%esp
801012bf:	6a 1c                	push   $0x1c
801012c1:	50                   	push   %eax
801012c2:	ff 75 0c             	push   0xc(%ebp)
<<<<<<< HEAD
801012c5:	e8 9f 2a 00 00       	call   80103d69 <memmove>
=======
801012c5:	e8 4b 2a 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
  brelse(bp);
801012ca:	89 1c 24             	mov    %ebx,(%esp)
801012cd:	e8 03 ef ff ff       	call   801001d5 <brelse>
}
801012d2:	83 c4 10             	add    $0x10,%esp
801012d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801012d8:	c9                   	leave  
801012d9:	c3                   	ret    

801012da <iinit>:
{
801012da:	55                   	push   %ebp
801012db:	89 e5                	mov    %esp,%ebp
801012dd:	53                   	push   %ebx
801012de:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
<<<<<<< HEAD
801012e1:	68 6b 67 10 80       	push   $0x8010676b
801012e6:	68 60 f9 10 80       	push   $0x8010f960
801012eb:	e8 19 28 00 00       	call   80103b09 <initlock>
=======
801012e1:	68 2b 67 10 80       	push   $0x8010672b
801012e6:	68 60 e9 10 80       	push   $0x8010e960
801012eb:	e8 c5 27 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
  for(i = 0; i < NINODE; i++) {
801012f0:	83 c4 10             	add    $0x10,%esp
801012f3:	bb 00 00 00 00       	mov    $0x0,%ebx
801012f8:	eb 21                	jmp    8010131b <iinit+0x41>
    initsleeplock(&icache.inode[i].lock, "inode");
801012fa:	83 ec 08             	sub    $0x8,%esp
801012fd:	68 72 67 10 80       	push   $0x80106772
80101302:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
80101305:	89 d0                	mov    %edx,%eax
80101307:	c1 e0 04             	shl    $0x4,%eax
8010130a:	05 a0 f9 10 80       	add    $0x8010f9a0,%eax
8010130f:	50                   	push   %eax
<<<<<<< HEAD
80101310:	e8 e9 26 00 00       	call   801039fe <initsleeplock>
=======
80101310:	e8 95 26 00 00       	call   801039aa <initsleeplock>
>>>>>>> d669a6c (ulib and makefile)
  for(i = 0; i < NINODE; i++) {
80101315:	83 c3 01             	add    $0x1,%ebx
80101318:	83 c4 10             	add    $0x10,%esp
8010131b:	83 fb 31             	cmp    $0x31,%ebx
8010131e:	7e da                	jle    801012fa <iinit+0x20>
  readsb(dev, &sb);
80101320:	83 ec 08             	sub    $0x8,%esp
80101323:	68 b4 15 11 80       	push   $0x801115b4
80101328:	ff 75 08             	push   0x8(%ebp)
8010132b:	e8 76 ff ff ff       	call   801012a6 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
80101330:	ff 35 cc 15 11 80    	push   0x801115cc
80101336:	ff 35 c8 15 11 80    	push   0x801115c8
8010133c:	ff 35 c4 15 11 80    	push   0x801115c4
80101342:	ff 35 c0 15 11 80    	push   0x801115c0
80101348:	ff 35 bc 15 11 80    	push   0x801115bc
8010134e:	ff 35 b8 15 11 80    	push   0x801115b8
80101354:	ff 35 b4 15 11 80    	push   0x801115b4
8010135a:	68 d8 67 10 80       	push   $0x801067d8
8010135f:	e8 a3 f2 ff ff       	call   80100607 <cprintf>
}
80101364:	83 c4 30             	add    $0x30,%esp
80101367:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010136a:	c9                   	leave  
8010136b:	c3                   	ret    

8010136c <ialloc>:
{
8010136c:	55                   	push   %ebp
8010136d:	89 e5                	mov    %esp,%ebp
8010136f:	57                   	push   %edi
80101370:	56                   	push   %esi
80101371:	53                   	push   %ebx
80101372:	83 ec 1c             	sub    $0x1c,%esp
80101375:	8b 45 0c             	mov    0xc(%ebp),%eax
80101378:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
8010137b:	bb 01 00 00 00       	mov    $0x1,%ebx
80101380:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80101383:	39 1d bc 15 11 80    	cmp    %ebx,0x801115bc
80101389:	76 3f                	jbe    801013ca <ialloc+0x5e>
    bp = bread(dev, IBLOCK(inum, sb));
8010138b:	89 d8                	mov    %ebx,%eax
8010138d:	c1 e8 03             	shr    $0x3,%eax
80101390:	83 ec 08             	sub    $0x8,%esp
80101393:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101399:	50                   	push   %eax
8010139a:	ff 75 08             	push   0x8(%ebp)
8010139d:	e8 ca ed ff ff       	call   8010016c <bread>
801013a2:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + inum%IPB;
801013a4:	89 d8                	mov    %ebx,%eax
801013a6:	83 e0 07             	and    $0x7,%eax
801013a9:	c1 e0 06             	shl    $0x6,%eax
801013ac:	8d 7c 06 5c          	lea    0x5c(%esi,%eax,1),%edi
    if(dip->type == 0){  // a free inode
801013b0:	83 c4 10             	add    $0x10,%esp
801013b3:	66 83 3f 00          	cmpw   $0x0,(%edi)
801013b7:	74 1e                	je     801013d7 <ialloc+0x6b>
    brelse(bp);
801013b9:	83 ec 0c             	sub    $0xc,%esp
801013bc:	56                   	push   %esi
801013bd:	e8 13 ee ff ff       	call   801001d5 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
801013c2:	83 c3 01             	add    $0x1,%ebx
801013c5:	83 c4 10             	add    $0x10,%esp
801013c8:	eb b6                	jmp    80101380 <ialloc+0x14>
  panic("ialloc: no inodes");
801013ca:	83 ec 0c             	sub    $0xc,%esp
801013cd:	68 78 67 10 80       	push   $0x80106778
801013d2:	e8 71 ef ff ff       	call   80100348 <panic>
      memset(dip, 0, sizeof(*dip));
801013d7:	83 ec 04             	sub    $0x4,%esp
801013da:	6a 40                	push   $0x40
801013dc:	6a 00                	push   $0x0
801013de:	57                   	push   %edi
<<<<<<< HEAD
801013df:	e8 0d 29 00 00       	call   80103cf1 <memset>
=======
801013df:	e8 b9 28 00 00       	call   80103c9d <memset>
>>>>>>> d669a6c (ulib and makefile)
      dip->type = type;
801013e4:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
801013e8:	66 89 07             	mov    %ax,(%edi)
      log_write(bp);   // mark it allocated on the disk
801013eb:	89 34 24             	mov    %esi,(%esp)
801013ee:	e8 b4 14 00 00       	call   801028a7 <log_write>
      brelse(bp);
801013f3:	89 34 24             	mov    %esi,(%esp)
801013f6:	e8 da ed ff ff       	call   801001d5 <brelse>
      return iget(dev, inum);
801013fb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801013fe:	8b 45 08             	mov    0x8(%ebp),%eax
80101401:	e8 f1 fd ff ff       	call   801011f7 <iget>
}
80101406:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101409:	5b                   	pop    %ebx
8010140a:	5e                   	pop    %esi
8010140b:	5f                   	pop    %edi
8010140c:	5d                   	pop    %ebp
8010140d:	c3                   	ret    

8010140e <iupdate>:
{
8010140e:	55                   	push   %ebp
8010140f:	89 e5                	mov    %esp,%ebp
80101411:	56                   	push   %esi
80101412:	53                   	push   %ebx
80101413:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101416:	8b 43 04             	mov    0x4(%ebx),%eax
80101419:	c1 e8 03             	shr    $0x3,%eax
8010141c:	83 ec 08             	sub    $0x8,%esp
8010141f:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101425:	50                   	push   %eax
80101426:	ff 33                	push   (%ebx)
80101428:	e8 3f ed ff ff       	call   8010016c <bread>
8010142d:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010142f:	8b 43 04             	mov    0x4(%ebx),%eax
80101432:	83 e0 07             	and    $0x7,%eax
80101435:	c1 e0 06             	shl    $0x6,%eax
80101438:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
8010143c:	0f b7 53 50          	movzwl 0x50(%ebx),%edx
80101440:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
80101443:	0f b7 53 52          	movzwl 0x52(%ebx),%edx
80101447:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
8010144b:	0f b7 53 54          	movzwl 0x54(%ebx),%edx
8010144f:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
80101453:	0f b7 53 56          	movzwl 0x56(%ebx),%edx
80101457:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
8010145b:	8b 53 58             	mov    0x58(%ebx),%edx
8010145e:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101461:	83 c3 5c             	add    $0x5c,%ebx
80101464:	83 c0 0c             	add    $0xc,%eax
80101467:	83 c4 0c             	add    $0xc,%esp
8010146a:	6a 34                	push   $0x34
8010146c:	53                   	push   %ebx
8010146d:	50                   	push   %eax
<<<<<<< HEAD
8010146e:	e8 f6 28 00 00       	call   80103d69 <memmove>
=======
8010146e:	e8 a2 28 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
  log_write(bp);
80101473:	89 34 24             	mov    %esi,(%esp)
80101476:	e8 2c 14 00 00       	call   801028a7 <log_write>
  brelse(bp);
8010147b:	89 34 24             	mov    %esi,(%esp)
8010147e:	e8 52 ed ff ff       	call   801001d5 <brelse>
}
80101483:	83 c4 10             	add    $0x10,%esp
80101486:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101489:	5b                   	pop    %ebx
8010148a:	5e                   	pop    %esi
8010148b:	5d                   	pop    %ebp
8010148c:	c3                   	ret    

8010148d <itrunc>:
{
8010148d:	55                   	push   %ebp
8010148e:	89 e5                	mov    %esp,%ebp
80101490:	57                   	push   %edi
80101491:	56                   	push   %esi
80101492:	53                   	push   %ebx
80101493:	83 ec 1c             	sub    $0x1c,%esp
80101496:	89 c6                	mov    %eax,%esi
  for(i = 0; i < NDIRECT; i++){
80101498:	bb 00 00 00 00       	mov    $0x0,%ebx
8010149d:	eb 03                	jmp    801014a2 <itrunc+0x15>
8010149f:	83 c3 01             	add    $0x1,%ebx
801014a2:	83 fb 0b             	cmp    $0xb,%ebx
801014a5:	7f 19                	jg     801014c0 <itrunc+0x33>
    if(ip->addrs[i]){
801014a7:	8b 54 9e 5c          	mov    0x5c(%esi,%ebx,4),%edx
801014ab:	85 d2                	test   %edx,%edx
801014ad:	74 f0                	je     8010149f <itrunc+0x12>
      bfree(ip->dev, ip->addrs[i]);
801014af:	8b 06                	mov    (%esi),%eax
801014b1:	e8 3d fb ff ff       	call   80100ff3 <bfree>
      ip->addrs[i] = 0;
801014b6:	c7 44 9e 5c 00 00 00 	movl   $0x0,0x5c(%esi,%ebx,4)
801014bd:	00 
801014be:	eb df                	jmp    8010149f <itrunc+0x12>
  if(ip->addrs[NDIRECT]){
801014c0:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
801014c6:	85 c0                	test   %eax,%eax
801014c8:	75 1b                	jne    801014e5 <itrunc+0x58>
  ip->size = 0;
801014ca:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
801014d1:	83 ec 0c             	sub    $0xc,%esp
801014d4:	56                   	push   %esi
801014d5:	e8 34 ff ff ff       	call   8010140e <iupdate>
}
801014da:	83 c4 10             	add    $0x10,%esp
801014dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014e0:	5b                   	pop    %ebx
801014e1:	5e                   	pop    %esi
801014e2:	5f                   	pop    %edi
801014e3:	5d                   	pop    %ebp
801014e4:	c3                   	ret    
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801014e5:	83 ec 08             	sub    $0x8,%esp
801014e8:	50                   	push   %eax
801014e9:	ff 36                	push   (%esi)
801014eb:	e8 7c ec ff ff       	call   8010016c <bread>
801014f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801014f3:	8d 78 5c             	lea    0x5c(%eax),%edi
    for(j = 0; j < NINDIRECT; j++){
801014f6:	83 c4 10             	add    $0x10,%esp
801014f9:	bb 00 00 00 00       	mov    $0x0,%ebx
801014fe:	eb 03                	jmp    80101503 <itrunc+0x76>
80101500:	83 c3 01             	add    $0x1,%ebx
80101503:	83 fb 7f             	cmp    $0x7f,%ebx
80101506:	77 10                	ja     80101518 <itrunc+0x8b>
      if(a[j])
80101508:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
8010150b:	85 d2                	test   %edx,%edx
8010150d:	74 f1                	je     80101500 <itrunc+0x73>
        bfree(ip->dev, a[j]);
8010150f:	8b 06                	mov    (%esi),%eax
80101511:	e8 dd fa ff ff       	call   80100ff3 <bfree>
80101516:	eb e8                	jmp    80101500 <itrunc+0x73>
    brelse(bp);
80101518:	83 ec 0c             	sub    $0xc,%esp
8010151b:	ff 75 e4             	push   -0x1c(%ebp)
8010151e:	e8 b2 ec ff ff       	call   801001d5 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101523:	8b 06                	mov    (%esi),%eax
80101525:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
8010152b:	e8 c3 fa ff ff       	call   80100ff3 <bfree>
    ip->addrs[NDIRECT] = 0;
80101530:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101537:	00 00 00 
8010153a:	83 c4 10             	add    $0x10,%esp
8010153d:	eb 8b                	jmp    801014ca <itrunc+0x3d>

8010153f <idup>:
{
8010153f:	55                   	push   %ebp
80101540:	89 e5                	mov    %esp,%ebp
80101542:	53                   	push   %ebx
80101543:	83 ec 10             	sub    $0x10,%esp
80101546:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
<<<<<<< HEAD
80101549:	68 60 f9 10 80       	push   $0x8010f960
8010154e:	e8 f2 26 00 00       	call   80103c45 <acquire>
=======
80101549:	68 60 e9 10 80       	push   $0x8010e960
8010154e:	e8 9e 26 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  ip->ref++;
80101553:	8b 43 08             	mov    0x8(%ebx),%eax
80101556:	83 c0 01             	add    $0x1,%eax
80101559:	89 43 08             	mov    %eax,0x8(%ebx)
  release(&icache.lock);
<<<<<<< HEAD
8010155c:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101563:	e8 42 27 00 00       	call   80103caa <release>
=======
8010155c:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
80101563:	e8 ee 26 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
80101568:	89 d8                	mov    %ebx,%eax
8010156a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010156d:	c9                   	leave  
8010156e:	c3                   	ret    

8010156f <ilock>:
{
8010156f:	55                   	push   %ebp
80101570:	89 e5                	mov    %esp,%ebp
80101572:	56                   	push   %esi
80101573:	53                   	push   %ebx
80101574:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101577:	85 db                	test   %ebx,%ebx
80101579:	74 22                	je     8010159d <ilock+0x2e>
8010157b:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
8010157f:	7e 1c                	jle    8010159d <ilock+0x2e>
  acquiresleep(&ip->lock);
80101581:	83 ec 0c             	sub    $0xc,%esp
80101584:	8d 43 0c             	lea    0xc(%ebx),%eax
80101587:	50                   	push   %eax
<<<<<<< HEAD
80101588:	e8 a4 24 00 00       	call   80103a31 <acquiresleep>
=======
80101588:	e8 50 24 00 00       	call   801039dd <acquiresleep>
>>>>>>> d669a6c (ulib and makefile)
  if(ip->valid == 0){
8010158d:	83 c4 10             	add    $0x10,%esp
80101590:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
80101594:	74 14                	je     801015aa <ilock+0x3b>
}
80101596:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101599:	5b                   	pop    %ebx
8010159a:	5e                   	pop    %esi
8010159b:	5d                   	pop    %ebp
8010159c:	c3                   	ret    
    panic("ilock");
8010159d:	83 ec 0c             	sub    $0xc,%esp
801015a0:	68 8a 67 10 80       	push   $0x8010678a
801015a5:	e8 9e ed ff ff       	call   80100348 <panic>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015aa:	8b 43 04             	mov    0x4(%ebx),%eax
801015ad:	c1 e8 03             	shr    $0x3,%eax
801015b0:	83 ec 08             	sub    $0x8,%esp
801015b3:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801015b9:	50                   	push   %eax
801015ba:	ff 33                	push   (%ebx)
801015bc:	e8 ab eb ff ff       	call   8010016c <bread>
801015c1:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801015c3:	8b 43 04             	mov    0x4(%ebx),%eax
801015c6:	83 e0 07             	and    $0x7,%eax
801015c9:	c1 e0 06             	shl    $0x6,%eax
801015cc:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801015d0:	0f b7 10             	movzwl (%eax),%edx
801015d3:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801015d7:	0f b7 50 02          	movzwl 0x2(%eax),%edx
801015db:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801015df:	0f b7 50 04          	movzwl 0x4(%eax),%edx
801015e3:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801015e7:	0f b7 50 06          	movzwl 0x6(%eax),%edx
801015eb:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801015ef:	8b 50 08             	mov    0x8(%eax),%edx
801015f2:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801015f5:	83 c0 0c             	add    $0xc,%eax
801015f8:	8d 53 5c             	lea    0x5c(%ebx),%edx
801015fb:	83 c4 0c             	add    $0xc,%esp
801015fe:	6a 34                	push   $0x34
80101600:	50                   	push   %eax
80101601:	52                   	push   %edx
<<<<<<< HEAD
80101602:	e8 62 27 00 00       	call   80103d69 <memmove>
=======
80101602:	e8 0e 27 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    brelse(bp);
80101607:	89 34 24             	mov    %esi,(%esp)
8010160a:	e8 c6 eb ff ff       	call   801001d5 <brelse>
    ip->valid = 1;
8010160f:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101616:	83 c4 10             	add    $0x10,%esp
80101619:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010161e:	0f 85 72 ff ff ff    	jne    80101596 <ilock+0x27>
      panic("ilock: no type");
80101624:	83 ec 0c             	sub    $0xc,%esp
80101627:	68 90 67 10 80       	push   $0x80106790
8010162c:	e8 17 ed ff ff       	call   80100348 <panic>

80101631 <iunlock>:
{
80101631:	55                   	push   %ebp
80101632:	89 e5                	mov    %esp,%ebp
80101634:	56                   	push   %esi
80101635:	53                   	push   %ebx
80101636:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101639:	85 db                	test   %ebx,%ebx
8010163b:	74 2c                	je     80101669 <iunlock+0x38>
8010163d:	8d 73 0c             	lea    0xc(%ebx),%esi
80101640:	83 ec 0c             	sub    $0xc,%esp
80101643:	56                   	push   %esi
<<<<<<< HEAD
80101644:	e8 72 24 00 00       	call   80103abb <holdingsleep>
=======
80101644:	e8 1e 24 00 00       	call   80103a67 <holdingsleep>
>>>>>>> d669a6c (ulib and makefile)
80101649:	83 c4 10             	add    $0x10,%esp
8010164c:	85 c0                	test   %eax,%eax
8010164e:	74 19                	je     80101669 <iunlock+0x38>
80101650:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
80101654:	7e 13                	jle    80101669 <iunlock+0x38>
  releasesleep(&ip->lock);
80101656:	83 ec 0c             	sub    $0xc,%esp
80101659:	56                   	push   %esi
<<<<<<< HEAD
8010165a:	e8 21 24 00 00       	call   80103a80 <releasesleep>
=======
8010165a:	e8 cd 23 00 00       	call   80103a2c <releasesleep>
>>>>>>> d669a6c (ulib and makefile)
}
8010165f:	83 c4 10             	add    $0x10,%esp
80101662:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101665:	5b                   	pop    %ebx
80101666:	5e                   	pop    %esi
80101667:	5d                   	pop    %ebp
80101668:	c3                   	ret    
    panic("iunlock");
80101669:	83 ec 0c             	sub    $0xc,%esp
8010166c:	68 9f 67 10 80       	push   $0x8010679f
80101671:	e8 d2 ec ff ff       	call   80100348 <panic>

80101676 <iput>:
{
80101676:	55                   	push   %ebp
80101677:	89 e5                	mov    %esp,%ebp
80101679:	57                   	push   %edi
8010167a:	56                   	push   %esi
8010167b:	53                   	push   %ebx
8010167c:	83 ec 18             	sub    $0x18,%esp
8010167f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
80101682:	8d 73 0c             	lea    0xc(%ebx),%esi
80101685:	56                   	push   %esi
<<<<<<< HEAD
80101686:	e8 a6 23 00 00       	call   80103a31 <acquiresleep>
=======
80101686:	e8 52 23 00 00       	call   801039dd <acquiresleep>
>>>>>>> d669a6c (ulib and makefile)
  if(ip->valid && ip->nlink == 0){
8010168b:	83 c4 10             	add    $0x10,%esp
8010168e:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
80101692:	74 07                	je     8010169b <iput+0x25>
80101694:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101699:	74 35                	je     801016d0 <iput+0x5a>
  releasesleep(&ip->lock);
8010169b:	83 ec 0c             	sub    $0xc,%esp
8010169e:	56                   	push   %esi
<<<<<<< HEAD
8010169f:	e8 dc 23 00 00       	call   80103a80 <releasesleep>
  acquire(&icache.lock);
801016a4:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
801016ab:	e8 95 25 00 00       	call   80103c45 <acquire>
=======
8010169f:	e8 88 23 00 00       	call   80103a2c <releasesleep>
  acquire(&icache.lock);
801016a4:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
801016ab:	e8 41 25 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  ip->ref--;
801016b0:	8b 43 08             	mov    0x8(%ebx),%eax
801016b3:	83 e8 01             	sub    $0x1,%eax
801016b6:	89 43 08             	mov    %eax,0x8(%ebx)
  release(&icache.lock);
<<<<<<< HEAD
801016b9:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
801016c0:	e8 e5 25 00 00       	call   80103caa <release>
=======
801016b9:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
801016c0:	e8 91 25 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
801016c5:	83 c4 10             	add    $0x10,%esp
801016c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801016cb:	5b                   	pop    %ebx
801016cc:	5e                   	pop    %esi
801016cd:	5f                   	pop    %edi
801016ce:	5d                   	pop    %ebp
801016cf:	c3                   	ret    
    acquire(&icache.lock);
801016d0:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801016d3:	68 60 f9 10 80       	push   $0x8010f960
801016d8:	e8 68 25 00 00       	call   80103c45 <acquire>
    int r = ip->ref;
801016dd:	8b 7b 08             	mov    0x8(%ebx),%edi
    release(&icache.lock);
801016e0:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
801016e7:	e8 be 25 00 00       	call   80103caa <release>
=======
801016d3:	68 60 e9 10 80       	push   $0x8010e960
801016d8:	e8 14 25 00 00       	call   80103bf1 <acquire>
    int r = ip->ref;
801016dd:	8b 7b 08             	mov    0x8(%ebx),%edi
    release(&icache.lock);
801016e0:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
801016e7:	e8 6a 25 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
    if(r == 1){
801016ec:	83 c4 10             	add    $0x10,%esp
801016ef:	83 ff 01             	cmp    $0x1,%edi
801016f2:	75 a7                	jne    8010169b <iput+0x25>
      itrunc(ip);
801016f4:	89 d8                	mov    %ebx,%eax
801016f6:	e8 92 fd ff ff       	call   8010148d <itrunc>
      ip->type = 0;
801016fb:	66 c7 43 50 00 00    	movw   $0x0,0x50(%ebx)
      iupdate(ip);
80101701:	83 ec 0c             	sub    $0xc,%esp
80101704:	53                   	push   %ebx
80101705:	e8 04 fd ff ff       	call   8010140e <iupdate>
      ip->valid = 0;
8010170a:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101711:	83 c4 10             	add    $0x10,%esp
80101714:	eb 85                	jmp    8010169b <iput+0x25>

80101716 <iunlockput>:
{
80101716:	55                   	push   %ebp
80101717:	89 e5                	mov    %esp,%ebp
80101719:	53                   	push   %ebx
8010171a:	83 ec 10             	sub    $0x10,%esp
8010171d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
80101720:	53                   	push   %ebx
80101721:	e8 0b ff ff ff       	call   80101631 <iunlock>
  iput(ip);
80101726:	89 1c 24             	mov    %ebx,(%esp)
80101729:	e8 48 ff ff ff       	call   80101676 <iput>
}
8010172e:	83 c4 10             	add    $0x10,%esp
80101731:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101734:	c9                   	leave  
80101735:	c3                   	ret    

80101736 <stati>:
{
80101736:	55                   	push   %ebp
80101737:	89 e5                	mov    %esp,%ebp
80101739:	8b 55 08             	mov    0x8(%ebp),%edx
8010173c:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
8010173f:	8b 0a                	mov    (%edx),%ecx
80101741:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
80101744:	8b 4a 04             	mov    0x4(%edx),%ecx
80101747:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
8010174a:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
8010174e:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
80101751:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101755:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101759:	8b 52 58             	mov    0x58(%edx),%edx
8010175c:	89 50 10             	mov    %edx,0x10(%eax)
}
8010175f:	5d                   	pop    %ebp
80101760:	c3                   	ret    

80101761 <readi>:
{
80101761:	55                   	push   %ebp
80101762:	89 e5                	mov    %esp,%ebp
80101764:	57                   	push   %edi
80101765:	56                   	push   %esi
80101766:	53                   	push   %ebx
80101767:	83 ec 1c             	sub    $0x1c,%esp
8010176a:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(ip->type == T_DEV){
8010176d:	8b 45 08             	mov    0x8(%ebp),%eax
80101770:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101775:	74 2c                	je     801017a3 <readi+0x42>
  if(off > ip->size || off + n < off)
80101777:	8b 45 08             	mov    0x8(%ebp),%eax
8010177a:	8b 40 58             	mov    0x58(%eax),%eax
8010177d:	39 f8                	cmp    %edi,%eax
8010177f:	0f 82 cb 00 00 00    	jb     80101850 <readi+0xef>
80101785:	89 fa                	mov    %edi,%edx
80101787:	03 55 14             	add    0x14(%ebp),%edx
8010178a:	0f 82 c7 00 00 00    	jb     80101857 <readi+0xf6>
  if(off + n > ip->size)
80101790:	39 d0                	cmp    %edx,%eax
80101792:	73 05                	jae    80101799 <readi+0x38>
    n = ip->size - off;
80101794:	29 f8                	sub    %edi,%eax
80101796:	89 45 14             	mov    %eax,0x14(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101799:	be 00 00 00 00       	mov    $0x0,%esi
8010179e:	e9 8f 00 00 00       	jmp    80101832 <readi+0xd1>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801017a3:	0f b7 40 52          	movzwl 0x52(%eax),%eax
801017a7:	66 83 f8 09          	cmp    $0x9,%ax
801017ab:	0f 87 91 00 00 00    	ja     80101842 <readi+0xe1>
801017b1:	98                   	cwtl   
801017b2:	8b 04 c5 00 f9 10 80 	mov    -0x7fef0700(,%eax,8),%eax
801017b9:	85 c0                	test   %eax,%eax
801017bb:	0f 84 88 00 00 00    	je     80101849 <readi+0xe8>
    return devsw[ip->major].read(ip, dst, n);
801017c1:	83 ec 04             	sub    $0x4,%esp
801017c4:	ff 75 14             	push   0x14(%ebp)
801017c7:	ff 75 0c             	push   0xc(%ebp)
801017ca:	ff 75 08             	push   0x8(%ebp)
801017cd:	ff d0                	call   *%eax
801017cf:	83 c4 10             	add    $0x10,%esp
801017d2:	eb 66                	jmp    8010183a <readi+0xd9>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801017d4:	89 fa                	mov    %edi,%edx
801017d6:	c1 ea 09             	shr    $0x9,%edx
801017d9:	8b 45 08             	mov    0x8(%ebp),%eax
801017dc:	e8 70 f9 ff ff       	call   80101151 <bmap>
801017e1:	83 ec 08             	sub    $0x8,%esp
801017e4:	50                   	push   %eax
801017e5:	8b 45 08             	mov    0x8(%ebp),%eax
801017e8:	ff 30                	push   (%eax)
801017ea:	e8 7d e9 ff ff       	call   8010016c <bread>
801017ef:	89 c1                	mov    %eax,%ecx
    m = min(n - tot, BSIZE - off%BSIZE);
801017f1:	89 f8                	mov    %edi,%eax
801017f3:	25 ff 01 00 00       	and    $0x1ff,%eax
801017f8:	bb 00 02 00 00       	mov    $0x200,%ebx
801017fd:	29 c3                	sub    %eax,%ebx
801017ff:	8b 55 14             	mov    0x14(%ebp),%edx
80101802:	29 f2                	sub    %esi,%edx
80101804:	39 d3                	cmp    %edx,%ebx
80101806:	0f 47 da             	cmova  %edx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101809:	83 c4 0c             	add    $0xc,%esp
8010180c:	53                   	push   %ebx
8010180d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101810:	8d 44 01 5c          	lea    0x5c(%ecx,%eax,1),%eax
80101814:	50                   	push   %eax
80101815:	ff 75 0c             	push   0xc(%ebp)
<<<<<<< HEAD
80101818:	e8 4c 25 00 00       	call   80103d69 <memmove>
=======
80101818:	e8 f8 24 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    brelse(bp);
8010181d:	83 c4 04             	add    $0x4,%esp
80101820:	ff 75 e4             	push   -0x1c(%ebp)
80101823:	e8 ad e9 ff ff       	call   801001d5 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101828:	01 de                	add    %ebx,%esi
8010182a:	01 df                	add    %ebx,%edi
8010182c:	01 5d 0c             	add    %ebx,0xc(%ebp)
8010182f:	83 c4 10             	add    $0x10,%esp
80101832:	39 75 14             	cmp    %esi,0x14(%ebp)
80101835:	77 9d                	ja     801017d4 <readi+0x73>
  return n;
80101837:	8b 45 14             	mov    0x14(%ebp),%eax
}
8010183a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010183d:	5b                   	pop    %ebx
8010183e:	5e                   	pop    %esi
8010183f:	5f                   	pop    %edi
80101840:	5d                   	pop    %ebp
80101841:	c3                   	ret    
      return -1;
80101842:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101847:	eb f1                	jmp    8010183a <readi+0xd9>
80101849:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010184e:	eb ea                	jmp    8010183a <readi+0xd9>
    return -1;
80101850:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101855:	eb e3                	jmp    8010183a <readi+0xd9>
80101857:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010185c:	eb dc                	jmp    8010183a <readi+0xd9>

8010185e <writei>:
{
8010185e:	55                   	push   %ebp
8010185f:	89 e5                	mov    %esp,%ebp
80101861:	57                   	push   %edi
80101862:	56                   	push   %esi
80101863:	53                   	push   %ebx
80101864:	83 ec 1c             	sub    $0x1c,%esp
80101867:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(ip->type == T_DEV){
8010186a:	8b 45 08             	mov    0x8(%ebp),%eax
8010186d:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101872:	74 2e                	je     801018a2 <writei+0x44>
  if(off > ip->size || off + n < off)
80101874:	8b 45 08             	mov    0x8(%ebp),%eax
80101877:	39 78 58             	cmp    %edi,0x58(%eax)
8010187a:	0f 82 f5 00 00 00    	jb     80101975 <writei+0x117>
80101880:	89 f8                	mov    %edi,%eax
80101882:	03 45 14             	add    0x14(%ebp),%eax
80101885:	0f 82 f1 00 00 00    	jb     8010197c <writei+0x11e>
  if(off + n > MAXFILE*BSIZE)
8010188b:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101890:	0f 87 ed 00 00 00    	ja     80101983 <writei+0x125>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101896:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010189d:	e9 93 00 00 00       	jmp    80101935 <writei+0xd7>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
801018a2:	0f b7 40 52          	movzwl 0x52(%eax),%eax
801018a6:	66 83 f8 09          	cmp    $0x9,%ax
801018aa:	0f 87 b7 00 00 00    	ja     80101967 <writei+0x109>
801018b0:	98                   	cwtl   
801018b1:	8b 04 c5 04 f9 10 80 	mov    -0x7fef06fc(,%eax,8),%eax
801018b8:	85 c0                	test   %eax,%eax
801018ba:	0f 84 ae 00 00 00    	je     8010196e <writei+0x110>
    return devsw[ip->major].write(ip, src, n);
801018c0:	83 ec 04             	sub    $0x4,%esp
801018c3:	ff 75 14             	push   0x14(%ebp)
801018c6:	ff 75 0c             	push   0xc(%ebp)
801018c9:	ff 75 08             	push   0x8(%ebp)
801018cc:	ff d0                	call   *%eax
801018ce:	83 c4 10             	add    $0x10,%esp
801018d1:	eb 7b                	jmp    8010194e <writei+0xf0>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801018d3:	89 fa                	mov    %edi,%edx
801018d5:	c1 ea 09             	shr    $0x9,%edx
801018d8:	8b 45 08             	mov    0x8(%ebp),%eax
801018db:	e8 71 f8 ff ff       	call   80101151 <bmap>
801018e0:	83 ec 08             	sub    $0x8,%esp
801018e3:	50                   	push   %eax
801018e4:	8b 45 08             	mov    0x8(%ebp),%eax
801018e7:	ff 30                	push   (%eax)
801018e9:	e8 7e e8 ff ff       	call   8010016c <bread>
801018ee:	89 c6                	mov    %eax,%esi
    m = min(n - tot, BSIZE - off%BSIZE);
801018f0:	89 f8                	mov    %edi,%eax
801018f2:	25 ff 01 00 00       	and    $0x1ff,%eax
801018f7:	bb 00 02 00 00       	mov    $0x200,%ebx
801018fc:	29 c3                	sub    %eax,%ebx
801018fe:	8b 55 14             	mov    0x14(%ebp),%edx
80101901:	2b 55 e4             	sub    -0x1c(%ebp),%edx
80101904:	39 d3                	cmp    %edx,%ebx
80101906:	0f 47 da             	cmova  %edx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101909:	83 c4 0c             	add    $0xc,%esp
8010190c:	53                   	push   %ebx
8010190d:	ff 75 0c             	push   0xc(%ebp)
80101910:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101914:	50                   	push   %eax
<<<<<<< HEAD
80101915:	e8 4f 24 00 00       	call   80103d69 <memmove>
=======
80101915:	e8 fb 23 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    log_write(bp);
8010191a:	89 34 24             	mov    %esi,(%esp)
8010191d:	e8 85 0f 00 00       	call   801028a7 <log_write>
    brelse(bp);
80101922:	89 34 24             	mov    %esi,(%esp)
80101925:	e8 ab e8 ff ff       	call   801001d5 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
8010192a:	01 5d e4             	add    %ebx,-0x1c(%ebp)
8010192d:	01 df                	add    %ebx,%edi
8010192f:	01 5d 0c             	add    %ebx,0xc(%ebp)
80101932:	83 c4 10             	add    $0x10,%esp
80101935:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101938:	3b 45 14             	cmp    0x14(%ebp),%eax
8010193b:	72 96                	jb     801018d3 <writei+0x75>
  if(n > 0 && off > ip->size){
8010193d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
80101941:	74 08                	je     8010194b <writei+0xed>
80101943:	8b 45 08             	mov    0x8(%ebp),%eax
80101946:	39 78 58             	cmp    %edi,0x58(%eax)
80101949:	72 0b                	jb     80101956 <writei+0xf8>
  return n;
8010194b:	8b 45 14             	mov    0x14(%ebp),%eax
}
8010194e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101951:	5b                   	pop    %ebx
80101952:	5e                   	pop    %esi
80101953:	5f                   	pop    %edi
80101954:	5d                   	pop    %ebp
80101955:	c3                   	ret    
    ip->size = off;
80101956:	89 78 58             	mov    %edi,0x58(%eax)
    iupdate(ip);
80101959:	83 ec 0c             	sub    $0xc,%esp
8010195c:	50                   	push   %eax
8010195d:	e8 ac fa ff ff       	call   8010140e <iupdate>
80101962:	83 c4 10             	add    $0x10,%esp
80101965:	eb e4                	jmp    8010194b <writei+0xed>
      return -1;
80101967:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010196c:	eb e0                	jmp    8010194e <writei+0xf0>
8010196e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101973:	eb d9                	jmp    8010194e <writei+0xf0>
    return -1;
80101975:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010197a:	eb d2                	jmp    8010194e <writei+0xf0>
8010197c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101981:	eb cb                	jmp    8010194e <writei+0xf0>
    return -1;
80101983:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101988:	eb c4                	jmp    8010194e <writei+0xf0>

8010198a <namecmp>:
{
8010198a:	55                   	push   %ebp
8010198b:	89 e5                	mov    %esp,%ebp
8010198d:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101990:	6a 0e                	push   $0xe
80101992:	ff 75 0c             	push   0xc(%ebp)
80101995:	ff 75 08             	push   0x8(%ebp)
<<<<<<< HEAD
80101998:	e8 38 24 00 00       	call   80103dd5 <strncmp>
=======
80101998:	e8 e4 23 00 00       	call   80103d81 <strncmp>
>>>>>>> d669a6c (ulib and makefile)
}
8010199d:	c9                   	leave  
8010199e:	c3                   	ret    

8010199f <dirlookup>:
{
8010199f:	55                   	push   %ebp
801019a0:	89 e5                	mov    %esp,%ebp
801019a2:	57                   	push   %edi
801019a3:	56                   	push   %esi
801019a4:	53                   	push   %ebx
801019a5:	83 ec 1c             	sub    $0x1c,%esp
801019a8:	8b 75 08             	mov    0x8(%ebp),%esi
801019ab:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(dp->type != T_DIR)
801019ae:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801019b3:	75 07                	jne    801019bc <dirlookup+0x1d>
  for(off = 0; off < dp->size; off += sizeof(de)){
801019b5:	bb 00 00 00 00       	mov    $0x0,%ebx
801019ba:	eb 1d                	jmp    801019d9 <dirlookup+0x3a>
    panic("dirlookup not DIR");
801019bc:	83 ec 0c             	sub    $0xc,%esp
801019bf:	68 a7 67 10 80       	push   $0x801067a7
801019c4:	e8 7f e9 ff ff       	call   80100348 <panic>
      panic("dirlookup read");
801019c9:	83 ec 0c             	sub    $0xc,%esp
801019cc:	68 b9 67 10 80       	push   $0x801067b9
801019d1:	e8 72 e9 ff ff       	call   80100348 <panic>
  for(off = 0; off < dp->size; off += sizeof(de)){
801019d6:	83 c3 10             	add    $0x10,%ebx
801019d9:	39 5e 58             	cmp    %ebx,0x58(%esi)
801019dc:	76 48                	jbe    80101a26 <dirlookup+0x87>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801019de:	6a 10                	push   $0x10
801019e0:	53                   	push   %ebx
801019e1:	8d 45 d8             	lea    -0x28(%ebp),%eax
801019e4:	50                   	push   %eax
801019e5:	56                   	push   %esi
801019e6:	e8 76 fd ff ff       	call   80101761 <readi>
801019eb:	83 c4 10             	add    $0x10,%esp
801019ee:	83 f8 10             	cmp    $0x10,%eax
801019f1:	75 d6                	jne    801019c9 <dirlookup+0x2a>
    if(de.inum == 0)
801019f3:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801019f8:	74 dc                	je     801019d6 <dirlookup+0x37>
    if(namecmp(name, de.name) == 0){
801019fa:	83 ec 08             	sub    $0x8,%esp
801019fd:	8d 45 da             	lea    -0x26(%ebp),%eax
80101a00:	50                   	push   %eax
80101a01:	57                   	push   %edi
80101a02:	e8 83 ff ff ff       	call   8010198a <namecmp>
80101a07:	83 c4 10             	add    $0x10,%esp
80101a0a:	85 c0                	test   %eax,%eax
80101a0c:	75 c8                	jne    801019d6 <dirlookup+0x37>
      if(poff)
80101a0e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80101a12:	74 05                	je     80101a19 <dirlookup+0x7a>
        *poff = off;
80101a14:	8b 45 10             	mov    0x10(%ebp),%eax
80101a17:	89 18                	mov    %ebx,(%eax)
      inum = de.inum;
80101a19:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101a1d:	8b 06                	mov    (%esi),%eax
80101a1f:	e8 d3 f7 ff ff       	call   801011f7 <iget>
80101a24:	eb 05                	jmp    80101a2b <dirlookup+0x8c>
  return 0;
80101a26:	b8 00 00 00 00       	mov    $0x0,%eax
}
80101a2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a2e:	5b                   	pop    %ebx
80101a2f:	5e                   	pop    %esi
80101a30:	5f                   	pop    %edi
80101a31:	5d                   	pop    %ebp
80101a32:	c3                   	ret    

80101a33 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101a33:	55                   	push   %ebp
80101a34:	89 e5                	mov    %esp,%ebp
80101a36:	57                   	push   %edi
80101a37:	56                   	push   %esi
80101a38:	53                   	push   %ebx
80101a39:	83 ec 1c             	sub    $0x1c,%esp
80101a3c:	89 c3                	mov    %eax,%ebx
80101a3e:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101a41:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101a44:	80 38 2f             	cmpb   $0x2f,(%eax)
80101a47:	74 17                	je     80101a60 <namex+0x2d>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101a49:	e8 67 17 00 00       	call   801031b5 <myproc>
80101a4e:	83 ec 0c             	sub    $0xc,%esp
80101a51:	ff 70 68             	push   0x68(%eax)
80101a54:	e8 e6 fa ff ff       	call   8010153f <idup>
80101a59:	89 c6                	mov    %eax,%esi
80101a5b:	83 c4 10             	add    $0x10,%esp
80101a5e:	eb 53                	jmp    80101ab3 <namex+0x80>
    ip = iget(ROOTDEV, ROOTINO);
80101a60:	ba 01 00 00 00       	mov    $0x1,%edx
80101a65:	b8 01 00 00 00       	mov    $0x1,%eax
80101a6a:	e8 88 f7 ff ff       	call   801011f7 <iget>
80101a6f:	89 c6                	mov    %eax,%esi
80101a71:	eb 40                	jmp    80101ab3 <namex+0x80>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
    if(ip->type != T_DIR){
      iunlockput(ip);
80101a73:	83 ec 0c             	sub    $0xc,%esp
80101a76:	56                   	push   %esi
80101a77:	e8 9a fc ff ff       	call   80101716 <iunlockput>
      return 0;
80101a7c:	83 c4 10             	add    $0x10,%esp
80101a7f:	be 00 00 00 00       	mov    $0x0,%esi
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101a84:	89 f0                	mov    %esi,%eax
80101a86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a89:	5b                   	pop    %ebx
80101a8a:	5e                   	pop    %esi
80101a8b:	5f                   	pop    %edi
80101a8c:	5d                   	pop    %ebp
80101a8d:	c3                   	ret    
    if((next = dirlookup(ip, name, 0)) == 0){
80101a8e:	83 ec 04             	sub    $0x4,%esp
80101a91:	6a 00                	push   $0x0
80101a93:	ff 75 e4             	push   -0x1c(%ebp)
80101a96:	56                   	push   %esi
80101a97:	e8 03 ff ff ff       	call   8010199f <dirlookup>
80101a9c:	89 c7                	mov    %eax,%edi
80101a9e:	83 c4 10             	add    $0x10,%esp
80101aa1:	85 c0                	test   %eax,%eax
80101aa3:	74 4a                	je     80101aef <namex+0xbc>
    iunlockput(ip);
80101aa5:	83 ec 0c             	sub    $0xc,%esp
80101aa8:	56                   	push   %esi
80101aa9:	e8 68 fc ff ff       	call   80101716 <iunlockput>
80101aae:	83 c4 10             	add    $0x10,%esp
    ip = next;
80101ab1:	89 fe                	mov    %edi,%esi
  while((path = skipelem(path, name)) != 0){
80101ab3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ab6:	89 d8                	mov    %ebx,%eax
80101ab8:	e8 85 f4 ff ff       	call   80100f42 <skipelem>
80101abd:	89 c3                	mov    %eax,%ebx
80101abf:	85 c0                	test   %eax,%eax
80101ac1:	74 3c                	je     80101aff <namex+0xcc>
    ilock(ip);
80101ac3:	83 ec 0c             	sub    $0xc,%esp
80101ac6:	56                   	push   %esi
80101ac7:	e8 a3 fa ff ff       	call   8010156f <ilock>
    if(ip->type != T_DIR){
80101acc:	83 c4 10             	add    $0x10,%esp
80101acf:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101ad4:	75 9d                	jne    80101a73 <namex+0x40>
    if(nameiparent && *path == '\0'){
80101ad6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80101ada:	74 b2                	je     80101a8e <namex+0x5b>
80101adc:	80 3b 00             	cmpb   $0x0,(%ebx)
80101adf:	75 ad                	jne    80101a8e <namex+0x5b>
      iunlock(ip);
80101ae1:	83 ec 0c             	sub    $0xc,%esp
80101ae4:	56                   	push   %esi
80101ae5:	e8 47 fb ff ff       	call   80101631 <iunlock>
      return ip;
80101aea:	83 c4 10             	add    $0x10,%esp
80101aed:	eb 95                	jmp    80101a84 <namex+0x51>
      iunlockput(ip);
80101aef:	83 ec 0c             	sub    $0xc,%esp
80101af2:	56                   	push   %esi
80101af3:	e8 1e fc ff ff       	call   80101716 <iunlockput>
      return 0;
80101af8:	83 c4 10             	add    $0x10,%esp
80101afb:	89 fe                	mov    %edi,%esi
80101afd:	eb 85                	jmp    80101a84 <namex+0x51>
  if(nameiparent){
80101aff:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80101b03:	0f 84 7b ff ff ff    	je     80101a84 <namex+0x51>
    iput(ip);
80101b09:	83 ec 0c             	sub    $0xc,%esp
80101b0c:	56                   	push   %esi
80101b0d:	e8 64 fb ff ff       	call   80101676 <iput>
    return 0;
80101b12:	83 c4 10             	add    $0x10,%esp
80101b15:	89 de                	mov    %ebx,%esi
80101b17:	e9 68 ff ff ff       	jmp    80101a84 <namex+0x51>

80101b1c <dirlink>:
{
80101b1c:	55                   	push   %ebp
80101b1d:	89 e5                	mov    %esp,%ebp
80101b1f:	57                   	push   %edi
80101b20:	56                   	push   %esi
80101b21:	53                   	push   %ebx
80101b22:	83 ec 20             	sub    $0x20,%esp
80101b25:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b28:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if((ip = dirlookup(dp, name, 0)) != 0){
80101b2b:	6a 00                	push   $0x0
80101b2d:	57                   	push   %edi
80101b2e:	53                   	push   %ebx
80101b2f:	e8 6b fe ff ff       	call   8010199f <dirlookup>
80101b34:	83 c4 10             	add    $0x10,%esp
80101b37:	85 c0                	test   %eax,%eax
80101b39:	75 2d                	jne    80101b68 <dirlink+0x4c>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101b3b:	b8 00 00 00 00       	mov    $0x0,%eax
80101b40:	89 c6                	mov    %eax,%esi
80101b42:	39 43 58             	cmp    %eax,0x58(%ebx)
80101b45:	76 41                	jbe    80101b88 <dirlink+0x6c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101b47:	6a 10                	push   $0x10
80101b49:	50                   	push   %eax
80101b4a:	8d 45 d8             	lea    -0x28(%ebp),%eax
80101b4d:	50                   	push   %eax
80101b4e:	53                   	push   %ebx
80101b4f:	e8 0d fc ff ff       	call   80101761 <readi>
80101b54:	83 c4 10             	add    $0x10,%esp
80101b57:	83 f8 10             	cmp    $0x10,%eax
80101b5a:	75 1f                	jne    80101b7b <dirlink+0x5f>
    if(de.inum == 0)
80101b5c:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101b61:	74 25                	je     80101b88 <dirlink+0x6c>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101b63:	8d 46 10             	lea    0x10(%esi),%eax
80101b66:	eb d8                	jmp    80101b40 <dirlink+0x24>
    iput(ip);
80101b68:	83 ec 0c             	sub    $0xc,%esp
80101b6b:	50                   	push   %eax
80101b6c:	e8 05 fb ff ff       	call   80101676 <iput>
    return -1;
80101b71:	83 c4 10             	add    $0x10,%esp
80101b74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b79:	eb 3d                	jmp    80101bb8 <dirlink+0x9c>
      panic("dirlink read");
80101b7b:	83 ec 0c             	sub    $0xc,%esp
80101b7e:	68 c8 67 10 80       	push   $0x801067c8
80101b83:	e8 c0 e7 ff ff       	call   80100348 <panic>
  strncpy(de.name, name, DIRSIZ);
80101b88:	83 ec 04             	sub    $0x4,%esp
80101b8b:	6a 0e                	push   $0xe
80101b8d:	57                   	push   %edi
80101b8e:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101b91:	8d 45 da             	lea    -0x26(%ebp),%eax
80101b94:	50                   	push   %eax
<<<<<<< HEAD
80101b95:	e8 7a 22 00 00       	call   80103e14 <strncpy>
=======
80101b95:	e8 26 22 00 00       	call   80103dc0 <strncpy>
>>>>>>> d669a6c (ulib and makefile)
  de.inum = inum;
80101b9a:	8b 45 10             	mov    0x10(%ebp),%eax
80101b9d:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ba1:	6a 10                	push   $0x10
80101ba3:	56                   	push   %esi
80101ba4:	57                   	push   %edi
80101ba5:	53                   	push   %ebx
80101ba6:	e8 b3 fc ff ff       	call   8010185e <writei>
80101bab:	83 c4 20             	add    $0x20,%esp
80101bae:	83 f8 10             	cmp    $0x10,%eax
80101bb1:	75 0d                	jne    80101bc0 <dirlink+0xa4>
  return 0;
80101bb3:	b8 00 00 00 00       	mov    $0x0,%eax
}
80101bb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bbb:	5b                   	pop    %ebx
80101bbc:	5e                   	pop    %esi
80101bbd:	5f                   	pop    %edi
80101bbe:	5d                   	pop    %ebp
80101bbf:	c3                   	ret    
    panic("dirlink");
80101bc0:	83 ec 0c             	sub    $0xc,%esp
80101bc3:	68 b8 6d 10 80       	push   $0x80106db8
80101bc8:	e8 7b e7 ff ff       	call   80100348 <panic>

80101bcd <namei>:

struct inode*
namei(char *path)
{
80101bcd:	55                   	push   %ebp
80101bce:	89 e5                	mov    %esp,%ebp
80101bd0:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101bd3:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101bd6:	ba 00 00 00 00       	mov    $0x0,%edx
80101bdb:	8b 45 08             	mov    0x8(%ebp),%eax
80101bde:	e8 50 fe ff ff       	call   80101a33 <namex>
}
80101be3:	c9                   	leave  
80101be4:	c3                   	ret    

80101be5 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101be5:	55                   	push   %ebp
80101be6:	89 e5                	mov    %esp,%ebp
80101be8:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
80101beb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101bee:	ba 01 00 00 00       	mov    $0x1,%edx
80101bf3:	8b 45 08             	mov    0x8(%ebp),%eax
80101bf6:	e8 38 fe ff ff       	call   80101a33 <namex>
}
80101bfb:	c9                   	leave  
80101bfc:	c3                   	ret    

80101bfd <idewait>:
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
{
80101bfd:	89 c1                	mov    %eax,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101bff:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101c04:	ec                   	in     (%dx),%al
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101c05:	89 c2                	mov    %eax,%edx
80101c07:	83 e2 c0             	and    $0xffffffc0,%edx
80101c0a:	80 fa 40             	cmp    $0x40,%dl
80101c0d:	75 f0                	jne    80101bff <idewait+0x2>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80101c0f:	85 c9                	test   %ecx,%ecx
80101c11:	74 09                	je     80101c1c <idewait+0x1f>
80101c13:	a8 21                	test   $0x21,%al
80101c15:	75 08                	jne    80101c1f <idewait+0x22>
    return -1;
  return 0;
80101c17:	b9 00 00 00 00       	mov    $0x0,%ecx
}
80101c1c:	89 c8                	mov    %ecx,%eax
80101c1e:	c3                   	ret    
    return -1;
80101c1f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80101c24:	eb f6                	jmp    80101c1c <idewait+0x1f>

80101c26 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101c26:	55                   	push   %ebp
80101c27:	89 e5                	mov    %esp,%ebp
80101c29:	56                   	push   %esi
80101c2a:	53                   	push   %ebx
  if(b == 0)
80101c2b:	85 c0                	test   %eax,%eax
80101c2d:	0f 84 8f 00 00 00    	je     80101cc2 <idestart+0x9c>
80101c33:	89 c6                	mov    %eax,%esi
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101c35:	8b 58 08             	mov    0x8(%eax),%ebx
80101c38:	81 fb 1f 4e 00 00    	cmp    $0x4e1f,%ebx
80101c3e:	0f 87 8b 00 00 00    	ja     80101ccf <idestart+0xa9>
  int read_cmd = (sector_per_block == 1) ? IDE_CMD_READ :  IDE_CMD_RDMUL;
  int write_cmd = (sector_per_block == 1) ? IDE_CMD_WRITE : IDE_CMD_WRMUL;

  if (sector_per_block > 7) panic("idestart");

  idewait(0);
80101c44:	b8 00 00 00 00       	mov    $0x0,%eax
80101c49:	e8 af ff ff ff       	call   80101bfd <idewait>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101c4e:	b8 00 00 00 00       	mov    $0x0,%eax
80101c53:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101c58:	ee                   	out    %al,(%dx)
80101c59:	b8 01 00 00 00       	mov    $0x1,%eax
80101c5e:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101c63:	ee                   	out    %al,(%dx)
80101c64:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101c69:	89 d8                	mov    %ebx,%eax
80101c6b:	ee                   	out    %al,(%dx)
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101c6c:	0f b6 c7             	movzbl %bh,%eax
80101c6f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101c74:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
80101c75:	89 d8                	mov    %ebx,%eax
80101c77:	c1 f8 10             	sar    $0x10,%eax
80101c7a:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101c7f:	ee                   	out    %al,(%dx)
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101c80:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101c84:	c1 e0 04             	shl    $0x4,%eax
80101c87:	83 e0 10             	and    $0x10,%eax
80101c8a:	c1 fb 18             	sar    $0x18,%ebx
80101c8d:	83 e3 0f             	and    $0xf,%ebx
80101c90:	09 d8                	or     %ebx,%eax
80101c92:	83 c8 e0             	or     $0xffffffe0,%eax
80101c95:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101c9a:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101c9b:	f6 06 04             	testb  $0x4,(%esi)
80101c9e:	74 3c                	je     80101cdc <idestart+0xb6>
80101ca0:	b8 30 00 00 00       	mov    $0x30,%eax
80101ca5:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101caa:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101cab:	83 c6 5c             	add    $0x5c,%esi
  asm volatile("cld; rep outsl" :
80101cae:	b9 80 00 00 00       	mov    $0x80,%ecx
80101cb3:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101cb8:	fc                   	cld    
80101cb9:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101cbb:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101cbe:	5b                   	pop    %ebx
80101cbf:	5e                   	pop    %esi
80101cc0:	5d                   	pop    %ebp
80101cc1:	c3                   	ret    
    panic("idestart");
80101cc2:	83 ec 0c             	sub    $0xc,%esp
80101cc5:	68 2b 68 10 80       	push   $0x8010682b
80101cca:	e8 79 e6 ff ff       	call   80100348 <panic>
    panic("incorrect blockno");
80101ccf:	83 ec 0c             	sub    $0xc,%esp
80101cd2:	68 34 68 10 80       	push   $0x80106834
80101cd7:	e8 6c e6 ff ff       	call   80100348 <panic>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101cdc:	b8 20 00 00 00       	mov    $0x20,%eax
80101ce1:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ce6:	ee                   	out    %al,(%dx)
}
80101ce7:	eb d2                	jmp    80101cbb <idestart+0x95>

80101ce9 <ideinit>:
{
80101ce9:	55                   	push   %ebp
80101cea:	89 e5                	mov    %esp,%ebp
80101cec:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
<<<<<<< HEAD
80101cef:	68 46 68 10 80       	push   $0x80106846
80101cf4:	68 00 16 11 80       	push   $0x80111600
80101cf9:	e8 0b 1e 00 00       	call   80103b09 <initlock>
=======
80101cef:	68 06 68 10 80       	push   $0x80106806
80101cf4:	68 00 06 11 80       	push   $0x80110600
80101cf9:	e8 b7 1d 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
  ioapicenable(IRQ_IDE, ncpu - 1);
80101cfe:	83 c4 08             	add    $0x8,%esp
80101d01:	a1 84 17 11 80       	mov    0x80111784,%eax
80101d06:	83 e8 01             	sub    $0x1,%eax
80101d09:	50                   	push   %eax
80101d0a:	6a 0e                	push   $0xe
80101d0c:	e8 50 02 00 00       	call   80101f61 <ioapicenable>
  idewait(0);
80101d11:	b8 00 00 00 00       	mov    $0x0,%eax
80101d16:	e8 e2 fe ff ff       	call   80101bfd <idewait>
80101d1b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101d20:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101d25:	ee                   	out    %al,(%dx)
  for(i=0; i<1000; i++){
80101d26:	83 c4 10             	add    $0x10,%esp
80101d29:	b9 00 00 00 00       	mov    $0x0,%ecx
80101d2e:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101d34:	7f 19                	jg     80101d4f <ideinit+0x66>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101d36:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101d3b:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80101d3c:	84 c0                	test   %al,%al
80101d3e:	75 05                	jne    80101d45 <ideinit+0x5c>
  for(i=0; i<1000; i++){
80101d40:	83 c1 01             	add    $0x1,%ecx
80101d43:	eb e9                	jmp    80101d2e <ideinit+0x45>
      havedisk1 = 1;
80101d45:	c7 05 e0 15 11 80 01 	movl   $0x1,0x801115e0
80101d4c:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101d4f:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80101d54:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101d59:	ee                   	out    %al,(%dx)
}
80101d5a:	c9                   	leave  
80101d5b:	c3                   	ret    

80101d5c <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80101d5c:	55                   	push   %ebp
80101d5d:	89 e5                	mov    %esp,%ebp
80101d5f:	57                   	push   %edi
80101d60:	53                   	push   %ebx
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80101d61:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101d64:	68 00 16 11 80       	push   $0x80111600
80101d69:	e8 d7 1e 00 00       	call   80103c45 <acquire>
=======
80101d64:	68 00 06 11 80       	push   $0x80110600
80101d69:	e8 83 1e 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)

  if((b = idequeue) == 0){
80101d6e:	8b 1d e4 15 11 80    	mov    0x801115e4,%ebx
80101d74:	83 c4 10             	add    $0x10,%esp
80101d77:	85 db                	test   %ebx,%ebx
80101d79:	74 4a                	je     80101dc5 <ideintr+0x69>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80101d7b:	8b 43 58             	mov    0x58(%ebx),%eax
80101d7e:	a3 e4 15 11 80       	mov    %eax,0x801115e4

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80101d83:	f6 03 04             	testb  $0x4,(%ebx)
80101d86:	74 4f                	je     80101dd7 <ideintr+0x7b>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
80101d88:	8b 03                	mov    (%ebx),%eax
80101d8a:	83 c8 02             	or     $0x2,%eax
80101d8d:	89 03                	mov    %eax,(%ebx)
  b->flags &= ~B_DIRTY;
80101d8f:	83 e0 fb             	and    $0xfffffffb,%eax
80101d92:	89 03                	mov    %eax,(%ebx)
  wakeup(b);
80101d94:	83 ec 0c             	sub    $0xc,%esp
80101d97:	53                   	push   %ebx
<<<<<<< HEAD
80101d98:	e8 12 1b 00 00       	call   801038af <wakeup>
=======
80101d98:	e8 be 1a 00 00       	call   8010385b <wakeup>
>>>>>>> d669a6c (ulib and makefile)

  // Start disk on next buf in queue.
  if(idequeue != 0)
80101d9d:	a1 e4 15 11 80       	mov    0x801115e4,%eax
80101da2:	83 c4 10             	add    $0x10,%esp
80101da5:	85 c0                	test   %eax,%eax
80101da7:	74 05                	je     80101dae <ideintr+0x52>
    idestart(idequeue);
80101da9:	e8 78 fe ff ff       	call   80101c26 <idestart>

  release(&idelock);
80101dae:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101db1:	68 00 16 11 80       	push   $0x80111600
80101db6:	e8 ef 1e 00 00       	call   80103caa <release>
=======
80101db1:	68 00 06 11 80       	push   $0x80110600
80101db6:	e8 9b 1e 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
80101dbb:	83 c4 10             	add    $0x10,%esp
}
80101dbe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101dc1:	5b                   	pop    %ebx
80101dc2:	5f                   	pop    %edi
80101dc3:	5d                   	pop    %ebp
80101dc4:	c3                   	ret    
    release(&idelock);
80101dc5:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101dc8:	68 00 16 11 80       	push   $0x80111600
80101dcd:	e8 d8 1e 00 00       	call   80103caa <release>
=======
80101dc8:	68 00 06 11 80       	push   $0x80110600
80101dcd:	e8 84 1e 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
    return;
80101dd2:	83 c4 10             	add    $0x10,%esp
80101dd5:	eb e7                	jmp    80101dbe <ideintr+0x62>
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80101dd7:	b8 01 00 00 00       	mov    $0x1,%eax
80101ddc:	e8 1c fe ff ff       	call   80101bfd <idewait>
80101de1:	85 c0                	test   %eax,%eax
80101de3:	78 a3                	js     80101d88 <ideintr+0x2c>
    insl(0x1f0, b->data, BSIZE/4);
80101de5:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80101de8:	b9 80 00 00 00       	mov    $0x80,%ecx
80101ded:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101df2:	fc                   	cld    
80101df3:	f3 6d                	rep insl (%dx),%es:(%edi)
}
80101df5:	eb 91                	jmp    80101d88 <ideintr+0x2c>

80101df7 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80101df7:	55                   	push   %ebp
80101df8:	89 e5                	mov    %esp,%ebp
80101dfa:	53                   	push   %ebx
80101dfb:	83 ec 10             	sub    $0x10,%esp
80101dfe:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
80101e01:	8d 43 0c             	lea    0xc(%ebx),%eax
80101e04:	50                   	push   %eax
<<<<<<< HEAD
80101e05:	e8 b1 1c 00 00       	call   80103abb <holdingsleep>
=======
80101e05:	e8 5d 1c 00 00       	call   80103a67 <holdingsleep>
>>>>>>> d669a6c (ulib and makefile)
80101e0a:	83 c4 10             	add    $0x10,%esp
80101e0d:	85 c0                	test   %eax,%eax
80101e0f:	74 37                	je     80101e48 <iderw+0x51>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
80101e11:	8b 03                	mov    (%ebx),%eax
80101e13:	83 e0 06             	and    $0x6,%eax
80101e16:	83 f8 02             	cmp    $0x2,%eax
80101e19:	74 3a                	je     80101e55 <iderw+0x5e>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
80101e1b:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
80101e1f:	74 09                	je     80101e2a <iderw+0x33>
80101e21:	83 3d e0 15 11 80 00 	cmpl   $0x0,0x801115e0
80101e28:	74 38                	je     80101e62 <iderw+0x6b>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80101e2a:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101e2d:	68 00 16 11 80       	push   $0x80111600
80101e32:	e8 0e 1e 00 00       	call   80103c45 <acquire>
=======
80101e2d:	68 00 06 11 80       	push   $0x80110600
80101e32:	e8 ba 1d 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)

  // Append b to idequeue.
  b->qnext = 0;
80101e37:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80101e3e:	83 c4 10             	add    $0x10,%esp
80101e41:	ba e4 15 11 80       	mov    $0x801115e4,%edx
80101e46:	eb 2a                	jmp    80101e72 <iderw+0x7b>
    panic("iderw: buf not locked");
80101e48:	83 ec 0c             	sub    $0xc,%esp
80101e4b:	68 4a 68 10 80       	push   $0x8010684a
80101e50:	e8 f3 e4 ff ff       	call   80100348 <panic>
    panic("iderw: nothing to do");
80101e55:	83 ec 0c             	sub    $0xc,%esp
80101e58:	68 60 68 10 80       	push   $0x80106860
80101e5d:	e8 e6 e4 ff ff       	call   80100348 <panic>
    panic("iderw: ide disk 1 not present");
80101e62:	83 ec 0c             	sub    $0xc,%esp
80101e65:	68 75 68 10 80       	push   $0x80106875
80101e6a:	e8 d9 e4 ff ff       	call   80100348 <panic>
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80101e6f:	8d 50 58             	lea    0x58(%eax),%edx
80101e72:	8b 02                	mov    (%edx),%eax
80101e74:	85 c0                	test   %eax,%eax
80101e76:	75 f7                	jne    80101e6f <iderw+0x78>
    ;
  *pp = b;
80101e78:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80101e7a:	39 1d e4 15 11 80    	cmp    %ebx,0x801115e4
80101e80:	75 1a                	jne    80101e9c <iderw+0xa5>
    idestart(b);
80101e82:	89 d8                	mov    %ebx,%eax
80101e84:	e8 9d fd ff ff       	call   80101c26 <idestart>
80101e89:	eb 11                	jmp    80101e9c <iderw+0xa5>

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
80101e8b:	83 ec 08             	sub    $0x8,%esp
80101e8e:	68 00 16 11 80       	push   $0x80111600
80101e93:	53                   	push   %ebx
<<<<<<< HEAD
80101e94:	e8 b1 18 00 00       	call   8010374a <sleep>
=======
80101e94:	e8 5d 18 00 00       	call   801036f6 <sleep>
>>>>>>> d669a6c (ulib and makefile)
80101e99:	83 c4 10             	add    $0x10,%esp
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80101e9c:	8b 03                	mov    (%ebx),%eax
80101e9e:	83 e0 06             	and    $0x6,%eax
80101ea1:	83 f8 02             	cmp    $0x2,%eax
80101ea4:	75 e5                	jne    80101e8b <iderw+0x94>
  }


  release(&idelock);
80101ea6:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101ea9:	68 00 16 11 80       	push   $0x80111600
80101eae:	e8 f7 1d 00 00       	call   80103caa <release>
=======
80101ea9:	68 00 06 11 80       	push   $0x80110600
80101eae:	e8 a3 1d 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
80101eb3:	83 c4 10             	add    $0x10,%esp
80101eb6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101eb9:	c9                   	leave  
80101eba:	c3                   	ret    

80101ebb <ioapicread>:
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80101ebb:	8b 15 34 16 11 80    	mov    0x80111634,%edx
80101ec1:	89 02                	mov    %eax,(%edx)
  return ioapic->data;
80101ec3:	a1 34 16 11 80       	mov    0x80111634,%eax
80101ec8:	8b 40 10             	mov    0x10(%eax),%eax
}
80101ecb:	c3                   	ret    

80101ecc <ioapicwrite>:

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80101ecc:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80101ed2:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80101ed4:	a1 34 16 11 80       	mov    0x80111634,%eax
80101ed9:	89 50 10             	mov    %edx,0x10(%eax)
}
80101edc:	c3                   	ret    

80101edd <ioapicinit>:

void
ioapicinit(void)
{
80101edd:	55                   	push   %ebp
80101ede:	89 e5                	mov    %esp,%ebp
80101ee0:	57                   	push   %edi
80101ee1:	56                   	push   %esi
80101ee2:	53                   	push   %ebx
80101ee3:	83 ec 0c             	sub    $0xc,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80101ee6:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
80101eed:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80101ef0:	b8 01 00 00 00       	mov    $0x1,%eax
80101ef5:	e8 c1 ff ff ff       	call   80101ebb <ioapicread>
80101efa:	c1 e8 10             	shr    $0x10,%eax
80101efd:	0f b6 f8             	movzbl %al,%edi
  id = ioapicread(REG_ID) >> 24;
80101f00:	b8 00 00 00 00       	mov    $0x0,%eax
80101f05:	e8 b1 ff ff ff       	call   80101ebb <ioapicread>
80101f0a:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80101f0d:	0f b6 15 80 17 11 80 	movzbl 0x80111780,%edx
80101f14:	39 c2                	cmp    %eax,%edx
80101f16:	75 07                	jne    80101f1f <ioapicinit+0x42>
{
80101f18:	bb 00 00 00 00       	mov    $0x0,%ebx
80101f1d:	eb 36                	jmp    80101f55 <ioapicinit+0x78>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80101f1f:	83 ec 0c             	sub    $0xc,%esp
80101f22:	68 94 68 10 80       	push   $0x80106894
80101f27:	e8 db e6 ff ff       	call   80100607 <cprintf>
80101f2c:	83 c4 10             	add    $0x10,%esp
80101f2f:	eb e7                	jmp    80101f18 <ioapicinit+0x3b>

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80101f31:	8d 53 20             	lea    0x20(%ebx),%edx
80101f34:	81 ca 00 00 01 00    	or     $0x10000,%edx
80101f3a:	8d 74 1b 10          	lea    0x10(%ebx,%ebx,1),%esi
80101f3e:	89 f0                	mov    %esi,%eax
80101f40:	e8 87 ff ff ff       	call   80101ecc <ioapicwrite>
    ioapicwrite(REG_TABLE+2*i+1, 0);
80101f45:	8d 46 01             	lea    0x1(%esi),%eax
80101f48:	ba 00 00 00 00       	mov    $0x0,%edx
80101f4d:	e8 7a ff ff ff       	call   80101ecc <ioapicwrite>
  for(i = 0; i <= maxintr; i++){
80101f52:	83 c3 01             	add    $0x1,%ebx
80101f55:	39 fb                	cmp    %edi,%ebx
80101f57:	7e d8                	jle    80101f31 <ioapicinit+0x54>
  }
}
80101f59:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f5c:	5b                   	pop    %ebx
80101f5d:	5e                   	pop    %esi
80101f5e:	5f                   	pop    %edi
80101f5f:	5d                   	pop    %ebp
80101f60:	c3                   	ret    

80101f61 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80101f61:	55                   	push   %ebp
80101f62:	89 e5                	mov    %esp,%ebp
80101f64:	53                   	push   %ebx
80101f65:	83 ec 04             	sub    $0x4,%esp
80101f68:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
80101f6b:	8d 50 20             	lea    0x20(%eax),%edx
80101f6e:	8d 5c 00 10          	lea    0x10(%eax,%eax,1),%ebx
80101f72:	89 d8                	mov    %ebx,%eax
80101f74:	e8 53 ff ff ff       	call   80101ecc <ioapicwrite>
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80101f79:	8b 55 0c             	mov    0xc(%ebp),%edx
80101f7c:	c1 e2 18             	shl    $0x18,%edx
80101f7f:	8d 43 01             	lea    0x1(%ebx),%eax
80101f82:	e8 45 ff ff ff       	call   80101ecc <ioapicwrite>
}
80101f87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101f8a:	c9                   	leave  
80101f8b:	c3                   	ret    

80101f8c <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80101f8c:	55                   	push   %ebp
80101f8d:	89 e5                	mov    %esp,%ebp
80101f8f:	53                   	push   %ebx
80101f90:	83 ec 04             	sub    $0x4,%esp
80101f93:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
80101f96:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80101f9c:	75 4c                	jne    80101fea <kfree+0x5e>
80101f9e:	81 fb d0 54 11 80    	cmp    $0x801154d0,%ebx
80101fa4:	72 44                	jb     80101fea <kfree+0x5e>
80101fa6:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80101fac:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80101fb1:	77 37                	ja     80101fea <kfree+0x5e>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80101fb3:	83 ec 04             	sub    $0x4,%esp
80101fb6:	68 00 10 00 00       	push   $0x1000
80101fbb:	6a 01                	push   $0x1
80101fbd:	53                   	push   %ebx
<<<<<<< HEAD
80101fbe:	e8 2e 1d 00 00       	call   80103cf1 <memset>
=======
80101fbe:	e8 da 1c 00 00       	call   80103c9d <memset>
>>>>>>> d669a6c (ulib and makefile)

  if(kmem.use_lock)
80101fc3:	83 c4 10             	add    $0x10,%esp
80101fc6:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
80101fcd:	75 28                	jne    80101ff7 <kfree+0x6b>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80101fcf:	a1 78 16 11 80       	mov    0x80111678,%eax
80101fd4:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
80101fd6:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
  if(kmem.use_lock)
80101fdc:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
80101fe3:	75 24                	jne    80102009 <kfree+0x7d>
    release(&kmem.lock);
}
80101fe5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101fe8:	c9                   	leave  
80101fe9:	c3                   	ret    
    panic("kfree");
80101fea:	83 ec 0c             	sub    $0xc,%esp
80101fed:	68 c6 68 10 80       	push   $0x801068c6
80101ff2:	e8 51 e3 ff ff       	call   80100348 <panic>
    acquire(&kmem.lock);
80101ff7:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80101ffa:	68 40 16 11 80       	push   $0x80111640
80101fff:	e8 41 1c 00 00       	call   80103c45 <acquire>
=======
80101ffa:	68 40 06 11 80       	push   $0x80110640
80101fff:	e8 ed 1b 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
80102004:	83 c4 10             	add    $0x10,%esp
80102007:	eb c6                	jmp    80101fcf <kfree+0x43>
    release(&kmem.lock);
80102009:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010200c:	68 40 16 11 80       	push   $0x80111640
80102011:	e8 94 1c 00 00       	call   80103caa <release>
=======
8010200c:	68 40 06 11 80       	push   $0x80110640
80102011:	e8 40 1c 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
80102016:	83 c4 10             	add    $0x10,%esp
}
80102019:	eb ca                	jmp    80101fe5 <kfree+0x59>

8010201b <freerange>:
{
8010201b:	55                   	push   %ebp
8010201c:	89 e5                	mov    %esp,%ebp
8010201e:	56                   	push   %esi
8010201f:	53                   	push   %ebx
80102020:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102023:	8b 45 08             	mov    0x8(%ebp),%eax
80102026:	05 ff 0f 00 00       	add    $0xfff,%eax
8010202b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102030:	eb 0e                	jmp    80102040 <freerange+0x25>
    kfree(p);
80102032:	83 ec 0c             	sub    $0xc,%esp
80102035:	50                   	push   %eax
80102036:	e8 51 ff ff ff       	call   80101f8c <kfree>
8010203b:	83 c4 10             	add    $0x10,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010203e:	89 f0                	mov    %esi,%eax
80102040:	8d b0 00 10 00 00    	lea    0x1000(%eax),%esi
80102046:	39 de                	cmp    %ebx,%esi
80102048:	76 e8                	jbe    80102032 <freerange+0x17>
}
8010204a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010204d:	5b                   	pop    %ebx
8010204e:	5e                   	pop    %esi
8010204f:	5d                   	pop    %ebp
80102050:	c3                   	ret    

80102051 <kinit1>:
{
80102051:	55                   	push   %ebp
80102052:	89 e5                	mov    %esp,%ebp
80102054:	83 ec 10             	sub    $0x10,%esp
  initlock(&kmem.lock, "kmem");
<<<<<<< HEAD
80102057:	68 cc 68 10 80       	push   $0x801068cc
8010205c:	68 40 16 11 80       	push   $0x80111640
80102061:	e8 a3 1a 00 00       	call   80103b09 <initlock>
=======
80102057:	68 8c 68 10 80       	push   $0x8010688c
8010205c:	68 40 06 11 80       	push   $0x80110640
80102061:	e8 4f 1a 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
  kmem.use_lock = 0;
80102066:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
8010206d:	00 00 00 
  freerange(vstart, vend);
80102070:	83 c4 08             	add    $0x8,%esp
80102073:	ff 75 0c             	push   0xc(%ebp)
80102076:	ff 75 08             	push   0x8(%ebp)
80102079:	e8 9d ff ff ff       	call   8010201b <freerange>
}
8010207e:	83 c4 10             	add    $0x10,%esp
80102081:	c9                   	leave  
80102082:	c3                   	ret    

80102083 <kinit2>:
{
80102083:	55                   	push   %ebp
80102084:	89 e5                	mov    %esp,%ebp
80102086:	83 ec 10             	sub    $0x10,%esp
  freerange(vstart, vend);
80102089:	ff 75 0c             	push   0xc(%ebp)
8010208c:	ff 75 08             	push   0x8(%ebp)
8010208f:	e8 87 ff ff ff       	call   8010201b <freerange>
  kmem.use_lock = 1;
80102094:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
8010209b:	00 00 00 
}
8010209e:	83 c4 10             	add    $0x10,%esp
801020a1:	c9                   	leave  
801020a2:	c3                   	ret    

801020a3 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801020a3:	55                   	push   %ebp
801020a4:	89 e5                	mov    %esp,%ebp
801020a6:	53                   	push   %ebx
801020a7:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
801020aa:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
801020b1:	75 21                	jne    801020d4 <kalloc+0x31>
    acquire(&kmem.lock);
  r = kmem.freelist;
801020b3:	8b 1d 78 16 11 80    	mov    0x80111678,%ebx
  if(r)
801020b9:	85 db                	test   %ebx,%ebx
801020bb:	74 07                	je     801020c4 <kalloc+0x21>
    kmem.freelist = r->next;
801020bd:	8b 03                	mov    (%ebx),%eax
801020bf:	a3 78 16 11 80       	mov    %eax,0x80111678
  if(kmem.use_lock)
801020c4:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
801020cb:	75 19                	jne    801020e6 <kalloc+0x43>
    release(&kmem.lock);
  return (char*)r;
}
801020cd:	89 d8                	mov    %ebx,%eax
801020cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801020d2:	c9                   	leave  
801020d3:	c3                   	ret    
    acquire(&kmem.lock);
801020d4:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801020d7:	68 40 16 11 80       	push   $0x80111640
801020dc:	e8 64 1b 00 00       	call   80103c45 <acquire>
=======
801020d7:	68 40 06 11 80       	push   $0x80110640
801020dc:	e8 10 1b 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
801020e1:	83 c4 10             	add    $0x10,%esp
801020e4:	eb cd                	jmp    801020b3 <kalloc+0x10>
    release(&kmem.lock);
801020e6:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801020e9:	68 40 16 11 80       	push   $0x80111640
801020ee:	e8 b7 1b 00 00       	call   80103caa <release>
=======
801020e9:	68 40 06 11 80       	push   $0x80110640
801020ee:	e8 63 1b 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
801020f3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
801020f6:	eb d5                	jmp    801020cd <kalloc+0x2a>

801020f8 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020f8:	ba 64 00 00 00       	mov    $0x64,%edx
801020fd:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801020fe:	a8 01                	test   $0x1,%al
80102100:	0f 84 b4 00 00 00    	je     801021ba <kbdgetc+0xc2>
80102106:	ba 60 00 00 00       	mov    $0x60,%edx
8010210b:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
8010210c:	0f b6 c8             	movzbl %al,%ecx

  if(data == 0xE0){
8010210f:	3c e0                	cmp    $0xe0,%al
80102111:	74 61                	je     80102174 <kbdgetc+0x7c>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102113:	84 c0                	test   %al,%al
80102115:	78 6a                	js     80102181 <kbdgetc+0x89>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102117:	8b 15 7c 16 11 80    	mov    0x8011167c,%edx
8010211d:	f6 c2 40             	test   $0x40,%dl
80102120:	74 0f                	je     80102131 <kbdgetc+0x39>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102122:	83 c8 80             	or     $0xffffff80,%eax
80102125:	0f b6 c8             	movzbl %al,%ecx
    shift &= ~E0ESC;
80102128:	83 e2 bf             	and    $0xffffffbf,%edx
8010212b:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
  }

  shift |= shiftcode[data];
80102131:	0f b6 91 00 6a 10 80 	movzbl -0x7fef9600(%ecx),%edx
80102138:	0b 15 7c 16 11 80    	or     0x8011167c,%edx
8010213e:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
  shift ^= togglecode[data];
80102144:	0f b6 81 00 69 10 80 	movzbl -0x7fef9700(%ecx),%eax
8010214b:	31 c2                	xor    %eax,%edx
8010214d:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
  c = charcode[shift & (CTL | SHIFT)][data];
80102153:	89 d0                	mov    %edx,%eax
80102155:	83 e0 03             	and    $0x3,%eax
80102158:	8b 04 85 e0 68 10 80 	mov    -0x7fef9720(,%eax,4),%eax
8010215f:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
80102163:	f6 c2 08             	test   $0x8,%dl
80102166:	74 57                	je     801021bf <kbdgetc+0xc7>
    if('a' <= c && c <= 'z')
80102168:	8d 50 9f             	lea    -0x61(%eax),%edx
8010216b:	83 fa 19             	cmp    $0x19,%edx
8010216e:	77 3e                	ja     801021ae <kbdgetc+0xb6>
      c += 'A' - 'a';
80102170:	83 e8 20             	sub    $0x20,%eax
80102173:	c3                   	ret    
    shift |= E0ESC;
80102174:	83 0d 7c 16 11 80 40 	orl    $0x40,0x8011167c
    return 0;
8010217b:	b8 00 00 00 00       	mov    $0x0,%eax
80102180:	c3                   	ret    
    data = (shift & E0ESC ? data : data & 0x7F);
80102181:	8b 15 7c 16 11 80    	mov    0x8011167c,%edx
80102187:	f6 c2 40             	test   $0x40,%dl
8010218a:	75 05                	jne    80102191 <kbdgetc+0x99>
8010218c:	89 c1                	mov    %eax,%ecx
8010218e:	83 e1 7f             	and    $0x7f,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
80102191:	0f b6 81 00 6a 10 80 	movzbl -0x7fef9600(%ecx),%eax
80102198:	83 c8 40             	or     $0x40,%eax
8010219b:	0f b6 c0             	movzbl %al,%eax
8010219e:	f7 d0                	not    %eax
801021a0:	21 c2                	and    %eax,%edx
801021a2:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
    return 0;
801021a8:	b8 00 00 00 00       	mov    $0x0,%eax
801021ad:	c3                   	ret    
    else if('A' <= c && c <= 'Z')
801021ae:	8d 50 bf             	lea    -0x41(%eax),%edx
801021b1:	83 fa 19             	cmp    $0x19,%edx
801021b4:	77 09                	ja     801021bf <kbdgetc+0xc7>
      c += 'a' - 'A';
801021b6:	83 c0 20             	add    $0x20,%eax
  }
  return c;
801021b9:	c3                   	ret    
    return -1;
801021ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801021bf:	c3                   	ret    

801021c0 <kbdintr>:

void
kbdintr(void)
{
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801021c6:	68 f8 20 10 80       	push   $0x801020f8
801021cb:	e8 63 e5 ff ff       	call   80100733 <consoleintr>
}
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	c9                   	leave  
801021d4:	c3                   	ret    

801021d5 <lapicw>:

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801021d5:	8b 0d 80 16 11 80    	mov    0x80111680,%ecx
801021db:	8d 04 81             	lea    (%ecx,%eax,4),%eax
801021de:	89 10                	mov    %edx,(%eax)
  lapic[ID];  // wait for write to finish, by reading
801021e0:	a1 80 16 11 80       	mov    0x80111680,%eax
801021e5:	8b 40 20             	mov    0x20(%eax),%eax
}
801021e8:	c3                   	ret    

801021e9 <cmos_read>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801021e9:	ba 70 00 00 00       	mov    $0x70,%edx
801021ee:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801021ef:	ba 71 00 00 00       	mov    $0x71,%edx
801021f4:	ec                   	in     (%dx),%al
cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
801021f5:	0f b6 c0             	movzbl %al,%eax
}
801021f8:	c3                   	ret    

801021f9 <fill_rtcdate>:

static void
fill_rtcdate(struct rtcdate *r)
{
801021f9:	55                   	push   %ebp
801021fa:	89 e5                	mov    %esp,%ebp
801021fc:	53                   	push   %ebx
801021fd:	83 ec 04             	sub    $0x4,%esp
80102200:	89 c3                	mov    %eax,%ebx
  r->second = cmos_read(SECS);
80102202:	b8 00 00 00 00       	mov    $0x0,%eax
80102207:	e8 dd ff ff ff       	call   801021e9 <cmos_read>
8010220c:	89 03                	mov    %eax,(%ebx)
  r->minute = cmos_read(MINS);
8010220e:	b8 02 00 00 00       	mov    $0x2,%eax
80102213:	e8 d1 ff ff ff       	call   801021e9 <cmos_read>
80102218:	89 43 04             	mov    %eax,0x4(%ebx)
  r->hour   = cmos_read(HOURS);
8010221b:	b8 04 00 00 00       	mov    $0x4,%eax
80102220:	e8 c4 ff ff ff       	call   801021e9 <cmos_read>
80102225:	89 43 08             	mov    %eax,0x8(%ebx)
  r->day    = cmos_read(DAY);
80102228:	b8 07 00 00 00       	mov    $0x7,%eax
8010222d:	e8 b7 ff ff ff       	call   801021e9 <cmos_read>
80102232:	89 43 0c             	mov    %eax,0xc(%ebx)
  r->month  = cmos_read(MONTH);
80102235:	b8 08 00 00 00       	mov    $0x8,%eax
8010223a:	e8 aa ff ff ff       	call   801021e9 <cmos_read>
8010223f:	89 43 10             	mov    %eax,0x10(%ebx)
  r->year   = cmos_read(YEAR);
80102242:	b8 09 00 00 00       	mov    $0x9,%eax
80102247:	e8 9d ff ff ff       	call   801021e9 <cmos_read>
8010224c:	89 43 14             	mov    %eax,0x14(%ebx)
}
8010224f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102252:	c9                   	leave  
80102253:	c3                   	ret    

80102254 <lapicinit>:
  if(!lapic)
80102254:	83 3d 80 16 11 80 00 	cmpl   $0x0,0x80111680
8010225b:	0f 84 fe 00 00 00    	je     8010235f <lapicinit+0x10b>
{
80102261:	55                   	push   %ebp
80102262:	89 e5                	mov    %esp,%ebp
80102264:	83 ec 08             	sub    $0x8,%esp
  lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
80102267:	ba 3f 01 00 00       	mov    $0x13f,%edx
8010226c:	b8 3c 00 00 00       	mov    $0x3c,%eax
80102271:	e8 5f ff ff ff       	call   801021d5 <lapicw>
  lapicw(TDCR, X1);
80102276:	ba 0b 00 00 00       	mov    $0xb,%edx
8010227b:	b8 f8 00 00 00       	mov    $0xf8,%eax
80102280:	e8 50 ff ff ff       	call   801021d5 <lapicw>
  lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
80102285:	ba 20 00 02 00       	mov    $0x20020,%edx
8010228a:	b8 c8 00 00 00       	mov    $0xc8,%eax
8010228f:	e8 41 ff ff ff       	call   801021d5 <lapicw>
  lapicw(TICR, 10000000);
80102294:	ba 80 96 98 00       	mov    $0x989680,%edx
80102299:	b8 e0 00 00 00       	mov    $0xe0,%eax
8010229e:	e8 32 ff ff ff       	call   801021d5 <lapicw>
  lapicw(LINT0, MASKED);
801022a3:	ba 00 00 01 00       	mov    $0x10000,%edx
801022a8:	b8 d4 00 00 00       	mov    $0xd4,%eax
801022ad:	e8 23 ff ff ff       	call   801021d5 <lapicw>
  lapicw(LINT1, MASKED);
801022b2:	ba 00 00 01 00       	mov    $0x10000,%edx
801022b7:	b8 d8 00 00 00       	mov    $0xd8,%eax
801022bc:	e8 14 ff ff ff       	call   801021d5 <lapicw>
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801022c1:	a1 80 16 11 80       	mov    0x80111680,%eax
801022c6:	8b 40 30             	mov    0x30(%eax),%eax
801022c9:	c1 e8 10             	shr    $0x10,%eax
801022cc:	a8 fc                	test   $0xfc,%al
801022ce:	75 7b                	jne    8010234b <lapicinit+0xf7>
  lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
801022d0:	ba 33 00 00 00       	mov    $0x33,%edx
801022d5:	b8 dc 00 00 00       	mov    $0xdc,%eax
801022da:	e8 f6 fe ff ff       	call   801021d5 <lapicw>
  lapicw(ESR, 0);
801022df:	ba 00 00 00 00       	mov    $0x0,%edx
801022e4:	b8 a0 00 00 00       	mov    $0xa0,%eax
801022e9:	e8 e7 fe ff ff       	call   801021d5 <lapicw>
  lapicw(ESR, 0);
801022ee:	ba 00 00 00 00       	mov    $0x0,%edx
801022f3:	b8 a0 00 00 00       	mov    $0xa0,%eax
801022f8:	e8 d8 fe ff ff       	call   801021d5 <lapicw>
  lapicw(EOI, 0);
801022fd:	ba 00 00 00 00       	mov    $0x0,%edx
80102302:	b8 2c 00 00 00       	mov    $0x2c,%eax
80102307:	e8 c9 fe ff ff       	call   801021d5 <lapicw>
  lapicw(ICRHI, 0);
8010230c:	ba 00 00 00 00       	mov    $0x0,%edx
80102311:	b8 c4 00 00 00       	mov    $0xc4,%eax
80102316:	e8 ba fe ff ff       	call   801021d5 <lapicw>
  lapicw(ICRLO, BCAST | INIT | LEVEL);
8010231b:	ba 00 85 08 00       	mov    $0x88500,%edx
80102320:	b8 c0 00 00 00       	mov    $0xc0,%eax
80102325:	e8 ab fe ff ff       	call   801021d5 <lapicw>
  while(lapic[ICRLO] & DELIVS)
8010232a:	a1 80 16 11 80       	mov    0x80111680,%eax
8010232f:	8b 80 00 03 00 00    	mov    0x300(%eax),%eax
80102335:	f6 c4 10             	test   $0x10,%ah
80102338:	75 f0                	jne    8010232a <lapicinit+0xd6>
  lapicw(TPR, 0);
8010233a:	ba 00 00 00 00       	mov    $0x0,%edx
8010233f:	b8 20 00 00 00       	mov    $0x20,%eax
80102344:	e8 8c fe ff ff       	call   801021d5 <lapicw>
}
80102349:	c9                   	leave  
8010234a:	c3                   	ret    
    lapicw(PCINT, MASKED);
8010234b:	ba 00 00 01 00       	mov    $0x10000,%edx
80102350:	b8 d0 00 00 00       	mov    $0xd0,%eax
80102355:	e8 7b fe ff ff       	call   801021d5 <lapicw>
8010235a:	e9 71 ff ff ff       	jmp    801022d0 <lapicinit+0x7c>
8010235f:	c3                   	ret    

80102360 <lapicid>:
  if (!lapic)
80102360:	a1 80 16 11 80       	mov    0x80111680,%eax
80102365:	85 c0                	test   %eax,%eax
80102367:	74 07                	je     80102370 <lapicid+0x10>
  return lapic[ID] >> 24;
80102369:	8b 40 20             	mov    0x20(%eax),%eax
8010236c:	c1 e8 18             	shr    $0x18,%eax
8010236f:	c3                   	ret    
    return 0;
80102370:	b8 00 00 00 00       	mov    $0x0,%eax
}
80102375:	c3                   	ret    

80102376 <lapiceoi>:
  if(lapic)
80102376:	83 3d 80 16 11 80 00 	cmpl   $0x0,0x80111680
8010237d:	74 17                	je     80102396 <lapiceoi+0x20>
{
8010237f:	55                   	push   %ebp
80102380:	89 e5                	mov    %esp,%ebp
80102382:	83 ec 08             	sub    $0x8,%esp
    lapicw(EOI, 0);
80102385:	ba 00 00 00 00       	mov    $0x0,%edx
8010238a:	b8 2c 00 00 00       	mov    $0x2c,%eax
8010238f:	e8 41 fe ff ff       	call   801021d5 <lapicw>
}
80102394:	c9                   	leave  
80102395:	c3                   	ret    
80102396:	c3                   	ret    

80102397 <microdelay>:
}
80102397:	c3                   	ret    

80102398 <lapicstartap>:
{
80102398:	55                   	push   %ebp
80102399:	89 e5                	mov    %esp,%ebp
8010239b:	57                   	push   %edi
8010239c:	56                   	push   %esi
8010239d:	53                   	push   %ebx
8010239e:	83 ec 0c             	sub    $0xc,%esp
801023a1:	8b 75 08             	mov    0x8(%ebp),%esi
801023a4:	8b 7d 0c             	mov    0xc(%ebp),%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801023a7:	b8 0f 00 00 00       	mov    $0xf,%eax
801023ac:	ba 70 00 00 00       	mov    $0x70,%edx
801023b1:	ee                   	out    %al,(%dx)
801023b2:	b8 0a 00 00 00       	mov    $0xa,%eax
801023b7:	ba 71 00 00 00       	mov    $0x71,%edx
801023bc:	ee                   	out    %al,(%dx)
  wrv[0] = 0;
801023bd:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
801023c4:	00 00 
  wrv[1] = addr >> 4;
801023c6:	89 f8                	mov    %edi,%eax
801023c8:	c1 e8 04             	shr    $0x4,%eax
801023cb:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapicw(ICRHI, apicid<<24);
801023d1:	c1 e6 18             	shl    $0x18,%esi
801023d4:	89 f2                	mov    %esi,%edx
801023d6:	b8 c4 00 00 00       	mov    $0xc4,%eax
801023db:	e8 f5 fd ff ff       	call   801021d5 <lapicw>
  lapicw(ICRLO, INIT | LEVEL | ASSERT);
801023e0:	ba 00 c5 00 00       	mov    $0xc500,%edx
801023e5:	b8 c0 00 00 00       	mov    $0xc0,%eax
801023ea:	e8 e6 fd ff ff       	call   801021d5 <lapicw>
  lapicw(ICRLO, INIT | LEVEL);
801023ef:	ba 00 85 00 00       	mov    $0x8500,%edx
801023f4:	b8 c0 00 00 00       	mov    $0xc0,%eax
801023f9:	e8 d7 fd ff ff       	call   801021d5 <lapicw>
  for(i = 0; i < 2; i++){
801023fe:	bb 00 00 00 00       	mov    $0x0,%ebx
80102403:	eb 21                	jmp    80102426 <lapicstartap+0x8e>
    lapicw(ICRHI, apicid<<24);
80102405:	89 f2                	mov    %esi,%edx
80102407:	b8 c4 00 00 00       	mov    $0xc4,%eax
8010240c:	e8 c4 fd ff ff       	call   801021d5 <lapicw>
    lapicw(ICRLO, STARTUP | (addr>>12));
80102411:	89 fa                	mov    %edi,%edx
80102413:	c1 ea 0c             	shr    $0xc,%edx
80102416:	80 ce 06             	or     $0x6,%dh
80102419:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010241e:	e8 b2 fd ff ff       	call   801021d5 <lapicw>
  for(i = 0; i < 2; i++){
80102423:	83 c3 01             	add    $0x1,%ebx
80102426:	83 fb 01             	cmp    $0x1,%ebx
80102429:	7e da                	jle    80102405 <lapicstartap+0x6d>
}
8010242b:	83 c4 0c             	add    $0xc,%esp
8010242e:	5b                   	pop    %ebx
8010242f:	5e                   	pop    %esi
80102430:	5f                   	pop    %edi
80102431:	5d                   	pop    %ebp
80102432:	c3                   	ret    

80102433 <cmostime>:

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102433:	55                   	push   %ebp
80102434:	89 e5                	mov    %esp,%ebp
80102436:	57                   	push   %edi
80102437:	56                   	push   %esi
80102438:	53                   	push   %ebx
80102439:	83 ec 3c             	sub    $0x3c,%esp
8010243c:	8b 75 08             	mov    0x8(%ebp),%esi
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);
8010243f:	b8 0b 00 00 00       	mov    $0xb,%eax
80102444:	e8 a0 fd ff ff       	call   801021e9 <cmos_read>

  bcd = (sb & (1 << 2)) == 0;
80102449:	83 e0 04             	and    $0x4,%eax
8010244c:	89 c7                	mov    %eax,%edi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
8010244e:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102451:	e8 a3 fd ff ff       	call   801021f9 <fill_rtcdate>
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102456:	b8 0a 00 00 00       	mov    $0xa,%eax
8010245b:	e8 89 fd ff ff       	call   801021e9 <cmos_read>
80102460:	a8 80                	test   $0x80,%al
80102462:	75 ea                	jne    8010244e <cmostime+0x1b>
        continue;
    fill_rtcdate(&t2);
80102464:	8d 5d b8             	lea    -0x48(%ebp),%ebx
80102467:	89 d8                	mov    %ebx,%eax
80102469:	e8 8b fd ff ff       	call   801021f9 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010246e:	83 ec 04             	sub    $0x4,%esp
80102471:	6a 18                	push   $0x18
80102473:	53                   	push   %ebx
80102474:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102477:	50                   	push   %eax
<<<<<<< HEAD
80102478:	e8 b7 18 00 00       	call   80103d34 <memcmp>
=======
80102478:	e8 63 18 00 00       	call   80103ce0 <memcmp>
>>>>>>> d669a6c (ulib and makefile)
8010247d:	83 c4 10             	add    $0x10,%esp
80102480:	85 c0                	test   %eax,%eax
80102482:	75 ca                	jne    8010244e <cmostime+0x1b>
      break;
  }

  // convert
  if(bcd) {
80102484:	85 ff                	test   %edi,%edi
80102486:	75 78                	jne    80102500 <cmostime+0xcd>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102488:	8b 45 d0             	mov    -0x30(%ebp),%eax
8010248b:	89 c2                	mov    %eax,%edx
8010248d:	c1 ea 04             	shr    $0x4,%edx
80102490:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102493:	83 e0 0f             	and    $0xf,%eax
80102496:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102499:	89 45 d0             	mov    %eax,-0x30(%ebp)
    CONV(minute);
8010249c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
8010249f:	89 c2                	mov    %eax,%edx
801024a1:	c1 ea 04             	shr    $0x4,%edx
801024a4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801024a7:	83 e0 0f             	and    $0xf,%eax
801024aa:	8d 04 50             	lea    (%eax,%edx,2),%eax
801024ad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    CONV(hour  );
801024b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
801024b3:	89 c2                	mov    %eax,%edx
801024b5:	c1 ea 04             	shr    $0x4,%edx
801024b8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801024bb:	83 e0 0f             	and    $0xf,%eax
801024be:	8d 04 50             	lea    (%eax,%edx,2),%eax
801024c1:	89 45 d8             	mov    %eax,-0x28(%ebp)
    CONV(day   );
801024c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801024c7:	89 c2                	mov    %eax,%edx
801024c9:	c1 ea 04             	shr    $0x4,%edx
801024cc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801024cf:	83 e0 0f             	and    $0xf,%eax
801024d2:	8d 04 50             	lea    (%eax,%edx,2),%eax
801024d5:	89 45 dc             	mov    %eax,-0x24(%ebp)
    CONV(month );
801024d8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801024db:	89 c2                	mov    %eax,%edx
801024dd:	c1 ea 04             	shr    $0x4,%edx
801024e0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801024e3:	83 e0 0f             	and    $0xf,%eax
801024e6:	8d 04 50             	lea    (%eax,%edx,2),%eax
801024e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    CONV(year  );
801024ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801024ef:	89 c2                	mov    %eax,%edx
801024f1:	c1 ea 04             	shr    $0x4,%edx
801024f4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801024f7:	83 e0 0f             	and    $0xf,%eax
801024fa:	8d 04 50             	lea    (%eax,%edx,2),%eax
801024fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
#undef     CONV
  }

  *r = t1;
80102500:	8b 45 d0             	mov    -0x30(%ebp),%eax
80102503:	89 06                	mov    %eax,(%esi)
80102505:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80102508:	89 46 04             	mov    %eax,0x4(%esi)
8010250b:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010250e:	89 46 08             	mov    %eax,0x8(%esi)
80102511:	8b 45 dc             	mov    -0x24(%ebp),%eax
80102514:	89 46 0c             	mov    %eax,0xc(%esi)
80102517:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010251a:	89 46 10             	mov    %eax,0x10(%esi)
8010251d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102520:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102523:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
8010252a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010252d:	5b                   	pop    %ebx
8010252e:	5e                   	pop    %esi
8010252f:	5f                   	pop    %edi
80102530:	5d                   	pop    %ebp
80102531:	c3                   	ret    

80102532 <read_head>:
}

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
80102532:	55                   	push   %ebp
80102533:	89 e5                	mov    %esp,%ebp
80102535:	53                   	push   %ebx
80102536:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102539:	ff 35 d4 16 11 80    	push   0x801116d4
8010253f:	ff 35 e4 16 11 80    	push   0x801116e4
80102545:	e8 22 dc ff ff       	call   8010016c <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
8010254a:	8b 58 5c             	mov    0x5c(%eax),%ebx
8010254d:	89 1d e8 16 11 80    	mov    %ebx,0x801116e8
  for (i = 0; i < log.lh.n; i++) {
80102553:	83 c4 10             	add    $0x10,%esp
80102556:	ba 00 00 00 00       	mov    $0x0,%edx
8010255b:	eb 0e                	jmp    8010256b <read_head+0x39>
    log.lh.block[i] = lh->block[i];
8010255d:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102561:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102568:	83 c2 01             	add    $0x1,%edx
8010256b:	39 d3                	cmp    %edx,%ebx
8010256d:	7f ee                	jg     8010255d <read_head+0x2b>
  }
  brelse(buf);
8010256f:	83 ec 0c             	sub    $0xc,%esp
80102572:	50                   	push   %eax
80102573:	e8 5d dc ff ff       	call   801001d5 <brelse>
}
80102578:	83 c4 10             	add    $0x10,%esp
8010257b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010257e:	c9                   	leave  
8010257f:	c3                   	ret    

80102580 <install_trans>:
{
80102580:	55                   	push   %ebp
80102581:	89 e5                	mov    %esp,%ebp
80102583:	57                   	push   %edi
80102584:	56                   	push   %esi
80102585:	53                   	push   %ebx
80102586:	83 ec 0c             	sub    $0xc,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
80102589:	be 00 00 00 00       	mov    $0x0,%esi
8010258e:	eb 66                	jmp    801025f6 <install_trans+0x76>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102590:	89 f0                	mov    %esi,%eax
80102592:	03 05 d4 16 11 80    	add    0x801116d4,%eax
80102598:	83 c0 01             	add    $0x1,%eax
8010259b:	83 ec 08             	sub    $0x8,%esp
8010259e:	50                   	push   %eax
8010259f:	ff 35 e4 16 11 80    	push   0x801116e4
801025a5:	e8 c2 db ff ff       	call   8010016c <bread>
801025aa:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801025ac:	83 c4 08             	add    $0x8,%esp
801025af:	ff 34 b5 ec 16 11 80 	push   -0x7feee914(,%esi,4)
801025b6:	ff 35 e4 16 11 80    	push   0x801116e4
801025bc:	e8 ab db ff ff       	call   8010016c <bread>
801025c1:	89 c3                	mov    %eax,%ebx
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801025c3:	8d 57 5c             	lea    0x5c(%edi),%edx
801025c6:	8d 40 5c             	lea    0x5c(%eax),%eax
801025c9:	83 c4 0c             	add    $0xc,%esp
801025cc:	68 00 02 00 00       	push   $0x200
801025d1:	52                   	push   %edx
801025d2:	50                   	push   %eax
<<<<<<< HEAD
801025d3:	e8 91 17 00 00       	call   80103d69 <memmove>
=======
801025d3:	e8 3d 17 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    bwrite(dbuf);  // write dst to disk
801025d8:	89 1c 24             	mov    %ebx,(%esp)
801025db:	e8 ba db ff ff       	call   8010019a <bwrite>
    brelse(lbuf);
801025e0:	89 3c 24             	mov    %edi,(%esp)
801025e3:	e8 ed db ff ff       	call   801001d5 <brelse>
    brelse(dbuf);
801025e8:	89 1c 24             	mov    %ebx,(%esp)
801025eb:	e8 e5 db ff ff       	call   801001d5 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
801025f0:	83 c6 01             	add    $0x1,%esi
801025f3:	83 c4 10             	add    $0x10,%esp
801025f6:	39 35 e8 16 11 80    	cmp    %esi,0x801116e8
801025fc:	7f 92                	jg     80102590 <install_trans+0x10>
}
801025fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102601:	5b                   	pop    %ebx
80102602:	5e                   	pop    %esi
80102603:	5f                   	pop    %edi
80102604:	5d                   	pop    %ebp
80102605:	c3                   	ret    

80102606 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102606:	55                   	push   %ebp
80102607:	89 e5                	mov    %esp,%ebp
80102609:	53                   	push   %ebx
8010260a:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
8010260d:	ff 35 d4 16 11 80    	push   0x801116d4
80102613:	ff 35 e4 16 11 80    	push   0x801116e4
80102619:	e8 4e db ff ff       	call   8010016c <bread>
8010261e:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102620:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102626:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102629:	83 c4 10             	add    $0x10,%esp
8010262c:	b8 00 00 00 00       	mov    $0x0,%eax
80102631:	eb 0e                	jmp    80102641 <write_head+0x3b>
    hb->block[i] = log.lh.block[i];
80102633:	8b 14 85 ec 16 11 80 	mov    -0x7feee914(,%eax,4),%edx
8010263a:	89 54 83 60          	mov    %edx,0x60(%ebx,%eax,4)
  for (i = 0; i < log.lh.n; i++) {
8010263e:	83 c0 01             	add    $0x1,%eax
80102641:	39 c1                	cmp    %eax,%ecx
80102643:	7f ee                	jg     80102633 <write_head+0x2d>
  }
  bwrite(buf);
80102645:	83 ec 0c             	sub    $0xc,%esp
80102648:	53                   	push   %ebx
80102649:	e8 4c db ff ff       	call   8010019a <bwrite>
  brelse(buf);
8010264e:	89 1c 24             	mov    %ebx,(%esp)
80102651:	e8 7f db ff ff       	call   801001d5 <brelse>
}
80102656:	83 c4 10             	add    $0x10,%esp
80102659:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010265c:	c9                   	leave  
8010265d:	c3                   	ret    

8010265e <recover_from_log>:

static void
recover_from_log(void)
{
8010265e:	55                   	push   %ebp
8010265f:	89 e5                	mov    %esp,%ebp
80102661:	83 ec 08             	sub    $0x8,%esp
  read_head();
80102664:	e8 c9 fe ff ff       	call   80102532 <read_head>
  install_trans(); // if committed, copy from log to disk
80102669:	e8 12 ff ff ff       	call   80102580 <install_trans>
  log.lh.n = 0;
8010266e:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102675:	00 00 00 
  write_head(); // clear the log
80102678:	e8 89 ff ff ff       	call   80102606 <write_head>
}
8010267d:	c9                   	leave  
8010267e:	c3                   	ret    

8010267f <write_log>:
}

// Copy modified blocks from cache to log.
static void
write_log(void)
{
8010267f:	55                   	push   %ebp
80102680:	89 e5                	mov    %esp,%ebp
80102682:	57                   	push   %edi
80102683:	56                   	push   %esi
80102684:	53                   	push   %ebx
80102685:	83 ec 0c             	sub    $0xc,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102688:	be 00 00 00 00       	mov    $0x0,%esi
8010268d:	eb 66                	jmp    801026f5 <write_log+0x76>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
8010268f:	89 f0                	mov    %esi,%eax
80102691:	03 05 d4 16 11 80    	add    0x801116d4,%eax
80102697:	83 c0 01             	add    $0x1,%eax
8010269a:	83 ec 08             	sub    $0x8,%esp
8010269d:	50                   	push   %eax
8010269e:	ff 35 e4 16 11 80    	push   0x801116e4
801026a4:	e8 c3 da ff ff       	call   8010016c <bread>
801026a9:	89 c3                	mov    %eax,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
801026ab:	83 c4 08             	add    $0x8,%esp
801026ae:	ff 34 b5 ec 16 11 80 	push   -0x7feee914(,%esi,4)
801026b5:	ff 35 e4 16 11 80    	push   0x801116e4
801026bb:	e8 ac da ff ff       	call   8010016c <bread>
801026c0:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
801026c2:	8d 50 5c             	lea    0x5c(%eax),%edx
801026c5:	8d 43 5c             	lea    0x5c(%ebx),%eax
801026c8:	83 c4 0c             	add    $0xc,%esp
801026cb:	68 00 02 00 00       	push   $0x200
801026d0:	52                   	push   %edx
801026d1:	50                   	push   %eax
<<<<<<< HEAD
801026d2:	e8 92 16 00 00       	call   80103d69 <memmove>
=======
801026d2:	e8 3e 16 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)
    bwrite(to);  // write the log
801026d7:	89 1c 24             	mov    %ebx,(%esp)
801026da:	e8 bb da ff ff       	call   8010019a <bwrite>
    brelse(from);
801026df:	89 3c 24             	mov    %edi,(%esp)
801026e2:	e8 ee da ff ff       	call   801001d5 <brelse>
    brelse(to);
801026e7:	89 1c 24             	mov    %ebx,(%esp)
801026ea:	e8 e6 da ff ff       	call   801001d5 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
801026ef:	83 c6 01             	add    $0x1,%esi
801026f2:	83 c4 10             	add    $0x10,%esp
801026f5:	39 35 e8 16 11 80    	cmp    %esi,0x801116e8
801026fb:	7f 92                	jg     8010268f <write_log+0x10>
  }
}
801026fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102700:	5b                   	pop    %ebx
80102701:	5e                   	pop    %esi
80102702:	5f                   	pop    %edi
80102703:	5d                   	pop    %ebp
80102704:	c3                   	ret    

80102705 <commit>:

static void
commit()
{
  if (log.lh.n > 0) {
80102705:	83 3d e8 16 11 80 00 	cmpl   $0x0,0x801116e8
8010270c:	7f 01                	jg     8010270f <commit+0xa>
8010270e:	c3                   	ret    
{
8010270f:	55                   	push   %ebp
80102710:	89 e5                	mov    %esp,%ebp
80102712:	83 ec 08             	sub    $0x8,%esp
    write_log();     // Write modified blocks from cache to log
80102715:	e8 65 ff ff ff       	call   8010267f <write_log>
    write_head();    // Write header to disk -- the real commit
8010271a:	e8 e7 fe ff ff       	call   80102606 <write_head>
    install_trans(); // Now install writes to home locations
8010271f:	e8 5c fe ff ff       	call   80102580 <install_trans>
    log.lh.n = 0;
80102724:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
8010272b:	00 00 00 
    write_head();    // Erase the transaction from the log
8010272e:	e8 d3 fe ff ff       	call   80102606 <write_head>
  }
}
80102733:	c9                   	leave  
80102734:	c3                   	ret    

80102735 <initlog>:
{
80102735:	55                   	push   %ebp
80102736:	89 e5                	mov    %esp,%ebp
80102738:	53                   	push   %ebx
80102739:	83 ec 2c             	sub    $0x2c,%esp
8010273c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
<<<<<<< HEAD
8010273f:	68 00 6b 10 80       	push   $0x80106b00
80102744:	68 a0 16 11 80       	push   $0x801116a0
80102749:	e8 bb 13 00 00       	call   80103b09 <initlock>
=======
8010273f:	68 c0 6a 10 80       	push   $0x80106ac0
80102744:	68 a0 06 11 80       	push   $0x801106a0
80102749:	e8 67 13 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
  readsb(dev, &sb);
8010274e:	83 c4 08             	add    $0x8,%esp
80102751:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102754:	50                   	push   %eax
80102755:	53                   	push   %ebx
80102756:	e8 4b eb ff ff       	call   801012a6 <readsb>
  log.start = sb.logstart;
8010275b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010275e:	a3 d4 16 11 80       	mov    %eax,0x801116d4
  log.size = sb.nlog;
80102763:	8b 45 e8             	mov    -0x18(%ebp),%eax
80102766:	a3 d8 16 11 80       	mov    %eax,0x801116d8
  log.dev = dev;
8010276b:	89 1d e4 16 11 80    	mov    %ebx,0x801116e4
  recover_from_log();
80102771:	e8 e8 fe ff ff       	call   8010265e <recover_from_log>
}
80102776:	83 c4 10             	add    $0x10,%esp
80102779:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010277c:	c9                   	leave  
8010277d:	c3                   	ret    

8010277e <begin_op>:
{
8010277e:	55                   	push   %ebp
8010277f:	89 e5                	mov    %esp,%ebp
80102781:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
<<<<<<< HEAD
80102784:	68 a0 16 11 80       	push   $0x801116a0
80102789:	e8 b7 14 00 00       	call   80103c45 <acquire>
=======
80102784:	68 a0 06 11 80       	push   $0x801106a0
80102789:	e8 63 14 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
8010278e:	83 c4 10             	add    $0x10,%esp
80102791:	eb 15                	jmp    801027a8 <begin_op+0x2a>
      sleep(&log, &log.lock);
80102793:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
80102796:	68 a0 16 11 80       	push   $0x801116a0
8010279b:	68 a0 16 11 80       	push   $0x801116a0
801027a0:	e8 a5 0f 00 00       	call   8010374a <sleep>
=======
80102796:	68 a0 06 11 80       	push   $0x801106a0
8010279b:	68 a0 06 11 80       	push   $0x801106a0
801027a0:	e8 51 0f 00 00       	call   801036f6 <sleep>
>>>>>>> d669a6c (ulib and makefile)
801027a5:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
801027a8:	83 3d e0 16 11 80 00 	cmpl   $0x0,0x801116e0
801027af:	75 e2                	jne    80102793 <begin_op+0x15>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
801027b1:	a1 dc 16 11 80       	mov    0x801116dc,%eax
801027b6:	83 c0 01             	add    $0x1,%eax
801027b9:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801027bc:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
801027bf:	03 15 e8 16 11 80    	add    0x801116e8,%edx
801027c5:	83 fa 1e             	cmp    $0x1e,%edx
801027c8:	7e 17                	jle    801027e1 <begin_op+0x63>
      sleep(&log, &log.lock);
801027ca:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
801027cd:	68 a0 16 11 80       	push   $0x801116a0
801027d2:	68 a0 16 11 80       	push   $0x801116a0
801027d7:	e8 6e 0f 00 00       	call   8010374a <sleep>
=======
801027cd:	68 a0 06 11 80       	push   $0x801106a0
801027d2:	68 a0 06 11 80       	push   $0x801106a0
801027d7:	e8 1a 0f 00 00       	call   801036f6 <sleep>
>>>>>>> d669a6c (ulib and makefile)
801027dc:	83 c4 10             	add    $0x10,%esp
801027df:	eb c7                	jmp    801027a8 <begin_op+0x2a>
      log.outstanding += 1;
801027e1:	a3 dc 16 11 80       	mov    %eax,0x801116dc
      release(&log.lock);
801027e6:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801027e9:	68 a0 16 11 80       	push   $0x801116a0
801027ee:	e8 b7 14 00 00       	call   80103caa <release>
=======
801027e9:	68 a0 06 11 80       	push   $0x801106a0
801027ee:	e8 63 14 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
801027f3:	83 c4 10             	add    $0x10,%esp
801027f6:	c9                   	leave  
801027f7:	c3                   	ret    

801027f8 <end_op>:
{
801027f8:	55                   	push   %ebp
801027f9:	89 e5                	mov    %esp,%ebp
801027fb:	53                   	push   %ebx
801027fc:	83 ec 10             	sub    $0x10,%esp
  acquire(&log.lock);
<<<<<<< HEAD
801027ff:	68 a0 16 11 80       	push   $0x801116a0
80102804:	e8 3c 14 00 00       	call   80103c45 <acquire>
=======
801027ff:	68 a0 06 11 80       	push   $0x801106a0
80102804:	e8 e8 13 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  log.outstanding -= 1;
80102809:	a1 dc 16 11 80       	mov    0x801116dc,%eax
8010280e:	83 e8 01             	sub    $0x1,%eax
80102811:	a3 dc 16 11 80       	mov    %eax,0x801116dc
  if(log.committing)
80102816:	8b 1d e0 16 11 80    	mov    0x801116e0,%ebx
8010281c:	83 c4 10             	add    $0x10,%esp
8010281f:	85 db                	test   %ebx,%ebx
80102821:	75 2c                	jne    8010284f <end_op+0x57>
  if(log.outstanding == 0){
80102823:	85 c0                	test   %eax,%eax
80102825:	75 35                	jne    8010285c <end_op+0x64>
    log.committing = 1;
80102827:	c7 05 e0 16 11 80 01 	movl   $0x1,0x801116e0
8010282e:	00 00 00 
    do_commit = 1;
80102831:	bb 01 00 00 00       	mov    $0x1,%ebx
  release(&log.lock);
80102836:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80102839:	68 a0 16 11 80       	push   $0x801116a0
8010283e:	e8 67 14 00 00       	call   80103caa <release>
=======
80102839:	68 a0 06 11 80       	push   $0x801106a0
8010283e:	e8 13 14 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  if(do_commit){
80102843:	83 c4 10             	add    $0x10,%esp
80102846:	85 db                	test   %ebx,%ebx
80102848:	75 24                	jne    8010286e <end_op+0x76>
}
8010284a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010284d:	c9                   	leave  
8010284e:	c3                   	ret    
    panic("log.committing");
8010284f:	83 ec 0c             	sub    $0xc,%esp
80102852:	68 04 6b 10 80       	push   $0x80106b04
80102857:	e8 ec da ff ff       	call   80100348 <panic>
    wakeup(&log);
8010285c:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010285f:	68 a0 16 11 80       	push   $0x801116a0
80102864:	e8 46 10 00 00       	call   801038af <wakeup>
=======
8010285f:	68 a0 06 11 80       	push   $0x801106a0
80102864:	e8 f2 0f 00 00       	call   8010385b <wakeup>
>>>>>>> d669a6c (ulib and makefile)
80102869:	83 c4 10             	add    $0x10,%esp
8010286c:	eb c8                	jmp    80102836 <end_op+0x3e>
    commit();
8010286e:	e8 92 fe ff ff       	call   80102705 <commit>
    acquire(&log.lock);
80102873:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
80102876:	68 a0 16 11 80       	push   $0x801116a0
8010287b:	e8 c5 13 00 00       	call   80103c45 <acquire>
=======
80102876:	68 a0 06 11 80       	push   $0x801106a0
8010287b:	e8 71 13 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
    log.committing = 0;
80102880:	c7 05 e0 16 11 80 00 	movl   $0x0,0x801116e0
80102887:	00 00 00 
    wakeup(&log);
<<<<<<< HEAD
8010288a:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102891:	e8 19 10 00 00       	call   801038af <wakeup>
    release(&log.lock);
80102896:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
8010289d:	e8 08 14 00 00       	call   80103caa <release>
=======
8010288a:	c7 04 24 a0 06 11 80 	movl   $0x801106a0,(%esp)
80102891:	e8 c5 0f 00 00       	call   8010385b <wakeup>
    release(&log.lock);
80102896:	c7 04 24 a0 06 11 80 	movl   $0x801106a0,(%esp)
8010289d:	e8 b4 13 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
801028a2:	83 c4 10             	add    $0x10,%esp
}
801028a5:	eb a3                	jmp    8010284a <end_op+0x52>

801028a7 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
801028a7:	55                   	push   %ebp
801028a8:	89 e5                	mov    %esp,%ebp
801028aa:	53                   	push   %ebx
801028ab:	83 ec 04             	sub    $0x4,%esp
801028ae:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
801028b1:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
801028b7:	83 fa 1d             	cmp    $0x1d,%edx
801028ba:	7f 2c                	jg     801028e8 <log_write+0x41>
801028bc:	a1 d8 16 11 80       	mov    0x801116d8,%eax
801028c1:	83 e8 01             	sub    $0x1,%eax
801028c4:	39 c2                	cmp    %eax,%edx
801028c6:	7d 20                	jge    801028e8 <log_write+0x41>
    panic("too big a transaction");
  if (log.outstanding < 1)
801028c8:	83 3d dc 16 11 80 00 	cmpl   $0x0,0x801116dc
801028cf:	7e 24                	jle    801028f5 <log_write+0x4e>
    panic("log_write outside of trans");

  acquire(&log.lock);
801028d1:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801028d4:	68 a0 16 11 80       	push   $0x801116a0
801028d9:	e8 67 13 00 00       	call   80103c45 <acquire>
=======
801028d4:	68 a0 06 11 80       	push   $0x801106a0
801028d9:	e8 13 13 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  for (i = 0; i < log.lh.n; i++) {
801028de:	83 c4 10             	add    $0x10,%esp
801028e1:	b8 00 00 00 00       	mov    $0x0,%eax
801028e6:	eb 1d                	jmp    80102905 <log_write+0x5e>
    panic("too big a transaction");
801028e8:	83 ec 0c             	sub    $0xc,%esp
801028eb:	68 13 6b 10 80       	push   $0x80106b13
801028f0:	e8 53 da ff ff       	call   80100348 <panic>
    panic("log_write outside of trans");
801028f5:	83 ec 0c             	sub    $0xc,%esp
801028f8:	68 29 6b 10 80       	push   $0x80106b29
801028fd:	e8 46 da ff ff       	call   80100348 <panic>
  for (i = 0; i < log.lh.n; i++) {
80102902:	83 c0 01             	add    $0x1,%eax
80102905:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
8010290b:	39 c2                	cmp    %eax,%edx
8010290d:	7e 0c                	jle    8010291b <log_write+0x74>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
8010290f:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102912:	39 0c 85 ec 16 11 80 	cmp    %ecx,-0x7feee914(,%eax,4)
80102919:	75 e7                	jne    80102902 <log_write+0x5b>
      break;
  }
  log.lh.block[i] = b->blockno;
8010291b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010291e:	89 0c 85 ec 16 11 80 	mov    %ecx,-0x7feee914(,%eax,4)
  if (i == log.lh.n)
80102925:	39 c2                	cmp    %eax,%edx
80102927:	74 18                	je     80102941 <log_write+0x9a>
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
80102929:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
8010292c:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010292f:	68 a0 16 11 80       	push   $0x801116a0
80102934:	e8 71 13 00 00       	call   80103caa <release>
=======
8010292f:	68 a0 06 11 80       	push   $0x801106a0
80102934:	e8 1d 13 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
80102939:	83 c4 10             	add    $0x10,%esp
8010293c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010293f:	c9                   	leave  
80102940:	c3                   	ret    
    log.lh.n++;
80102941:	83 c2 01             	add    $0x1,%edx
80102944:	89 15 e8 16 11 80    	mov    %edx,0x801116e8
8010294a:	eb dd                	jmp    80102929 <log_write+0x82>

8010294c <startothers>:
pde_t entrypgdir[];  // For entry.S

// Start the non-boot (AP) processors.
static void
startothers(void)
{
8010294c:	55                   	push   %ebp
8010294d:	89 e5                	mov    %esp,%ebp
8010294f:	53                   	push   %ebx
80102950:	83 ec 08             	sub    $0x8,%esp

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102953:	68 8a 00 00 00       	push   $0x8a
80102958:	68 8c a4 10 80       	push   $0x8010a48c
8010295d:	68 00 70 00 80       	push   $0x80007000
<<<<<<< HEAD
80102962:	e8 02 14 00 00       	call   80103d69 <memmove>
=======
80102962:	e8 ae 13 00 00       	call   80103d15 <memmove>
>>>>>>> d669a6c (ulib and makefile)

  for(c = cpus; c < cpus+ncpu; c++){
80102967:	83 c4 10             	add    $0x10,%esp
8010296a:	bb a0 17 11 80       	mov    $0x801117a0,%ebx
8010296f:	eb 06                	jmp    80102977 <startothers+0x2b>
80102971:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102977:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
8010297e:	00 00 00 
80102981:	05 a0 17 11 80       	add    $0x801117a0,%eax
80102986:	39 d8                	cmp    %ebx,%eax
80102988:	76 4c                	jbe    801029d6 <startothers+0x8a>
    if(c == mycpu())  // We've started already.
8010298a:	e8 af 07 00 00       	call   8010313e <mycpu>
8010298f:	39 c3                	cmp    %eax,%ebx
80102991:	74 de                	je     80102971 <startothers+0x25>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102993:	e8 0b f7 ff ff       	call   801020a3 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102998:	05 00 10 00 00       	add    $0x1000,%eax
8010299d:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void(**)(void))(code-8) = mpenter;
801029a2:	c7 05 f8 6f 00 80 1a 	movl   $0x80102a1a,0x80006ff8
801029a9:	2a 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
801029ac:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
801029b3:	90 10 00 

    lapicstartap(c->apicid, V2P(code));
801029b6:	83 ec 08             	sub    $0x8,%esp
801029b9:	68 00 70 00 00       	push   $0x7000
801029be:	0f b6 03             	movzbl (%ebx),%eax
801029c1:	50                   	push   %eax
801029c2:	e8 d1 f9 ff ff       	call   80102398 <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801029c7:	83 c4 10             	add    $0x10,%esp
801029ca:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801029d0:	85 c0                	test   %eax,%eax
801029d2:	74 f6                	je     801029ca <startothers+0x7e>
801029d4:	eb 9b                	jmp    80102971 <startothers+0x25>
      ;
  }
}
801029d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801029d9:	c9                   	leave  
801029da:	c3                   	ret    

801029db <mpmain>:
{
801029db:	55                   	push   %ebp
801029dc:	89 e5                	mov    %esp,%ebp
801029de:	53                   	push   %ebx
801029df:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
801029e2:	e8 b3 07 00 00       	call   8010319a <cpuid>
801029e7:	89 c3                	mov    %eax,%ebx
801029e9:	e8 ac 07 00 00       	call   8010319a <cpuid>
801029ee:	83 ec 04             	sub    $0x4,%esp
801029f1:	53                   	push   %ebx
801029f2:	50                   	push   %eax
801029f3:	68 44 6b 10 80       	push   $0x80106b44
801029f8:	e8 0a dc ff ff       	call   80100607 <cprintf>
  idtinit();       // load idt register
<<<<<<< HEAD
801029fd:	e8 80 24 00 00       	call   80104e82 <idtinit>
=======
801029fd:	e8 2c 24 00 00       	call   80104e2e <idtinit>
>>>>>>> d669a6c (ulib and makefile)
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102a02:	e8 37 07 00 00       	call   8010313e <mycpu>
80102a07:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102a09:	b8 01 00 00 00       	mov    $0x1,%eax
80102a0e:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
<<<<<<< HEAD
80102a15:	e8 0b 0b 00 00       	call   80103525 <scheduler>
=======
80102a15:	e8 b7 0a 00 00       	call   801034d1 <scheduler>
>>>>>>> d669a6c (ulib and makefile)

80102a1a <mpenter>:
{
80102a1a:	55                   	push   %ebp
80102a1b:	89 e5                	mov    %esp,%ebp
80102a1d:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
<<<<<<< HEAD
80102a20:	e8 89 35 00 00       	call   80105fae <switchkvm>
  seginit();
80102a25:	e8 0f 33 00 00       	call   80105d39 <seginit>
=======
80102a20:	e8 35 35 00 00       	call   80105f5a <switchkvm>
  seginit();
80102a25:	e8 bb 32 00 00       	call   80105ce5 <seginit>
>>>>>>> d669a6c (ulib and makefile)
  lapicinit();
80102a2a:	e8 25 f8 ff ff       	call   80102254 <lapicinit>
  mpmain();
80102a2f:	e8 a7 ff ff ff       	call   801029db <mpmain>

80102a34 <main>:
{
80102a34:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102a38:	83 e4 f0             	and    $0xfffffff0,%esp
80102a3b:	ff 71 fc             	push   -0x4(%ecx)
80102a3e:	55                   	push   %ebp
80102a3f:	89 e5                	mov    %esp,%ebp
80102a41:	51                   	push   %ecx
80102a42:	83 ec 0c             	sub    $0xc,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102a45:	68 00 00 40 80       	push   $0x80400000
80102a4a:	68 d0 54 11 80       	push   $0x801154d0
80102a4f:	e8 fd f5 ff ff       	call   80102051 <kinit1>
  kvmalloc();      // kernel page table
<<<<<<< HEAD
80102a54:	e8 21 3a 00 00       	call   8010647a <kvmalloc>
=======
80102a54:	e8 cd 39 00 00       	call   80106426 <kvmalloc>
>>>>>>> d669a6c (ulib and makefile)
  mpinit();        // detect other processors
80102a59:	e8 c1 01 00 00       	call   80102c1f <mpinit>
  lapicinit();     // interrupt controller
80102a5e:	e8 f1 f7 ff ff       	call   80102254 <lapicinit>
  seginit();       // segment descriptors
<<<<<<< HEAD
80102a63:	e8 d1 32 00 00       	call   80105d39 <seginit>
=======
80102a63:	e8 7d 32 00 00       	call   80105ce5 <seginit>
>>>>>>> d669a6c (ulib and makefile)
  picinit();       // disable pic
80102a68:	e8 88 02 00 00       	call   80102cf5 <picinit>
  ioapicinit();    // another interrupt controller
80102a6d:	e8 6b f4 ff ff       	call   80101edd <ioapicinit>
  consoleinit();   // console hardware
80102a72:	e8 13 de ff ff       	call   8010088a <consoleinit>
  uartinit();      // serial port
<<<<<<< HEAD
80102a77:	e8 ad 26 00 00       	call   80105129 <uartinit>
  pinit();         // process table
80102a7c:	e8 a3 06 00 00       	call   80103124 <pinit>
  tvinit();        // trap vectors
80102a81:	e8 f7 22 00 00       	call   80104d7d <tvinit>
=======
80102a77:	e8 59 26 00 00       	call   801050d5 <uartinit>
  pinit();         // process table
80102a7c:	e8 a3 06 00 00       	call   80103124 <pinit>
  tvinit();        // trap vectors
80102a81:	e8 a3 22 00 00       	call   80104d29 <tvinit>
>>>>>>> d669a6c (ulib and makefile)
  binit();         // buffer cache
80102a86:	e8 69 d6 ff ff       	call   801000f4 <binit>
  fileinit();      // file table
80102a8b:	e8 73 e1 ff ff       	call   80100c03 <fileinit>
  ideinit();       // disk 
80102a90:	e8 54 f2 ff ff       	call   80101ce9 <ideinit>
  startothers();   // start other processors
80102a95:	e8 b2 fe ff ff       	call   8010294c <startothers>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102a9a:	83 c4 08             	add    $0x8,%esp
80102a9d:	68 00 00 00 8e       	push   $0x8e000000
80102aa2:	68 00 00 40 80       	push   $0x80400000
80102aa7:	e8 d7 f5 ff ff       	call   80102083 <kinit2>
  userinit();      // first user process
80102aac:	e8 27 07 00 00       	call   801031d8 <userinit>
  mpmain();        // finish this processor's setup
80102ab1:	e8 25 ff ff ff       	call   801029db <mpmain>

80102ab6 <sum>:
int ncpu;
uchar ioapicid;

static uchar
sum(uchar *addr, int len)
{
80102ab6:	55                   	push   %ebp
80102ab7:	89 e5                	mov    %esp,%ebp
80102ab9:	56                   	push   %esi
80102aba:	53                   	push   %ebx
80102abb:	89 c6                	mov    %eax,%esi
  int i, sum;

  sum = 0;
80102abd:	b8 00 00 00 00       	mov    $0x0,%eax
  for(i=0; i<len; i++)
80102ac2:	b9 00 00 00 00       	mov    $0x0,%ecx
80102ac7:	eb 09                	jmp    80102ad2 <sum+0x1c>
    sum += addr[i];
80102ac9:	0f b6 1c 0e          	movzbl (%esi,%ecx,1),%ebx
80102acd:	01 d8                	add    %ebx,%eax
  for(i=0; i<len; i++)
80102acf:	83 c1 01             	add    $0x1,%ecx
80102ad2:	39 d1                	cmp    %edx,%ecx
80102ad4:	7c f3                	jl     80102ac9 <sum+0x13>
  return sum;
}
80102ad6:	5b                   	pop    %ebx
80102ad7:	5e                   	pop    %esi
80102ad8:	5d                   	pop    %ebp
80102ad9:	c3                   	ret    

80102ada <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102ada:	55                   	push   %ebp
80102adb:	89 e5                	mov    %esp,%ebp
80102add:	56                   	push   %esi
80102ade:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
80102adf:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102ae5:	89 f3                	mov    %esi,%ebx
  e = addr+len;
80102ae7:	01 d6                	add    %edx,%esi
  for(p = addr; p < e; p += sizeof(struct mp))
80102ae9:	eb 03                	jmp    80102aee <mpsearch1+0x14>
80102aeb:	83 c3 10             	add    $0x10,%ebx
80102aee:	39 f3                	cmp    %esi,%ebx
80102af0:	73 29                	jae    80102b1b <mpsearch1+0x41>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102af2:	83 ec 04             	sub    $0x4,%esp
80102af5:	6a 04                	push   $0x4
80102af7:	68 58 6b 10 80       	push   $0x80106b58
80102afc:	53                   	push   %ebx
<<<<<<< HEAD
80102afd:	e8 32 12 00 00       	call   80103d34 <memcmp>
=======
80102afd:	e8 de 11 00 00       	call   80103ce0 <memcmp>
>>>>>>> d669a6c (ulib and makefile)
80102b02:	83 c4 10             	add    $0x10,%esp
80102b05:	85 c0                	test   %eax,%eax
80102b07:	75 e2                	jne    80102aeb <mpsearch1+0x11>
80102b09:	ba 10 00 00 00       	mov    $0x10,%edx
80102b0e:	89 d8                	mov    %ebx,%eax
80102b10:	e8 a1 ff ff ff       	call   80102ab6 <sum>
80102b15:	84 c0                	test   %al,%al
80102b17:	75 d2                	jne    80102aeb <mpsearch1+0x11>
80102b19:	eb 05                	jmp    80102b20 <mpsearch1+0x46>
      return (struct mp*)p;
  return 0;
80102b1b:	bb 00 00 00 00       	mov    $0x0,%ebx
}
80102b20:	89 d8                	mov    %ebx,%eax
80102b22:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b25:	5b                   	pop    %ebx
80102b26:	5e                   	pop    %esi
80102b27:	5d                   	pop    %ebp
80102b28:	c3                   	ret    

80102b29 <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
80102b29:	55                   	push   %ebp
80102b2a:	89 e5                	mov    %esp,%ebp
80102b2c:	83 ec 08             	sub    $0x8,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102b2f:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102b36:	c1 e0 08             	shl    $0x8,%eax
80102b39:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102b40:	09 d0                	or     %edx,%eax
80102b42:	c1 e0 04             	shl    $0x4,%eax
80102b45:	74 1f                	je     80102b66 <mpsearch+0x3d>
    if((mp = mpsearch1(p, 1024)))
80102b47:	ba 00 04 00 00       	mov    $0x400,%edx
80102b4c:	e8 89 ff ff ff       	call   80102ada <mpsearch1>
80102b51:	85 c0                	test   %eax,%eax
80102b53:	75 0f                	jne    80102b64 <mpsearch+0x3b>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
80102b55:	ba 00 00 01 00       	mov    $0x10000,%edx
80102b5a:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80102b5f:	e8 76 ff ff ff       	call   80102ada <mpsearch1>
}
80102b64:	c9                   	leave  
80102b65:	c3                   	ret    
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80102b66:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102b6d:	c1 e0 08             	shl    $0x8,%eax
80102b70:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102b77:	09 d0                	or     %edx,%eax
80102b79:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80102b7c:	2d 00 04 00 00       	sub    $0x400,%eax
80102b81:	ba 00 04 00 00       	mov    $0x400,%edx
80102b86:	e8 4f ff ff ff       	call   80102ada <mpsearch1>
80102b8b:	85 c0                	test   %eax,%eax
80102b8d:	75 d5                	jne    80102b64 <mpsearch+0x3b>
80102b8f:	eb c4                	jmp    80102b55 <mpsearch+0x2c>

80102b91 <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
80102b91:	55                   	push   %ebp
80102b92:	89 e5                	mov    %esp,%ebp
80102b94:	57                   	push   %edi
80102b95:	56                   	push   %esi
80102b96:	53                   	push   %ebx
80102b97:	83 ec 1c             	sub    $0x1c,%esp
80102b9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80102b9d:	e8 87 ff ff ff       	call   80102b29 <mpsearch>
80102ba2:	89 c3                	mov    %eax,%ebx
80102ba4:	85 c0                	test   %eax,%eax
80102ba6:	74 5a                	je     80102c02 <mpconfig+0x71>
80102ba8:	8b 70 04             	mov    0x4(%eax),%esi
80102bab:	85 f6                	test   %esi,%esi
80102bad:	74 57                	je     80102c06 <mpconfig+0x75>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80102baf:	8d be 00 00 00 80    	lea    -0x80000000(%esi),%edi
  if(memcmp(conf, "PCMP", 4) != 0)
80102bb5:	83 ec 04             	sub    $0x4,%esp
80102bb8:	6a 04                	push   $0x4
80102bba:	68 5d 6b 10 80       	push   $0x80106b5d
80102bbf:	57                   	push   %edi
<<<<<<< HEAD
80102bc0:	e8 6f 11 00 00       	call   80103d34 <memcmp>
=======
80102bc0:	e8 1b 11 00 00       	call   80103ce0 <memcmp>
>>>>>>> d669a6c (ulib and makefile)
80102bc5:	83 c4 10             	add    $0x10,%esp
80102bc8:	85 c0                	test   %eax,%eax
80102bca:	75 3e                	jne    80102c0a <mpconfig+0x79>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80102bcc:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
80102bd3:	3c 01                	cmp    $0x1,%al
80102bd5:	0f 95 c2             	setne  %dl
80102bd8:	3c 04                	cmp    $0x4,%al
80102bda:	0f 95 c0             	setne  %al
80102bdd:	84 c2                	test   %al,%dl
80102bdf:	75 30                	jne    80102c11 <mpconfig+0x80>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80102be1:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
80102be8:	89 f8                	mov    %edi,%eax
80102bea:	e8 c7 fe ff ff       	call   80102ab6 <sum>
80102bef:	84 c0                	test   %al,%al
80102bf1:	75 25                	jne    80102c18 <mpconfig+0x87>
    return 0;
  *pmp = mp;
80102bf3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102bf6:	89 18                	mov    %ebx,(%eax)
  return conf;
}
80102bf8:	89 f8                	mov    %edi,%eax
80102bfa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102bfd:	5b                   	pop    %ebx
80102bfe:	5e                   	pop    %esi
80102bff:	5f                   	pop    %edi
80102c00:	5d                   	pop    %ebp
80102c01:	c3                   	ret    
    return 0;
80102c02:	89 c7                	mov    %eax,%edi
80102c04:	eb f2                	jmp    80102bf8 <mpconfig+0x67>
80102c06:	89 f7                	mov    %esi,%edi
80102c08:	eb ee                	jmp    80102bf8 <mpconfig+0x67>
    return 0;
80102c0a:	bf 00 00 00 00       	mov    $0x0,%edi
80102c0f:	eb e7                	jmp    80102bf8 <mpconfig+0x67>
    return 0;
80102c11:	bf 00 00 00 00       	mov    $0x0,%edi
80102c16:	eb e0                	jmp    80102bf8 <mpconfig+0x67>
    return 0;
80102c18:	bf 00 00 00 00       	mov    $0x0,%edi
80102c1d:	eb d9                	jmp    80102bf8 <mpconfig+0x67>

80102c1f <mpinit>:

void
mpinit(void)
{
80102c1f:	55                   	push   %ebp
80102c20:	89 e5                	mov    %esp,%ebp
80102c22:	57                   	push   %edi
80102c23:	56                   	push   %esi
80102c24:	53                   	push   %ebx
80102c25:	83 ec 1c             	sub    $0x1c,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80102c28:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80102c2b:	e8 61 ff ff ff       	call   80102b91 <mpconfig>
80102c30:	85 c0                	test   %eax,%eax
80102c32:	74 19                	je     80102c4d <mpinit+0x2e>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80102c34:	8b 50 24             	mov    0x24(%eax),%edx
80102c37:	89 15 80 16 11 80    	mov    %edx,0x80111680
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80102c3d:	8d 50 2c             	lea    0x2c(%eax),%edx
80102c40:	0f b7 48 04          	movzwl 0x4(%eax),%ecx
80102c44:	01 c1                	add    %eax,%ecx
  ismp = 1;
80102c46:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80102c4b:	eb 20                	jmp    80102c6d <mpinit+0x4e>
    panic("Expect to run on an SMP");
80102c4d:	83 ec 0c             	sub    $0xc,%esp
80102c50:	68 62 6b 10 80       	push   $0x80106b62
80102c55:	e8 ee d6 ff ff       	call   80100348 <panic>
    switch(*p){
80102c5a:	bb 00 00 00 00       	mov    $0x0,%ebx
80102c5f:	eb 0c                	jmp    80102c6d <mpinit+0x4e>
80102c61:	83 e8 03             	sub    $0x3,%eax
80102c64:	3c 01                	cmp    $0x1,%al
80102c66:	76 1a                	jbe    80102c82 <mpinit+0x63>
80102c68:	bb 00 00 00 00       	mov    $0x0,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80102c6d:	39 ca                	cmp    %ecx,%edx
80102c6f:	73 4d                	jae    80102cbe <mpinit+0x9f>
    switch(*p){
80102c71:	0f b6 02             	movzbl (%edx),%eax
80102c74:	3c 02                	cmp    $0x2,%al
80102c76:	74 38                	je     80102cb0 <mpinit+0x91>
80102c78:	77 e7                	ja     80102c61 <mpinit+0x42>
80102c7a:	84 c0                	test   %al,%al
80102c7c:	74 09                	je     80102c87 <mpinit+0x68>
80102c7e:	3c 01                	cmp    $0x1,%al
80102c80:	75 d8                	jne    80102c5a <mpinit+0x3b>
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80102c82:	83 c2 08             	add    $0x8,%edx
      continue;
80102c85:	eb e6                	jmp    80102c6d <mpinit+0x4e>
      if(ncpu < NCPU) {
80102c87:	8b 35 84 17 11 80    	mov    0x80111784,%esi
80102c8d:	83 fe 07             	cmp    $0x7,%esi
80102c90:	7f 19                	jg     80102cab <mpinit+0x8c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80102c92:	0f b6 42 01          	movzbl 0x1(%edx),%eax
80102c96:	69 fe b0 00 00 00    	imul   $0xb0,%esi,%edi
80102c9c:	88 87 a0 17 11 80    	mov    %al,-0x7feee860(%edi)
        ncpu++;
80102ca2:	83 c6 01             	add    $0x1,%esi
80102ca5:	89 35 84 17 11 80    	mov    %esi,0x80111784
      p += sizeof(struct mpproc);
80102cab:	83 c2 14             	add    $0x14,%edx
      continue;
80102cae:	eb bd                	jmp    80102c6d <mpinit+0x4e>
      ioapicid = ioapic->apicno;
80102cb0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
80102cb4:	a2 80 17 11 80       	mov    %al,0x80111780
      p += sizeof(struct mpioapic);
80102cb9:	83 c2 08             	add    $0x8,%edx
      continue;
80102cbc:	eb af                	jmp    80102c6d <mpinit+0x4e>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80102cbe:	85 db                	test   %ebx,%ebx
80102cc0:	74 26                	je     80102ce8 <mpinit+0xc9>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
80102cc2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102cc5:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80102cc9:	74 15                	je     80102ce0 <mpinit+0xc1>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ccb:	b8 70 00 00 00       	mov    $0x70,%eax
80102cd0:	ba 22 00 00 00       	mov    $0x22,%edx
80102cd5:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102cd6:	ba 23 00 00 00       	mov    $0x23,%edx
80102cdb:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80102cdc:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102cdf:	ee                   	out    %al,(%dx)
  }
}
80102ce0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ce3:	5b                   	pop    %ebx
80102ce4:	5e                   	pop    %esi
80102ce5:	5f                   	pop    %edi
80102ce6:	5d                   	pop    %ebp
80102ce7:	c3                   	ret    
    panic("Didn't find a suitable machine");
80102ce8:	83 ec 0c             	sub    $0xc,%esp
80102ceb:	68 7c 6b 10 80       	push   $0x80106b7c
80102cf0:	e8 53 d6 ff ff       	call   80100348 <panic>

80102cf5 <picinit>:
80102cf5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102cfa:	ba 21 00 00 00       	mov    $0x21,%edx
80102cff:	ee                   	out    %al,(%dx)
80102d00:	ba a1 00 00 00       	mov    $0xa1,%edx
80102d05:	ee                   	out    %al,(%dx)
picinit(void)
{
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80102d06:	c3                   	ret    

80102d07 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80102d07:	55                   	push   %ebp
80102d08:	89 e5                	mov    %esp,%ebp
80102d0a:	57                   	push   %edi
80102d0b:	56                   	push   %esi
80102d0c:	53                   	push   %ebx
80102d0d:	83 ec 0c             	sub    $0xc,%esp
80102d10:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d13:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
80102d16:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80102d1c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
80102d22:	e8 f6 de ff ff       	call   80100c1d <filealloc>
80102d27:	89 03                	mov    %eax,(%ebx)
80102d29:	85 c0                	test   %eax,%eax
80102d2b:	0f 84 88 00 00 00    	je     80102db9 <pipealloc+0xb2>
80102d31:	e8 e7 de ff ff       	call   80100c1d <filealloc>
80102d36:	89 06                	mov    %eax,(%esi)
80102d38:	85 c0                	test   %eax,%eax
80102d3a:	74 7d                	je     80102db9 <pipealloc+0xb2>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80102d3c:	e8 62 f3 ff ff       	call   801020a3 <kalloc>
80102d41:	89 c7                	mov    %eax,%edi
80102d43:	85 c0                	test   %eax,%eax
80102d45:	74 72                	je     80102db9 <pipealloc+0xb2>
    goto bad;
  p->readopen = 1;
80102d47:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80102d4e:	00 00 00 
  p->writeopen = 1;
80102d51:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80102d58:	00 00 00 
  p->nwrite = 0;
80102d5b:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80102d62:	00 00 00 
  p->nread = 0;
80102d65:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80102d6c:	00 00 00 
  initlock(&p->lock, "pipe");
80102d6f:	83 ec 08             	sub    $0x8,%esp
80102d72:	68 9b 6b 10 80       	push   $0x80106b9b
80102d77:	50                   	push   %eax
<<<<<<< HEAD
80102d78:	e8 8c 0d 00 00       	call   80103b09 <initlock>
=======
80102d78:	e8 38 0d 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
  (*f0)->type = FD_PIPE;
80102d7d:	8b 03                	mov    (%ebx),%eax
80102d7f:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80102d85:	8b 03                	mov    (%ebx),%eax
80102d87:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80102d8b:	8b 03                	mov    (%ebx),%eax
80102d8d:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80102d91:	8b 03                	mov    (%ebx),%eax
80102d93:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80102d96:	8b 06                	mov    (%esi),%eax
80102d98:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80102d9e:	8b 06                	mov    (%esi),%eax
80102da0:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80102da4:	8b 06                	mov    (%esi),%eax
80102da6:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80102daa:	8b 06                	mov    (%esi),%eax
80102dac:	89 78 0c             	mov    %edi,0xc(%eax)
  return 0;
80102daf:	83 c4 10             	add    $0x10,%esp
80102db2:	b8 00 00 00 00       	mov    $0x0,%eax
80102db7:	eb 29                	jmp    80102de2 <pipealloc+0xdb>

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80102db9:	8b 03                	mov    (%ebx),%eax
80102dbb:	85 c0                	test   %eax,%eax
80102dbd:	74 0c                	je     80102dcb <pipealloc+0xc4>
    fileclose(*f0);
80102dbf:	83 ec 0c             	sub    $0xc,%esp
80102dc2:	50                   	push   %eax
80102dc3:	e8 fb de ff ff       	call   80100cc3 <fileclose>
80102dc8:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80102dcb:	8b 06                	mov    (%esi),%eax
80102dcd:	85 c0                	test   %eax,%eax
80102dcf:	74 19                	je     80102dea <pipealloc+0xe3>
    fileclose(*f1);
80102dd1:	83 ec 0c             	sub    $0xc,%esp
80102dd4:	50                   	push   %eax
80102dd5:	e8 e9 de ff ff       	call   80100cc3 <fileclose>
80102dda:	83 c4 10             	add    $0x10,%esp
  return -1;
80102ddd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102de2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102de5:	5b                   	pop    %ebx
80102de6:	5e                   	pop    %esi
80102de7:	5f                   	pop    %edi
80102de8:	5d                   	pop    %ebp
80102de9:	c3                   	ret    
  return -1;
80102dea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102def:	eb f1                	jmp    80102de2 <pipealloc+0xdb>

80102df1 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80102df1:	55                   	push   %ebp
80102df2:	89 e5                	mov    %esp,%ebp
80102df4:	53                   	push   %ebx
80102df5:	83 ec 10             	sub    $0x10,%esp
80102df8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&p->lock);
80102dfb:	53                   	push   %ebx
<<<<<<< HEAD
80102dfc:	e8 44 0e 00 00       	call   80103c45 <acquire>
=======
80102dfc:	e8 f0 0d 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  if(writable){
80102e01:	83 c4 10             	add    $0x10,%esp
80102e04:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80102e08:	74 3f                	je     80102e49 <pipeclose+0x58>
    p->writeopen = 0;
80102e0a:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80102e11:	00 00 00 
    wakeup(&p->nread);
80102e14:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102e1a:	83 ec 0c             	sub    $0xc,%esp
80102e1d:	50                   	push   %eax
<<<<<<< HEAD
80102e1e:	e8 8c 0a 00 00       	call   801038af <wakeup>
=======
80102e1e:	e8 38 0a 00 00       	call   8010385b <wakeup>
>>>>>>> d669a6c (ulib and makefile)
80102e23:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80102e26:	83 bb 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ebx)
80102e2d:	75 09                	jne    80102e38 <pipeclose+0x47>
80102e2f:	83 bb 40 02 00 00 00 	cmpl   $0x0,0x240(%ebx)
80102e36:	74 2f                	je     80102e67 <pipeclose+0x76>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80102e38:	83 ec 0c             	sub    $0xc,%esp
80102e3b:	53                   	push   %ebx
<<<<<<< HEAD
80102e3c:	e8 69 0e 00 00       	call   80103caa <release>
=======
80102e3c:	e8 15 0e 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
80102e41:	83 c4 10             	add    $0x10,%esp
}
80102e44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e47:	c9                   	leave  
80102e48:	c3                   	ret    
    p->readopen = 0;
80102e49:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80102e50:	00 00 00 
    wakeup(&p->nwrite);
80102e53:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102e59:	83 ec 0c             	sub    $0xc,%esp
80102e5c:	50                   	push   %eax
<<<<<<< HEAD
80102e5d:	e8 4d 0a 00 00       	call   801038af <wakeup>
=======
80102e5d:	e8 f9 09 00 00       	call   8010385b <wakeup>
>>>>>>> d669a6c (ulib and makefile)
80102e62:	83 c4 10             	add    $0x10,%esp
80102e65:	eb bf                	jmp    80102e26 <pipeclose+0x35>
    release(&p->lock);
80102e67:	83 ec 0c             	sub    $0xc,%esp
80102e6a:	53                   	push   %ebx
<<<<<<< HEAD
80102e6b:	e8 3a 0e 00 00       	call   80103caa <release>
=======
80102e6b:	e8 e6 0d 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
    kfree((char*)p);
80102e70:	89 1c 24             	mov    %ebx,(%esp)
80102e73:	e8 14 f1 ff ff       	call   80101f8c <kfree>
80102e78:	83 c4 10             	add    $0x10,%esp
80102e7b:	eb c7                	jmp    80102e44 <pipeclose+0x53>

80102e7d <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80102e7d:	55                   	push   %ebp
80102e7e:	89 e5                	mov    %esp,%ebp
80102e80:	57                   	push   %edi
80102e81:	56                   	push   %esi
80102e82:	53                   	push   %ebx
80102e83:	83 ec 18             	sub    $0x18,%esp
80102e86:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e89:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  acquire(&p->lock);
80102e8c:	53                   	push   %ebx
<<<<<<< HEAD
80102e8d:	e8 b3 0d 00 00       	call   80103c45 <acquire>
=======
80102e8d:	e8 5f 0d 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  for(i = 0; i < n; i++){
80102e92:	83 c4 10             	add    $0x10,%esp
80102e95:	bf 00 00 00 00       	mov    $0x0,%edi
80102e9a:	39 f7                	cmp    %esi,%edi
80102e9c:	7c 40                	jl     80102ede <pipewrite+0x61>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80102e9e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102ea4:	83 ec 0c             	sub    $0xc,%esp
80102ea7:	50                   	push   %eax
<<<<<<< HEAD
80102ea8:	e8 02 0a 00 00       	call   801038af <wakeup>
  release(&p->lock);
80102ead:	89 1c 24             	mov    %ebx,(%esp)
80102eb0:	e8 f5 0d 00 00       	call   80103caa <release>
=======
80102ea8:	e8 ae 09 00 00       	call   8010385b <wakeup>
  release(&p->lock);
80102ead:	89 1c 24             	mov    %ebx,(%esp)
80102eb0:	e8 a1 0d 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  return n;
80102eb5:	83 c4 10             	add    $0x10,%esp
80102eb8:	89 f0                	mov    %esi,%eax
80102eba:	eb 5c                	jmp    80102f18 <pipewrite+0x9b>
      wakeup(&p->nread);
80102ebc:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102ec2:	83 ec 0c             	sub    $0xc,%esp
80102ec5:	50                   	push   %eax
<<<<<<< HEAD
80102ec6:	e8 e4 09 00 00       	call   801038af <wakeup>
=======
80102ec6:	e8 90 09 00 00       	call   8010385b <wakeup>
>>>>>>> d669a6c (ulib and makefile)
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80102ecb:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102ed1:	83 c4 08             	add    $0x8,%esp
80102ed4:	53                   	push   %ebx
80102ed5:	50                   	push   %eax
<<<<<<< HEAD
80102ed6:	e8 6f 08 00 00       	call   8010374a <sleep>
=======
80102ed6:	e8 1b 08 00 00       	call   801036f6 <sleep>
>>>>>>> d669a6c (ulib and makefile)
80102edb:	83 c4 10             	add    $0x10,%esp
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80102ede:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80102ee4:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80102eea:	05 00 02 00 00       	add    $0x200,%eax
80102eef:	39 c2                	cmp    %eax,%edx
80102ef1:	75 2d                	jne    80102f20 <pipewrite+0xa3>
      if(p->readopen == 0 || myproc()->killed){
80102ef3:	83 bb 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ebx)
80102efa:	74 0b                	je     80102f07 <pipewrite+0x8a>
80102efc:	e8 b4 02 00 00       	call   801031b5 <myproc>
80102f01:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80102f05:	74 b5                	je     80102ebc <pipewrite+0x3f>
        release(&p->lock);
80102f07:	83 ec 0c             	sub    $0xc,%esp
80102f0a:	53                   	push   %ebx
<<<<<<< HEAD
80102f0b:	e8 9a 0d 00 00       	call   80103caa <release>
=======
80102f0b:	e8 46 0d 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
        return -1;
80102f10:	83 c4 10             	add    $0x10,%esp
80102f13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102f18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f1b:	5b                   	pop    %ebx
80102f1c:	5e                   	pop    %esi
80102f1d:	5f                   	pop    %edi
80102f1e:	5d                   	pop    %ebp
80102f1f:	c3                   	ret    
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80102f20:	8d 42 01             	lea    0x1(%edx),%eax
80102f23:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80102f29:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80102f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
80102f32:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
80102f36:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
80102f3a:	83 c7 01             	add    $0x1,%edi
80102f3d:	e9 58 ff ff ff       	jmp    80102e9a <pipewrite+0x1d>

80102f42 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80102f42:	55                   	push   %ebp
80102f43:	89 e5                	mov    %esp,%ebp
80102f45:	57                   	push   %edi
80102f46:	56                   	push   %esi
80102f47:	53                   	push   %ebx
80102f48:	83 ec 18             	sub    $0x18,%esp
80102f4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f4e:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
80102f51:	53                   	push   %ebx
<<<<<<< HEAD
80102f52:	e8 ee 0c 00 00       	call   80103c45 <acquire>
=======
80102f52:	e8 9a 0c 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80102f57:	83 c4 10             	add    $0x10,%esp
80102f5a:	eb 13                	jmp    80102f6f <piperead+0x2d>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80102f5c:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102f62:	83 ec 08             	sub    $0x8,%esp
80102f65:	53                   	push   %ebx
80102f66:	50                   	push   %eax
<<<<<<< HEAD
80102f67:	e8 de 07 00 00       	call   8010374a <sleep>
=======
80102f67:	e8 8a 07 00 00       	call   801036f6 <sleep>
>>>>>>> d669a6c (ulib and makefile)
80102f6c:	83 c4 10             	add    $0x10,%esp
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80102f6f:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80102f75:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80102f7b:	75 78                	jne    80102ff5 <piperead+0xb3>
80102f7d:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
80102f83:	85 f6                	test   %esi,%esi
80102f85:	74 37                	je     80102fbe <piperead+0x7c>
    if(myproc()->killed){
80102f87:	e8 29 02 00 00       	call   801031b5 <myproc>
80102f8c:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80102f90:	74 ca                	je     80102f5c <piperead+0x1a>
      release(&p->lock);
80102f92:	83 ec 0c             	sub    $0xc,%esp
80102f95:	53                   	push   %ebx
<<<<<<< HEAD
80102f96:	e8 0f 0d 00 00       	call   80103caa <release>
=======
80102f96:	e8 bb 0c 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
      return -1;
80102f9b:	83 c4 10             	add    $0x10,%esp
80102f9e:	be ff ff ff ff       	mov    $0xffffffff,%esi
80102fa3:	eb 46                	jmp    80102feb <piperead+0xa9>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80102fa5:	8d 50 01             	lea    0x1(%eax),%edx
80102fa8:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
80102fae:	25 ff 01 00 00       	and    $0x1ff,%eax
80102fb3:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80102fb8:	88 04 37             	mov    %al,(%edi,%esi,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80102fbb:	83 c6 01             	add    $0x1,%esi
80102fbe:	3b 75 10             	cmp    0x10(%ebp),%esi
80102fc1:	7d 0e                	jge    80102fd1 <piperead+0x8f>
    if(p->nread == p->nwrite)
80102fc3:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80102fc9:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80102fcf:	75 d4                	jne    80102fa5 <piperead+0x63>
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80102fd1:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102fd7:	83 ec 0c             	sub    $0xc,%esp
80102fda:	50                   	push   %eax
<<<<<<< HEAD
80102fdb:	e8 cf 08 00 00       	call   801038af <wakeup>
  release(&p->lock);
80102fe0:	89 1c 24             	mov    %ebx,(%esp)
80102fe3:	e8 c2 0c 00 00       	call   80103caa <release>
=======
80102fdb:	e8 7b 08 00 00       	call   8010385b <wakeup>
  release(&p->lock);
80102fe0:	89 1c 24             	mov    %ebx,(%esp)
80102fe3:	e8 6e 0c 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  return i;
80102fe8:	83 c4 10             	add    $0x10,%esp
}
80102feb:	89 f0                	mov    %esi,%eax
80102fed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ff0:	5b                   	pop    %ebx
80102ff1:	5e                   	pop    %esi
80102ff2:	5f                   	pop    %edi
80102ff3:	5d                   	pop    %ebp
80102ff4:	c3                   	ret    
80102ff5:	be 00 00 00 00       	mov    $0x0,%esi
80102ffa:	eb c2                	jmp    80102fbe <piperead+0x7c>

80102ffc <wakeup1>:
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80102ffc:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
80103001:	eb 03                	jmp    80103006 <wakeup1+0xa>
80103003:	83 c2 7c             	add    $0x7c,%edx
80103006:	81 fa 54 3c 11 80    	cmp    $0x80113c54,%edx
8010300c:	73 14                	jae    80103022 <wakeup1+0x26>
    if(p->state == SLEEPING && p->chan == chan)
8010300e:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103012:	75 ef                	jne    80103003 <wakeup1+0x7>
80103014:	39 42 20             	cmp    %eax,0x20(%edx)
80103017:	75 ea                	jne    80103003 <wakeup1+0x7>
      p->state = RUNNABLE;
80103019:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103020:	eb e1                	jmp    80103003 <wakeup1+0x7>
}
80103022:	c3                   	ret    

80103023 <allocproc>:
{
80103023:	55                   	push   %ebp
80103024:	89 e5                	mov    %esp,%ebp
80103026:	53                   	push   %ebx
80103027:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
<<<<<<< HEAD
8010302a:	68 20 1d 11 80       	push   $0x80111d20
8010302f:	e8 11 0c 00 00       	call   80103c45 <acquire>
=======
8010302a:	68 20 0d 11 80       	push   $0x80110d20
8010302f:	e8 bd 0b 00 00       	call   80103bf1 <acquire>
>>>>>>> d669a6c (ulib and makefile)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103034:	83 c4 10             	add    $0x10,%esp
80103037:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
8010303c:	eb 03                	jmp    80103041 <allocproc+0x1e>
8010303e:	83 c3 7c             	add    $0x7c,%ebx
80103041:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103047:	73 76                	jae    801030bf <allocproc+0x9c>
    if(p->state == UNUSED)
80103049:	83 7b 0c 00          	cmpl   $0x0,0xc(%ebx)
8010304d:	75 ef                	jne    8010303e <allocproc+0x1b>
  p->state = EMBRYO;
8010304f:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
80103056:	a1 04 a0 10 80       	mov    0x8010a004,%eax
8010305b:	8d 50 01             	lea    0x1(%eax),%edx
8010305e:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
80103064:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103067:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
8010306a:	68 20 1d 11 80       	push   $0x80111d20
8010306f:	e8 36 0c 00 00       	call   80103caa <release>
=======
8010306a:	68 20 0d 11 80       	push   $0x80110d20
8010306f:	e8 e2 0b 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  if((p->kstack = kalloc()) == 0){
80103074:	e8 2a f0 ff ff       	call   801020a3 <kalloc>
80103079:	89 43 08             	mov    %eax,0x8(%ebx)
8010307c:	83 c4 10             	add    $0x10,%esp
8010307f:	85 c0                	test   %eax,%eax
80103081:	74 53                	je     801030d6 <allocproc+0xb3>
  sp -= sizeof *p->tf;
80103083:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  p->tf = (struct trapframe*)sp;
80103089:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
<<<<<<< HEAD
8010308c:	c7 80 b0 0f 00 00 72 	movl   $0x80104d72,0xfb0(%eax)
=======
8010308c:	c7 80 b0 0f 00 00 1e 	movl   $0x80104d1e,0xfb0(%eax)
>>>>>>> d669a6c (ulib and makefile)
80103093:	4d 10 80 
  sp -= sizeof *p->context;
80103096:	05 9c 0f 00 00       	add    $0xf9c,%eax
  p->context = (struct context*)sp;
8010309b:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010309e:	83 ec 04             	sub    $0x4,%esp
801030a1:	6a 14                	push   $0x14
801030a3:	6a 00                	push   $0x0
801030a5:	50                   	push   %eax
<<<<<<< HEAD
801030a6:	e8 46 0c 00 00       	call   80103cf1 <memset>
=======
801030a6:	e8 f2 0b 00 00       	call   80103c9d <memset>
>>>>>>> d669a6c (ulib and makefile)
  p->context->eip = (uint)forkret;
801030ab:	8b 43 1c             	mov    0x1c(%ebx),%eax
801030ae:	c7 40 10 e1 30 10 80 	movl   $0x801030e1,0x10(%eax)
  return p;
801030b5:	83 c4 10             	add    $0x10,%esp
}
801030b8:	89 d8                	mov    %ebx,%eax
801030ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801030bd:	c9                   	leave  
801030be:	c3                   	ret    
  release(&ptable.lock);
801030bf:	83 ec 0c             	sub    $0xc,%esp
<<<<<<< HEAD
801030c2:	68 20 1d 11 80       	push   $0x80111d20
801030c7:	e8 de 0b 00 00       	call   80103caa <release>
=======
801030c2:	68 20 0d 11 80       	push   $0x80110d20
801030c7:	e8 8a 0b 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  return 0;
801030cc:	83 c4 10             	add    $0x10,%esp
801030cf:	bb 00 00 00 00       	mov    $0x0,%ebx
801030d4:	eb e2                	jmp    801030b8 <allocproc+0x95>
    p->state = UNUSED;
801030d6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801030dd:	89 c3                	mov    %eax,%ebx
801030df:	eb d7                	jmp    801030b8 <allocproc+0x95>

801030e1 <forkret>:
{
801030e1:	55                   	push   %ebp
801030e2:	89 e5                	mov    %esp,%ebp
801030e4:	83 ec 14             	sub    $0x14,%esp
  release(&ptable.lock);
<<<<<<< HEAD
801030e7:	68 20 1d 11 80       	push   $0x80111d20
801030ec:	e8 b9 0b 00 00       	call   80103caa <release>
=======
801030e7:	68 20 0d 11 80       	push   $0x80110d20
801030ec:	e8 65 0b 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
  if (first) {
801030f1:	83 c4 10             	add    $0x10,%esp
801030f4:	83 3d 00 a0 10 80 00 	cmpl   $0x0,0x8010a000
801030fb:	75 02                	jne    801030ff <forkret+0x1e>
}
801030fd:	c9                   	leave  
801030fe:	c3                   	ret    
    first = 0;
801030ff:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
80103106:	00 00 00 
    iinit(ROOTDEV);
80103109:	83 ec 0c             	sub    $0xc,%esp
8010310c:	6a 01                	push   $0x1
8010310e:	e8 c7 e1 ff ff       	call   801012da <iinit>
    initlog(ROOTDEV);
80103113:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010311a:	e8 16 f6 ff ff       	call   80102735 <initlog>
8010311f:	83 c4 10             	add    $0x10,%esp
}
80103122:	eb d9                	jmp    801030fd <forkret+0x1c>

80103124 <pinit>:
{
80103124:	55                   	push   %ebp
80103125:	89 e5                	mov    %esp,%ebp
80103127:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
<<<<<<< HEAD
8010312a:	68 a0 6b 10 80       	push   $0x80106ba0
8010312f:	68 20 1d 11 80       	push   $0x80111d20
80103134:	e8 d0 09 00 00       	call   80103b09 <initlock>
=======
8010312a:	68 60 6b 10 80       	push   $0x80106b60
8010312f:	68 20 0d 11 80       	push   $0x80110d20
80103134:	e8 7c 09 00 00       	call   80103ab5 <initlock>
>>>>>>> d669a6c (ulib and makefile)
}
80103139:	83 c4 10             	add    $0x10,%esp
8010313c:	c9                   	leave  
8010313d:	c3                   	ret    

8010313e <mycpu>:
{
8010313e:	55                   	push   %ebp
8010313f:	89 e5                	mov    %esp,%ebp
80103141:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103144:	9c                   	pushf  
80103145:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103146:	f6 c4 02             	test   $0x2,%ah
80103149:	75 28                	jne    80103173 <mycpu+0x35>
  apicid = lapicid();
8010314b:	e8 10 f2 ff ff       	call   80102360 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103150:	ba 00 00 00 00       	mov    $0x0,%edx
80103155:	39 15 84 17 11 80    	cmp    %edx,0x80111784
8010315b:	7e 23                	jle    80103180 <mycpu+0x42>
    if (cpus[i].apicid == apicid)
8010315d:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
80103163:	0f b6 89 a0 17 11 80 	movzbl -0x7feee860(%ecx),%ecx
8010316a:	39 c1                	cmp    %eax,%ecx
8010316c:	74 1f                	je     8010318d <mycpu+0x4f>
  for (i = 0; i < ncpu; ++i) {
8010316e:	83 c2 01             	add    $0x1,%edx
80103171:	eb e2                	jmp    80103155 <mycpu+0x17>
    panic("mycpu called with interrupts enabled\n");
80103173:	83 ec 0c             	sub    $0xc,%esp
80103176:	68 84 6c 10 80       	push   $0x80106c84
8010317b:	e8 c8 d1 ff ff       	call   80100348 <panic>
  panic("unknown apicid\n");
80103180:	83 ec 0c             	sub    $0xc,%esp
80103183:	68 a7 6b 10 80       	push   $0x80106ba7
80103188:	e8 bb d1 ff ff       	call   80100348 <panic>
      return &cpus[i];
8010318d:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
80103193:	05 a0 17 11 80       	add    $0x801117a0,%eax
}
80103198:	c9                   	leave  
80103199:	c3                   	ret    

8010319a <cpuid>:
cpuid() {
8010319a:	55                   	push   %ebp
8010319b:	89 e5                	mov    %esp,%ebp
8010319d:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801031a0:	e8 99 ff ff ff       	call   8010313e <mycpu>
801031a5:	2d a0 17 11 80       	sub    $0x801117a0,%eax
801031aa:	c1 f8 04             	sar    $0x4,%eax
801031ad:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801031b3:	c9                   	leave  
801031b4:	c3                   	ret    

801031b5 <myproc>:
myproc(void) {
801031b5:	55                   	push   %ebp
801031b6:	89 e5                	mov    %esp,%ebp
801031b8:	53                   	push   %ebx
801031b9:	83 ec 04             	sub    $0x4,%esp
  pushcli();
<<<<<<< HEAD
801031bc:	e8 a9 09 00 00       	call   80103b6a <pushcli>
=======
801031bc:	e8 55 09 00 00       	call   80103b16 <pushcli>
>>>>>>> d669a6c (ulib and makefile)
  c = mycpu();
801031c1:	e8 78 ff ff ff       	call   8010313e <mycpu>
  p = c->proc;
801031c6:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
<<<<<<< HEAD
801031cc:	e8 d5 09 00 00       	call   80103ba6 <popcli>
=======
801031cc:	e8 81 09 00 00       	call   80103b52 <popcli>
>>>>>>> d669a6c (ulib and makefile)
}
801031d1:	89 d8                	mov    %ebx,%eax
801031d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801031d6:	c9                   	leave  
801031d7:	c3                   	ret    

801031d8 <userinit>:
{
801031d8:	55                   	push   %ebp
801031d9:	89 e5                	mov    %esp,%ebp
801031db:	53                   	push   %ebx
801031dc:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801031df:	e8 3f fe ff ff       	call   80103023 <allocproc>
801031e4:	89 c3                	mov    %eax,%ebx
  initproc = p;
801031e6:	a3 54 3c 11 80       	mov    %eax,0x80113c54
  if((p->pgdir = setupkvm()) == 0)
<<<<<<< HEAD
801031eb:	e8 1c 32 00 00       	call   8010640c <setupkvm>
=======
801031eb:	e8 c8 31 00 00       	call   801063b8 <setupkvm>
>>>>>>> d669a6c (ulib and makefile)
801031f0:	89 43 04             	mov    %eax,0x4(%ebx)
801031f3:	85 c0                	test   %eax,%eax
801031f5:	0f 84 b8 00 00 00    	je     801032b3 <userinit+0xdb>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801031fb:	83 ec 04             	sub    $0x4,%esp
801031fe:	68 2c 00 00 00       	push   $0x2c
80103203:	68 60 a4 10 80       	push   $0x8010a460
80103208:	50                   	push   %eax
<<<<<<< HEAD
80103209:	e8 0e 2f 00 00       	call   8010611c <inituvm>
=======
80103209:	e8 ba 2e 00 00       	call   801060c8 <inituvm>
>>>>>>> d669a6c (ulib and makefile)
  p->sz = PGSIZE;
8010320e:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103214:	8b 43 18             	mov    0x18(%ebx),%eax
80103217:	83 c4 0c             	add    $0xc,%esp
8010321a:	6a 4c                	push   $0x4c
8010321c:	6a 00                	push   $0x0
8010321e:	50                   	push   %eax
<<<<<<< HEAD
8010321f:	e8 cd 0a 00 00       	call   80103cf1 <memset>
=======
8010321f:	e8 79 0a 00 00       	call   80103c9d <memset>
>>>>>>> d669a6c (ulib and makefile)
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103224:	8b 43 18             	mov    0x18(%ebx),%eax
80103227:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010322d:	8b 43 18             	mov    0x18(%ebx),%eax
80103230:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103236:	8b 43 18             	mov    0x18(%ebx),%eax
80103239:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010323d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103241:	8b 43 18             	mov    0x18(%ebx),%eax
80103244:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103248:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010324c:	8b 43 18             	mov    0x18(%ebx),%eax
8010324f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103256:	8b 43 18             	mov    0x18(%ebx),%eax
80103259:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103260:	8b 43 18             	mov    0x18(%ebx),%eax
80103263:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010326a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010326d:	83 c4 0c             	add    $0xc,%esp
80103270:	6a 10                	push   $0x10
80103272:	68 d0 6b 10 80       	push   $0x80106bd0
80103277:	50                   	push   %eax
<<<<<<< HEAD
80103278:	e8 e0 0b 00 00       	call   80103e5d <safestrcpy>
=======
80103278:	e8 8c 0b 00 00       	call   80103e09 <safestrcpy>
>>>>>>> d669a6c (ulib and makefile)
  p->cwd = namei("/");
8010327d:	c7 04 24 d9 6b 10 80 	movl   $0x80106bd9,(%esp)
80103284:	e8 44 e9 ff ff       	call   80101bcd <namei>
80103289:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
<<<<<<< HEAD
8010328c:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103293:	e8 ad 09 00 00       	call   80103c45 <acquire>
  p->state = RUNNABLE;
80103298:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010329f:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801032a6:	e8 ff 09 00 00       	call   80103caa <release>
=======
8010328c:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
80103293:	e8 59 09 00 00       	call   80103bf1 <acquire>
  p->state = RUNNABLE;
80103298:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010329f:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801032a6:	e8 ab 09 00 00       	call   80103c56 <release>
>>>>>>> d669a6c (ulib and makefile)
}
801032ab:	83 c4 10             	add    $0x10,%esp
801032ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801032b1:	c9                   	leave  
801032b2:	c3                   	ret    
    panic("userinit: out of memory?");
801032b3:	83 ec 0c             	sub    $0xc,%esp
801032b6:	68 b7 6b 10 80       	push   $0x80106bb7
801032bb:	e8 88 d0 ff ff       	call   80100348 <panic>

801032c0 <growproc>:
{
801032c0:	55                   	push   %ebp
801032c1:	89 e5                	mov    %esp,%ebp
801032c3:	56                   	push   %esi
801032c4:	53                   	push   %ebx
801032c5:	8b 75 08             	mov    0x8(%ebp),%esi
  struct proc *curproc = myproc();
801032c8:	e8 e8 fe ff ff       	call   801031b5 <myproc>
801032cd:	89 c3                	mov    %eax,%ebx
  sz = curproc->sz;
801032cf:	8b 00                	mov    (%eax),%eax
  if(n > 0){
801032d1:	85 f6                	test   %esi,%esi
801032d3:	7f 1c                	jg     801032f1 <growproc+0x31>
  } else if(n < 0){
801032d5:	78 37                	js     8010330e <growproc+0x4e>
  curproc->sz = sz;
801032d7:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801032d9:	83 ec 0c             	sub    $0xc,%esp
801032dc:	53                   	push   %ebx
<<<<<<< HEAD
801032dd:	e8 da 2c 00 00       	call   80105fbc <switchuvm>
=======
801032dd:	e8 86 2c 00 00       	call   80105f68 <switchuvm>
>>>>>>> d669a6c (ulib and makefile)
  return 0;
801032e2:	83 c4 10             	add    $0x10,%esp
801032e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
801032ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
801032ed:	5b                   	pop    %ebx
801032ee:	5e                   	pop    %esi
801032ef:	5d                   	pop    %ebp
801032f0:	c3                   	ret    
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801032f1:	83 ec 04             	sub    $0x4,%esp
801032f4:	01 c6                	add    %eax,%esi
801032f6:	56                   	push   %esi
801032f7:	50                   	push   %eax
801032f8:	ff 73 04             	push   0x4(%ebx)
<<<<<<< HEAD
801032fb:	e8 b2 2f 00 00       	call   801062b2 <allocuvm>
=======
801032fb:	e8 5e 2f 00 00       	call   8010625e <allocuvm>
>>>>>>> d669a6c (ulib and makefile)
80103300:	83 c4 10             	add    $0x10,%esp
80103303:	85 c0                	test   %eax,%eax
80103305:	75 d0                	jne    801032d7 <growproc+0x17>
      return -1;
80103307:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010330c:	eb dc                	jmp    801032ea <growproc+0x2a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010330e:	83 ec 04             	sub    $0x4,%esp
80103311:	01 c6                	add    %eax,%esi
80103313:	56                   	push   %esi
80103314:	50                   	push   %eax
80103315:	ff 73 04             	push   0x4(%ebx)
<<<<<<< HEAD
80103318:	e8 03 2f 00 00       	call   80106220 <deallocuvm>
=======
80103318:	e8 af 2e 00 00       	call   801061cc <deallocuvm>
>>>>>>> d669a6c (ulib and makefile)
8010331d:	83 c4 10             	add    $0x10,%esp
80103320:	85 c0                	test   %eax,%eax
80103322:	75 b3                	jne    801032d7 <growproc+0x17>
      return -1;
80103324:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103329:	eb bf                	jmp    801032ea <growproc+0x2a>

8010332b <clone>:
int clone(void(*fcn)(void*, void*), void *arg1, void *arg2, void *stack) {
8010332b:	55                   	push   %ebp
8010332c:	89 e5                	mov    %esp,%ebp
8010332e:	57                   	push   %edi
8010332f:	56                   	push   %esi
80103330:	53                   	push   %ebx
80103331:	83 ec 2c             	sub    $0x2c,%esp
80103334:	8b 75 14             	mov    0x14(%ebp),%esi
  struct proc *curproc = myproc();
80103337:	e8 79 fe ff ff       	call   801031b5 <myproc>
  if(((uint)stack % PGSIZE) != 0){
8010333c:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
80103342:	75 0d                	jne    80103351 <clone+0x26>
80103344:	89 c3                	mov    %eax,%ebx
  if((curproc->sz - (uint)stack) < PGSIZE){
80103346:	8b 00                	mov    (%eax),%eax
80103348:	29 f0                	sub    %esi,%eax
8010334a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
8010334f:	77 0d                	ja     8010335e <clone+0x33>
}
80103351:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103356:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103359:	5b                   	pop    %ebx
8010335a:	5e                   	pop    %esi
8010335b:	5f                   	pop    %edi
8010335c:	5d                   	pop    %ebp
8010335d:	c3                   	ret    
  if((np = allocproc()) == 0){
<<<<<<< HEAD
8010335e:	e8 c0 fc ff ff       	call   80103023 <allocproc>
80103363:	89 c2                	mov    %eax,%edx
80103365:	89 45 d0             	mov    %eax,-0x30(%ebp)
80103368:	85 c0                	test   %eax,%eax
8010336a:	74 e5                	je     80103351 <clone+0x26>
  np->pgdir = curproc->pgdir;
8010336c:	8b 43 04             	mov    0x4(%ebx),%eax
8010336f:	89 d7                	mov    %edx,%edi
80103371:	89 42 04             	mov    %eax,0x4(%edx)
  tmp_u_stack[0] = (uint)arg2;
80103374:	8b 45 10             	mov    0x10(%ebp),%eax
80103377:	89 45 dc             	mov    %eax,-0x24(%ebp)
  tmp_u_stack[1] = (uint)arg1;
8010337a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010337d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  tmp_u_stack[2] = 0xffffffff;
80103380:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  stack_ptr -= 12;
80103387:	8d 8e f4 0f 00 00    	lea    0xff4(%esi),%ecx
  if (copyout(np->pgdir, stack_ptr, tmp_u_stack, 12) < 0){
8010338d:	6a 0c                	push   $0xc
8010338f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80103392:	50                   	push   %eax
80103393:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80103396:	51                   	push   %ecx
80103397:	ff 72 04             	push   0x4(%edx)
8010339a:	e8 40 32 00 00       	call   801065df <copyout>
8010339f:	83 c4 10             	add    $0x10,%esp
801033a2:	85 c0                	test   %eax,%eax
801033a4:	78 ab                	js     80103351 <clone+0x26>
  np->sz = curproc->sz; 
801033a6:	8b 03                	mov    (%ebx),%eax
801033a8:	89 fa                	mov    %edi,%edx
801033aa:	89 07                	mov    %eax,(%edi)
  np->parent = curproc;
801033ac:	89 5f 14             	mov    %ebx,0x14(%edi)
  *np->tf = *curproc->tf;
801033af:	8b 73 18             	mov    0x18(%ebx),%esi
801033b2:	8b 7f 18             	mov    0x18(%edi),%edi
801033b5:	b9 13 00 00 00       	mov    $0x13,%ecx
801033ba:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eip = (uint)fcn;
801033bc:	89 d7                	mov    %edx,%edi
801033be:	8b 42 18             	mov    0x18(%edx),%eax
801033c1:	8b 55 08             	mov    0x8(%ebp),%edx
801033c4:	89 50 38             	mov    %edx,0x38(%eax)
  np->tf->esp = (uint)stack+PGSIZE-12;
801033c7:	8b 47 18             	mov    0x18(%edi),%eax
801033ca:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
801033cd:	89 48 44             	mov    %ecx,0x44(%eax)
  np->tf->ebp = (uint)stack+PGSIZE-12;
801033d0:	8b 47 18             	mov    0x18(%edi),%eax
801033d3:	89 48 08             	mov    %ecx,0x8(%eax)
  for(i = 0; i < NOFILE; i++)
801033d6:	be 00 00 00 00       	mov    $0x0,%esi
801033db:	eb 03                	jmp    801033e0 <clone+0xb5>
801033dd:	83 c6 01             	add    $0x1,%esi
801033e0:	83 fe 0f             	cmp    $0xf,%esi
801033e3:	7f 1a                	jg     801033ff <clone+0xd4>
    if(curproc->ofile[i])
801033e5:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801033e9:	85 c0                	test   %eax,%eax
801033eb:	74 f0                	je     801033dd <clone+0xb2>
      np->ofile[i] = filedup(curproc->ofile[i]);
801033ed:	83 ec 0c             	sub    $0xc,%esp
801033f0:	50                   	push   %eax
801033f1:	e8 88 d8 ff ff       	call   80100c7e <filedup>
801033f6:	89 44 b7 28          	mov    %eax,0x28(%edi,%esi,4)
801033fa:	83 c4 10             	add    $0x10,%esp
801033fd:	eb de                	jmp    801033dd <clone+0xb2>
  np->cwd = idup(curproc->cwd);
801033ff:	83 ec 0c             	sub    $0xc,%esp
80103402:	ff 73 68             	push   0x68(%ebx)
80103405:	e8 35 e1 ff ff       	call   8010153f <idup>
8010340a:	8b 4d d0             	mov    -0x30(%ebp),%ecx
8010340d:	89 41 68             	mov    %eax,0x68(%ecx)
  return pid;
80103410:	83 c4 10             	add    $0x10,%esp
80103413:	e9 39 ff ff ff       	jmp    80103351 <clone+0x26>

80103418 <join>:
}
80103418:	b8 00 00 00 00       	mov    $0x0,%eax
8010341d:	c3                   	ret    

8010341e <fork>:
{
8010341e:	55                   	push   %ebp
8010341f:	89 e5                	mov    %esp,%ebp
80103421:	57                   	push   %edi
80103422:	56                   	push   %esi
80103423:	53                   	push   %ebx
80103424:	83 ec 1c             	sub    $0x1c,%esp
  struct proc *curproc = myproc();
80103427:	e8 89 fd ff ff       	call   801031b5 <myproc>
8010342c:	89 c3                	mov    %eax,%ebx
  if((np = allocproc()) == 0){
8010342e:	e8 f0 fb ff ff       	call   80103023 <allocproc>
80103433:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103436:	85 c0                	test   %eax,%eax
80103438:	0f 84 e0 00 00 00    	je     8010351e <fork+0x100>
8010343e:	89 c7                	mov    %eax,%edi
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103440:	83 ec 08             	sub    $0x8,%esp
80103443:	ff 33                	push   (%ebx)
80103445:	ff 73 04             	push   0x4(%ebx)
80103448:	e8 70 30 00 00       	call   801064bd <copyuvm>
8010344d:	89 47 04             	mov    %eax,0x4(%edi)
80103450:	83 c4 10             	add    $0x10,%esp
80103453:	85 c0                	test   %eax,%eax
80103455:	74 2a                	je     80103481 <fork+0x63>
  np->sz = curproc->sz;
80103457:	8b 03                	mov    (%ebx),%eax
80103459:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010345c:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
8010345e:	89 c8                	mov    %ecx,%eax
80103460:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103463:	8b 73 18             	mov    0x18(%ebx),%esi
80103466:	8b 79 18             	mov    0x18(%ecx),%edi
80103469:	b9 13 00 00 00       	mov    $0x13,%ecx
8010346e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eax = 0;
80103470:	8b 40 18             	mov    0x18(%eax),%eax
80103473:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  for(i = 0; i < NOFILE; i++)
8010347a:	be 00 00 00 00       	mov    $0x0,%esi
8010347f:	eb 29                	jmp    801034aa <fork+0x8c>
    kfree(np->kstack);
80103481:	83 ec 0c             	sub    $0xc,%esp
80103484:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103487:	ff 73 08             	push   0x8(%ebx)
8010348a:	e8 fd ea ff ff       	call   80101f8c <kfree>
    np->kstack = 0;
8010348f:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103496:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
8010349d:	83 c4 10             	add    $0x10,%esp
801034a0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801034a5:	eb 6d                	jmp    80103514 <fork+0xf6>
  for(i = 0; i < NOFILE; i++)
801034a7:	83 c6 01             	add    $0x1,%esi
801034aa:	83 fe 0f             	cmp    $0xf,%esi
801034ad:	7f 1d                	jg     801034cc <fork+0xae>
    if(curproc->ofile[i])
801034af:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801034b3:	85 c0                	test   %eax,%eax
801034b5:	74 f0                	je     801034a7 <fork+0x89>
      np->ofile[i] = filedup(curproc->ofile[i]);
801034b7:	83 ec 0c             	sub    $0xc,%esp
801034ba:	50                   	push   %eax
801034bb:	e8 be d7 ff ff       	call   80100c7e <filedup>
801034c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801034c3:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
801034c7:	83 c4 10             	add    $0x10,%esp
801034ca:	eb db                	jmp    801034a7 <fork+0x89>
  np->cwd = idup(curproc->cwd);
801034cc:	83 ec 0c             	sub    $0xc,%esp
801034cf:	ff 73 68             	push   0x68(%ebx)
801034d2:	e8 68 e0 ff ff       	call   8010153f <idup>
801034d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801034da:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801034dd:	83 c3 6c             	add    $0x6c,%ebx
801034e0:	8d 47 6c             	lea    0x6c(%edi),%eax
801034e3:	83 c4 0c             	add    $0xc,%esp
801034e6:	6a 10                	push   $0x10
801034e8:	53                   	push   %ebx
801034e9:	50                   	push   %eax
801034ea:	e8 6e 09 00 00       	call   80103e5d <safestrcpy>
  pid = np->pid;
801034ef:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
801034f2:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801034f9:	e8 47 07 00 00       	call   80103c45 <acquire>
  np->state = RUNNABLE;
801034fe:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103505:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010350c:	e8 99 07 00 00       	call   80103caa <release>
  return pid;
80103511:	83 c4 10             	add    $0x10,%esp
}
80103514:	89 d8                	mov    %ebx,%eax
80103516:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103519:	5b                   	pop    %ebx
8010351a:	5e                   	pop    %esi
8010351b:	5f                   	pop    %edi
8010351c:	5d                   	pop    %ebp
8010351d:	c3                   	ret    
    return -1;
8010351e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103523:	eb ef                	jmp    80103514 <fork+0xf6>

80103525 <scheduler>:
{
80103525:	55                   	push   %ebp
80103526:	89 e5                	mov    %esp,%ebp
80103528:	56                   	push   %esi
80103529:	53                   	push   %ebx
  struct cpu *c = mycpu();
8010352a:	e8 0f fc ff ff       	call   8010313e <mycpu>
8010352f:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103531:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103538:	00 00 00 
8010353b:	eb 5a                	jmp    80103597 <scheduler+0x72>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010353d:	83 c3 7c             	add    $0x7c,%ebx
80103540:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103546:	73 3f                	jae    80103587 <scheduler+0x62>
      if(p->state != RUNNABLE)
80103548:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
8010354c:	75 ef                	jne    8010353d <scheduler+0x18>
      c->proc = p;
8010354e:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103554:	83 ec 0c             	sub    $0xc,%esp
80103557:	53                   	push   %ebx
80103558:	e8 5f 2a 00 00       	call   80105fbc <switchuvm>
      p->state = RUNNING;
8010355d:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103564:	83 c4 08             	add    $0x8,%esp
80103567:	ff 73 1c             	push   0x1c(%ebx)
8010356a:	8d 46 04             	lea    0x4(%esi),%eax
8010356d:	50                   	push   %eax
8010356e:	e8 3f 09 00 00       	call   80103eb2 <swtch>
      switchkvm();
80103573:	e8 36 2a 00 00       	call   80105fae <switchkvm>
      c->proc = 0;
80103578:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
8010357f:	00 00 00 
80103582:	83 c4 10             	add    $0x10,%esp
80103585:	eb b6                	jmp    8010353d <scheduler+0x18>
    release(&ptable.lock);
80103587:	83 ec 0c             	sub    $0xc,%esp
8010358a:	68 20 1d 11 80       	push   $0x80111d20
8010358f:	e8 16 07 00 00       	call   80103caa <release>
    sti();
80103594:	83 c4 10             	add    $0x10,%esp
  asm volatile("sti");
80103597:	fb                   	sti    
    acquire(&ptable.lock);
80103598:	83 ec 0c             	sub    $0xc,%esp
8010359b:	68 20 1d 11 80       	push   $0x80111d20
801035a0:	e8 a0 06 00 00       	call   80103c45 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801035a5:	83 c4 10             	add    $0x10,%esp
801035a8:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801035ad:	eb 91                	jmp    80103540 <scheduler+0x1b>

801035af <sched>:
{
801035af:	55                   	push   %ebp
801035b0:	89 e5                	mov    %esp,%ebp
801035b2:	56                   	push   %esi
801035b3:	53                   	push   %ebx
  struct proc *p = myproc();
801035b4:	e8 fc fb ff ff       	call   801031b5 <myproc>
801035b9:	89 c3                	mov    %eax,%ebx
  if(!holding(&ptable.lock))
801035bb:	83 ec 0c             	sub    $0xc,%esp
801035be:	68 20 1d 11 80       	push   $0x80111d20
801035c3:	e8 3e 06 00 00       	call   80103c06 <holding>
801035c8:	83 c4 10             	add    $0x10,%esp
801035cb:	85 c0                	test   %eax,%eax
801035cd:	74 4f                	je     8010361e <sched+0x6f>
  if(mycpu()->ncli != 1)
801035cf:	e8 6a fb ff ff       	call   8010313e <mycpu>
801035d4:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
801035db:	75 4e                	jne    8010362b <sched+0x7c>
  if(p->state == RUNNING)
801035dd:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
801035e1:	74 55                	je     80103638 <sched+0x89>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801035e3:	9c                   	pushf  
801035e4:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801035e5:	f6 c4 02             	test   $0x2,%ah
801035e8:	75 5b                	jne    80103645 <sched+0x96>
  intena = mycpu()->intena;
801035ea:	e8 4f fb ff ff       	call   8010313e <mycpu>
801035ef:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
801035f5:	e8 44 fb ff ff       	call   8010313e <mycpu>
801035fa:	83 ec 08             	sub    $0x8,%esp
801035fd:	ff 70 04             	push   0x4(%eax)
80103600:	83 c3 1c             	add    $0x1c,%ebx
80103603:	53                   	push   %ebx
80103604:	e8 a9 08 00 00       	call   80103eb2 <swtch>
  mycpu()->intena = intena;
80103609:	e8 30 fb ff ff       	call   8010313e <mycpu>
8010360e:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103614:	83 c4 10             	add    $0x10,%esp
80103617:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010361a:	5b                   	pop    %ebx
8010361b:	5e                   	pop    %esi
8010361c:	5d                   	pop    %ebp
8010361d:	c3                   	ret    
    panic("sched ptable.lock");
8010361e:	83 ec 0c             	sub    $0xc,%esp
80103621:	68 db 6b 10 80       	push   $0x80106bdb
80103626:	e8 1d cd ff ff       	call   80100348 <panic>
    panic("sched locks");
8010362b:	83 ec 0c             	sub    $0xc,%esp
8010362e:	68 ed 6b 10 80       	push   $0x80106bed
80103633:	e8 10 cd ff ff       	call   80100348 <panic>
    panic("sched running");
80103638:	83 ec 0c             	sub    $0xc,%esp
8010363b:	68 f9 6b 10 80       	push   $0x80106bf9
80103640:	e8 03 cd ff ff       	call   80100348 <panic>
    panic("sched interruptible");
80103645:	83 ec 0c             	sub    $0xc,%esp
80103648:	68 07 6c 10 80       	push   $0x80106c07
8010364d:	e8 f6 cc ff ff       	call   80100348 <panic>

80103652 <exit>:
{
80103652:	55                   	push   %ebp
80103653:	89 e5                	mov    %esp,%ebp
80103655:	56                   	push   %esi
80103656:	53                   	push   %ebx
  struct proc *curproc = myproc();
80103657:	e8 59 fb ff ff       	call   801031b5 <myproc>
  if(curproc == initproc)
8010365c:	39 05 54 3c 11 80    	cmp    %eax,0x80113c54
80103662:	74 09                	je     8010366d <exit+0x1b>
80103664:	89 c6                	mov    %eax,%esi
  for(fd = 0; fd < NOFILE; fd++){
80103666:	bb 00 00 00 00       	mov    $0x0,%ebx
8010366b:	eb 24                	jmp    80103691 <exit+0x3f>
    panic("init exiting");
8010366d:	83 ec 0c             	sub    $0xc,%esp
80103670:	68 1b 6c 10 80       	push   $0x80106c1b
80103675:	e8 ce cc ff ff       	call   80100348 <panic>
      fileclose(curproc->ofile[fd]);
8010367a:	83 ec 0c             	sub    $0xc,%esp
8010367d:	50                   	push   %eax
8010367e:	e8 40 d6 ff ff       	call   80100cc3 <fileclose>
      curproc->ofile[fd] = 0;
80103683:	c7 44 9e 28 00 00 00 	movl   $0x0,0x28(%esi,%ebx,4)
8010368a:	00 
8010368b:	83 c4 10             	add    $0x10,%esp
  for(fd = 0; fd < NOFILE; fd++){
8010368e:	83 c3 01             	add    $0x1,%ebx
80103691:	83 fb 0f             	cmp    $0xf,%ebx
80103694:	7f 0a                	jg     801036a0 <exit+0x4e>
    if(curproc->ofile[fd]){
80103696:	8b 44 9e 28          	mov    0x28(%esi,%ebx,4),%eax
8010369a:	85 c0                	test   %eax,%eax
8010369c:	75 dc                	jne    8010367a <exit+0x28>
8010369e:	eb ee                	jmp    8010368e <exit+0x3c>
  begin_op();
801036a0:	e8 d9 f0 ff ff       	call   8010277e <begin_op>
  iput(curproc->cwd);
801036a5:	83 ec 0c             	sub    $0xc,%esp
801036a8:	ff 76 68             	push   0x68(%esi)
801036ab:	e8 c6 df ff ff       	call   80101676 <iput>
  end_op();
801036b0:	e8 43 f1 ff ff       	call   801027f8 <end_op>
  curproc->cwd = 0;
801036b5:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
801036bc:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801036c3:	e8 7d 05 00 00       	call   80103c45 <acquire>
  wakeup1(curproc->parent);
801036c8:	8b 46 14             	mov    0x14(%esi),%eax
801036cb:	e8 2c f9 ff ff       	call   80102ffc <wakeup1>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801036d0:	83 c4 10             	add    $0x10,%esp
801036d3:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801036d8:	eb 03                	jmp    801036dd <exit+0x8b>
801036da:	83 c3 7c             	add    $0x7c,%ebx
801036dd:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
801036e3:	73 1a                	jae    801036ff <exit+0xad>
    if(p->parent == curproc){
801036e5:	39 73 14             	cmp    %esi,0x14(%ebx)
801036e8:	75 f0                	jne    801036da <exit+0x88>
      p->parent = initproc;
801036ea:	a1 54 3c 11 80       	mov    0x80113c54,%eax
801036ef:	89 43 14             	mov    %eax,0x14(%ebx)
      if(p->state == ZOMBIE)
801036f2:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801036f6:	75 e2                	jne    801036da <exit+0x88>
        wakeup1(initproc);
801036f8:	e8 ff f8 ff ff       	call   80102ffc <wakeup1>
801036fd:	eb db                	jmp    801036da <exit+0x88>
  curproc->state = ZOMBIE;
801036ff:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103706:	e8 a4 fe ff ff       	call   801035af <sched>
  panic("zombie exit");
8010370b:	83 ec 0c             	sub    $0xc,%esp
8010370e:	68 28 6c 10 80       	push   $0x80106c28
80103713:	e8 30 cc ff ff       	call   80100348 <panic>

80103718 <yield>:
{
80103718:	55                   	push   %ebp
80103719:	89 e5                	mov    %esp,%ebp
8010371b:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
8010371e:	68 20 1d 11 80       	push   $0x80111d20
80103723:	e8 1d 05 00 00       	call   80103c45 <acquire>
  myproc()->state = RUNNABLE;
80103728:	e8 88 fa ff ff       	call   801031b5 <myproc>
8010372d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103734:	e8 76 fe ff ff       	call   801035af <sched>
  release(&ptable.lock);
80103739:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103740:	e8 65 05 00 00       	call   80103caa <release>
}
80103745:	83 c4 10             	add    $0x10,%esp
80103748:	c9                   	leave  
80103749:	c3                   	ret    

8010374a <sleep>:
{
8010374a:	55                   	push   %ebp
8010374b:	89 e5                	mov    %esp,%ebp
8010374d:	56                   	push   %esi
8010374e:	53                   	push   %ebx
8010374f:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *p = myproc();
80103752:	e8 5e fa ff ff       	call   801031b5 <myproc>
  if(p == 0)
80103757:	85 c0                	test   %eax,%eax
80103759:	74 66                	je     801037c1 <sleep+0x77>
8010375b:	89 c3                	mov    %eax,%ebx
  if(lk == 0)
8010375d:	85 f6                	test   %esi,%esi
8010375f:	74 6d                	je     801037ce <sleep+0x84>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103761:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
80103767:	74 18                	je     80103781 <sleep+0x37>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103769:	83 ec 0c             	sub    $0xc,%esp
8010376c:	68 20 1d 11 80       	push   $0x80111d20
80103771:	e8 cf 04 00 00       	call   80103c45 <acquire>
    release(lk);
80103776:	89 34 24             	mov    %esi,(%esp)
80103779:	e8 2c 05 00 00       	call   80103caa <release>
8010377e:	83 c4 10             	add    $0x10,%esp
  p->chan = chan;
80103781:	8b 45 08             	mov    0x8(%ebp),%eax
80103784:	89 43 20             	mov    %eax,0x20(%ebx)
  p->state = SLEEPING;
80103787:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
8010378e:	e8 1c fe ff ff       	call   801035af <sched>
  p->chan = 0;
80103793:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  if(lk != &ptable.lock){  //DOC: sleeplock2
8010379a:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
801037a0:	74 18                	je     801037ba <sleep+0x70>
    release(&ptable.lock);
801037a2:	83 ec 0c             	sub    $0xc,%esp
801037a5:	68 20 1d 11 80       	push   $0x80111d20
801037aa:	e8 fb 04 00 00       	call   80103caa <release>
    acquire(lk);
801037af:	89 34 24             	mov    %esi,(%esp)
801037b2:	e8 8e 04 00 00       	call   80103c45 <acquire>
801037b7:	83 c4 10             	add    $0x10,%esp
}
801037ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
801037bd:	5b                   	pop    %ebx
801037be:	5e                   	pop    %esi
801037bf:	5d                   	pop    %ebp
801037c0:	c3                   	ret    
    panic("sleep");
801037c1:	83 ec 0c             	sub    $0xc,%esp
801037c4:	68 34 6c 10 80       	push   $0x80106c34
801037c9:	e8 7a cb ff ff       	call   80100348 <panic>
    panic("sleep without lk");
801037ce:	83 ec 0c             	sub    $0xc,%esp
801037d1:	68 3a 6c 10 80       	push   $0x80106c3a
801037d6:	e8 6d cb ff ff       	call   80100348 <panic>

801037db <wait>:
{
801037db:	55                   	push   %ebp
801037dc:	89 e5                	mov    %esp,%ebp
801037de:	56                   	push   %esi
801037df:	53                   	push   %ebx
  struct proc *curproc = myproc();
801037e0:	e8 d0 f9 ff ff       	call   801031b5 <myproc>
801037e5:	89 c6                	mov    %eax,%esi
  acquire(&ptable.lock);
801037e7:	83 ec 0c             	sub    $0xc,%esp
801037ea:	68 20 1d 11 80       	push   $0x80111d20
801037ef:	e8 51 04 00 00       	call   80103c45 <acquire>
801037f4:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
801037f7:	b8 00 00 00 00       	mov    $0x0,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801037fc:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103801:	eb 5b                	jmp    8010385e <wait+0x83>
        pid = p->pid;
80103803:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103806:	83 ec 0c             	sub    $0xc,%esp
80103809:	ff 73 08             	push   0x8(%ebx)
8010380c:	e8 7b e7 ff ff       	call   80101f8c <kfree>
        p->kstack = 0;
80103811:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103818:	83 c4 04             	add    $0x4,%esp
8010381b:	ff 73 04             	push   0x4(%ebx)
8010381e:	e8 79 2b 00 00       	call   8010639c <freevm>
        p->pid = 0;
80103823:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010382a:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103831:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103835:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010383c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103843:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010384a:	e8 5b 04 00 00       	call   80103caa <release>
        return pid;
8010384f:	83 c4 10             	add    $0x10,%esp
}
80103852:	89 f0                	mov    %esi,%eax
80103854:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103857:	5b                   	pop    %ebx
80103858:	5e                   	pop    %esi
80103859:	5d                   	pop    %ebp
8010385a:	c3                   	ret    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010385b:	83 c3 7c             	add    $0x7c,%ebx
8010385e:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103864:	73 12                	jae    80103878 <wait+0x9d>
      if(p->parent != curproc)
80103866:	39 73 14             	cmp    %esi,0x14(%ebx)
80103869:	75 f0                	jne    8010385b <wait+0x80>
      if(p->state == ZOMBIE){
8010386b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010386f:	74 92                	je     80103803 <wait+0x28>
      havekids = 1;
80103871:	b8 01 00 00 00       	mov    $0x1,%eax
80103876:	eb e3                	jmp    8010385b <wait+0x80>
    if(!havekids || curproc->killed){
80103878:	85 c0                	test   %eax,%eax
8010387a:	74 06                	je     80103882 <wait+0xa7>
8010387c:	83 7e 24 00          	cmpl   $0x0,0x24(%esi)
80103880:	74 17                	je     80103899 <wait+0xbe>
      release(&ptable.lock);
80103882:	83 ec 0c             	sub    $0xc,%esp
80103885:	68 20 1d 11 80       	push   $0x80111d20
8010388a:	e8 1b 04 00 00       	call   80103caa <release>
      return -1;
8010388f:	83 c4 10             	add    $0x10,%esp
80103892:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103897:	eb b9                	jmp    80103852 <wait+0x77>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103899:	83 ec 08             	sub    $0x8,%esp
8010389c:	68 20 1d 11 80       	push   $0x80111d20
801038a1:	56                   	push   %esi
801038a2:	e8 a3 fe ff ff       	call   8010374a <sleep>
    havekids = 0;
801038a7:	83 c4 10             	add    $0x10,%esp
801038aa:	e9 48 ff ff ff       	jmp    801037f7 <wait+0x1c>

801038af <wakeup>:
=======
8010333b:	e8 e3 fc ff ff       	call   80103023 <allocproc>
80103340:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103343:	85 c0                	test   %eax,%eax
80103345:	74 70                	je     801033b7 <clone+0x8c>
80103347:	89 c2                	mov    %eax,%edx
  np->pgdir = curproc->pgdir;
80103349:	8b 43 04             	mov    0x4(%ebx),%eax
8010334c:	89 42 04             	mov    %eax,0x4(%edx)
  np->sz = curproc->sz; 
8010334f:	8b 03                	mov    (%ebx),%eax
80103351:	89 02                	mov    %eax,(%edx)
  np->parent = curproc;
80103353:	89 5a 14             	mov    %ebx,0x14(%edx)
  *np->tf = *curproc->tf;
80103356:	8b 73 18             	mov    0x18(%ebx),%esi
80103359:	8b 7a 18             	mov    0x18(%edx),%edi
8010335c:	b9 13 00 00 00       	mov    $0x13,%ecx
80103361:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eip = (uint)fcn;
80103363:	89 d7                	mov    %edx,%edi
80103365:	8b 42 18             	mov    0x18(%edx),%eax
80103368:	8b 55 08             	mov    0x8(%ebp),%edx
8010336b:	89 50 38             	mov    %edx,0x38(%eax)
  np->tf->esp = (uint)stack;
8010336e:	8b 47 18             	mov    0x18(%edi),%eax
80103371:	8b 55 14             	mov    0x14(%ebp),%edx
80103374:	89 50 44             	mov    %edx,0x44(%eax)
  for(i = 0; i < NOFILE; i++)
80103377:	be 00 00 00 00       	mov    $0x0,%esi
8010337c:	eb 16                	jmp    80103394 <clone+0x69>
      np->ofile[i] = filedup(curproc->ofile[i]);
8010337e:	83 ec 0c             	sub    $0xc,%esp
80103381:	50                   	push   %eax
80103382:	e8 f7 d8 ff ff       	call   80100c7e <filedup>
80103387:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010338a:	89 44 b1 28          	mov    %eax,0x28(%ecx,%esi,4)
8010338e:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NOFILE; i++)
80103391:	83 c6 01             	add    $0x1,%esi
80103394:	83 fe 0f             	cmp    $0xf,%esi
80103397:	7f 0a                	jg     801033a3 <clone+0x78>
    if(curproc->ofile[i])
80103399:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
8010339d:	85 c0                	test   %eax,%eax
8010339f:	75 dd                	jne    8010337e <clone+0x53>
801033a1:	eb ee                	jmp    80103391 <clone+0x66>
  np->cwd = idup(curproc->cwd);
801033a3:	83 ec 0c             	sub    $0xc,%esp
801033a6:	ff 73 68             	push   0x68(%ebx)
801033a9:	e8 91 e1 ff ff       	call   8010153f <idup>
801033ae:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801033b1:	89 47 68             	mov    %eax,0x68(%edi)
  return pid;
801033b4:	83 c4 10             	add    $0x10,%esp
}
801033b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801033bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033bf:	5b                   	pop    %ebx
801033c0:	5e                   	pop    %esi
801033c1:	5f                   	pop    %edi
801033c2:	5d                   	pop    %ebp
801033c3:	c3                   	ret    

801033c4 <join>:
}
801033c4:	b8 00 00 00 00       	mov    $0x0,%eax
801033c9:	c3                   	ret    

801033ca <fork>:
{
801033ca:	55                   	push   %ebp
801033cb:	89 e5                	mov    %esp,%ebp
801033cd:	57                   	push   %edi
801033ce:	56                   	push   %esi
801033cf:	53                   	push   %ebx
801033d0:	83 ec 1c             	sub    $0x1c,%esp
  struct proc *curproc = myproc();
801033d3:	e8 dd fd ff ff       	call   801031b5 <myproc>
801033d8:	89 c3                	mov    %eax,%ebx
  if((np = allocproc()) == 0){
801033da:	e8 44 fc ff ff       	call   80103023 <allocproc>
801033df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801033e2:	85 c0                	test   %eax,%eax
801033e4:	0f 84 e0 00 00 00    	je     801034ca <fork+0x100>
801033ea:	89 c7                	mov    %eax,%edi
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
801033ec:	83 ec 08             	sub    $0x8,%esp
801033ef:	ff 33                	push   (%ebx)
801033f1:	ff 73 04             	push   0x4(%ebx)
801033f4:	e8 70 30 00 00       	call   80106469 <copyuvm>
801033f9:	89 47 04             	mov    %eax,0x4(%edi)
801033fc:	83 c4 10             	add    $0x10,%esp
801033ff:	85 c0                	test   %eax,%eax
80103401:	74 2a                	je     8010342d <fork+0x63>
  np->sz = curproc->sz;
80103403:	8b 03                	mov    (%ebx),%eax
80103405:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103408:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
8010340a:	89 c8                	mov    %ecx,%eax
8010340c:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
8010340f:	8b 73 18             	mov    0x18(%ebx),%esi
80103412:	8b 79 18             	mov    0x18(%ecx),%edi
80103415:	b9 13 00 00 00       	mov    $0x13,%ecx
8010341a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eax = 0;
8010341c:	8b 40 18             	mov    0x18(%eax),%eax
8010341f:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  for(i = 0; i < NOFILE; i++)
80103426:	be 00 00 00 00       	mov    $0x0,%esi
8010342b:	eb 29                	jmp    80103456 <fork+0x8c>
    kfree(np->kstack);
8010342d:	83 ec 0c             	sub    $0xc,%esp
80103430:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103433:	ff 73 08             	push   0x8(%ebx)
80103436:	e8 51 eb ff ff       	call   80101f8c <kfree>
    np->kstack = 0;
8010343b:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103442:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103449:	83 c4 10             	add    $0x10,%esp
8010344c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103451:	eb 6d                	jmp    801034c0 <fork+0xf6>
  for(i = 0; i < NOFILE; i++)
80103453:	83 c6 01             	add    $0x1,%esi
80103456:	83 fe 0f             	cmp    $0xf,%esi
80103459:	7f 1d                	jg     80103478 <fork+0xae>
    if(curproc->ofile[i])
8010345b:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
8010345f:	85 c0                	test   %eax,%eax
80103461:	74 f0                	je     80103453 <fork+0x89>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103463:	83 ec 0c             	sub    $0xc,%esp
80103466:	50                   	push   %eax
80103467:	e8 12 d8 ff ff       	call   80100c7e <filedup>
8010346c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010346f:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103473:	83 c4 10             	add    $0x10,%esp
80103476:	eb db                	jmp    80103453 <fork+0x89>
  np->cwd = idup(curproc->cwd);
80103478:	83 ec 0c             	sub    $0xc,%esp
8010347b:	ff 73 68             	push   0x68(%ebx)
8010347e:	e8 bc e0 ff ff       	call   8010153f <idup>
80103483:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103486:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103489:	83 c3 6c             	add    $0x6c,%ebx
8010348c:	8d 47 6c             	lea    0x6c(%edi),%eax
8010348f:	83 c4 0c             	add    $0xc,%esp
80103492:	6a 10                	push   $0x10
80103494:	53                   	push   %ebx
80103495:	50                   	push   %eax
80103496:	e8 6e 09 00 00       	call   80103e09 <safestrcpy>
  pid = np->pid;
8010349b:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
8010349e:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801034a5:	e8 47 07 00 00       	call   80103bf1 <acquire>
  np->state = RUNNABLE;
801034aa:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
801034b1:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801034b8:	e8 99 07 00 00       	call   80103c56 <release>
  return pid;
801034bd:	83 c4 10             	add    $0x10,%esp
}
801034c0:	89 d8                	mov    %ebx,%eax
801034c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034c5:	5b                   	pop    %ebx
801034c6:	5e                   	pop    %esi
801034c7:	5f                   	pop    %edi
801034c8:	5d                   	pop    %ebp
801034c9:	c3                   	ret    
    return -1;
801034ca:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801034cf:	eb ef                	jmp    801034c0 <fork+0xf6>

801034d1 <scheduler>:
{
801034d1:	55                   	push   %ebp
801034d2:	89 e5                	mov    %esp,%ebp
801034d4:	56                   	push   %esi
801034d5:	53                   	push   %ebx
  struct cpu *c = mycpu();
801034d6:	e8 63 fc ff ff       	call   8010313e <mycpu>
801034db:	89 c6                	mov    %eax,%esi
  c->proc = 0;
801034dd:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
801034e4:	00 00 00 
801034e7:	eb 5a                	jmp    80103543 <scheduler+0x72>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801034e9:	83 c3 7c             	add    $0x7c,%ebx
801034ec:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
801034f2:	73 3f                	jae    80103533 <scheduler+0x62>
      if(p->state != RUNNABLE)
801034f4:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
801034f8:	75 ef                	jne    801034e9 <scheduler+0x18>
      c->proc = p;
801034fa:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103500:	83 ec 0c             	sub    $0xc,%esp
80103503:	53                   	push   %ebx
80103504:	e8 5f 2a 00 00       	call   80105f68 <switchuvm>
      p->state = RUNNING;
80103509:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103510:	83 c4 08             	add    $0x8,%esp
80103513:	ff 73 1c             	push   0x1c(%ebx)
80103516:	8d 46 04             	lea    0x4(%esi),%eax
80103519:	50                   	push   %eax
8010351a:	e8 3f 09 00 00       	call   80103e5e <swtch>
      switchkvm();
8010351f:	e8 36 2a 00 00       	call   80105f5a <switchkvm>
      c->proc = 0;
80103524:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
8010352b:	00 00 00 
8010352e:	83 c4 10             	add    $0x10,%esp
80103531:	eb b6                	jmp    801034e9 <scheduler+0x18>
    release(&ptable.lock);
80103533:	83 ec 0c             	sub    $0xc,%esp
80103536:	68 20 0d 11 80       	push   $0x80110d20
8010353b:	e8 16 07 00 00       	call   80103c56 <release>
    sti();
80103540:	83 c4 10             	add    $0x10,%esp
  asm volatile("sti");
80103543:	fb                   	sti    
    acquire(&ptable.lock);
80103544:	83 ec 0c             	sub    $0xc,%esp
80103547:	68 20 0d 11 80       	push   $0x80110d20
8010354c:	e8 a0 06 00 00       	call   80103bf1 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103551:	83 c4 10             	add    $0x10,%esp
80103554:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
80103559:	eb 91                	jmp    801034ec <scheduler+0x1b>

8010355b <sched>:
{
8010355b:	55                   	push   %ebp
8010355c:	89 e5                	mov    %esp,%ebp
8010355e:	56                   	push   %esi
8010355f:	53                   	push   %ebx
  struct proc *p = myproc();
80103560:	e8 50 fc ff ff       	call   801031b5 <myproc>
80103565:	89 c3                	mov    %eax,%ebx
  if(!holding(&ptable.lock))
80103567:	83 ec 0c             	sub    $0xc,%esp
8010356a:	68 20 0d 11 80       	push   $0x80110d20
8010356f:	e8 3e 06 00 00       	call   80103bb2 <holding>
80103574:	83 c4 10             	add    $0x10,%esp
80103577:	85 c0                	test   %eax,%eax
80103579:	74 4f                	je     801035ca <sched+0x6f>
  if(mycpu()->ncli != 1)
8010357b:	e8 be fb ff ff       	call   8010313e <mycpu>
80103580:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103587:	75 4e                	jne    801035d7 <sched+0x7c>
  if(p->state == RUNNING)
80103589:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
8010358d:	74 55                	je     801035e4 <sched+0x89>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
8010358f:	9c                   	pushf  
80103590:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103591:	f6 c4 02             	test   $0x2,%ah
80103594:	75 5b                	jne    801035f1 <sched+0x96>
  intena = mycpu()->intena;
80103596:	e8 a3 fb ff ff       	call   8010313e <mycpu>
8010359b:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
801035a1:	e8 98 fb ff ff       	call   8010313e <mycpu>
801035a6:	83 ec 08             	sub    $0x8,%esp
801035a9:	ff 70 04             	push   0x4(%eax)
801035ac:	83 c3 1c             	add    $0x1c,%ebx
801035af:	53                   	push   %ebx
801035b0:	e8 a9 08 00 00       	call   80103e5e <swtch>
  mycpu()->intena = intena;
801035b5:	e8 84 fb ff ff       	call   8010313e <mycpu>
801035ba:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
801035c0:	83 c4 10             	add    $0x10,%esp
801035c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801035c6:	5b                   	pop    %ebx
801035c7:	5e                   	pop    %esi
801035c8:	5d                   	pop    %ebp
801035c9:	c3                   	ret    
    panic("sched ptable.lock");
801035ca:	83 ec 0c             	sub    $0xc,%esp
801035cd:	68 9b 6b 10 80       	push   $0x80106b9b
801035d2:	e8 71 cd ff ff       	call   80100348 <panic>
    panic("sched locks");
801035d7:	83 ec 0c             	sub    $0xc,%esp
801035da:	68 ad 6b 10 80       	push   $0x80106bad
801035df:	e8 64 cd ff ff       	call   80100348 <panic>
    panic("sched running");
801035e4:	83 ec 0c             	sub    $0xc,%esp
801035e7:	68 b9 6b 10 80       	push   $0x80106bb9
801035ec:	e8 57 cd ff ff       	call   80100348 <panic>
    panic("sched interruptible");
801035f1:	83 ec 0c             	sub    $0xc,%esp
801035f4:	68 c7 6b 10 80       	push   $0x80106bc7
801035f9:	e8 4a cd ff ff       	call   80100348 <panic>

801035fe <exit>:
{
801035fe:	55                   	push   %ebp
801035ff:	89 e5                	mov    %esp,%ebp
80103601:	56                   	push   %esi
80103602:	53                   	push   %ebx
  struct proc *curproc = myproc();
80103603:	e8 ad fb ff ff       	call   801031b5 <myproc>
  if(curproc == initproc)
80103608:	39 05 54 2c 11 80    	cmp    %eax,0x80112c54
8010360e:	74 09                	je     80103619 <exit+0x1b>
80103610:	89 c6                	mov    %eax,%esi
  for(fd = 0; fd < NOFILE; fd++){
80103612:	bb 00 00 00 00       	mov    $0x0,%ebx
80103617:	eb 24                	jmp    8010363d <exit+0x3f>
    panic("init exiting");
80103619:	83 ec 0c             	sub    $0xc,%esp
8010361c:	68 db 6b 10 80       	push   $0x80106bdb
80103621:	e8 22 cd ff ff       	call   80100348 <panic>
      fileclose(curproc->ofile[fd]);
80103626:	83 ec 0c             	sub    $0xc,%esp
80103629:	50                   	push   %eax
8010362a:	e8 94 d6 ff ff       	call   80100cc3 <fileclose>
      curproc->ofile[fd] = 0;
8010362f:	c7 44 9e 28 00 00 00 	movl   $0x0,0x28(%esi,%ebx,4)
80103636:	00 
80103637:	83 c4 10             	add    $0x10,%esp
  for(fd = 0; fd < NOFILE; fd++){
8010363a:	83 c3 01             	add    $0x1,%ebx
8010363d:	83 fb 0f             	cmp    $0xf,%ebx
80103640:	7f 0a                	jg     8010364c <exit+0x4e>
    if(curproc->ofile[fd]){
80103642:	8b 44 9e 28          	mov    0x28(%esi,%ebx,4),%eax
80103646:	85 c0                	test   %eax,%eax
80103648:	75 dc                	jne    80103626 <exit+0x28>
8010364a:	eb ee                	jmp    8010363a <exit+0x3c>
  begin_op();
8010364c:	e8 2d f1 ff ff       	call   8010277e <begin_op>
  iput(curproc->cwd);
80103651:	83 ec 0c             	sub    $0xc,%esp
80103654:	ff 76 68             	push   0x68(%esi)
80103657:	e8 1a e0 ff ff       	call   80101676 <iput>
  end_op();
8010365c:	e8 97 f1 ff ff       	call   801027f8 <end_op>
  curproc->cwd = 0;
80103661:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103668:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
8010366f:	e8 7d 05 00 00       	call   80103bf1 <acquire>
  wakeup1(curproc->parent);
80103674:	8b 46 14             	mov    0x14(%esi),%eax
80103677:	e8 80 f9 ff ff       	call   80102ffc <wakeup1>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010367c:	83 c4 10             	add    $0x10,%esp
8010367f:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
80103684:	eb 03                	jmp    80103689 <exit+0x8b>
80103686:	83 c3 7c             	add    $0x7c,%ebx
80103689:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
8010368f:	73 1a                	jae    801036ab <exit+0xad>
    if(p->parent == curproc){
80103691:	39 73 14             	cmp    %esi,0x14(%ebx)
80103694:	75 f0                	jne    80103686 <exit+0x88>
      p->parent = initproc;
80103696:	a1 54 2c 11 80       	mov    0x80112c54,%eax
8010369b:	89 43 14             	mov    %eax,0x14(%ebx)
      if(p->state == ZOMBIE)
8010369e:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801036a2:	75 e2                	jne    80103686 <exit+0x88>
        wakeup1(initproc);
801036a4:	e8 53 f9 ff ff       	call   80102ffc <wakeup1>
801036a9:	eb db                	jmp    80103686 <exit+0x88>
  curproc->state = ZOMBIE;
801036ab:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
801036b2:	e8 a4 fe ff ff       	call   8010355b <sched>
  panic("zombie exit");
801036b7:	83 ec 0c             	sub    $0xc,%esp
801036ba:	68 e8 6b 10 80       	push   $0x80106be8
801036bf:	e8 84 cc ff ff       	call   80100348 <panic>

801036c4 <yield>:
{
801036c4:	55                   	push   %ebp
801036c5:	89 e5                	mov    %esp,%ebp
801036c7:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
801036ca:	68 20 0d 11 80       	push   $0x80110d20
801036cf:	e8 1d 05 00 00       	call   80103bf1 <acquire>
  myproc()->state = RUNNABLE;
801036d4:	e8 dc fa ff ff       	call   801031b5 <myproc>
801036d9:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
801036e0:	e8 76 fe ff ff       	call   8010355b <sched>
  release(&ptable.lock);
801036e5:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801036ec:	e8 65 05 00 00       	call   80103c56 <release>
}
801036f1:	83 c4 10             	add    $0x10,%esp
801036f4:	c9                   	leave  
801036f5:	c3                   	ret    

801036f6 <sleep>:
{
801036f6:	55                   	push   %ebp
801036f7:	89 e5                	mov    %esp,%ebp
801036f9:	56                   	push   %esi
801036fa:	53                   	push   %ebx
801036fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *p = myproc();
801036fe:	e8 b2 fa ff ff       	call   801031b5 <myproc>
  if(p == 0)
80103703:	85 c0                	test   %eax,%eax
80103705:	74 66                	je     8010376d <sleep+0x77>
80103707:	89 c3                	mov    %eax,%ebx
  if(lk == 0)
80103709:	85 f6                	test   %esi,%esi
8010370b:	74 6d                	je     8010377a <sleep+0x84>
  if(lk != &ptable.lock){  //DOC: sleeplock0
8010370d:	81 fe 20 0d 11 80    	cmp    $0x80110d20,%esi
80103713:	74 18                	je     8010372d <sleep+0x37>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103715:	83 ec 0c             	sub    $0xc,%esp
80103718:	68 20 0d 11 80       	push   $0x80110d20
8010371d:	e8 cf 04 00 00       	call   80103bf1 <acquire>
    release(lk);
80103722:	89 34 24             	mov    %esi,(%esp)
80103725:	e8 2c 05 00 00       	call   80103c56 <release>
8010372a:	83 c4 10             	add    $0x10,%esp
  p->chan = chan;
8010372d:	8b 45 08             	mov    0x8(%ebp),%eax
80103730:	89 43 20             	mov    %eax,0x20(%ebx)
  p->state = SLEEPING;
80103733:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
8010373a:	e8 1c fe ff ff       	call   8010355b <sched>
  p->chan = 0;
8010373f:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  if(lk != &ptable.lock){  //DOC: sleeplock2
80103746:	81 fe 20 0d 11 80    	cmp    $0x80110d20,%esi
8010374c:	74 18                	je     80103766 <sleep+0x70>
    release(&ptable.lock);
8010374e:	83 ec 0c             	sub    $0xc,%esp
80103751:	68 20 0d 11 80       	push   $0x80110d20
80103756:	e8 fb 04 00 00       	call   80103c56 <release>
    acquire(lk);
8010375b:	89 34 24             	mov    %esi,(%esp)
8010375e:	e8 8e 04 00 00       	call   80103bf1 <acquire>
80103763:	83 c4 10             	add    $0x10,%esp
}
80103766:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103769:	5b                   	pop    %ebx
8010376a:	5e                   	pop    %esi
8010376b:	5d                   	pop    %ebp
8010376c:	c3                   	ret    
    panic("sleep");
8010376d:	83 ec 0c             	sub    $0xc,%esp
80103770:	68 f4 6b 10 80       	push   $0x80106bf4
80103775:	e8 ce cb ff ff       	call   80100348 <panic>
    panic("sleep without lk");
8010377a:	83 ec 0c             	sub    $0xc,%esp
8010377d:	68 fa 6b 10 80       	push   $0x80106bfa
80103782:	e8 c1 cb ff ff       	call   80100348 <panic>

80103787 <wait>:
{
80103787:	55                   	push   %ebp
80103788:	89 e5                	mov    %esp,%ebp
8010378a:	56                   	push   %esi
8010378b:	53                   	push   %ebx
  struct proc *curproc = myproc();
8010378c:	e8 24 fa ff ff       	call   801031b5 <myproc>
80103791:	89 c6                	mov    %eax,%esi
  acquire(&ptable.lock);
80103793:	83 ec 0c             	sub    $0xc,%esp
80103796:	68 20 0d 11 80       	push   $0x80110d20
8010379b:	e8 51 04 00 00       	call   80103bf1 <acquire>
801037a0:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
801037a3:	b8 00 00 00 00       	mov    $0x0,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801037a8:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
801037ad:	eb 5b                	jmp    8010380a <wait+0x83>
        pid = p->pid;
801037af:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
801037b2:	83 ec 0c             	sub    $0xc,%esp
801037b5:	ff 73 08             	push   0x8(%ebx)
801037b8:	e8 cf e7 ff ff       	call   80101f8c <kfree>
        p->kstack = 0;
801037bd:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
801037c4:	83 c4 04             	add    $0x4,%esp
801037c7:	ff 73 04             	push   0x4(%ebx)
801037ca:	e8 79 2b 00 00       	call   80106348 <freevm>
        p->pid = 0;
801037cf:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801037d6:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801037dd:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
801037e1:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801037e8:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801037ef:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801037f6:	e8 5b 04 00 00       	call   80103c56 <release>
        return pid;
801037fb:	83 c4 10             	add    $0x10,%esp
}
801037fe:	89 f0                	mov    %esi,%eax
80103800:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103803:	5b                   	pop    %ebx
80103804:	5e                   	pop    %esi
80103805:	5d                   	pop    %ebp
80103806:	c3                   	ret    
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103807:	83 c3 7c             	add    $0x7c,%ebx
8010380a:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
80103810:	73 12                	jae    80103824 <wait+0x9d>
      if(p->parent != curproc)
80103812:	39 73 14             	cmp    %esi,0x14(%ebx)
80103815:	75 f0                	jne    80103807 <wait+0x80>
      if(p->state == ZOMBIE){
80103817:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010381b:	74 92                	je     801037af <wait+0x28>
      havekids = 1;
8010381d:	b8 01 00 00 00       	mov    $0x1,%eax
80103822:	eb e3                	jmp    80103807 <wait+0x80>
    if(!havekids || curproc->killed){
80103824:	85 c0                	test   %eax,%eax
80103826:	74 06                	je     8010382e <wait+0xa7>
80103828:	83 7e 24 00          	cmpl   $0x0,0x24(%esi)
8010382c:	74 17                	je     80103845 <wait+0xbe>
      release(&ptable.lock);
8010382e:	83 ec 0c             	sub    $0xc,%esp
80103831:	68 20 0d 11 80       	push   $0x80110d20
80103836:	e8 1b 04 00 00       	call   80103c56 <release>
      return -1;
8010383b:	83 c4 10             	add    $0x10,%esp
8010383e:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103843:	eb b9                	jmp    801037fe <wait+0x77>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103845:	83 ec 08             	sub    $0x8,%esp
80103848:	68 20 0d 11 80       	push   $0x80110d20
8010384d:	56                   	push   %esi
8010384e:	e8 a3 fe ff ff       	call   801036f6 <sleep>
    havekids = 0;
80103853:	83 c4 10             	add    $0x10,%esp
80103856:	e9 48 ff ff ff       	jmp    801037a3 <wait+0x1c>

8010385b <wakeup>:
>>>>>>> d669a6c (ulib and makefile)

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
<<<<<<< HEAD
801038af:	55                   	push   %ebp
801038b0:	89 e5                	mov    %esp,%ebp
801038b2:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);
801038b5:	68 20 1d 11 80       	push   $0x80111d20
801038ba:	e8 86 03 00 00       	call   80103c45 <acquire>
  wakeup1(chan);
801038bf:	8b 45 08             	mov    0x8(%ebp),%eax
801038c2:	e8 35 f7 ff ff       	call   80102ffc <wakeup1>
  release(&ptable.lock);
801038c7:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801038ce:	e8 d7 03 00 00       	call   80103caa <release>
}
801038d3:	83 c4 10             	add    $0x10,%esp
801038d6:	c9                   	leave  
801038d7:	c3                   	ret    

801038d8 <kill>:
=======
8010385b:	55                   	push   %ebp
8010385c:	89 e5                	mov    %esp,%ebp
8010385e:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);
80103861:	68 20 0d 11 80       	push   $0x80110d20
80103866:	e8 86 03 00 00       	call   80103bf1 <acquire>
  wakeup1(chan);
8010386b:	8b 45 08             	mov    0x8(%ebp),%eax
8010386e:	e8 89 f7 ff ff       	call   80102ffc <wakeup1>
  release(&ptable.lock);
80103873:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
8010387a:	e8 d7 03 00 00       	call   80103c56 <release>
}
8010387f:	83 c4 10             	add    $0x10,%esp
80103882:	c9                   	leave  
80103883:	c3                   	ret    

80103884 <kill>:
>>>>>>> d669a6c (ulib and makefile)
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
<<<<<<< HEAD
801038d8:	55                   	push   %ebp
801038d9:	89 e5                	mov    %esp,%ebp
801038db:	53                   	push   %ebx
801038dc:	83 ec 10             	sub    $0x10,%esp
801038df:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801038e2:	68 20 1d 11 80       	push   $0x80111d20
801038e7:	e8 59 03 00 00       	call   80103c45 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801038ec:	83 c4 10             	add    $0x10,%esp
801038ef:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801038f4:	eb 0c                	jmp    80103902 <kill+0x2a>
=======
80103884:	55                   	push   %ebp
80103885:	89 e5                	mov    %esp,%ebp
80103887:	53                   	push   %ebx
80103888:	83 ec 10             	sub    $0x10,%esp
8010388b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010388e:	68 20 0d 11 80       	push   $0x80110d20
80103893:	e8 59 03 00 00       	call   80103bf1 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103898:	83 c4 10             	add    $0x10,%esp
8010389b:	b8 54 0d 11 80       	mov    $0x80110d54,%eax
801038a0:	eb 0c                	jmp    801038ae <kill+0x2a>
>>>>>>> d669a6c (ulib and makefile)
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
<<<<<<< HEAD
801038f6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801038fd:	eb 1c                	jmp    8010391b <kill+0x43>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801038ff:	83 c0 7c             	add    $0x7c,%eax
80103902:	3d 54 3c 11 80       	cmp    $0x80113c54,%eax
80103907:	73 2c                	jae    80103935 <kill+0x5d>
    if(p->pid == pid){
80103909:	39 58 10             	cmp    %ebx,0x10(%eax)
8010390c:	75 f1                	jne    801038ff <kill+0x27>
      p->killed = 1;
8010390e:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
80103915:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103919:	74 db                	je     801038f6 <kill+0x1e>
      release(&ptable.lock);
8010391b:	83 ec 0c             	sub    $0xc,%esp
8010391e:	68 20 1d 11 80       	push   $0x80111d20
80103923:	e8 82 03 00 00       	call   80103caa <release>
      return 0;
80103928:	83 c4 10             	add    $0x10,%esp
8010392b:	b8 00 00 00 00       	mov    $0x0,%eax
=======
801038a2:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801038a9:	eb 1c                	jmp    801038c7 <kill+0x43>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801038ab:	83 c0 7c             	add    $0x7c,%eax
801038ae:	3d 54 2c 11 80       	cmp    $0x80112c54,%eax
801038b3:	73 2c                	jae    801038e1 <kill+0x5d>
    if(p->pid == pid){
801038b5:	39 58 10             	cmp    %ebx,0x10(%eax)
801038b8:	75 f1                	jne    801038ab <kill+0x27>
      p->killed = 1;
801038ba:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
801038c1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801038c5:	74 db                	je     801038a2 <kill+0x1e>
      release(&ptable.lock);
801038c7:	83 ec 0c             	sub    $0xc,%esp
801038ca:	68 20 0d 11 80       	push   $0x80110d20
801038cf:	e8 82 03 00 00       	call   80103c56 <release>
      return 0;
801038d4:	83 c4 10             	add    $0x10,%esp
801038d7:	b8 00 00 00 00       	mov    $0x0,%eax
>>>>>>> d669a6c (ulib and makefile)
    }
  }
  release(&ptable.lock);
  return -1;
}
<<<<<<< HEAD
80103930:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103933:	c9                   	leave  
80103934:	c3                   	ret    
  release(&ptable.lock);
80103935:	83 ec 0c             	sub    $0xc,%esp
80103938:	68 20 1d 11 80       	push   $0x80111d20
8010393d:	e8 68 03 00 00       	call   80103caa <release>
  return -1;
80103942:	83 c4 10             	add    $0x10,%esp
80103945:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010394a:	eb e4                	jmp    80103930 <kill+0x58>

8010394c <procdump>:
=======
801038dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038df:	c9                   	leave  
801038e0:	c3                   	ret    
  release(&ptable.lock);
801038e1:	83 ec 0c             	sub    $0xc,%esp
801038e4:	68 20 0d 11 80       	push   $0x80110d20
801038e9:	e8 68 03 00 00       	call   80103c56 <release>
  return -1;
801038ee:	83 c4 10             	add    $0x10,%esp
801038f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801038f6:	eb e4                	jmp    801038dc <kill+0x58>

801038f8 <procdump>:
>>>>>>> d669a6c (ulib and makefile)
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
<<<<<<< HEAD
8010394c:	55                   	push   %ebp
8010394d:	89 e5                	mov    %esp,%ebp
8010394f:	56                   	push   %esi
80103950:	53                   	push   %ebx
80103951:	83 ec 30             	sub    $0x30,%esp
=======
801038f8:	55                   	push   %ebp
801038f9:	89 e5                	mov    %esp,%ebp
801038fb:	56                   	push   %esi
801038fc:	53                   	push   %ebx
801038fd:	83 ec 30             	sub    $0x30,%esp
>>>>>>> d669a6c (ulib and makefile)
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
<<<<<<< HEAD
80103954:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103959:	eb 33                	jmp    8010398e <procdump+0x42>
=======
80103900:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
80103905:	eb 33                	jmp    8010393a <procdump+0x42>
>>>>>>> d669a6c (ulib and makefile)
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
<<<<<<< HEAD
8010395b:	b8 4b 6c 10 80       	mov    $0x80106c4b,%eax
    cprintf("%d %s %s", p->pid, state, p->name);
80103960:	8d 53 6c             	lea    0x6c(%ebx),%edx
80103963:	52                   	push   %edx
80103964:	50                   	push   %eax
80103965:	ff 73 10             	push   0x10(%ebx)
80103968:	68 4f 6c 10 80       	push   $0x80106c4f
8010396d:	e8 95 cc ff ff       	call   80100607 <cprintf>
    if(p->state == SLEEPING){
80103972:	83 c4 10             	add    $0x10,%esp
80103975:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80103979:	74 39                	je     801039b4 <procdump+0x68>
=======
80103907:	b8 0b 6c 10 80       	mov    $0x80106c0b,%eax
    cprintf("%d %s %s", p->pid, state, p->name);
8010390c:	8d 53 6c             	lea    0x6c(%ebx),%edx
8010390f:	52                   	push   %edx
80103910:	50                   	push   %eax
80103911:	ff 73 10             	push   0x10(%ebx)
80103914:	68 0f 6c 10 80       	push   $0x80106c0f
80103919:	e8 e9 cc ff ff       	call   80100607 <cprintf>
    if(p->state == SLEEPING){
8010391e:	83 c4 10             	add    $0x10,%esp
80103921:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80103925:	74 39                	je     80103960 <procdump+0x68>
>>>>>>> d669a6c (ulib and makefile)
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
<<<<<<< HEAD
8010397b:	83 ec 0c             	sub    $0xc,%esp
8010397e:	68 bf 6f 10 80       	push   $0x80106fbf
80103983:	e8 7f cc ff ff       	call   80100607 <cprintf>
80103988:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010398b:	83 c3 7c             	add    $0x7c,%ebx
8010398e:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103994:	73 61                	jae    801039f7 <procdump+0xab>
    if(p->state == UNUSED)
80103996:	8b 43 0c             	mov    0xc(%ebx),%eax
80103999:	85 c0                	test   %eax,%eax
8010399b:	74 ee                	je     8010398b <procdump+0x3f>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010399d:	83 f8 05             	cmp    $0x5,%eax
801039a0:	77 b9                	ja     8010395b <procdump+0xf>
801039a2:	8b 04 85 ac 6c 10 80 	mov    -0x7fef9354(,%eax,4),%eax
801039a9:	85 c0                	test   %eax,%eax
801039ab:	75 b3                	jne    80103960 <procdump+0x14>
      state = "???";
801039ad:	b8 4b 6c 10 80       	mov    $0x80106c4b,%eax
801039b2:	eb ac                	jmp    80103960 <procdump+0x14>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801039b4:	8b 43 1c             	mov    0x1c(%ebx),%eax
801039b7:	8b 40 0c             	mov    0xc(%eax),%eax
801039ba:	83 c0 08             	add    $0x8,%eax
801039bd:	83 ec 08             	sub    $0x8,%esp
801039c0:	8d 55 d0             	lea    -0x30(%ebp),%edx
801039c3:	52                   	push   %edx
801039c4:	50                   	push   %eax
801039c5:	e8 5a 01 00 00       	call   80103b24 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
801039ca:	83 c4 10             	add    $0x10,%esp
801039cd:	be 00 00 00 00       	mov    $0x0,%esi
801039d2:	eb 14                	jmp    801039e8 <procdump+0x9c>
        cprintf(" %p", pc[i]);
801039d4:	83 ec 08             	sub    $0x8,%esp
801039d7:	50                   	push   %eax
801039d8:	68 a1 66 10 80       	push   $0x801066a1
801039dd:	e8 25 cc ff ff       	call   80100607 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801039e2:	83 c6 01             	add    $0x1,%esi
801039e5:	83 c4 10             	add    $0x10,%esp
801039e8:	83 fe 09             	cmp    $0x9,%esi
801039eb:	7f 8e                	jg     8010397b <procdump+0x2f>
801039ed:	8b 44 b5 d0          	mov    -0x30(%ebp,%esi,4),%eax
801039f1:	85 c0                	test   %eax,%eax
801039f3:	75 df                	jne    801039d4 <procdump+0x88>
801039f5:	eb 84                	jmp    8010397b <procdump+0x2f>
  }
}
801039f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039fa:	5b                   	pop    %ebx
801039fb:	5e                   	pop    %esi
801039fc:	5d                   	pop    %ebp
801039fd:	c3                   	ret    

801039fe <initsleeplock>:
=======
80103927:	83 ec 0c             	sub    $0xc,%esp
8010392a:	68 7f 6f 10 80       	push   $0x80106f7f
8010392f:	e8 d3 cc ff ff       	call   80100607 <cprintf>
80103934:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103937:	83 c3 7c             	add    $0x7c,%ebx
8010393a:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
80103940:	73 61                	jae    801039a3 <procdump+0xab>
    if(p->state == UNUSED)
80103942:	8b 43 0c             	mov    0xc(%ebx),%eax
80103945:	85 c0                	test   %eax,%eax
80103947:	74 ee                	je     80103937 <procdump+0x3f>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103949:	83 f8 05             	cmp    $0x5,%eax
8010394c:	77 b9                	ja     80103907 <procdump+0xf>
8010394e:	8b 04 85 6c 6c 10 80 	mov    -0x7fef9394(,%eax,4),%eax
80103955:	85 c0                	test   %eax,%eax
80103957:	75 b3                	jne    8010390c <procdump+0x14>
      state = "???";
80103959:	b8 0b 6c 10 80       	mov    $0x80106c0b,%eax
8010395e:	eb ac                	jmp    8010390c <procdump+0x14>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80103960:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103963:	8b 40 0c             	mov    0xc(%eax),%eax
80103966:	83 c0 08             	add    $0x8,%eax
80103969:	83 ec 08             	sub    $0x8,%esp
8010396c:	8d 55 d0             	lea    -0x30(%ebp),%edx
8010396f:	52                   	push   %edx
80103970:	50                   	push   %eax
80103971:	e8 5a 01 00 00       	call   80103ad0 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
80103976:	83 c4 10             	add    $0x10,%esp
80103979:	be 00 00 00 00       	mov    $0x0,%esi
8010397e:	eb 14                	jmp    80103994 <procdump+0x9c>
        cprintf(" %p", pc[i]);
80103980:	83 ec 08             	sub    $0x8,%esp
80103983:	50                   	push   %eax
80103984:	68 61 66 10 80       	push   $0x80106661
80103989:	e8 79 cc ff ff       	call   80100607 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
8010398e:	83 c6 01             	add    $0x1,%esi
80103991:	83 c4 10             	add    $0x10,%esp
80103994:	83 fe 09             	cmp    $0x9,%esi
80103997:	7f 8e                	jg     80103927 <procdump+0x2f>
80103999:	8b 44 b5 d0          	mov    -0x30(%ebp,%esi,4),%eax
8010399d:	85 c0                	test   %eax,%eax
8010399f:	75 df                	jne    80103980 <procdump+0x88>
801039a1:	eb 84                	jmp    80103927 <procdump+0x2f>
  }
}
801039a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039a6:	5b                   	pop    %ebx
801039a7:	5e                   	pop    %esi
801039a8:	5d                   	pop    %ebp
801039a9:	c3                   	ret    

801039aa <initsleeplock>:
>>>>>>> d669a6c (ulib and makefile)
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
<<<<<<< HEAD
801039fe:	55                   	push   %ebp
801039ff:	89 e5                	mov    %esp,%ebp
80103a01:	53                   	push   %ebx
80103a02:	83 ec 0c             	sub    $0xc,%esp
80103a05:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
80103a08:	68 c4 6c 10 80       	push   $0x80106cc4
80103a0d:	8d 43 04             	lea    0x4(%ebx),%eax
80103a10:	50                   	push   %eax
80103a11:	e8 f3 00 00 00       	call   80103b09 <initlock>
  lk->name = name;
80103a16:	8b 45 0c             	mov    0xc(%ebp),%eax
80103a19:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
80103a1c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103a22:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
}
80103a29:	83 c4 10             	add    $0x10,%esp
80103a2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a2f:	c9                   	leave  
80103a30:	c3                   	ret    

80103a31 <acquiresleep>:
=======
801039aa:	55                   	push   %ebp
801039ab:	89 e5                	mov    %esp,%ebp
801039ad:	53                   	push   %ebx
801039ae:	83 ec 0c             	sub    $0xc,%esp
801039b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801039b4:	68 84 6c 10 80       	push   $0x80106c84
801039b9:	8d 43 04             	lea    0x4(%ebx),%eax
801039bc:	50                   	push   %eax
801039bd:	e8 f3 00 00 00       	call   80103ab5 <initlock>
  lk->name = name;
801039c2:	8b 45 0c             	mov    0xc(%ebp),%eax
801039c5:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
801039c8:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801039ce:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
}
801039d5:	83 c4 10             	add    $0x10,%esp
801039d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039db:	c9                   	leave  
801039dc:	c3                   	ret    

801039dd <acquiresleep>:
>>>>>>> d669a6c (ulib and makefile)

void
acquiresleep(struct sleeplock *lk)
{
<<<<<<< HEAD
80103a31:	55                   	push   %ebp
80103a32:	89 e5                	mov    %esp,%ebp
80103a34:	56                   	push   %esi
80103a35:	53                   	push   %ebx
80103a36:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103a39:	8d 73 04             	lea    0x4(%ebx),%esi
80103a3c:	83 ec 0c             	sub    $0xc,%esp
80103a3f:	56                   	push   %esi
80103a40:	e8 00 02 00 00       	call   80103c45 <acquire>
  while (lk->locked) {
80103a45:	83 c4 10             	add    $0x10,%esp
80103a48:	eb 0d                	jmp    80103a57 <acquiresleep+0x26>
    sleep(lk, &lk->lk);
80103a4a:	83 ec 08             	sub    $0x8,%esp
80103a4d:	56                   	push   %esi
80103a4e:	53                   	push   %ebx
80103a4f:	e8 f6 fc ff ff       	call   8010374a <sleep>
80103a54:	83 c4 10             	add    $0x10,%esp
  while (lk->locked) {
80103a57:	83 3b 00             	cmpl   $0x0,(%ebx)
80103a5a:	75 ee                	jne    80103a4a <acquiresleep+0x19>
  }
  lk->locked = 1;
80103a5c:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80103a62:	e8 4e f7 ff ff       	call   801031b5 <myproc>
80103a67:	8b 40 10             	mov    0x10(%eax),%eax
80103a6a:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80103a6d:	83 ec 0c             	sub    $0xc,%esp
80103a70:	56                   	push   %esi
80103a71:	e8 34 02 00 00       	call   80103caa <release>
}
80103a76:	83 c4 10             	add    $0x10,%esp
80103a79:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a7c:	5b                   	pop    %ebx
80103a7d:	5e                   	pop    %esi
80103a7e:	5d                   	pop    %ebp
80103a7f:	c3                   	ret    

80103a80 <releasesleep>:
=======
801039dd:	55                   	push   %ebp
801039de:	89 e5                	mov    %esp,%ebp
801039e0:	56                   	push   %esi
801039e1:	53                   	push   %ebx
801039e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801039e5:	8d 73 04             	lea    0x4(%ebx),%esi
801039e8:	83 ec 0c             	sub    $0xc,%esp
801039eb:	56                   	push   %esi
801039ec:	e8 00 02 00 00       	call   80103bf1 <acquire>
  while (lk->locked) {
801039f1:	83 c4 10             	add    $0x10,%esp
801039f4:	eb 0d                	jmp    80103a03 <acquiresleep+0x26>
    sleep(lk, &lk->lk);
801039f6:	83 ec 08             	sub    $0x8,%esp
801039f9:	56                   	push   %esi
801039fa:	53                   	push   %ebx
801039fb:	e8 f6 fc ff ff       	call   801036f6 <sleep>
80103a00:	83 c4 10             	add    $0x10,%esp
  while (lk->locked) {
80103a03:	83 3b 00             	cmpl   $0x0,(%ebx)
80103a06:	75 ee                	jne    801039f6 <acquiresleep+0x19>
  }
  lk->locked = 1;
80103a08:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80103a0e:	e8 a2 f7 ff ff       	call   801031b5 <myproc>
80103a13:	8b 40 10             	mov    0x10(%eax),%eax
80103a16:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80103a19:	83 ec 0c             	sub    $0xc,%esp
80103a1c:	56                   	push   %esi
80103a1d:	e8 34 02 00 00       	call   80103c56 <release>
}
80103a22:	83 c4 10             	add    $0x10,%esp
80103a25:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a28:	5b                   	pop    %ebx
80103a29:	5e                   	pop    %esi
80103a2a:	5d                   	pop    %ebp
80103a2b:	c3                   	ret    

80103a2c <releasesleep>:
>>>>>>> d669a6c (ulib and makefile)

void
releasesleep(struct sleeplock *lk)
{
<<<<<<< HEAD
80103a80:	55                   	push   %ebp
80103a81:	89 e5                	mov    %esp,%ebp
80103a83:	56                   	push   %esi
80103a84:	53                   	push   %ebx
80103a85:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103a88:	8d 73 04             	lea    0x4(%ebx),%esi
80103a8b:	83 ec 0c             	sub    $0xc,%esp
80103a8e:	56                   	push   %esi
80103a8f:	e8 b1 01 00 00       	call   80103c45 <acquire>
  lk->locked = 0;
80103a94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103a9a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80103aa1:	89 1c 24             	mov    %ebx,(%esp)
80103aa4:	e8 06 fe ff ff       	call   801038af <wakeup>
  release(&lk->lk);
80103aa9:	89 34 24             	mov    %esi,(%esp)
80103aac:	e8 f9 01 00 00       	call   80103caa <release>
}
80103ab1:	83 c4 10             	add    $0x10,%esp
80103ab4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ab7:	5b                   	pop    %ebx
80103ab8:	5e                   	pop    %esi
80103ab9:	5d                   	pop    %ebp
80103aba:	c3                   	ret    

80103abb <holdingsleep>:
=======
80103a2c:	55                   	push   %ebp
80103a2d:	89 e5                	mov    %esp,%ebp
80103a2f:	56                   	push   %esi
80103a30:	53                   	push   %ebx
80103a31:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103a34:	8d 73 04             	lea    0x4(%ebx),%esi
80103a37:	83 ec 0c             	sub    $0xc,%esp
80103a3a:	56                   	push   %esi
80103a3b:	e8 b1 01 00 00       	call   80103bf1 <acquire>
  lk->locked = 0;
80103a40:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103a46:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80103a4d:	89 1c 24             	mov    %ebx,(%esp)
80103a50:	e8 06 fe ff ff       	call   8010385b <wakeup>
  release(&lk->lk);
80103a55:	89 34 24             	mov    %esi,(%esp)
80103a58:	e8 f9 01 00 00       	call   80103c56 <release>
}
80103a5d:	83 c4 10             	add    $0x10,%esp
80103a60:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a63:	5b                   	pop    %ebx
80103a64:	5e                   	pop    %esi
80103a65:	5d                   	pop    %ebp
80103a66:	c3                   	ret    

80103a67 <holdingsleep>:
>>>>>>> d669a6c (ulib and makefile)

int
holdingsleep(struct sleeplock *lk)
{
<<<<<<< HEAD
80103abb:	55                   	push   %ebp
80103abc:	89 e5                	mov    %esp,%ebp
80103abe:	56                   	push   %esi
80103abf:	53                   	push   %ebx
80103ac0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
80103ac3:	8d 73 04             	lea    0x4(%ebx),%esi
80103ac6:	83 ec 0c             	sub    $0xc,%esp
80103ac9:	56                   	push   %esi
80103aca:	e8 76 01 00 00       	call   80103c45 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80103acf:	83 c4 10             	add    $0x10,%esp
80103ad2:	83 3b 00             	cmpl   $0x0,(%ebx)
80103ad5:	75 17                	jne    80103aee <holdingsleep+0x33>
80103ad7:	bb 00 00 00 00       	mov    $0x0,%ebx
  release(&lk->lk);
80103adc:	83 ec 0c             	sub    $0xc,%esp
80103adf:	56                   	push   %esi
80103ae0:	e8 c5 01 00 00       	call   80103caa <release>
  return r;
}
80103ae5:	89 d8                	mov    %ebx,%eax
80103ae7:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103aea:	5b                   	pop    %ebx
80103aeb:	5e                   	pop    %esi
80103aec:	5d                   	pop    %ebp
80103aed:	c3                   	ret    
  r = lk->locked && (lk->pid == myproc()->pid);
80103aee:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103af1:	e8 bf f6 ff ff       	call   801031b5 <myproc>
80103af6:	3b 58 10             	cmp    0x10(%eax),%ebx
80103af9:	74 07                	je     80103b02 <holdingsleep+0x47>
80103afb:	bb 00 00 00 00       	mov    $0x0,%ebx
80103b00:	eb da                	jmp    80103adc <holdingsleep+0x21>
80103b02:	bb 01 00 00 00       	mov    $0x1,%ebx
80103b07:	eb d3                	jmp    80103adc <holdingsleep+0x21>

80103b09 <initlock>:
=======
80103a67:	55                   	push   %ebp
80103a68:	89 e5                	mov    %esp,%ebp
80103a6a:	56                   	push   %esi
80103a6b:	53                   	push   %ebx
80103a6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
80103a6f:	8d 73 04             	lea    0x4(%ebx),%esi
80103a72:	83 ec 0c             	sub    $0xc,%esp
80103a75:	56                   	push   %esi
80103a76:	e8 76 01 00 00       	call   80103bf1 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80103a7b:	83 c4 10             	add    $0x10,%esp
80103a7e:	83 3b 00             	cmpl   $0x0,(%ebx)
80103a81:	75 17                	jne    80103a9a <holdingsleep+0x33>
80103a83:	bb 00 00 00 00       	mov    $0x0,%ebx
  release(&lk->lk);
80103a88:	83 ec 0c             	sub    $0xc,%esp
80103a8b:	56                   	push   %esi
80103a8c:	e8 c5 01 00 00       	call   80103c56 <release>
  return r;
}
80103a91:	89 d8                	mov    %ebx,%eax
80103a93:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a96:	5b                   	pop    %ebx
80103a97:	5e                   	pop    %esi
80103a98:	5d                   	pop    %ebp
80103a99:	c3                   	ret    
  r = lk->locked && (lk->pid == myproc()->pid);
80103a9a:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103a9d:	e8 13 f7 ff ff       	call   801031b5 <myproc>
80103aa2:	3b 58 10             	cmp    0x10(%eax),%ebx
80103aa5:	74 07                	je     80103aae <holdingsleep+0x47>
80103aa7:	bb 00 00 00 00       	mov    $0x0,%ebx
80103aac:	eb da                	jmp    80103a88 <holdingsleep+0x21>
80103aae:	bb 01 00 00 00       	mov    $0x1,%ebx
80103ab3:	eb d3                	jmp    80103a88 <holdingsleep+0x21>

80103ab5 <initlock>:
>>>>>>> d669a6c (ulib and makefile)
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
<<<<<<< HEAD
80103b09:	55                   	push   %ebp
80103b0a:	89 e5                	mov    %esp,%ebp
80103b0c:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80103b0f:	8b 55 0c             	mov    0xc(%ebp),%edx
80103b12:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
80103b15:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
80103b1b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80103b22:	5d                   	pop    %ebp
80103b23:	c3                   	ret    

80103b24 <getcallerpcs>:
=======
80103ab5:	55                   	push   %ebp
80103ab6:	89 e5                	mov    %esp,%ebp
80103ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80103abb:	8b 55 0c             	mov    0xc(%ebp),%edx
80103abe:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
80103ac1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
80103ac7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80103ace:	5d                   	pop    %ebp
80103acf:	c3                   	ret    

80103ad0 <getcallerpcs>:
>>>>>>> d669a6c (ulib and makefile)
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
<<<<<<< HEAD
80103b24:	55                   	push   %ebp
80103b25:	89 e5                	mov    %esp,%ebp
80103b27:	53                   	push   %ebx
80103b28:	8b 4d 0c             	mov    0xc(%ebp),%ecx
=======
80103ad0:	55                   	push   %ebp
80103ad1:	89 e5                	mov    %esp,%ebp
80103ad3:	53                   	push   %ebx
80103ad4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
>>>>>>> d669a6c (ulib and makefile)
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
<<<<<<< HEAD
80103b2b:	8b 45 08             	mov    0x8(%ebp),%eax
80103b2e:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
80103b31:	b8 00 00 00 00       	mov    $0x0,%eax
80103b36:	83 f8 09             	cmp    $0x9,%eax
80103b39:	7f 25                	jg     80103b60 <getcallerpcs+0x3c>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80103b3b:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80103b41:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103b47:	77 17                	ja     80103b60 <getcallerpcs+0x3c>
      break;
    pcs[i] = ebp[1];     // saved %eip
80103b49:	8b 5a 04             	mov    0x4(%edx),%ebx
80103b4c:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
    ebp = (uint*)ebp[0]; // saved %ebp
80103b4f:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
80103b51:	83 c0 01             	add    $0x1,%eax
80103b54:	eb e0                	jmp    80103b36 <getcallerpcs+0x12>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80103b56:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
80103b5d:	83 c0 01             	add    $0x1,%eax
80103b60:	83 f8 09             	cmp    $0x9,%eax
80103b63:	7e f1                	jle    80103b56 <getcallerpcs+0x32>
}
80103b65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b68:	c9                   	leave  
80103b69:	c3                   	ret    

80103b6a <pushcli>:
=======
80103ad7:	8b 45 08             	mov    0x8(%ebp),%eax
80103ada:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
80103add:	b8 00 00 00 00       	mov    $0x0,%eax
80103ae2:	83 f8 09             	cmp    $0x9,%eax
80103ae5:	7f 25                	jg     80103b0c <getcallerpcs+0x3c>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80103ae7:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80103aed:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103af3:	77 17                	ja     80103b0c <getcallerpcs+0x3c>
      break;
    pcs[i] = ebp[1];     // saved %eip
80103af5:	8b 5a 04             	mov    0x4(%edx),%ebx
80103af8:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
    ebp = (uint*)ebp[0]; // saved %ebp
80103afb:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
80103afd:	83 c0 01             	add    $0x1,%eax
80103b00:	eb e0                	jmp    80103ae2 <getcallerpcs+0x12>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80103b02:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
80103b09:	83 c0 01             	add    $0x1,%eax
80103b0c:	83 f8 09             	cmp    $0x9,%eax
80103b0f:	7e f1                	jle    80103b02 <getcallerpcs+0x32>
}
80103b11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b14:	c9                   	leave  
80103b15:	c3                   	ret    

80103b16 <pushcli>:
>>>>>>> d669a6c (ulib and makefile)
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
<<<<<<< HEAD
80103b6a:	55                   	push   %ebp
80103b6b:	89 e5                	mov    %esp,%ebp
80103b6d:	53                   	push   %ebx
80103b6e:	83 ec 04             	sub    $0x4,%esp
80103b71:	9c                   	pushf  
80103b72:	5b                   	pop    %ebx
  asm volatile("cli");
80103b73:	fa                   	cli    
=======
80103b16:	55                   	push   %ebp
80103b17:	89 e5                	mov    %esp,%ebp
80103b19:	53                   	push   %ebx
80103b1a:	83 ec 04             	sub    $0x4,%esp
80103b1d:	9c                   	pushf  
80103b1e:	5b                   	pop    %ebx
  asm volatile("cli");
80103b1f:	fa                   	cli    
>>>>>>> d669a6c (ulib and makefile)
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
<<<<<<< HEAD
80103b74:	e8 c5 f5 ff ff       	call   8010313e <mycpu>
80103b79:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103b80:	74 11                	je     80103b93 <pushcli+0x29>
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
80103b82:	e8 b7 f5 ff ff       	call   8010313e <mycpu>
80103b87:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80103b8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b91:	c9                   	leave  
80103b92:	c3                   	ret    
    mycpu()->intena = eflags & FL_IF;
80103b93:	e8 a6 f5 ff ff       	call   8010313e <mycpu>
80103b98:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103b9e:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80103ba4:	eb dc                	jmp    80103b82 <pushcli+0x18>

80103ba6 <popcli>:
=======
80103b20:	e8 19 f6 ff ff       	call   8010313e <mycpu>
80103b25:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103b2c:	74 11                	je     80103b3f <pushcli+0x29>
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
80103b2e:	e8 0b f6 ff ff       	call   8010313e <mycpu>
80103b33:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80103b3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b3d:	c9                   	leave  
80103b3e:	c3                   	ret    
    mycpu()->intena = eflags & FL_IF;
80103b3f:	e8 fa f5 ff ff       	call   8010313e <mycpu>
80103b44:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103b4a:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80103b50:	eb dc                	jmp    80103b2e <pushcli+0x18>

80103b52 <popcli>:
>>>>>>> d669a6c (ulib and makefile)

void
popcli(void)
{
<<<<<<< HEAD
80103ba6:	55                   	push   %ebp
80103ba7:	89 e5                	mov    %esp,%ebp
80103ba9:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103bac:	9c                   	pushf  
80103bad:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103bae:	f6 c4 02             	test   $0x2,%ah
80103bb1:	75 28                	jne    80103bdb <popcli+0x35>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
80103bb3:	e8 86 f5 ff ff       	call   8010313e <mycpu>
80103bb8:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80103bbe:	8d 51 ff             	lea    -0x1(%ecx),%edx
80103bc1:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80103bc7:	85 d2                	test   %edx,%edx
80103bc9:	78 1d                	js     80103be8 <popcli+0x42>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80103bcb:	e8 6e f5 ff ff       	call   8010313e <mycpu>
80103bd0:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103bd7:	74 1c                	je     80103bf5 <popcli+0x4f>
    sti();
}
80103bd9:	c9                   	leave  
80103bda:	c3                   	ret    
    panic("popcli - interruptible");
80103bdb:	83 ec 0c             	sub    $0xc,%esp
80103bde:	68 cf 6c 10 80       	push   $0x80106ccf
80103be3:	e8 60 c7 ff ff       	call   80100348 <panic>
    panic("popcli");
80103be8:	83 ec 0c             	sub    $0xc,%esp
80103beb:	68 e6 6c 10 80       	push   $0x80106ce6
80103bf0:	e8 53 c7 ff ff       	call   80100348 <panic>
  if(mycpu()->ncli == 0 && mycpu()->intena)
80103bf5:	e8 44 f5 ff ff       	call   8010313e <mycpu>
80103bfa:	83 b8 a8 00 00 00 00 	cmpl   $0x0,0xa8(%eax)
80103c01:	74 d6                	je     80103bd9 <popcli+0x33>
  asm volatile("sti");
80103c03:	fb                   	sti    
}
80103c04:	eb d3                	jmp    80103bd9 <popcli+0x33>

80103c06 <holding>:
{
80103c06:	55                   	push   %ebp
80103c07:	89 e5                	mov    %esp,%ebp
80103c09:	53                   	push   %ebx
80103c0a:	83 ec 04             	sub    $0x4,%esp
80103c0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80103c10:	e8 55 ff ff ff       	call   80103b6a <pushcli>
  r = lock->locked && lock->cpu == mycpu();
80103c15:	83 3b 00             	cmpl   $0x0,(%ebx)
80103c18:	75 11                	jne    80103c2b <holding+0x25>
80103c1a:	bb 00 00 00 00       	mov    $0x0,%ebx
  popcli();
80103c1f:	e8 82 ff ff ff       	call   80103ba6 <popcli>
}
80103c24:	89 d8                	mov    %ebx,%eax
80103c26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c29:	c9                   	leave  
80103c2a:	c3                   	ret    
  r = lock->locked && lock->cpu == mycpu();
80103c2b:	8b 5b 08             	mov    0x8(%ebx),%ebx
80103c2e:	e8 0b f5 ff ff       	call   8010313e <mycpu>
80103c33:	39 c3                	cmp    %eax,%ebx
80103c35:	74 07                	je     80103c3e <holding+0x38>
80103c37:	bb 00 00 00 00       	mov    $0x0,%ebx
80103c3c:	eb e1                	jmp    80103c1f <holding+0x19>
80103c3e:	bb 01 00 00 00       	mov    $0x1,%ebx
80103c43:	eb da                	jmp    80103c1f <holding+0x19>

80103c45 <acquire>:
{
80103c45:	55                   	push   %ebp
80103c46:	89 e5                	mov    %esp,%ebp
80103c48:	53                   	push   %ebx
80103c49:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80103c4c:	e8 19 ff ff ff       	call   80103b6a <pushcli>
  if(holding(lk))
80103c51:	83 ec 0c             	sub    $0xc,%esp
80103c54:	ff 75 08             	push   0x8(%ebp)
80103c57:	e8 aa ff ff ff       	call   80103c06 <holding>
80103c5c:	83 c4 10             	add    $0x10,%esp
80103c5f:	85 c0                	test   %eax,%eax
80103c61:	75 3a                	jne    80103c9d <acquire+0x58>
  while(xchg(&lk->locked, 1) != 0)
80103c63:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("lock; xchgl %0, %1" :
80103c66:	b8 01 00 00 00       	mov    $0x1,%eax
80103c6b:	f0 87 02             	lock xchg %eax,(%edx)
80103c6e:	85 c0                	test   %eax,%eax
80103c70:	75 f1                	jne    80103c63 <acquire+0x1e>
  __sync_synchronize();
80103c72:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80103c77:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103c7a:	e8 bf f4 ff ff       	call   8010313e <mycpu>
80103c7f:	89 43 08             	mov    %eax,0x8(%ebx)
  getcallerpcs(&lk, lk->pcs);
80103c82:	8b 45 08             	mov    0x8(%ebp),%eax
80103c85:	83 c0 0c             	add    $0xc,%eax
80103c88:	83 ec 08             	sub    $0x8,%esp
80103c8b:	50                   	push   %eax
80103c8c:	8d 45 08             	lea    0x8(%ebp),%eax
80103c8f:	50                   	push   %eax
80103c90:	e8 8f fe ff ff       	call   80103b24 <getcallerpcs>
}
80103c95:	83 c4 10             	add    $0x10,%esp
80103c98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c9b:	c9                   	leave  
80103c9c:	c3                   	ret    
    panic("acquire");
80103c9d:	83 ec 0c             	sub    $0xc,%esp
80103ca0:	68 ed 6c 10 80       	push   $0x80106ced
80103ca5:	e8 9e c6 ff ff       	call   80100348 <panic>

80103caa <release>:
{
80103caa:	55                   	push   %ebp
80103cab:	89 e5                	mov    %esp,%ebp
80103cad:	53                   	push   %ebx
80103cae:	83 ec 10             	sub    $0x10,%esp
80103cb1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
80103cb4:	53                   	push   %ebx
80103cb5:	e8 4c ff ff ff       	call   80103c06 <holding>
80103cba:	83 c4 10             	add    $0x10,%esp
80103cbd:	85 c0                	test   %eax,%eax
80103cbf:	74 23                	je     80103ce4 <release+0x3a>
  lk->pcs[0] = 0;
80103cc1:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80103cc8:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80103ccf:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80103cd4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  popcli();
80103cda:	e8 c7 fe ff ff       	call   80103ba6 <popcli>
}
80103cdf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ce2:	c9                   	leave  
80103ce3:	c3                   	ret    
    panic("release");
80103ce4:	83 ec 0c             	sub    $0xc,%esp
80103ce7:	68 f5 6c 10 80       	push   $0x80106cf5
80103cec:	e8 57 c6 ff ff       	call   80100348 <panic>

80103cf1 <memset>:
=======
80103b52:	55                   	push   %ebp
80103b53:	89 e5                	mov    %esp,%ebp
80103b55:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b58:	9c                   	pushf  
80103b59:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103b5a:	f6 c4 02             	test   $0x2,%ah
80103b5d:	75 28                	jne    80103b87 <popcli+0x35>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
80103b5f:	e8 da f5 ff ff       	call   8010313e <mycpu>
80103b64:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80103b6a:	8d 51 ff             	lea    -0x1(%ecx),%edx
80103b6d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80103b73:	85 d2                	test   %edx,%edx
80103b75:	78 1d                	js     80103b94 <popcli+0x42>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80103b77:	e8 c2 f5 ff ff       	call   8010313e <mycpu>
80103b7c:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103b83:	74 1c                	je     80103ba1 <popcli+0x4f>
    sti();
}
80103b85:	c9                   	leave  
80103b86:	c3                   	ret    
    panic("popcli - interruptible");
80103b87:	83 ec 0c             	sub    $0xc,%esp
80103b8a:	68 8f 6c 10 80       	push   $0x80106c8f
80103b8f:	e8 b4 c7 ff ff       	call   80100348 <panic>
    panic("popcli");
80103b94:	83 ec 0c             	sub    $0xc,%esp
80103b97:	68 a6 6c 10 80       	push   $0x80106ca6
80103b9c:	e8 a7 c7 ff ff       	call   80100348 <panic>
  if(mycpu()->ncli == 0 && mycpu()->intena)
80103ba1:	e8 98 f5 ff ff       	call   8010313e <mycpu>
80103ba6:	83 b8 a8 00 00 00 00 	cmpl   $0x0,0xa8(%eax)
80103bad:	74 d6                	je     80103b85 <popcli+0x33>
  asm volatile("sti");
80103baf:	fb                   	sti    
}
80103bb0:	eb d3                	jmp    80103b85 <popcli+0x33>

80103bb2 <holding>:
{
80103bb2:	55                   	push   %ebp
80103bb3:	89 e5                	mov    %esp,%ebp
80103bb5:	53                   	push   %ebx
80103bb6:	83 ec 04             	sub    $0x4,%esp
80103bb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80103bbc:	e8 55 ff ff ff       	call   80103b16 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
80103bc1:	83 3b 00             	cmpl   $0x0,(%ebx)
80103bc4:	75 11                	jne    80103bd7 <holding+0x25>
80103bc6:	bb 00 00 00 00       	mov    $0x0,%ebx
  popcli();
80103bcb:	e8 82 ff ff ff       	call   80103b52 <popcli>
}
80103bd0:	89 d8                	mov    %ebx,%eax
80103bd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103bd5:	c9                   	leave  
80103bd6:	c3                   	ret    
  r = lock->locked && lock->cpu == mycpu();
80103bd7:	8b 5b 08             	mov    0x8(%ebx),%ebx
80103bda:	e8 5f f5 ff ff       	call   8010313e <mycpu>
80103bdf:	39 c3                	cmp    %eax,%ebx
80103be1:	74 07                	je     80103bea <holding+0x38>
80103be3:	bb 00 00 00 00       	mov    $0x0,%ebx
80103be8:	eb e1                	jmp    80103bcb <holding+0x19>
80103bea:	bb 01 00 00 00       	mov    $0x1,%ebx
80103bef:	eb da                	jmp    80103bcb <holding+0x19>

80103bf1 <acquire>:
{
80103bf1:	55                   	push   %ebp
80103bf2:	89 e5                	mov    %esp,%ebp
80103bf4:	53                   	push   %ebx
80103bf5:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80103bf8:	e8 19 ff ff ff       	call   80103b16 <pushcli>
  if(holding(lk))
80103bfd:	83 ec 0c             	sub    $0xc,%esp
80103c00:	ff 75 08             	push   0x8(%ebp)
80103c03:	e8 aa ff ff ff       	call   80103bb2 <holding>
80103c08:	83 c4 10             	add    $0x10,%esp
80103c0b:	85 c0                	test   %eax,%eax
80103c0d:	75 3a                	jne    80103c49 <acquire+0x58>
  while(xchg(&lk->locked, 1) != 0)
80103c0f:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("lock; xchgl %0, %1" :
80103c12:	b8 01 00 00 00       	mov    $0x1,%eax
80103c17:	f0 87 02             	lock xchg %eax,(%edx)
80103c1a:	85 c0                	test   %eax,%eax
80103c1c:	75 f1                	jne    80103c0f <acquire+0x1e>
  __sync_synchronize();
80103c1e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80103c23:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103c26:	e8 13 f5 ff ff       	call   8010313e <mycpu>
80103c2b:	89 43 08             	mov    %eax,0x8(%ebx)
  getcallerpcs(&lk, lk->pcs);
80103c2e:	8b 45 08             	mov    0x8(%ebp),%eax
80103c31:	83 c0 0c             	add    $0xc,%eax
80103c34:	83 ec 08             	sub    $0x8,%esp
80103c37:	50                   	push   %eax
80103c38:	8d 45 08             	lea    0x8(%ebp),%eax
80103c3b:	50                   	push   %eax
80103c3c:	e8 8f fe ff ff       	call   80103ad0 <getcallerpcs>
}
80103c41:	83 c4 10             	add    $0x10,%esp
80103c44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c47:	c9                   	leave  
80103c48:	c3                   	ret    
    panic("acquire");
80103c49:	83 ec 0c             	sub    $0xc,%esp
80103c4c:	68 ad 6c 10 80       	push   $0x80106cad
80103c51:	e8 f2 c6 ff ff       	call   80100348 <panic>

80103c56 <release>:
{
80103c56:	55                   	push   %ebp
80103c57:	89 e5                	mov    %esp,%ebp
80103c59:	53                   	push   %ebx
80103c5a:	83 ec 10             	sub    $0x10,%esp
80103c5d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
80103c60:	53                   	push   %ebx
80103c61:	e8 4c ff ff ff       	call   80103bb2 <holding>
80103c66:	83 c4 10             	add    $0x10,%esp
80103c69:	85 c0                	test   %eax,%eax
80103c6b:	74 23                	je     80103c90 <release+0x3a>
  lk->pcs[0] = 0;
80103c6d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80103c74:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80103c7b:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80103c80:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  popcli();
80103c86:	e8 c7 fe ff ff       	call   80103b52 <popcli>
}
80103c8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c8e:	c9                   	leave  
80103c8f:	c3                   	ret    
    panic("release");
80103c90:	83 ec 0c             	sub    $0xc,%esp
80103c93:	68 b5 6c 10 80       	push   $0x80106cb5
80103c98:	e8 ab c6 ff ff       	call   80100348 <panic>

80103c9d <memset>:
>>>>>>> d669a6c (ulib and makefile)
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
80103cf1:	55                   	push   %ebp
80103cf2:	89 e5                	mov    %esp,%ebp
80103cf4:	57                   	push   %edi
80103cf5:	53                   	push   %ebx
80103cf6:	8b 55 08             	mov    0x8(%ebp),%edx
80103cf9:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cfc:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
80103cff:	f6 c2 03             	test   $0x3,%dl
80103d02:	75 25                	jne    80103d29 <memset+0x38>
80103d04:	f6 c1 03             	test   $0x3,%cl
80103d07:	75 20                	jne    80103d29 <memset+0x38>
    c &= 0xFF;
80103d09:	0f b6 f8             	movzbl %al,%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80103d0c:	c1 e9 02             	shr    $0x2,%ecx
80103d0f:	c1 e0 18             	shl    $0x18,%eax
80103d12:	89 fb                	mov    %edi,%ebx
80103d14:	c1 e3 10             	shl    $0x10,%ebx
80103d17:	09 d8                	or     %ebx,%eax
80103d19:	89 fb                	mov    %edi,%ebx
80103d1b:	c1 e3 08             	shl    $0x8,%ebx
80103d1e:	09 d8                	or     %ebx,%eax
80103d20:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80103d22:	89 d7                	mov    %edx,%edi
80103d24:	fc                   	cld    
80103d25:	f3 ab                	rep stos %eax,%es:(%edi)
}
80103d27:	eb 05                	jmp    80103d2e <memset+0x3d>
  asm volatile("cld; rep stosb" :
80103d29:	89 d7                	mov    %edx,%edi
80103d2b:	fc                   	cld    
80103d2c:	f3 aa                	rep stos %al,%es:(%edi)
=======
80103c9d:	55                   	push   %ebp
80103c9e:	89 e5                	mov    %esp,%ebp
80103ca0:	57                   	push   %edi
80103ca1:	53                   	push   %ebx
80103ca2:	8b 55 08             	mov    0x8(%ebp),%edx
80103ca5:	8b 45 0c             	mov    0xc(%ebp),%eax
80103ca8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
80103cab:	f6 c2 03             	test   $0x3,%dl
80103cae:	75 25                	jne    80103cd5 <memset+0x38>
80103cb0:	f6 c1 03             	test   $0x3,%cl
80103cb3:	75 20                	jne    80103cd5 <memset+0x38>
    c &= 0xFF;
80103cb5:	0f b6 f8             	movzbl %al,%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80103cb8:	c1 e9 02             	shr    $0x2,%ecx
80103cbb:	c1 e0 18             	shl    $0x18,%eax
80103cbe:	89 fb                	mov    %edi,%ebx
80103cc0:	c1 e3 10             	shl    $0x10,%ebx
80103cc3:	09 d8                	or     %ebx,%eax
80103cc5:	89 fb                	mov    %edi,%ebx
80103cc7:	c1 e3 08             	shl    $0x8,%ebx
80103cca:	09 d8                	or     %ebx,%eax
80103ccc:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80103cce:	89 d7                	mov    %edx,%edi
80103cd0:	fc                   	cld    
80103cd1:	f3 ab                	rep stos %eax,%es:(%edi)
}
80103cd3:	eb 05                	jmp    80103cda <memset+0x3d>
  asm volatile("cld; rep stosb" :
80103cd5:	89 d7                	mov    %edx,%edi
80103cd7:	fc                   	cld    
80103cd8:	f3 aa                	rep stos %al,%es:(%edi)
>>>>>>> d669a6c (ulib and makefile)
  } else
    stosb(dst, c, n);
  return dst;
}
<<<<<<< HEAD
80103d2e:	89 d0                	mov    %edx,%eax
80103d30:	5b                   	pop    %ebx
80103d31:	5f                   	pop    %edi
80103d32:	5d                   	pop    %ebp
80103d33:	c3                   	ret    

80103d34 <memcmp>:
=======
80103cda:	89 d0                	mov    %edx,%eax
80103cdc:	5b                   	pop    %ebx
80103cdd:	5f                   	pop    %edi
80103cde:	5d                   	pop    %ebp
80103cdf:	c3                   	ret    

80103ce0 <memcmp>:
>>>>>>> d669a6c (ulib and makefile)

int
memcmp(const void *v1, const void *v2, uint n)
{
<<<<<<< HEAD
80103d34:	55                   	push   %ebp
80103d35:	89 e5                	mov    %esp,%ebp
80103d37:	56                   	push   %esi
80103d38:	53                   	push   %ebx
80103d39:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103d3c:	8b 55 0c             	mov    0xc(%ebp),%edx
80103d3f:	8b 45 10             	mov    0x10(%ebp),%eax
=======
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	56                   	push   %esi
80103ce4:	53                   	push   %ebx
80103ce5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103ce8:	8b 55 0c             	mov    0xc(%ebp),%edx
80103ceb:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> d669a6c (ulib and makefile)
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
<<<<<<< HEAD
80103d42:	eb 08                	jmp    80103d4c <memcmp+0x18>
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
80103d44:	83 c1 01             	add    $0x1,%ecx
80103d47:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0){
80103d4a:	89 f0                	mov    %esi,%eax
80103d4c:	8d 70 ff             	lea    -0x1(%eax),%esi
80103d4f:	85 c0                	test   %eax,%eax
80103d51:	74 12                	je     80103d65 <memcmp+0x31>
    if(*s1 != *s2)
80103d53:	0f b6 01             	movzbl (%ecx),%eax
80103d56:	0f b6 1a             	movzbl (%edx),%ebx
80103d59:	38 d8                	cmp    %bl,%al
80103d5b:	74 e7                	je     80103d44 <memcmp+0x10>
      return *s1 - *s2;
80103d5d:	0f b6 c0             	movzbl %al,%eax
80103d60:	0f b6 db             	movzbl %bl,%ebx
80103d63:	29 d8                	sub    %ebx,%eax
=======
80103cee:	eb 08                	jmp    80103cf8 <memcmp+0x18>
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
80103cf0:	83 c1 01             	add    $0x1,%ecx
80103cf3:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0){
80103cf6:	89 f0                	mov    %esi,%eax
80103cf8:	8d 70 ff             	lea    -0x1(%eax),%esi
80103cfb:	85 c0                	test   %eax,%eax
80103cfd:	74 12                	je     80103d11 <memcmp+0x31>
    if(*s1 != *s2)
80103cff:	0f b6 01             	movzbl (%ecx),%eax
80103d02:	0f b6 1a             	movzbl (%edx),%ebx
80103d05:	38 d8                	cmp    %bl,%al
80103d07:	74 e7                	je     80103cf0 <memcmp+0x10>
      return *s1 - *s2;
80103d09:	0f b6 c0             	movzbl %al,%eax
80103d0c:	0f b6 db             	movzbl %bl,%ebx
80103d0f:	29 d8                	sub    %ebx,%eax
>>>>>>> d669a6c (ulib and makefile)
  }

  return 0;
}
<<<<<<< HEAD
80103d65:	5b                   	pop    %ebx
80103d66:	5e                   	pop    %esi
80103d67:	5d                   	pop    %ebp
80103d68:	c3                   	ret    

80103d69 <memmove>:
=======
80103d11:	5b                   	pop    %ebx
80103d12:	5e                   	pop    %esi
80103d13:	5d                   	pop    %ebp
80103d14:	c3                   	ret    

80103d15 <memmove>:
>>>>>>> d669a6c (ulib and makefile)

void*
memmove(void *dst, const void *src, uint n)
{
<<<<<<< HEAD
80103d69:	55                   	push   %ebp
80103d6a:	89 e5                	mov    %esp,%ebp
80103d6c:	56                   	push   %esi
80103d6d:	53                   	push   %ebx
80103d6e:	8b 75 08             	mov    0x8(%ebp),%esi
80103d71:	8b 55 0c             	mov    0xc(%ebp),%edx
80103d74:	8b 45 10             	mov    0x10(%ebp),%eax
=======
80103d15:	55                   	push   %ebp
80103d16:	89 e5                	mov    %esp,%ebp
80103d18:	56                   	push   %esi
80103d19:	53                   	push   %ebx
80103d1a:	8b 75 08             	mov    0x8(%ebp),%esi
80103d1d:	8b 55 0c             	mov    0xc(%ebp),%edx
80103d20:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> d669a6c (ulib and makefile)
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
<<<<<<< HEAD
80103d77:	39 f2                	cmp    %esi,%edx
80103d79:	73 3c                	jae    80103db7 <memmove+0x4e>
80103d7b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80103d7e:	39 f1                	cmp    %esi,%ecx
80103d80:	76 39                	jbe    80103dbb <memmove+0x52>
    s += n;
    d += n;
80103d82:	8d 14 06             	lea    (%esi,%eax,1),%edx
    while(n-- > 0)
80103d85:	eb 0d                	jmp    80103d94 <memmove+0x2b>
      *--d = *--s;
80103d87:	83 e9 01             	sub    $0x1,%ecx
80103d8a:	83 ea 01             	sub    $0x1,%edx
80103d8d:	0f b6 01             	movzbl (%ecx),%eax
80103d90:	88 02                	mov    %al,(%edx)
    while(n-- > 0)
80103d92:	89 d8                	mov    %ebx,%eax
80103d94:	8d 58 ff             	lea    -0x1(%eax),%ebx
80103d97:	85 c0                	test   %eax,%eax
80103d99:	75 ec                	jne    80103d87 <memmove+0x1e>
80103d9b:	eb 14                	jmp    80103db1 <memmove+0x48>
  } else
    while(n-- > 0)
      *d++ = *s++;
80103d9d:	0f b6 02             	movzbl (%edx),%eax
80103da0:	88 01                	mov    %al,(%ecx)
80103da2:	8d 49 01             	lea    0x1(%ecx),%ecx
80103da5:	8d 52 01             	lea    0x1(%edx),%edx
    while(n-- > 0)
80103da8:	89 d8                	mov    %ebx,%eax
80103daa:	8d 58 ff             	lea    -0x1(%eax),%ebx
80103dad:	85 c0                	test   %eax,%eax
80103daf:	75 ec                	jne    80103d9d <memmove+0x34>

  return dst;
}
80103db1:	89 f0                	mov    %esi,%eax
80103db3:	5b                   	pop    %ebx
80103db4:	5e                   	pop    %esi
80103db5:	5d                   	pop    %ebp
80103db6:	c3                   	ret    
80103db7:	89 f1                	mov    %esi,%ecx
80103db9:	eb ef                	jmp    80103daa <memmove+0x41>
80103dbb:	89 f1                	mov    %esi,%ecx
80103dbd:	eb eb                	jmp    80103daa <memmove+0x41>

80103dbf <memcpy>:
=======
80103d23:	39 f2                	cmp    %esi,%edx
80103d25:	73 3c                	jae    80103d63 <memmove+0x4e>
80103d27:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80103d2a:	39 f1                	cmp    %esi,%ecx
80103d2c:	76 39                	jbe    80103d67 <memmove+0x52>
    s += n;
    d += n;
80103d2e:	8d 14 06             	lea    (%esi,%eax,1),%edx
    while(n-- > 0)
80103d31:	eb 0d                	jmp    80103d40 <memmove+0x2b>
      *--d = *--s;
80103d33:	83 e9 01             	sub    $0x1,%ecx
80103d36:	83 ea 01             	sub    $0x1,%edx
80103d39:	0f b6 01             	movzbl (%ecx),%eax
80103d3c:	88 02                	mov    %al,(%edx)
    while(n-- > 0)
80103d3e:	89 d8                	mov    %ebx,%eax
80103d40:	8d 58 ff             	lea    -0x1(%eax),%ebx
80103d43:	85 c0                	test   %eax,%eax
80103d45:	75 ec                	jne    80103d33 <memmove+0x1e>
80103d47:	eb 14                	jmp    80103d5d <memmove+0x48>
  } else
    while(n-- > 0)
      *d++ = *s++;
80103d49:	0f b6 02             	movzbl (%edx),%eax
80103d4c:	88 01                	mov    %al,(%ecx)
80103d4e:	8d 49 01             	lea    0x1(%ecx),%ecx
80103d51:	8d 52 01             	lea    0x1(%edx),%edx
    while(n-- > 0)
80103d54:	89 d8                	mov    %ebx,%eax
80103d56:	8d 58 ff             	lea    -0x1(%eax),%ebx
80103d59:	85 c0                	test   %eax,%eax
80103d5b:	75 ec                	jne    80103d49 <memmove+0x34>

  return dst;
}
80103d5d:	89 f0                	mov    %esi,%eax
80103d5f:	5b                   	pop    %ebx
80103d60:	5e                   	pop    %esi
80103d61:	5d                   	pop    %ebp
80103d62:	c3                   	ret    
80103d63:	89 f1                	mov    %esi,%ecx
80103d65:	eb ef                	jmp    80103d56 <memmove+0x41>
80103d67:	89 f1                	mov    %esi,%ecx
80103d69:	eb eb                	jmp    80103d56 <memmove+0x41>

80103d6b <memcpy>:
>>>>>>> d669a6c (ulib and makefile)

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
<<<<<<< HEAD
80103dbf:	55                   	push   %ebp
80103dc0:	89 e5                	mov    %esp,%ebp
80103dc2:	83 ec 0c             	sub    $0xc,%esp
  return memmove(dst, src, n);
80103dc5:	ff 75 10             	push   0x10(%ebp)
80103dc8:	ff 75 0c             	push   0xc(%ebp)
80103dcb:	ff 75 08             	push   0x8(%ebp)
80103dce:	e8 96 ff ff ff       	call   80103d69 <memmove>
}
80103dd3:	c9                   	leave  
80103dd4:	c3                   	ret    

80103dd5 <strncmp>:
=======
80103d6b:	55                   	push   %ebp
80103d6c:	89 e5                	mov    %esp,%ebp
80103d6e:	83 ec 0c             	sub    $0xc,%esp
  return memmove(dst, src, n);
80103d71:	ff 75 10             	push   0x10(%ebp)
80103d74:	ff 75 0c             	push   0xc(%ebp)
80103d77:	ff 75 08             	push   0x8(%ebp)
80103d7a:	e8 96 ff ff ff       	call   80103d15 <memmove>
}
80103d7f:	c9                   	leave  
80103d80:	c3                   	ret    

80103d81 <strncmp>:
>>>>>>> d669a6c (ulib and makefile)

int
strncmp(const char *p, const char *q, uint n)
{
<<<<<<< HEAD
80103dd5:	55                   	push   %ebp
80103dd6:	89 e5                	mov    %esp,%ebp
80103dd8:	53                   	push   %ebx
80103dd9:	8b 55 08             	mov    0x8(%ebp),%edx
80103ddc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103ddf:	8b 45 10             	mov    0x10(%ebp),%eax
  while(n > 0 && *p && *p == *q)
80103de2:	eb 09                	jmp    80103ded <strncmp+0x18>
    n--, p++, q++;
80103de4:	83 e8 01             	sub    $0x1,%eax
80103de7:	83 c2 01             	add    $0x1,%edx
80103dea:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
80103ded:	85 c0                	test   %eax,%eax
80103def:	74 0b                	je     80103dfc <strncmp+0x27>
80103df1:	0f b6 1a             	movzbl (%edx),%ebx
80103df4:	84 db                	test   %bl,%bl
80103df6:	74 04                	je     80103dfc <strncmp+0x27>
80103df8:	3a 19                	cmp    (%ecx),%bl
80103dfa:	74 e8                	je     80103de4 <strncmp+0xf>
  if(n == 0)
80103dfc:	85 c0                	test   %eax,%eax
80103dfe:	74 0d                	je     80103e0d <strncmp+0x38>
    return 0;
  return (uchar)*p - (uchar)*q;
80103e00:	0f b6 02             	movzbl (%edx),%eax
80103e03:	0f b6 11             	movzbl (%ecx),%edx
80103e06:	29 d0                	sub    %edx,%eax
}
80103e08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e0b:	c9                   	leave  
80103e0c:	c3                   	ret    
    return 0;
80103e0d:	b8 00 00 00 00       	mov    $0x0,%eax
80103e12:	eb f4                	jmp    80103e08 <strncmp+0x33>

80103e14 <strncpy>:
=======
80103d81:	55                   	push   %ebp
80103d82:	89 e5                	mov    %esp,%ebp
80103d84:	53                   	push   %ebx
80103d85:	8b 55 08             	mov    0x8(%ebp),%edx
80103d88:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103d8b:	8b 45 10             	mov    0x10(%ebp),%eax
  while(n > 0 && *p && *p == *q)
80103d8e:	eb 09                	jmp    80103d99 <strncmp+0x18>
    n--, p++, q++;
80103d90:	83 e8 01             	sub    $0x1,%eax
80103d93:	83 c2 01             	add    $0x1,%edx
80103d96:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
80103d99:	85 c0                	test   %eax,%eax
80103d9b:	74 0b                	je     80103da8 <strncmp+0x27>
80103d9d:	0f b6 1a             	movzbl (%edx),%ebx
80103da0:	84 db                	test   %bl,%bl
80103da2:	74 04                	je     80103da8 <strncmp+0x27>
80103da4:	3a 19                	cmp    (%ecx),%bl
80103da6:	74 e8                	je     80103d90 <strncmp+0xf>
  if(n == 0)
80103da8:	85 c0                	test   %eax,%eax
80103daa:	74 0d                	je     80103db9 <strncmp+0x38>
    return 0;
  return (uchar)*p - (uchar)*q;
80103dac:	0f b6 02             	movzbl (%edx),%eax
80103daf:	0f b6 11             	movzbl (%ecx),%edx
80103db2:	29 d0                	sub    %edx,%eax
}
80103db4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103db7:	c9                   	leave  
80103db8:	c3                   	ret    
    return 0;
80103db9:	b8 00 00 00 00       	mov    $0x0,%eax
80103dbe:	eb f4                	jmp    80103db4 <strncmp+0x33>

80103dc0 <strncpy>:
>>>>>>> d669a6c (ulib and makefile)

char*
strncpy(char *s, const char *t, int n)
{
<<<<<<< HEAD
80103e14:	55                   	push   %ebp
80103e15:	89 e5                	mov    %esp,%ebp
80103e17:	57                   	push   %edi
80103e18:	56                   	push   %esi
80103e19:	53                   	push   %ebx
80103e1a:	8b 7d 08             	mov    0x8(%ebp),%edi
80103e1d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103e20:	8b 45 10             	mov    0x10(%ebp),%eax
=======
80103dc0:	55                   	push   %ebp
80103dc1:	89 e5                	mov    %esp,%ebp
80103dc3:	57                   	push   %edi
80103dc4:	56                   	push   %esi
80103dc5:	53                   	push   %ebx
80103dc6:	8b 7d 08             	mov    0x8(%ebp),%edi
80103dc9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103dcc:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> d669a6c (ulib and makefile)
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
<<<<<<< HEAD
80103e23:	89 fa                	mov    %edi,%edx
80103e25:	eb 04                	jmp    80103e2b <strncpy+0x17>
80103e27:	89 f1                	mov    %esi,%ecx
80103e29:	89 da                	mov    %ebx,%edx
80103e2b:	89 c3                	mov    %eax,%ebx
80103e2d:	83 e8 01             	sub    $0x1,%eax
80103e30:	85 db                	test   %ebx,%ebx
80103e32:	7e 11                	jle    80103e45 <strncpy+0x31>
80103e34:	8d 71 01             	lea    0x1(%ecx),%esi
80103e37:	8d 5a 01             	lea    0x1(%edx),%ebx
80103e3a:	0f b6 09             	movzbl (%ecx),%ecx
80103e3d:	88 0a                	mov    %cl,(%edx)
80103e3f:	84 c9                	test   %cl,%cl
80103e41:	75 e4                	jne    80103e27 <strncpy+0x13>
80103e43:	89 da                	mov    %ebx,%edx
    ;
  while(n-- > 0)
80103e45:	8d 48 ff             	lea    -0x1(%eax),%ecx
80103e48:	85 c0                	test   %eax,%eax
80103e4a:	7e 0a                	jle    80103e56 <strncpy+0x42>
    *s++ = 0;
80103e4c:	c6 02 00             	movb   $0x0,(%edx)
  while(n-- > 0)
80103e4f:	89 c8                	mov    %ecx,%eax
    *s++ = 0;
80103e51:	8d 52 01             	lea    0x1(%edx),%edx
80103e54:	eb ef                	jmp    80103e45 <strncpy+0x31>
  return os;
}
80103e56:	89 f8                	mov    %edi,%eax
80103e58:	5b                   	pop    %ebx
80103e59:	5e                   	pop    %esi
80103e5a:	5f                   	pop    %edi
80103e5b:	5d                   	pop    %ebp
80103e5c:	c3                   	ret    

80103e5d <safestrcpy>:
=======
80103dcf:	89 fa                	mov    %edi,%edx
80103dd1:	eb 04                	jmp    80103dd7 <strncpy+0x17>
80103dd3:	89 f1                	mov    %esi,%ecx
80103dd5:	89 da                	mov    %ebx,%edx
80103dd7:	89 c3                	mov    %eax,%ebx
80103dd9:	83 e8 01             	sub    $0x1,%eax
80103ddc:	85 db                	test   %ebx,%ebx
80103dde:	7e 11                	jle    80103df1 <strncpy+0x31>
80103de0:	8d 71 01             	lea    0x1(%ecx),%esi
80103de3:	8d 5a 01             	lea    0x1(%edx),%ebx
80103de6:	0f b6 09             	movzbl (%ecx),%ecx
80103de9:	88 0a                	mov    %cl,(%edx)
80103deb:	84 c9                	test   %cl,%cl
80103ded:	75 e4                	jne    80103dd3 <strncpy+0x13>
80103def:	89 da                	mov    %ebx,%edx
    ;
  while(n-- > 0)
80103df1:	8d 48 ff             	lea    -0x1(%eax),%ecx
80103df4:	85 c0                	test   %eax,%eax
80103df6:	7e 0a                	jle    80103e02 <strncpy+0x42>
    *s++ = 0;
80103df8:	c6 02 00             	movb   $0x0,(%edx)
  while(n-- > 0)
80103dfb:	89 c8                	mov    %ecx,%eax
    *s++ = 0;
80103dfd:	8d 52 01             	lea    0x1(%edx),%edx
80103e00:	eb ef                	jmp    80103df1 <strncpy+0x31>
  return os;
}
80103e02:	89 f8                	mov    %edi,%eax
80103e04:	5b                   	pop    %ebx
80103e05:	5e                   	pop    %esi
80103e06:	5f                   	pop    %edi
80103e07:	5d                   	pop    %ebp
80103e08:	c3                   	ret    

80103e09 <safestrcpy>:
>>>>>>> d669a6c (ulib and makefile)

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
<<<<<<< HEAD
80103e5d:	55                   	push   %ebp
80103e5e:	89 e5                	mov    %esp,%ebp
80103e60:	57                   	push   %edi
80103e61:	56                   	push   %esi
80103e62:	53                   	push   %ebx
80103e63:	8b 7d 08             	mov    0x8(%ebp),%edi
80103e66:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103e69:	8b 45 10             	mov    0x10(%ebp),%eax
=======
80103e09:	55                   	push   %ebp
80103e0a:	89 e5                	mov    %esp,%ebp
80103e0c:	57                   	push   %edi
80103e0d:	56                   	push   %esi
80103e0e:	53                   	push   %ebx
80103e0f:	8b 7d 08             	mov    0x8(%ebp),%edi
80103e12:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103e15:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> d669a6c (ulib and makefile)
  char *os;

  os = s;
  if(n <= 0)
<<<<<<< HEAD
80103e6c:	85 c0                	test   %eax,%eax
80103e6e:	7e 23                	jle    80103e93 <safestrcpy+0x36>
80103e70:	89 fa                	mov    %edi,%edx
80103e72:	eb 04                	jmp    80103e78 <safestrcpy+0x1b>
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80103e74:	89 f1                	mov    %esi,%ecx
80103e76:	89 da                	mov    %ebx,%edx
80103e78:	83 e8 01             	sub    $0x1,%eax
80103e7b:	85 c0                	test   %eax,%eax
80103e7d:	7e 11                	jle    80103e90 <safestrcpy+0x33>
80103e7f:	8d 71 01             	lea    0x1(%ecx),%esi
80103e82:	8d 5a 01             	lea    0x1(%edx),%ebx
80103e85:	0f b6 09             	movzbl (%ecx),%ecx
80103e88:	88 0a                	mov    %cl,(%edx)
80103e8a:	84 c9                	test   %cl,%cl
80103e8c:	75 e6                	jne    80103e74 <safestrcpy+0x17>
80103e8e:	89 da                	mov    %ebx,%edx
    ;
  *s = 0;
80103e90:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
80103e93:	89 f8                	mov    %edi,%eax
80103e95:	5b                   	pop    %ebx
80103e96:	5e                   	pop    %esi
80103e97:	5f                   	pop    %edi
80103e98:	5d                   	pop    %ebp
80103e99:	c3                   	ret    

80103e9a <strlen>:
=======
80103e18:	85 c0                	test   %eax,%eax
80103e1a:	7e 23                	jle    80103e3f <safestrcpy+0x36>
80103e1c:	89 fa                	mov    %edi,%edx
80103e1e:	eb 04                	jmp    80103e24 <safestrcpy+0x1b>
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80103e20:	89 f1                	mov    %esi,%ecx
80103e22:	89 da                	mov    %ebx,%edx
80103e24:	83 e8 01             	sub    $0x1,%eax
80103e27:	85 c0                	test   %eax,%eax
80103e29:	7e 11                	jle    80103e3c <safestrcpy+0x33>
80103e2b:	8d 71 01             	lea    0x1(%ecx),%esi
80103e2e:	8d 5a 01             	lea    0x1(%edx),%ebx
80103e31:	0f b6 09             	movzbl (%ecx),%ecx
80103e34:	88 0a                	mov    %cl,(%edx)
80103e36:	84 c9                	test   %cl,%cl
80103e38:	75 e6                	jne    80103e20 <safestrcpy+0x17>
80103e3a:	89 da                	mov    %ebx,%edx
    ;
  *s = 0;
80103e3c:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
80103e3f:	89 f8                	mov    %edi,%eax
80103e41:	5b                   	pop    %ebx
80103e42:	5e                   	pop    %esi
80103e43:	5f                   	pop    %edi
80103e44:	5d                   	pop    %ebp
80103e45:	c3                   	ret    

80103e46 <strlen>:
>>>>>>> d669a6c (ulib and makefile)

int
strlen(const char *s)
{
<<<<<<< HEAD
80103e9a:	55                   	push   %ebp
80103e9b:	89 e5                	mov    %esp,%ebp
80103e9d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80103ea0:	b8 00 00 00 00       	mov    $0x0,%eax
80103ea5:	eb 03                	jmp    80103eaa <strlen+0x10>
80103ea7:	83 c0 01             	add    $0x1,%eax
80103eaa:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80103eae:	75 f7                	jne    80103ea7 <strlen+0xd>
    ;
  return n;
}
80103eb0:	5d                   	pop    %ebp
80103eb1:	c3                   	ret    

80103eb2 <swtch>:
=======
80103e46:	55                   	push   %ebp
80103e47:	89 e5                	mov    %esp,%ebp
80103e49:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80103e4c:	b8 00 00 00 00       	mov    $0x0,%eax
80103e51:	eb 03                	jmp    80103e56 <strlen+0x10>
80103e53:	83 c0 01             	add    $0x1,%eax
80103e56:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80103e5a:	75 f7                	jne    80103e53 <strlen+0xd>
    ;
  return n;
}
80103e5c:	5d                   	pop    %ebp
80103e5d:	c3                   	ret    

80103e5e <swtch>:
>>>>>>> d669a6c (ulib and makefile)
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
<<<<<<< HEAD
80103eb2:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80103eb6:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80103eba:	55                   	push   %ebp
  pushl %ebx
80103ebb:	53                   	push   %ebx
  pushl %esi
80103ebc:	56                   	push   %esi
  pushl %edi
80103ebd:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80103ebe:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80103ec0:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80103ec2:	5f                   	pop    %edi
  popl %esi
80103ec3:	5e                   	pop    %esi
  popl %ebx
80103ec4:	5b                   	pop    %ebx
  popl %ebp
80103ec5:	5d                   	pop    %ebp
  ret
80103ec6:	c3                   	ret    

80103ec7 <fetchint>:
=======
80103e5e:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80103e62:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80103e66:	55                   	push   %ebp
  pushl %ebx
80103e67:	53                   	push   %ebx
  pushl %esi
80103e68:	56                   	push   %esi
  pushl %edi
80103e69:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80103e6a:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80103e6c:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80103e6e:	5f                   	pop    %edi
  popl %esi
80103e6f:	5e                   	pop    %esi
  popl %ebx
80103e70:	5b                   	pop    %ebx
  popl %ebp
80103e71:	5d                   	pop    %ebp
  ret
80103e72:	c3                   	ret    

80103e73 <fetchint>:
>>>>>>> d669a6c (ulib and makefile)
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
<<<<<<< HEAD
80103ec7:	55                   	push   %ebp
80103ec8:	89 e5                	mov    %esp,%ebp
80103eca:	53                   	push   %ebx
80103ecb:	83 ec 04             	sub    $0x4,%esp
80103ece:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80103ed1:	e8 df f2 ff ff       	call   801031b5 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80103ed6:	8b 00                	mov    (%eax),%eax
80103ed8:	39 d8                	cmp    %ebx,%eax
80103eda:	76 18                	jbe    80103ef4 <fetchint+0x2d>
80103edc:	8d 53 04             	lea    0x4(%ebx),%edx
80103edf:	39 d0                	cmp    %edx,%eax
80103ee1:	72 18                	jb     80103efb <fetchint+0x34>
    return -1;
  *ip = *(int*)(addr);
80103ee3:	8b 13                	mov    (%ebx),%edx
80103ee5:	8b 45 0c             	mov    0xc(%ebp),%eax
80103ee8:	89 10                	mov    %edx,(%eax)
  return 0;
80103eea:	b8 00 00 00 00       	mov    $0x0,%eax
}
80103eef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ef2:	c9                   	leave  
80103ef3:	c3                   	ret    
    return -1;
80103ef4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ef9:	eb f4                	jmp    80103eef <fetchint+0x28>
80103efb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f00:	eb ed                	jmp    80103eef <fetchint+0x28>

80103f02 <fetchstr>:
=======
80103e73:	55                   	push   %ebp
80103e74:	89 e5                	mov    %esp,%ebp
80103e76:	53                   	push   %ebx
80103e77:	83 ec 04             	sub    $0x4,%esp
80103e7a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80103e7d:	e8 33 f3 ff ff       	call   801031b5 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80103e82:	8b 00                	mov    (%eax),%eax
80103e84:	39 d8                	cmp    %ebx,%eax
80103e86:	76 18                	jbe    80103ea0 <fetchint+0x2d>
80103e88:	8d 53 04             	lea    0x4(%ebx),%edx
80103e8b:	39 d0                	cmp    %edx,%eax
80103e8d:	72 18                	jb     80103ea7 <fetchint+0x34>
    return -1;
  *ip = *(int*)(addr);
80103e8f:	8b 13                	mov    (%ebx),%edx
80103e91:	8b 45 0c             	mov    0xc(%ebp),%eax
80103e94:	89 10                	mov    %edx,(%eax)
  return 0;
80103e96:	b8 00 00 00 00       	mov    $0x0,%eax
}
80103e9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e9e:	c9                   	leave  
80103e9f:	c3                   	ret    
    return -1;
80103ea0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ea5:	eb f4                	jmp    80103e9b <fetchint+0x28>
80103ea7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103eac:	eb ed                	jmp    80103e9b <fetchint+0x28>

80103eae <fetchstr>:
>>>>>>> d669a6c (ulib and makefile)
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
<<<<<<< HEAD
80103f02:	55                   	push   %ebp
80103f03:	89 e5                	mov    %esp,%ebp
80103f05:	53                   	push   %ebx
80103f06:	83 ec 04             	sub    $0x4,%esp
80103f09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80103f0c:	e8 a4 f2 ff ff       	call   801031b5 <myproc>

  if(addr >= curproc->sz)
80103f11:	39 18                	cmp    %ebx,(%eax)
80103f13:	76 25                	jbe    80103f3a <fetchstr+0x38>
    return -1;
  *pp = (char*)addr;
80103f15:	8b 55 0c             	mov    0xc(%ebp),%edx
80103f18:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
80103f1a:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++){
80103f1c:	89 d8                	mov    %ebx,%eax
80103f1e:	eb 03                	jmp    80103f23 <fetchstr+0x21>
80103f20:	83 c0 01             	add    $0x1,%eax
80103f23:	39 d0                	cmp    %edx,%eax
80103f25:	73 09                	jae    80103f30 <fetchstr+0x2e>
    if(*s == 0)
80103f27:	80 38 00             	cmpb   $0x0,(%eax)
80103f2a:	75 f4                	jne    80103f20 <fetchstr+0x1e>
      return s - *pp;
80103f2c:	29 d8                	sub    %ebx,%eax
80103f2e:	eb 05                	jmp    80103f35 <fetchstr+0x33>
  }
  return -1;
80103f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f38:	c9                   	leave  
80103f39:	c3                   	ret    
    return -1;
80103f3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f3f:	eb f4                	jmp    80103f35 <fetchstr+0x33>

80103f41 <argint>:
=======
80103eae:	55                   	push   %ebp
80103eaf:	89 e5                	mov    %esp,%ebp
80103eb1:	53                   	push   %ebx
80103eb2:	83 ec 04             	sub    $0x4,%esp
80103eb5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80103eb8:	e8 f8 f2 ff ff       	call   801031b5 <myproc>

  if(addr >= curproc->sz)
80103ebd:	39 18                	cmp    %ebx,(%eax)
80103ebf:	76 25                	jbe    80103ee6 <fetchstr+0x38>
    return -1;
  *pp = (char*)addr;
80103ec1:	8b 55 0c             	mov    0xc(%ebp),%edx
80103ec4:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
80103ec6:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++){
80103ec8:	89 d8                	mov    %ebx,%eax
80103eca:	eb 03                	jmp    80103ecf <fetchstr+0x21>
80103ecc:	83 c0 01             	add    $0x1,%eax
80103ecf:	39 d0                	cmp    %edx,%eax
80103ed1:	73 09                	jae    80103edc <fetchstr+0x2e>
    if(*s == 0)
80103ed3:	80 38 00             	cmpb   $0x0,(%eax)
80103ed6:	75 f4                	jne    80103ecc <fetchstr+0x1e>
      return s - *pp;
80103ed8:	29 d8                	sub    %ebx,%eax
80103eda:	eb 05                	jmp    80103ee1 <fetchstr+0x33>
  }
  return -1;
80103edc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103ee1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ee4:	c9                   	leave  
80103ee5:	c3                   	ret    
    return -1;
80103ee6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103eeb:	eb f4                	jmp    80103ee1 <fetchstr+0x33>

80103eed <argint>:
>>>>>>> d669a6c (ulib and makefile)

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
<<<<<<< HEAD
80103f41:	55                   	push   %ebp
80103f42:	89 e5                	mov    %esp,%ebp
80103f44:	83 ec 08             	sub    $0x8,%esp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80103f47:	e8 69 f2 ff ff       	call   801031b5 <myproc>
80103f4c:	8b 50 18             	mov    0x18(%eax),%edx
80103f4f:	8b 45 08             	mov    0x8(%ebp),%eax
80103f52:	c1 e0 02             	shl    $0x2,%eax
80103f55:	03 42 44             	add    0x44(%edx),%eax
80103f58:	83 ec 08             	sub    $0x8,%esp
80103f5b:	ff 75 0c             	push   0xc(%ebp)
80103f5e:	83 c0 04             	add    $0x4,%eax
80103f61:	50                   	push   %eax
80103f62:	e8 60 ff ff ff       	call   80103ec7 <fetchint>
}
80103f67:	c9                   	leave  
80103f68:	c3                   	ret    

80103f69 <argptr>:
=======
80103eed:	55                   	push   %ebp
80103eee:	89 e5                	mov    %esp,%ebp
80103ef0:	83 ec 08             	sub    $0x8,%esp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80103ef3:	e8 bd f2 ff ff       	call   801031b5 <myproc>
80103ef8:	8b 50 18             	mov    0x18(%eax),%edx
80103efb:	8b 45 08             	mov    0x8(%ebp),%eax
80103efe:	c1 e0 02             	shl    $0x2,%eax
80103f01:	03 42 44             	add    0x44(%edx),%eax
80103f04:	83 ec 08             	sub    $0x8,%esp
80103f07:	ff 75 0c             	push   0xc(%ebp)
80103f0a:	83 c0 04             	add    $0x4,%eax
80103f0d:	50                   	push   %eax
80103f0e:	e8 60 ff ff ff       	call   80103e73 <fetchint>
}
80103f13:	c9                   	leave  
80103f14:	c3                   	ret    

80103f15 <argptr>:
>>>>>>> d669a6c (ulib and makefile)
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
<<<<<<< HEAD
80103f69:	55                   	push   %ebp
80103f6a:	89 e5                	mov    %esp,%ebp
80103f6c:	56                   	push   %esi
80103f6d:	53                   	push   %ebx
80103f6e:	83 ec 10             	sub    $0x10,%esp
80103f71:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80103f74:	e8 3c f2 ff ff       	call   801031b5 <myproc>
80103f79:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80103f7b:	83 ec 08             	sub    $0x8,%esp
80103f7e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103f81:	50                   	push   %eax
80103f82:	ff 75 08             	push   0x8(%ebp)
80103f85:	e8 b7 ff ff ff       	call   80103f41 <argint>
80103f8a:	83 c4 10             	add    $0x10,%esp
80103f8d:	85 c0                	test   %eax,%eax
80103f8f:	78 24                	js     80103fb5 <argptr+0x4c>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80103f91:	85 db                	test   %ebx,%ebx
80103f93:	78 27                	js     80103fbc <argptr+0x53>
80103f95:	8b 16                	mov    (%esi),%edx
80103f97:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103f9a:	39 c2                	cmp    %eax,%edx
80103f9c:	76 25                	jbe    80103fc3 <argptr+0x5a>
80103f9e:	01 c3                	add    %eax,%ebx
80103fa0:	39 da                	cmp    %ebx,%edx
80103fa2:	72 26                	jb     80103fca <argptr+0x61>
    return -1;
  *pp = (char*)i;
80103fa4:	8b 55 0c             	mov    0xc(%ebp),%edx
80103fa7:	89 02                	mov    %eax,(%edx)
  return 0;
80103fa9:	b8 00 00 00 00       	mov    $0x0,%eax
}
80103fae:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103fb1:	5b                   	pop    %ebx
80103fb2:	5e                   	pop    %esi
80103fb3:	5d                   	pop    %ebp
80103fb4:	c3                   	ret    
    return -1;
80103fb5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fba:	eb f2                	jmp    80103fae <argptr+0x45>
    return -1;
80103fbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fc1:	eb eb                	jmp    80103fae <argptr+0x45>
80103fc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fc8:	eb e4                	jmp    80103fae <argptr+0x45>
80103fca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fcf:	eb dd                	jmp    80103fae <argptr+0x45>

80103fd1 <argstr>:
=======
80103f15:	55                   	push   %ebp
80103f16:	89 e5                	mov    %esp,%ebp
80103f18:	56                   	push   %esi
80103f19:	53                   	push   %ebx
80103f1a:	83 ec 10             	sub    $0x10,%esp
80103f1d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80103f20:	e8 90 f2 ff ff       	call   801031b5 <myproc>
80103f25:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80103f27:	83 ec 08             	sub    $0x8,%esp
80103f2a:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103f2d:	50                   	push   %eax
80103f2e:	ff 75 08             	push   0x8(%ebp)
80103f31:	e8 b7 ff ff ff       	call   80103eed <argint>
80103f36:	83 c4 10             	add    $0x10,%esp
80103f39:	85 c0                	test   %eax,%eax
80103f3b:	78 24                	js     80103f61 <argptr+0x4c>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80103f3d:	85 db                	test   %ebx,%ebx
80103f3f:	78 27                	js     80103f68 <argptr+0x53>
80103f41:	8b 16                	mov    (%esi),%edx
80103f43:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103f46:	39 c2                	cmp    %eax,%edx
80103f48:	76 25                	jbe    80103f6f <argptr+0x5a>
80103f4a:	01 c3                	add    %eax,%ebx
80103f4c:	39 da                	cmp    %ebx,%edx
80103f4e:	72 26                	jb     80103f76 <argptr+0x61>
    return -1;
  *pp = (char*)i;
80103f50:	8b 55 0c             	mov    0xc(%ebp),%edx
80103f53:	89 02                	mov    %eax,(%edx)
  return 0;
80103f55:	b8 00 00 00 00       	mov    $0x0,%eax
}
80103f5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f5d:	5b                   	pop    %ebx
80103f5e:	5e                   	pop    %esi
80103f5f:	5d                   	pop    %ebp
80103f60:	c3                   	ret    
    return -1;
80103f61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f66:	eb f2                	jmp    80103f5a <argptr+0x45>
    return -1;
80103f68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f6d:	eb eb                	jmp    80103f5a <argptr+0x45>
80103f6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f74:	eb e4                	jmp    80103f5a <argptr+0x45>
80103f76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f7b:	eb dd                	jmp    80103f5a <argptr+0x45>

80103f7d <argstr>:
>>>>>>> d669a6c (ulib and makefile)
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
<<<<<<< HEAD
80103fd1:	55                   	push   %ebp
80103fd2:	89 e5                	mov    %esp,%ebp
80103fd4:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80103fd7:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103fda:	50                   	push   %eax
80103fdb:	ff 75 08             	push   0x8(%ebp)
80103fde:	e8 5e ff ff ff       	call   80103f41 <argint>
80103fe3:	83 c4 10             	add    $0x10,%esp
80103fe6:	85 c0                	test   %eax,%eax
80103fe8:	78 13                	js     80103ffd <argstr+0x2c>
    return -1;
  return fetchstr(addr, pp);
80103fea:	83 ec 08             	sub    $0x8,%esp
80103fed:	ff 75 0c             	push   0xc(%ebp)
80103ff0:	ff 75 f4             	push   -0xc(%ebp)
80103ff3:	e8 0a ff ff ff       	call   80103f02 <fetchstr>
80103ff8:	83 c4 10             	add    $0x10,%esp
}
80103ffb:	c9                   	leave  
80103ffc:	c3                   	ret    
    return -1;
80103ffd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104002:	eb f7                	jmp    80103ffb <argstr+0x2a>

80104004 <syscall>:
=======
80103f7d:	55                   	push   %ebp
80103f7e:	89 e5                	mov    %esp,%ebp
80103f80:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80103f83:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103f86:	50                   	push   %eax
80103f87:	ff 75 08             	push   0x8(%ebp)
80103f8a:	e8 5e ff ff ff       	call   80103eed <argint>
80103f8f:	83 c4 10             	add    $0x10,%esp
80103f92:	85 c0                	test   %eax,%eax
80103f94:	78 13                	js     80103fa9 <argstr+0x2c>
    return -1;
  return fetchstr(addr, pp);
80103f96:	83 ec 08             	sub    $0x8,%esp
80103f99:	ff 75 0c             	push   0xc(%ebp)
80103f9c:	ff 75 f4             	push   -0xc(%ebp)
80103f9f:	e8 0a ff ff ff       	call   80103eae <fetchstr>
80103fa4:	83 c4 10             	add    $0x10,%esp
}
80103fa7:	c9                   	leave  
80103fa8:	c3                   	ret    
    return -1;
80103fa9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fae:	eb f7                	jmp    80103fa7 <argstr+0x2a>

80103fb0 <syscall>:
>>>>>>> d669a6c (ulib and makefile)
[SYS_join]    sys_join,
};

void
syscall(void)
{
<<<<<<< HEAD
80104004:	55                   	push   %ebp
80104005:	89 e5                	mov    %esp,%ebp
80104007:	53                   	push   %ebx
80104008:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
8010400b:	e8 a5 f1 ff ff       	call   801031b5 <myproc>
80104010:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104012:	8b 40 18             	mov    0x18(%eax),%eax
80104015:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104018:	8d 50 ff             	lea    -0x1(%eax),%edx
8010401b:	83 fa 16             	cmp    $0x16,%edx
8010401e:	77 17                	ja     80104037 <syscall+0x33>
80104020:	8b 14 85 20 6d 10 80 	mov    -0x7fef92e0(,%eax,4),%edx
80104027:	85 d2                	test   %edx,%edx
80104029:	74 0c                	je     80104037 <syscall+0x33>
    curproc->tf->eax = syscalls[num]();
8010402b:	ff d2                	call   *%edx
8010402d:	89 c2                	mov    %eax,%edx
8010402f:	8b 43 18             	mov    0x18(%ebx),%eax
80104032:	89 50 1c             	mov    %edx,0x1c(%eax)
80104035:	eb 1f                	jmp    80104056 <syscall+0x52>
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
80104037:	8d 53 6c             	lea    0x6c(%ebx),%edx
    cprintf("%d %s: unknown sys call %d\n",
8010403a:	50                   	push   %eax
8010403b:	52                   	push   %edx
8010403c:	ff 73 10             	push   0x10(%ebx)
8010403f:	68 fd 6c 10 80       	push   $0x80106cfd
80104044:	e8 be c5 ff ff       	call   80100607 <cprintf>
    curproc->tf->eax = -1;
80104049:	8b 43 18             	mov    0x18(%ebx),%eax
8010404c:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104053:	83 c4 10             	add    $0x10,%esp
  }
}
80104056:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104059:	c9                   	leave  
8010405a:	c3                   	ret    

8010405b <argfd>:
=======
80103fb0:	55                   	push   %ebp
80103fb1:	89 e5                	mov    %esp,%ebp
80103fb3:	53                   	push   %ebx
80103fb4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80103fb7:	e8 f9 f1 ff ff       	call   801031b5 <myproc>
80103fbc:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80103fbe:	8b 40 18             	mov    0x18(%eax),%eax
80103fc1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80103fc4:	8d 50 ff             	lea    -0x1(%eax),%edx
80103fc7:	83 fa 16             	cmp    $0x16,%edx
80103fca:	77 17                	ja     80103fe3 <syscall+0x33>
80103fcc:	8b 14 85 e0 6c 10 80 	mov    -0x7fef9320(,%eax,4),%edx
80103fd3:	85 d2                	test   %edx,%edx
80103fd5:	74 0c                	je     80103fe3 <syscall+0x33>
    curproc->tf->eax = syscalls[num]();
80103fd7:	ff d2                	call   *%edx
80103fd9:	89 c2                	mov    %eax,%edx
80103fdb:	8b 43 18             	mov    0x18(%ebx),%eax
80103fde:	89 50 1c             	mov    %edx,0x1c(%eax)
80103fe1:	eb 1f                	jmp    80104002 <syscall+0x52>
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
80103fe3:	8d 53 6c             	lea    0x6c(%ebx),%edx
    cprintf("%d %s: unknown sys call %d\n",
80103fe6:	50                   	push   %eax
80103fe7:	52                   	push   %edx
80103fe8:	ff 73 10             	push   0x10(%ebx)
80103feb:	68 bd 6c 10 80       	push   $0x80106cbd
80103ff0:	e8 12 c6 ff ff       	call   80100607 <cprintf>
    curproc->tf->eax = -1;
80103ff5:	8b 43 18             	mov    0x18(%ebx),%eax
80103ff8:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80103fff:	83 c4 10             	add    $0x10,%esp
  }
}
80104002:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104005:	c9                   	leave  
80104006:	c3                   	ret    

80104007 <argfd>:
>>>>>>> d669a6c (ulib and makefile)

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
<<<<<<< HEAD
8010405b:	55                   	push   %ebp
8010405c:	89 e5                	mov    %esp,%ebp
8010405e:	56                   	push   %esi
8010405f:	53                   	push   %ebx
80104060:	83 ec 18             	sub    $0x18,%esp
80104063:	89 d6                	mov    %edx,%esi
80104065:	89 cb                	mov    %ecx,%ebx
=======
80104007:	55                   	push   %ebp
80104008:	89 e5                	mov    %esp,%ebp
8010400a:	56                   	push   %esi
8010400b:	53                   	push   %ebx
8010400c:	83 ec 18             	sub    $0x18,%esp
8010400f:	89 d6                	mov    %edx,%esi
80104011:	89 cb                	mov    %ecx,%ebx
>>>>>>> d669a6c (ulib and makefile)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
<<<<<<< HEAD
80104067:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010406a:	52                   	push   %edx
8010406b:	50                   	push   %eax
8010406c:	e8 d0 fe ff ff       	call   80103f41 <argint>
80104071:	83 c4 10             	add    $0x10,%esp
80104074:	85 c0                	test   %eax,%eax
80104076:	78 35                	js     801040ad <argfd+0x52>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104078:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010407c:	77 28                	ja     801040a6 <argfd+0x4b>
8010407e:	e8 32 f1 ff ff       	call   801031b5 <myproc>
80104083:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104086:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
8010408a:	85 c0                	test   %eax,%eax
8010408c:	74 18                	je     801040a6 <argfd+0x4b>
    return -1;
  if(pfd)
8010408e:	85 f6                	test   %esi,%esi
80104090:	74 02                	je     80104094 <argfd+0x39>
    *pfd = fd;
80104092:	89 16                	mov    %edx,(%esi)
  if(pf)
80104094:	85 db                	test   %ebx,%ebx
80104096:	74 1c                	je     801040b4 <argfd+0x59>
    *pf = f;
80104098:	89 03                	mov    %eax,(%ebx)
  return 0;
8010409a:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010409f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040a2:	5b                   	pop    %ebx
801040a3:	5e                   	pop    %esi
801040a4:	5d                   	pop    %ebp
801040a5:	c3                   	ret    
    return -1;
801040a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040ab:	eb f2                	jmp    8010409f <argfd+0x44>
    return -1;
801040ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040b2:	eb eb                	jmp    8010409f <argfd+0x44>
  return 0;
801040b4:	b8 00 00 00 00       	mov    $0x0,%eax
801040b9:	eb e4                	jmp    8010409f <argfd+0x44>

801040bb <fdalloc>:
=======
80104013:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104016:	52                   	push   %edx
80104017:	50                   	push   %eax
80104018:	e8 d0 fe ff ff       	call   80103eed <argint>
8010401d:	83 c4 10             	add    $0x10,%esp
80104020:	85 c0                	test   %eax,%eax
80104022:	78 35                	js     80104059 <argfd+0x52>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104024:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104028:	77 28                	ja     80104052 <argfd+0x4b>
8010402a:	e8 86 f1 ff ff       	call   801031b5 <myproc>
8010402f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104032:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104036:	85 c0                	test   %eax,%eax
80104038:	74 18                	je     80104052 <argfd+0x4b>
    return -1;
  if(pfd)
8010403a:	85 f6                	test   %esi,%esi
8010403c:	74 02                	je     80104040 <argfd+0x39>
    *pfd = fd;
8010403e:	89 16                	mov    %edx,(%esi)
  if(pf)
80104040:	85 db                	test   %ebx,%ebx
80104042:	74 1c                	je     80104060 <argfd+0x59>
    *pf = f;
80104044:	89 03                	mov    %eax,(%ebx)
  return 0;
80104046:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010404b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010404e:	5b                   	pop    %ebx
8010404f:	5e                   	pop    %esi
80104050:	5d                   	pop    %ebp
80104051:	c3                   	ret    
    return -1;
80104052:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104057:	eb f2                	jmp    8010404b <argfd+0x44>
    return -1;
80104059:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010405e:	eb eb                	jmp    8010404b <argfd+0x44>
  return 0;
80104060:	b8 00 00 00 00       	mov    $0x0,%eax
80104065:	eb e4                	jmp    8010404b <argfd+0x44>

80104067 <fdalloc>:
>>>>>>> d669a6c (ulib and makefile)

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
<<<<<<< HEAD
801040bb:	55                   	push   %ebp
801040bc:	89 e5                	mov    %esp,%ebp
801040be:	53                   	push   %ebx
801040bf:	83 ec 04             	sub    $0x4,%esp
801040c2:	89 c3                	mov    %eax,%ebx
  int fd;
  struct proc *curproc = myproc();
801040c4:	e8 ec f0 ff ff       	call   801031b5 <myproc>
801040c9:	89 c2                	mov    %eax,%edx

  for(fd = 0; fd < NOFILE; fd++){
801040cb:	b8 00 00 00 00       	mov    $0x0,%eax
801040d0:	83 f8 0f             	cmp    $0xf,%eax
801040d3:	7f 12                	jg     801040e7 <fdalloc+0x2c>
    if(curproc->ofile[fd] == 0){
801040d5:	83 7c 82 28 00       	cmpl   $0x0,0x28(%edx,%eax,4)
801040da:	74 05                	je     801040e1 <fdalloc+0x26>
  for(fd = 0; fd < NOFILE; fd++){
801040dc:	83 c0 01             	add    $0x1,%eax
801040df:	eb ef                	jmp    801040d0 <fdalloc+0x15>
      curproc->ofile[fd] = f;
801040e1:	89 5c 82 28          	mov    %ebx,0x28(%edx,%eax,4)
      return fd;
801040e5:	eb 05                	jmp    801040ec <fdalloc+0x31>
    }
  }
  return -1;
801040e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801040ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040ef:	c9                   	leave  
801040f0:	c3                   	ret    

801040f1 <isdirempty>:
=======
80104067:	55                   	push   %ebp
80104068:	89 e5                	mov    %esp,%ebp
8010406a:	53                   	push   %ebx
8010406b:	83 ec 04             	sub    $0x4,%esp
8010406e:	89 c3                	mov    %eax,%ebx
  int fd;
  struct proc *curproc = myproc();
80104070:	e8 40 f1 ff ff       	call   801031b5 <myproc>
80104075:	89 c2                	mov    %eax,%edx

  for(fd = 0; fd < NOFILE; fd++){
80104077:	b8 00 00 00 00       	mov    $0x0,%eax
8010407c:	83 f8 0f             	cmp    $0xf,%eax
8010407f:	7f 12                	jg     80104093 <fdalloc+0x2c>
    if(curproc->ofile[fd] == 0){
80104081:	83 7c 82 28 00       	cmpl   $0x0,0x28(%edx,%eax,4)
80104086:	74 05                	je     8010408d <fdalloc+0x26>
  for(fd = 0; fd < NOFILE; fd++){
80104088:	83 c0 01             	add    $0x1,%eax
8010408b:	eb ef                	jmp    8010407c <fdalloc+0x15>
      curproc->ofile[fd] = f;
8010408d:	89 5c 82 28          	mov    %ebx,0x28(%edx,%eax,4)
      return fd;
80104091:	eb 05                	jmp    80104098 <fdalloc+0x31>
    }
  }
  return -1;
80104093:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104098:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010409b:	c9                   	leave  
8010409c:	c3                   	ret    

8010409d <isdirempty>:
>>>>>>> d669a6c (ulib and makefile)
}

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
<<<<<<< HEAD
801040f1:	55                   	push   %ebp
801040f2:	89 e5                	mov    %esp,%ebp
801040f4:	56                   	push   %esi
801040f5:	53                   	push   %ebx
801040f6:	83 ec 10             	sub    $0x10,%esp
801040f9:	89 c3                	mov    %eax,%ebx
=======
8010409d:	55                   	push   %ebp
8010409e:	89 e5                	mov    %esp,%ebp
801040a0:	56                   	push   %esi
801040a1:	53                   	push   %ebx
801040a2:	83 ec 10             	sub    $0x10,%esp
801040a5:	89 c3                	mov    %eax,%ebx
>>>>>>> d669a6c (ulib and makefile)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
<<<<<<< HEAD
801040fb:	b8 20 00 00 00       	mov    $0x20,%eax
80104100:	89 c6                	mov    %eax,%esi
80104102:	39 43 58             	cmp    %eax,0x58(%ebx)
80104105:	76 2e                	jbe    80104135 <isdirempty+0x44>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104107:	6a 10                	push   $0x10
80104109:	50                   	push   %eax
8010410a:	8d 45 e8             	lea    -0x18(%ebp),%eax
8010410d:	50                   	push   %eax
8010410e:	53                   	push   %ebx
8010410f:	e8 4d d6 ff ff       	call   80101761 <readi>
80104114:	83 c4 10             	add    $0x10,%esp
80104117:	83 f8 10             	cmp    $0x10,%eax
8010411a:	75 0c                	jne    80104128 <isdirempty+0x37>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010411c:	66 83 7d e8 00       	cmpw   $0x0,-0x18(%ebp)
80104121:	75 1e                	jne    80104141 <isdirempty+0x50>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104123:	8d 46 10             	lea    0x10(%esi),%eax
80104126:	eb d8                	jmp    80104100 <isdirempty+0xf>
      panic("isdirempty: readi");
80104128:	83 ec 0c             	sub    $0xc,%esp
8010412b:	68 80 6d 10 80       	push   $0x80106d80
80104130:	e8 13 c2 ff ff       	call   80100348 <panic>
      return 0;
  }
  return 1;
80104135:	b8 01 00 00 00       	mov    $0x1,%eax
}
8010413a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010413d:	5b                   	pop    %ebx
8010413e:	5e                   	pop    %esi
8010413f:	5d                   	pop    %ebp
80104140:	c3                   	ret    
      return 0;
80104141:	b8 00 00 00 00       	mov    $0x0,%eax
80104146:	eb f2                	jmp    8010413a <isdirempty+0x49>

80104148 <create>:
=======
801040a7:	b8 20 00 00 00       	mov    $0x20,%eax
801040ac:	89 c6                	mov    %eax,%esi
801040ae:	39 43 58             	cmp    %eax,0x58(%ebx)
801040b1:	76 2e                	jbe    801040e1 <isdirempty+0x44>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801040b3:	6a 10                	push   $0x10
801040b5:	50                   	push   %eax
801040b6:	8d 45 e8             	lea    -0x18(%ebp),%eax
801040b9:	50                   	push   %eax
801040ba:	53                   	push   %ebx
801040bb:	e8 a1 d6 ff ff       	call   80101761 <readi>
801040c0:	83 c4 10             	add    $0x10,%esp
801040c3:	83 f8 10             	cmp    $0x10,%eax
801040c6:	75 0c                	jne    801040d4 <isdirempty+0x37>
      panic("isdirempty: readi");
    if(de.inum != 0)
801040c8:	66 83 7d e8 00       	cmpw   $0x0,-0x18(%ebp)
801040cd:	75 1e                	jne    801040ed <isdirempty+0x50>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801040cf:	8d 46 10             	lea    0x10(%esi),%eax
801040d2:	eb d8                	jmp    801040ac <isdirempty+0xf>
      panic("isdirempty: readi");
801040d4:	83 ec 0c             	sub    $0xc,%esp
801040d7:	68 40 6d 10 80       	push   $0x80106d40
801040dc:	e8 67 c2 ff ff       	call   80100348 <panic>
      return 0;
  }
  return 1;
801040e1:	b8 01 00 00 00       	mov    $0x1,%eax
}
801040e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040e9:	5b                   	pop    %ebx
801040ea:	5e                   	pop    %esi
801040eb:	5d                   	pop    %ebp
801040ec:	c3                   	ret    
      return 0;
801040ed:	b8 00 00 00 00       	mov    $0x0,%eax
801040f2:	eb f2                	jmp    801040e6 <isdirempty+0x49>

801040f4 <create>:
>>>>>>> d669a6c (ulib and makefile)
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
<<<<<<< HEAD
80104148:	55                   	push   %ebp
80104149:	89 e5                	mov    %esp,%ebp
8010414b:	57                   	push   %edi
8010414c:	56                   	push   %esi
8010414d:	53                   	push   %ebx
8010414e:	83 ec 34             	sub    $0x34,%esp
80104151:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104154:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104157:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
801040f4:	55                   	push   %ebp
801040f5:	89 e5                	mov    %esp,%ebp
801040f7:	57                   	push   %edi
801040f8:	56                   	push   %esi
801040f9:	53                   	push   %ebx
801040fa:	83 ec 34             	sub    $0x34,%esp
801040fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104100:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104103:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> d669a6c (ulib and makefile)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
<<<<<<< HEAD
8010415a:	8d 55 da             	lea    -0x26(%ebp),%edx
8010415d:	52                   	push   %edx
8010415e:	50                   	push   %eax
8010415f:	e8 81 da ff ff       	call   80101be5 <nameiparent>
80104164:	89 c6                	mov    %eax,%esi
80104166:	83 c4 10             	add    $0x10,%esp
80104169:	85 c0                	test   %eax,%eax
8010416b:	0f 84 33 01 00 00    	je     801042a4 <create+0x15c>
    return 0;
  ilock(dp);
80104171:	83 ec 0c             	sub    $0xc,%esp
80104174:	50                   	push   %eax
80104175:	e8 f5 d3 ff ff       	call   8010156f <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
8010417a:	83 c4 0c             	add    $0xc,%esp
8010417d:	6a 00                	push   $0x0
8010417f:	8d 45 da             	lea    -0x26(%ebp),%eax
80104182:	50                   	push   %eax
80104183:	56                   	push   %esi
80104184:	e8 16 d8 ff ff       	call   8010199f <dirlookup>
80104189:	89 c3                	mov    %eax,%ebx
8010418b:	83 c4 10             	add    $0x10,%esp
8010418e:	85 c0                	test   %eax,%eax
80104190:	74 3d                	je     801041cf <create+0x87>
    iunlockput(dp);
80104192:	83 ec 0c             	sub    $0xc,%esp
80104195:	56                   	push   %esi
80104196:	e8 7b d5 ff ff       	call   80101716 <iunlockput>
    ilock(ip);
8010419b:	89 1c 24             	mov    %ebx,(%esp)
8010419e:	e8 cc d3 ff ff       	call   8010156f <ilock>
    if(type == T_FILE && ip->type == T_FILE)
801041a3:	83 c4 10             	add    $0x10,%esp
801041a6:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
801041ab:	75 07                	jne    801041b4 <create+0x6c>
801041ad:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
801041b2:	74 11                	je     801041c5 <create+0x7d>
      return ip;
    iunlockput(ip);
801041b4:	83 ec 0c             	sub    $0xc,%esp
801041b7:	53                   	push   %ebx
801041b8:	e8 59 d5 ff ff       	call   80101716 <iunlockput>
    return 0;
801041bd:	83 c4 10             	add    $0x10,%esp
801041c0:	bb 00 00 00 00       	mov    $0x0,%ebx
=======
80104106:	8d 55 da             	lea    -0x26(%ebp),%edx
80104109:	52                   	push   %edx
8010410a:	50                   	push   %eax
8010410b:	e8 d5 da ff ff       	call   80101be5 <nameiparent>
80104110:	89 c6                	mov    %eax,%esi
80104112:	83 c4 10             	add    $0x10,%esp
80104115:	85 c0                	test   %eax,%eax
80104117:	0f 84 33 01 00 00    	je     80104250 <create+0x15c>
    return 0;
  ilock(dp);
8010411d:	83 ec 0c             	sub    $0xc,%esp
80104120:	50                   	push   %eax
80104121:	e8 49 d4 ff ff       	call   8010156f <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104126:	83 c4 0c             	add    $0xc,%esp
80104129:	6a 00                	push   $0x0
8010412b:	8d 45 da             	lea    -0x26(%ebp),%eax
8010412e:	50                   	push   %eax
8010412f:	56                   	push   %esi
80104130:	e8 6a d8 ff ff       	call   8010199f <dirlookup>
80104135:	89 c3                	mov    %eax,%ebx
80104137:	83 c4 10             	add    $0x10,%esp
8010413a:	85 c0                	test   %eax,%eax
8010413c:	74 3d                	je     8010417b <create+0x87>
    iunlockput(dp);
8010413e:	83 ec 0c             	sub    $0xc,%esp
80104141:	56                   	push   %esi
80104142:	e8 cf d5 ff ff       	call   80101716 <iunlockput>
    ilock(ip);
80104147:	89 1c 24             	mov    %ebx,(%esp)
8010414a:	e8 20 d4 ff ff       	call   8010156f <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010414f:	83 c4 10             	add    $0x10,%esp
80104152:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104157:	75 07                	jne    80104160 <create+0x6c>
80104159:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010415e:	74 11                	je     80104171 <create+0x7d>
      return ip;
    iunlockput(ip);
80104160:	83 ec 0c             	sub    $0xc,%esp
80104163:	53                   	push   %ebx
80104164:	e8 ad d5 ff ff       	call   80101716 <iunlockput>
    return 0;
80104169:	83 c4 10             	add    $0x10,%esp
8010416c:	bb 00 00 00 00       	mov    $0x0,%ebx
>>>>>>> d669a6c (ulib and makefile)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
<<<<<<< HEAD
801041c5:	89 d8                	mov    %ebx,%eax
801041c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041ca:	5b                   	pop    %ebx
801041cb:	5e                   	pop    %esi
801041cc:	5f                   	pop    %edi
801041cd:	5d                   	pop    %ebp
801041ce:	c3                   	ret    
  if((ip = ialloc(dp->dev, type)) == 0)
801041cf:	83 ec 08             	sub    $0x8,%esp
801041d2:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
801041d6:	50                   	push   %eax
801041d7:	ff 36                	push   (%esi)
801041d9:	e8 8e d1 ff ff       	call   8010136c <ialloc>
801041de:	89 c3                	mov    %eax,%ebx
801041e0:	83 c4 10             	add    $0x10,%esp
801041e3:	85 c0                	test   %eax,%eax
801041e5:	74 52                	je     80104239 <create+0xf1>
  ilock(ip);
801041e7:	83 ec 0c             	sub    $0xc,%esp
801041ea:	50                   	push   %eax
801041eb:	e8 7f d3 ff ff       	call   8010156f <ilock>
  ip->major = major;
801041f0:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
801041f4:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
801041f8:	66 89 7b 54          	mov    %di,0x54(%ebx)
  ip->nlink = 1;
801041fc:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)
  iupdate(ip);
80104202:	89 1c 24             	mov    %ebx,(%esp)
80104205:	e8 04 d2 ff ff       	call   8010140e <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
8010420a:	83 c4 10             	add    $0x10,%esp
8010420d:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104212:	74 32                	je     80104246 <create+0xfe>
  if(dirlink(dp, name, ip->inum) < 0)
80104214:	83 ec 04             	sub    $0x4,%esp
80104217:	ff 73 04             	push   0x4(%ebx)
8010421a:	8d 45 da             	lea    -0x26(%ebp),%eax
8010421d:	50                   	push   %eax
8010421e:	56                   	push   %esi
8010421f:	e8 f8 d8 ff ff       	call   80101b1c <dirlink>
80104224:	83 c4 10             	add    $0x10,%esp
80104227:	85 c0                	test   %eax,%eax
80104229:	78 6c                	js     80104297 <create+0x14f>
  iunlockput(dp);
8010422b:	83 ec 0c             	sub    $0xc,%esp
8010422e:	56                   	push   %esi
8010422f:	e8 e2 d4 ff ff       	call   80101716 <iunlockput>
  return ip;
80104234:	83 c4 10             	add    $0x10,%esp
80104237:	eb 8c                	jmp    801041c5 <create+0x7d>
    panic("create: ialloc");
80104239:	83 ec 0c             	sub    $0xc,%esp
8010423c:	68 92 6d 10 80       	push   $0x80106d92
80104241:	e8 02 c1 ff ff       	call   80100348 <panic>
    dp->nlink++;  // for ".."
80104246:	0f b7 46 56          	movzwl 0x56(%esi),%eax
8010424a:	83 c0 01             	add    $0x1,%eax
8010424d:	66 89 46 56          	mov    %ax,0x56(%esi)
    iupdate(dp);
80104251:	83 ec 0c             	sub    $0xc,%esp
80104254:	56                   	push   %esi
80104255:	e8 b4 d1 ff ff       	call   8010140e <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010425a:	83 c4 0c             	add    $0xc,%esp
8010425d:	ff 73 04             	push   0x4(%ebx)
80104260:	68 a2 6d 10 80       	push   $0x80106da2
80104265:	53                   	push   %ebx
80104266:	e8 b1 d8 ff ff       	call   80101b1c <dirlink>
8010426b:	83 c4 10             	add    $0x10,%esp
8010426e:	85 c0                	test   %eax,%eax
80104270:	78 18                	js     8010428a <create+0x142>
80104272:	83 ec 04             	sub    $0x4,%esp
80104275:	ff 76 04             	push   0x4(%esi)
80104278:	68 a1 6d 10 80       	push   $0x80106da1
8010427d:	53                   	push   %ebx
8010427e:	e8 99 d8 ff ff       	call   80101b1c <dirlink>
80104283:	83 c4 10             	add    $0x10,%esp
80104286:	85 c0                	test   %eax,%eax
80104288:	79 8a                	jns    80104214 <create+0xcc>
      panic("create dots");
8010428a:	83 ec 0c             	sub    $0xc,%esp
8010428d:	68 a4 6d 10 80       	push   $0x80106da4
80104292:	e8 b1 c0 ff ff       	call   80100348 <panic>
    panic("create: dirlink");
80104297:	83 ec 0c             	sub    $0xc,%esp
8010429a:	68 b0 6d 10 80       	push   $0x80106db0
8010429f:	e8 a4 c0 ff ff       	call   80100348 <panic>
    return 0;
801042a4:	89 c3                	mov    %eax,%ebx
801042a6:	e9 1a ff ff ff       	jmp    801041c5 <create+0x7d>

801042ab <sys_dup>:
{
801042ab:	55                   	push   %ebp
801042ac:	89 e5                	mov    %esp,%ebp
801042ae:	53                   	push   %ebx
801042af:	83 ec 14             	sub    $0x14,%esp
  if(argfd(0, 0, &f) < 0)
801042b2:	8d 4d f4             	lea    -0xc(%ebp),%ecx
801042b5:	ba 00 00 00 00       	mov    $0x0,%edx
801042ba:	b8 00 00 00 00       	mov    $0x0,%eax
801042bf:	e8 97 fd ff ff       	call   8010405b <argfd>
801042c4:	85 c0                	test   %eax,%eax
801042c6:	78 23                	js     801042eb <sys_dup+0x40>
  if((fd=fdalloc(f)) < 0)
801042c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801042cb:	e8 eb fd ff ff       	call   801040bb <fdalloc>
801042d0:	89 c3                	mov    %eax,%ebx
801042d2:	85 c0                	test   %eax,%eax
801042d4:	78 1c                	js     801042f2 <sys_dup+0x47>
  filedup(f);
801042d6:	83 ec 0c             	sub    $0xc,%esp
801042d9:	ff 75 f4             	push   -0xc(%ebp)
801042dc:	e8 9d c9 ff ff       	call   80100c7e <filedup>
  return fd;
801042e1:	83 c4 10             	add    $0x10,%esp
}
801042e4:	89 d8                	mov    %ebx,%eax
801042e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042e9:	c9                   	leave  
801042ea:	c3                   	ret    
    return -1;
801042eb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801042f0:	eb f2                	jmp    801042e4 <sys_dup+0x39>
    return -1;
801042f2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801042f7:	eb eb                	jmp    801042e4 <sys_dup+0x39>

801042f9 <sys_read>:
{
801042f9:	55                   	push   %ebp
801042fa:	89 e5                	mov    %esp,%ebp
801042fc:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801042ff:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104302:	ba 00 00 00 00       	mov    $0x0,%edx
80104307:	b8 00 00 00 00       	mov    $0x0,%eax
8010430c:	e8 4a fd ff ff       	call   8010405b <argfd>
80104311:	85 c0                	test   %eax,%eax
80104313:	78 43                	js     80104358 <sys_read+0x5f>
80104315:	83 ec 08             	sub    $0x8,%esp
80104318:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010431b:	50                   	push   %eax
8010431c:	6a 02                	push   $0x2
8010431e:	e8 1e fc ff ff       	call   80103f41 <argint>
80104323:	83 c4 10             	add    $0x10,%esp
80104326:	85 c0                	test   %eax,%eax
80104328:	78 2e                	js     80104358 <sys_read+0x5f>
8010432a:	83 ec 04             	sub    $0x4,%esp
8010432d:	ff 75 f0             	push   -0x10(%ebp)
80104330:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104333:	50                   	push   %eax
80104334:	6a 01                	push   $0x1
80104336:	e8 2e fc ff ff       	call   80103f69 <argptr>
8010433b:	83 c4 10             	add    $0x10,%esp
8010433e:	85 c0                	test   %eax,%eax
80104340:	78 16                	js     80104358 <sys_read+0x5f>
  return fileread(f, p, n);
80104342:	83 ec 04             	sub    $0x4,%esp
80104345:	ff 75 f0             	push   -0x10(%ebp)
80104348:	ff 75 ec             	push   -0x14(%ebp)
8010434b:	ff 75 f4             	push   -0xc(%ebp)
8010434e:	e8 7d ca ff ff       	call   80100dd0 <fileread>
80104353:	83 c4 10             	add    $0x10,%esp
}
80104356:	c9                   	leave  
80104357:	c3                   	ret    
    return -1;
80104358:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010435d:	eb f7                	jmp    80104356 <sys_read+0x5d>

8010435f <sys_clone>:
{
8010435f:	55                   	push   %ebp
80104360:	89 e5                	mov    %esp,%ebp
80104362:	83 ec 08             	sub    $0x8,%esp
  return clone(0, 0, 0, 0);
80104365:	6a 00                	push   $0x0
80104367:	6a 00                	push   $0x0
80104369:	6a 00                	push   $0x0
8010436b:	6a 00                	push   $0x0
8010436d:	e8 b9 ef ff ff       	call   8010332b <clone>
}
80104372:	c9                   	leave  
80104373:	c3                   	ret    

80104374 <sys_join>:
{
80104374:	55                   	push   %ebp
80104375:	89 e5                	mov    %esp,%ebp
80104377:	83 ec 14             	sub    $0x14,%esp
  return join(0);
8010437a:	6a 00                	push   $0x0
8010437c:	e8 97 f0 ff ff       	call   80103418 <join>
}
80104381:	c9                   	leave  
80104382:	c3                   	ret    

80104383 <sys_write>:
{
80104383:	55                   	push   %ebp
80104384:	89 e5                	mov    %esp,%ebp
80104386:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104389:	8d 4d f4             	lea    -0xc(%ebp),%ecx
8010438c:	ba 00 00 00 00       	mov    $0x0,%edx
80104391:	b8 00 00 00 00       	mov    $0x0,%eax
80104396:	e8 c0 fc ff ff       	call   8010405b <argfd>
8010439b:	85 c0                	test   %eax,%eax
8010439d:	78 43                	js     801043e2 <sys_write+0x5f>
8010439f:	83 ec 08             	sub    $0x8,%esp
801043a2:	8d 45 f0             	lea    -0x10(%ebp),%eax
801043a5:	50                   	push   %eax
801043a6:	6a 02                	push   $0x2
801043a8:	e8 94 fb ff ff       	call   80103f41 <argint>
801043ad:	83 c4 10             	add    $0x10,%esp
801043b0:	85 c0                	test   %eax,%eax
801043b2:	78 2e                	js     801043e2 <sys_write+0x5f>
801043b4:	83 ec 04             	sub    $0x4,%esp
801043b7:	ff 75 f0             	push   -0x10(%ebp)
801043ba:	8d 45 ec             	lea    -0x14(%ebp),%eax
801043bd:	50                   	push   %eax
801043be:	6a 01                	push   $0x1
801043c0:	e8 a4 fb ff ff       	call   80103f69 <argptr>
801043c5:	83 c4 10             	add    $0x10,%esp
801043c8:	85 c0                	test   %eax,%eax
801043ca:	78 16                	js     801043e2 <sys_write+0x5f>
  return filewrite(f, p, n);
801043cc:	83 ec 04             	sub    $0x4,%esp
801043cf:	ff 75 f0             	push   -0x10(%ebp)
801043d2:	ff 75 ec             	push   -0x14(%ebp)
801043d5:	ff 75 f4             	push   -0xc(%ebp)
801043d8:	e8 78 ca ff ff       	call   80100e55 <filewrite>
801043dd:	83 c4 10             	add    $0x10,%esp
}
801043e0:	c9                   	leave  
801043e1:	c3                   	ret    
    return -1;
801043e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043e7:	eb f7                	jmp    801043e0 <sys_write+0x5d>

801043e9 <sys_close>:
{
801043e9:	55                   	push   %ebp
801043ea:	89 e5                	mov    %esp,%ebp
801043ec:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
801043ef:	8d 4d f0             	lea    -0x10(%ebp),%ecx
801043f2:	8d 55 f4             	lea    -0xc(%ebp),%edx
801043f5:	b8 00 00 00 00       	mov    $0x0,%eax
801043fa:	e8 5c fc ff ff       	call   8010405b <argfd>
801043ff:	85 c0                	test   %eax,%eax
80104401:	78 25                	js     80104428 <sys_close+0x3f>
  myproc()->ofile[fd] = 0;
80104403:	e8 ad ed ff ff       	call   801031b5 <myproc>
80104408:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010440b:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104412:	00 
  fileclose(f);
80104413:	83 ec 0c             	sub    $0xc,%esp
80104416:	ff 75 f0             	push   -0x10(%ebp)
80104419:	e8 a5 c8 ff ff       	call   80100cc3 <fileclose>
  return 0;
8010441e:	83 c4 10             	add    $0x10,%esp
80104421:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104426:	c9                   	leave  
80104427:	c3                   	ret    
    return -1;
80104428:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010442d:	eb f7                	jmp    80104426 <sys_close+0x3d>

8010442f <sys_fstat>:
{
8010442f:	55                   	push   %ebp
80104430:	89 e5                	mov    %esp,%ebp
80104432:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104435:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104438:	ba 00 00 00 00       	mov    $0x0,%edx
8010443d:	b8 00 00 00 00       	mov    $0x0,%eax
80104442:	e8 14 fc ff ff       	call   8010405b <argfd>
80104447:	85 c0                	test   %eax,%eax
80104449:	78 2a                	js     80104475 <sys_fstat+0x46>
8010444b:	83 ec 04             	sub    $0x4,%esp
8010444e:	6a 14                	push   $0x14
80104450:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104453:	50                   	push   %eax
80104454:	6a 01                	push   $0x1
80104456:	e8 0e fb ff ff       	call   80103f69 <argptr>
8010445b:	83 c4 10             	add    $0x10,%esp
8010445e:	85 c0                	test   %eax,%eax
80104460:	78 13                	js     80104475 <sys_fstat+0x46>
  return filestat(f, st);
80104462:	83 ec 08             	sub    $0x8,%esp
80104465:	ff 75 f0             	push   -0x10(%ebp)
80104468:	ff 75 f4             	push   -0xc(%ebp)
8010446b:	e8 19 c9 ff ff       	call   80100d89 <filestat>
80104470:	83 c4 10             	add    $0x10,%esp
}
80104473:	c9                   	leave  
80104474:	c3                   	ret    
    return -1;
80104475:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010447a:	eb f7                	jmp    80104473 <sys_fstat+0x44>

8010447c <sys_link>:
{
8010447c:	55                   	push   %ebp
8010447d:	89 e5                	mov    %esp,%ebp
8010447f:	56                   	push   %esi
80104480:	53                   	push   %ebx
80104481:	83 ec 28             	sub    $0x28,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104484:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104487:	50                   	push   %eax
80104488:	6a 00                	push   $0x0
8010448a:	e8 42 fb ff ff       	call   80103fd1 <argstr>
8010448f:	83 c4 10             	add    $0x10,%esp
80104492:	85 c0                	test   %eax,%eax
80104494:	0f 88 d3 00 00 00    	js     8010456d <sys_link+0xf1>
8010449a:	83 ec 08             	sub    $0x8,%esp
8010449d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801044a0:	50                   	push   %eax
801044a1:	6a 01                	push   $0x1
801044a3:	e8 29 fb ff ff       	call   80103fd1 <argstr>
801044a8:	83 c4 10             	add    $0x10,%esp
801044ab:	85 c0                	test   %eax,%eax
801044ad:	0f 88 ba 00 00 00    	js     8010456d <sys_link+0xf1>
  begin_op();
801044b3:	e8 c6 e2 ff ff       	call   8010277e <begin_op>
  if((ip = namei(old)) == 0){
801044b8:	83 ec 0c             	sub    $0xc,%esp
801044bb:	ff 75 e0             	push   -0x20(%ebp)
801044be:	e8 0a d7 ff ff       	call   80101bcd <namei>
801044c3:	89 c3                	mov    %eax,%ebx
801044c5:	83 c4 10             	add    $0x10,%esp
801044c8:	85 c0                	test   %eax,%eax
801044ca:	0f 84 a4 00 00 00    	je     80104574 <sys_link+0xf8>
  ilock(ip);
801044d0:	83 ec 0c             	sub    $0xc,%esp
801044d3:	50                   	push   %eax
801044d4:	e8 96 d0 ff ff       	call   8010156f <ilock>
  if(ip->type == T_DIR){
801044d9:	83 c4 10             	add    $0x10,%esp
801044dc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801044e1:	0f 84 99 00 00 00    	je     80104580 <sys_link+0x104>
  ip->nlink++;
801044e7:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
801044eb:	83 c0 01             	add    $0x1,%eax
801044ee:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
801044f2:	83 ec 0c             	sub    $0xc,%esp
801044f5:	53                   	push   %ebx
801044f6:	e8 13 cf ff ff       	call   8010140e <iupdate>
  iunlock(ip);
801044fb:	89 1c 24             	mov    %ebx,(%esp)
801044fe:	e8 2e d1 ff ff       	call   80101631 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104503:	83 c4 08             	add    $0x8,%esp
80104506:	8d 45 ea             	lea    -0x16(%ebp),%eax
80104509:	50                   	push   %eax
8010450a:	ff 75 e4             	push   -0x1c(%ebp)
8010450d:	e8 d3 d6 ff ff       	call   80101be5 <nameiparent>
80104512:	89 c6                	mov    %eax,%esi
80104514:	83 c4 10             	add    $0x10,%esp
80104517:	85 c0                	test   %eax,%eax
80104519:	0f 84 85 00 00 00    	je     801045a4 <sys_link+0x128>
  ilock(dp);
8010451f:	83 ec 0c             	sub    $0xc,%esp
80104522:	50                   	push   %eax
80104523:	e8 47 d0 ff ff       	call   8010156f <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104528:	83 c4 10             	add    $0x10,%esp
8010452b:	8b 03                	mov    (%ebx),%eax
8010452d:	39 06                	cmp    %eax,(%esi)
8010452f:	75 67                	jne    80104598 <sys_link+0x11c>
80104531:	83 ec 04             	sub    $0x4,%esp
80104534:	ff 73 04             	push   0x4(%ebx)
80104537:	8d 45 ea             	lea    -0x16(%ebp),%eax
8010453a:	50                   	push   %eax
8010453b:	56                   	push   %esi
8010453c:	e8 db d5 ff ff       	call   80101b1c <dirlink>
80104541:	83 c4 10             	add    $0x10,%esp
80104544:	85 c0                	test   %eax,%eax
80104546:	78 50                	js     80104598 <sys_link+0x11c>
  iunlockput(dp);
80104548:	83 ec 0c             	sub    $0xc,%esp
8010454b:	56                   	push   %esi
8010454c:	e8 c5 d1 ff ff       	call   80101716 <iunlockput>
  iput(ip);
80104551:	89 1c 24             	mov    %ebx,(%esp)
80104554:	e8 1d d1 ff ff       	call   80101676 <iput>
  end_op();
80104559:	e8 9a e2 ff ff       	call   801027f8 <end_op>
  return 0;
8010455e:	83 c4 10             	add    $0x10,%esp
80104561:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104566:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104569:	5b                   	pop    %ebx
8010456a:	5e                   	pop    %esi
8010456b:	5d                   	pop    %ebp
8010456c:	c3                   	ret    
    return -1;
8010456d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104572:	eb f2                	jmp    80104566 <sys_link+0xea>
    end_op();
80104574:	e8 7f e2 ff ff       	call   801027f8 <end_op>
    return -1;
80104579:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010457e:	eb e6                	jmp    80104566 <sys_link+0xea>
    iunlockput(ip);
80104580:	83 ec 0c             	sub    $0xc,%esp
80104583:	53                   	push   %ebx
80104584:	e8 8d d1 ff ff       	call   80101716 <iunlockput>
    end_op();
80104589:	e8 6a e2 ff ff       	call   801027f8 <end_op>
    return -1;
8010458e:	83 c4 10             	add    $0x10,%esp
80104591:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104596:	eb ce                	jmp    80104566 <sys_link+0xea>
    iunlockput(dp);
80104598:	83 ec 0c             	sub    $0xc,%esp
8010459b:	56                   	push   %esi
8010459c:	e8 75 d1 ff ff       	call   80101716 <iunlockput>
    goto bad;
801045a1:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
801045a4:	83 ec 0c             	sub    $0xc,%esp
801045a7:	53                   	push   %ebx
801045a8:	e8 c2 cf ff ff       	call   8010156f <ilock>
  ip->nlink--;
801045ad:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
801045b1:	83 e8 01             	sub    $0x1,%eax
801045b4:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
801045b8:	89 1c 24             	mov    %ebx,(%esp)
801045bb:	e8 4e ce ff ff       	call   8010140e <iupdate>
  iunlockput(ip);
801045c0:	89 1c 24             	mov    %ebx,(%esp)
801045c3:	e8 4e d1 ff ff       	call   80101716 <iunlockput>
  end_op();
801045c8:	e8 2b e2 ff ff       	call   801027f8 <end_op>
  return -1;
801045cd:	83 c4 10             	add    $0x10,%esp
801045d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801045d5:	eb 8f                	jmp    80104566 <sys_link+0xea>

801045d7 <sys_unlink>:
{
801045d7:	55                   	push   %ebp
801045d8:	89 e5                	mov    %esp,%ebp
801045da:	57                   	push   %edi
801045db:	56                   	push   %esi
801045dc:	53                   	push   %ebx
801045dd:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
801045e0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801045e3:	50                   	push   %eax
801045e4:	6a 00                	push   $0x0
801045e6:	e8 e6 f9 ff ff       	call   80103fd1 <argstr>
801045eb:	83 c4 10             	add    $0x10,%esp
801045ee:	85 c0                	test   %eax,%eax
801045f0:	0f 88 83 01 00 00    	js     80104779 <sys_unlink+0x1a2>
  begin_op();
801045f6:	e8 83 e1 ff ff       	call   8010277e <begin_op>
  if((dp = nameiparent(path, name)) == 0){
801045fb:	83 ec 08             	sub    $0x8,%esp
801045fe:	8d 45 ca             	lea    -0x36(%ebp),%eax
80104601:	50                   	push   %eax
80104602:	ff 75 c4             	push   -0x3c(%ebp)
80104605:	e8 db d5 ff ff       	call   80101be5 <nameiparent>
8010460a:	89 c6                	mov    %eax,%esi
8010460c:	83 c4 10             	add    $0x10,%esp
8010460f:	85 c0                	test   %eax,%eax
80104611:	0f 84 ed 00 00 00    	je     80104704 <sys_unlink+0x12d>
  ilock(dp);
80104617:	83 ec 0c             	sub    $0xc,%esp
8010461a:	50                   	push   %eax
8010461b:	e8 4f cf ff ff       	call   8010156f <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104620:	83 c4 08             	add    $0x8,%esp
80104623:	68 a2 6d 10 80       	push   $0x80106da2
80104628:	8d 45 ca             	lea    -0x36(%ebp),%eax
8010462b:	50                   	push   %eax
8010462c:	e8 59 d3 ff ff       	call   8010198a <namecmp>
80104631:	83 c4 10             	add    $0x10,%esp
80104634:	85 c0                	test   %eax,%eax
80104636:	0f 84 fc 00 00 00    	je     80104738 <sys_unlink+0x161>
8010463c:	83 ec 08             	sub    $0x8,%esp
8010463f:	68 a1 6d 10 80       	push   $0x80106da1
80104644:	8d 45 ca             	lea    -0x36(%ebp),%eax
80104647:	50                   	push   %eax
80104648:	e8 3d d3 ff ff       	call   8010198a <namecmp>
8010464d:	83 c4 10             	add    $0x10,%esp
80104650:	85 c0                	test   %eax,%eax
80104652:	0f 84 e0 00 00 00    	je     80104738 <sys_unlink+0x161>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104658:	83 ec 04             	sub    $0x4,%esp
8010465b:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010465e:	50                   	push   %eax
8010465f:	8d 45 ca             	lea    -0x36(%ebp),%eax
80104662:	50                   	push   %eax
80104663:	56                   	push   %esi
80104664:	e8 36 d3 ff ff       	call   8010199f <dirlookup>
80104669:	89 c3                	mov    %eax,%ebx
8010466b:	83 c4 10             	add    $0x10,%esp
8010466e:	85 c0                	test   %eax,%eax
80104670:	0f 84 c2 00 00 00    	je     80104738 <sys_unlink+0x161>
  ilock(ip);
80104676:	83 ec 0c             	sub    $0xc,%esp
80104679:	50                   	push   %eax
8010467a:	e8 f0 ce ff ff       	call   8010156f <ilock>
  if(ip->nlink < 1)
8010467f:	83 c4 10             	add    $0x10,%esp
80104682:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104687:	0f 8e 83 00 00 00    	jle    80104710 <sys_unlink+0x139>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010468d:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104692:	0f 84 85 00 00 00    	je     8010471d <sys_unlink+0x146>
  memset(&de, 0, sizeof(de));
80104698:	83 ec 04             	sub    $0x4,%esp
8010469b:	6a 10                	push   $0x10
8010469d:	6a 00                	push   $0x0
8010469f:	8d 7d d8             	lea    -0x28(%ebp),%edi
801046a2:	57                   	push   %edi
801046a3:	e8 49 f6 ff ff       	call   80103cf1 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801046a8:	6a 10                	push   $0x10
801046aa:	ff 75 c0             	push   -0x40(%ebp)
801046ad:	57                   	push   %edi
801046ae:	56                   	push   %esi
801046af:	e8 aa d1 ff ff       	call   8010185e <writei>
801046b4:	83 c4 20             	add    $0x20,%esp
801046b7:	83 f8 10             	cmp    $0x10,%eax
801046ba:	0f 85 90 00 00 00    	jne    80104750 <sys_unlink+0x179>
  if(ip->type == T_DIR){
801046c0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801046c5:	0f 84 92 00 00 00    	je     8010475d <sys_unlink+0x186>
  iunlockput(dp);
801046cb:	83 ec 0c             	sub    $0xc,%esp
801046ce:	56                   	push   %esi
801046cf:	e8 42 d0 ff ff       	call   80101716 <iunlockput>
  ip->nlink--;
801046d4:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
801046d8:	83 e8 01             	sub    $0x1,%eax
801046db:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
801046df:	89 1c 24             	mov    %ebx,(%esp)
801046e2:	e8 27 cd ff ff       	call   8010140e <iupdate>
  iunlockput(ip);
801046e7:	89 1c 24             	mov    %ebx,(%esp)
801046ea:	e8 27 d0 ff ff       	call   80101716 <iunlockput>
  end_op();
801046ef:	e8 04 e1 ff ff       	call   801027f8 <end_op>
  return 0;
801046f4:	83 c4 10             	add    $0x10,%esp
801046f7:	b8 00 00 00 00       	mov    $0x0,%eax
}
801046fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046ff:	5b                   	pop    %ebx
80104700:	5e                   	pop    %esi
80104701:	5f                   	pop    %edi
80104702:	5d                   	pop    %ebp
80104703:	c3                   	ret    
    end_op();
80104704:	e8 ef e0 ff ff       	call   801027f8 <end_op>
    return -1;
80104709:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010470e:	eb ec                	jmp    801046fc <sys_unlink+0x125>
    panic("unlink: nlink < 1");
80104710:	83 ec 0c             	sub    $0xc,%esp
80104713:	68 c0 6d 10 80       	push   $0x80106dc0
80104718:	e8 2b bc ff ff       	call   80100348 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010471d:	89 d8                	mov    %ebx,%eax
8010471f:	e8 cd f9 ff ff       	call   801040f1 <isdirempty>
80104724:	85 c0                	test   %eax,%eax
80104726:	0f 85 6c ff ff ff    	jne    80104698 <sys_unlink+0xc1>
    iunlockput(ip);
8010472c:	83 ec 0c             	sub    $0xc,%esp
8010472f:	53                   	push   %ebx
80104730:	e8 e1 cf ff ff       	call   80101716 <iunlockput>
    goto bad;
80104735:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
80104738:	83 ec 0c             	sub    $0xc,%esp
8010473b:	56                   	push   %esi
8010473c:	e8 d5 cf ff ff       	call   80101716 <iunlockput>
  end_op();
80104741:	e8 b2 e0 ff ff       	call   801027f8 <end_op>
  return -1;
80104746:	83 c4 10             	add    $0x10,%esp
80104749:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010474e:	eb ac                	jmp    801046fc <sys_unlink+0x125>
    panic("unlink: writei");
80104750:	83 ec 0c             	sub    $0xc,%esp
80104753:	68 d2 6d 10 80       	push   $0x80106dd2
80104758:	e8 eb bb ff ff       	call   80100348 <panic>
    dp->nlink--;
8010475d:	0f b7 46 56          	movzwl 0x56(%esi),%eax
80104761:	83 e8 01             	sub    $0x1,%eax
80104764:	66 89 46 56          	mov    %ax,0x56(%esi)
    iupdate(dp);
80104768:	83 ec 0c             	sub    $0xc,%esp
8010476b:	56                   	push   %esi
8010476c:	e8 9d cc ff ff       	call   8010140e <iupdate>
80104771:	83 c4 10             	add    $0x10,%esp
80104774:	e9 52 ff ff ff       	jmp    801046cb <sys_unlink+0xf4>
    return -1;
80104779:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010477e:	e9 79 ff ff ff       	jmp    801046fc <sys_unlink+0x125>

80104783 <sys_open>:
=======
80104171:	89 d8                	mov    %ebx,%eax
80104173:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104176:	5b                   	pop    %ebx
80104177:	5e                   	pop    %esi
80104178:	5f                   	pop    %edi
80104179:	5d                   	pop    %ebp
8010417a:	c3                   	ret    
  if((ip = ialloc(dp->dev, type)) == 0)
8010417b:	83 ec 08             	sub    $0x8,%esp
8010417e:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104182:	50                   	push   %eax
80104183:	ff 36                	push   (%esi)
80104185:	e8 e2 d1 ff ff       	call   8010136c <ialloc>
8010418a:	89 c3                	mov    %eax,%ebx
8010418c:	83 c4 10             	add    $0x10,%esp
8010418f:	85 c0                	test   %eax,%eax
80104191:	74 52                	je     801041e5 <create+0xf1>
  ilock(ip);
80104193:	83 ec 0c             	sub    $0xc,%esp
80104196:	50                   	push   %eax
80104197:	e8 d3 d3 ff ff       	call   8010156f <ilock>
  ip->major = major;
8010419c:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
801041a0:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
801041a4:	66 89 7b 54          	mov    %di,0x54(%ebx)
  ip->nlink = 1;
801041a8:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)
  iupdate(ip);
801041ae:	89 1c 24             	mov    %ebx,(%esp)
801041b1:	e8 58 d2 ff ff       	call   8010140e <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
801041b6:	83 c4 10             	add    $0x10,%esp
801041b9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
801041be:	74 32                	je     801041f2 <create+0xfe>
  if(dirlink(dp, name, ip->inum) < 0)
801041c0:	83 ec 04             	sub    $0x4,%esp
801041c3:	ff 73 04             	push   0x4(%ebx)
801041c6:	8d 45 da             	lea    -0x26(%ebp),%eax
801041c9:	50                   	push   %eax
801041ca:	56                   	push   %esi
801041cb:	e8 4c d9 ff ff       	call   80101b1c <dirlink>
801041d0:	83 c4 10             	add    $0x10,%esp
801041d3:	85 c0                	test   %eax,%eax
801041d5:	78 6c                	js     80104243 <create+0x14f>
  iunlockput(dp);
801041d7:	83 ec 0c             	sub    $0xc,%esp
801041da:	56                   	push   %esi
801041db:	e8 36 d5 ff ff       	call   80101716 <iunlockput>
  return ip;
801041e0:	83 c4 10             	add    $0x10,%esp
801041e3:	eb 8c                	jmp    80104171 <create+0x7d>
    panic("create: ialloc");
801041e5:	83 ec 0c             	sub    $0xc,%esp
801041e8:	68 52 6d 10 80       	push   $0x80106d52
801041ed:	e8 56 c1 ff ff       	call   80100348 <panic>
    dp->nlink++;  // for ".."
801041f2:	0f b7 46 56          	movzwl 0x56(%esi),%eax
801041f6:	83 c0 01             	add    $0x1,%eax
801041f9:	66 89 46 56          	mov    %ax,0x56(%esi)
    iupdate(dp);
801041fd:	83 ec 0c             	sub    $0xc,%esp
80104200:	56                   	push   %esi
80104201:	e8 08 d2 ff ff       	call   8010140e <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104206:	83 c4 0c             	add    $0xc,%esp
80104209:	ff 73 04             	push   0x4(%ebx)
8010420c:	68 62 6d 10 80       	push   $0x80106d62
80104211:	53                   	push   %ebx
80104212:	e8 05 d9 ff ff       	call   80101b1c <dirlink>
80104217:	83 c4 10             	add    $0x10,%esp
8010421a:	85 c0                	test   %eax,%eax
8010421c:	78 18                	js     80104236 <create+0x142>
8010421e:	83 ec 04             	sub    $0x4,%esp
80104221:	ff 76 04             	push   0x4(%esi)
80104224:	68 61 6d 10 80       	push   $0x80106d61
80104229:	53                   	push   %ebx
8010422a:	e8 ed d8 ff ff       	call   80101b1c <dirlink>
8010422f:	83 c4 10             	add    $0x10,%esp
80104232:	85 c0                	test   %eax,%eax
80104234:	79 8a                	jns    801041c0 <create+0xcc>
      panic("create dots");
80104236:	83 ec 0c             	sub    $0xc,%esp
80104239:	68 64 6d 10 80       	push   $0x80106d64
8010423e:	e8 05 c1 ff ff       	call   80100348 <panic>
    panic("create: dirlink");
80104243:	83 ec 0c             	sub    $0xc,%esp
80104246:	68 70 6d 10 80       	push   $0x80106d70
8010424b:	e8 f8 c0 ff ff       	call   80100348 <panic>
    return 0;
80104250:	89 c3                	mov    %eax,%ebx
80104252:	e9 1a ff ff ff       	jmp    80104171 <create+0x7d>

80104257 <sys_dup>:
{
80104257:	55                   	push   %ebp
80104258:	89 e5                	mov    %esp,%ebp
8010425a:	53                   	push   %ebx
8010425b:	83 ec 14             	sub    $0x14,%esp
  if(argfd(0, 0, &f) < 0)
8010425e:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104261:	ba 00 00 00 00       	mov    $0x0,%edx
80104266:	b8 00 00 00 00       	mov    $0x0,%eax
8010426b:	e8 97 fd ff ff       	call   80104007 <argfd>
80104270:	85 c0                	test   %eax,%eax
80104272:	78 23                	js     80104297 <sys_dup+0x40>
  if((fd=fdalloc(f)) < 0)
80104274:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104277:	e8 eb fd ff ff       	call   80104067 <fdalloc>
8010427c:	89 c3                	mov    %eax,%ebx
8010427e:	85 c0                	test   %eax,%eax
80104280:	78 1c                	js     8010429e <sys_dup+0x47>
  filedup(f);
80104282:	83 ec 0c             	sub    $0xc,%esp
80104285:	ff 75 f4             	push   -0xc(%ebp)
80104288:	e8 f1 c9 ff ff       	call   80100c7e <filedup>
  return fd;
8010428d:	83 c4 10             	add    $0x10,%esp
}
80104290:	89 d8                	mov    %ebx,%eax
80104292:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104295:	c9                   	leave  
80104296:	c3                   	ret    
    return -1;
80104297:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010429c:	eb f2                	jmp    80104290 <sys_dup+0x39>
    return -1;
8010429e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801042a3:	eb eb                	jmp    80104290 <sys_dup+0x39>

801042a5 <sys_read>:
{
801042a5:	55                   	push   %ebp
801042a6:	89 e5                	mov    %esp,%ebp
801042a8:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801042ab:	8d 4d f4             	lea    -0xc(%ebp),%ecx
801042ae:	ba 00 00 00 00       	mov    $0x0,%edx
801042b3:	b8 00 00 00 00       	mov    $0x0,%eax
801042b8:	e8 4a fd ff ff       	call   80104007 <argfd>
801042bd:	85 c0                	test   %eax,%eax
801042bf:	78 43                	js     80104304 <sys_read+0x5f>
801042c1:	83 ec 08             	sub    $0x8,%esp
801042c4:	8d 45 f0             	lea    -0x10(%ebp),%eax
801042c7:	50                   	push   %eax
801042c8:	6a 02                	push   $0x2
801042ca:	e8 1e fc ff ff       	call   80103eed <argint>
801042cf:	83 c4 10             	add    $0x10,%esp
801042d2:	85 c0                	test   %eax,%eax
801042d4:	78 2e                	js     80104304 <sys_read+0x5f>
801042d6:	83 ec 04             	sub    $0x4,%esp
801042d9:	ff 75 f0             	push   -0x10(%ebp)
801042dc:	8d 45 ec             	lea    -0x14(%ebp),%eax
801042df:	50                   	push   %eax
801042e0:	6a 01                	push   $0x1
801042e2:	e8 2e fc ff ff       	call   80103f15 <argptr>
801042e7:	83 c4 10             	add    $0x10,%esp
801042ea:	85 c0                	test   %eax,%eax
801042ec:	78 16                	js     80104304 <sys_read+0x5f>
  return fileread(f, p, n);
801042ee:	83 ec 04             	sub    $0x4,%esp
801042f1:	ff 75 f0             	push   -0x10(%ebp)
801042f4:	ff 75 ec             	push   -0x14(%ebp)
801042f7:	ff 75 f4             	push   -0xc(%ebp)
801042fa:	e8 d1 ca ff ff       	call   80100dd0 <fileread>
801042ff:	83 c4 10             	add    $0x10,%esp
}
80104302:	c9                   	leave  
80104303:	c3                   	ret    
    return -1;
80104304:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104309:	eb f7                	jmp    80104302 <sys_read+0x5d>

8010430b <sys_clone>:
{
8010430b:	55                   	push   %ebp
8010430c:	89 e5                	mov    %esp,%ebp
8010430e:	83 ec 08             	sub    $0x8,%esp
  return clone(0, 0, 0, 0);
80104311:	6a 00                	push   $0x0
80104313:	6a 00                	push   $0x0
80104315:	6a 00                	push   $0x0
80104317:	6a 00                	push   $0x0
80104319:	e8 0d f0 ff ff       	call   8010332b <clone>
}
8010431e:	c9                   	leave  
8010431f:	c3                   	ret    

80104320 <sys_join>:
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	83 ec 14             	sub    $0x14,%esp
  return join(0);
80104326:	6a 00                	push   $0x0
80104328:	e8 97 f0 ff ff       	call   801033c4 <join>
}
8010432d:	c9                   	leave  
8010432e:	c3                   	ret    

8010432f <sys_write>:
{
8010432f:	55                   	push   %ebp
80104330:	89 e5                	mov    %esp,%ebp
80104332:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104335:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104338:	ba 00 00 00 00       	mov    $0x0,%edx
8010433d:	b8 00 00 00 00       	mov    $0x0,%eax
80104342:	e8 c0 fc ff ff       	call   80104007 <argfd>
80104347:	85 c0                	test   %eax,%eax
80104349:	78 43                	js     8010438e <sys_write+0x5f>
8010434b:	83 ec 08             	sub    $0x8,%esp
8010434e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104351:	50                   	push   %eax
80104352:	6a 02                	push   $0x2
80104354:	e8 94 fb ff ff       	call   80103eed <argint>
80104359:	83 c4 10             	add    $0x10,%esp
8010435c:	85 c0                	test   %eax,%eax
8010435e:	78 2e                	js     8010438e <sys_write+0x5f>
80104360:	83 ec 04             	sub    $0x4,%esp
80104363:	ff 75 f0             	push   -0x10(%ebp)
80104366:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104369:	50                   	push   %eax
8010436a:	6a 01                	push   $0x1
8010436c:	e8 a4 fb ff ff       	call   80103f15 <argptr>
80104371:	83 c4 10             	add    $0x10,%esp
80104374:	85 c0                	test   %eax,%eax
80104376:	78 16                	js     8010438e <sys_write+0x5f>
  return filewrite(f, p, n);
80104378:	83 ec 04             	sub    $0x4,%esp
8010437b:	ff 75 f0             	push   -0x10(%ebp)
8010437e:	ff 75 ec             	push   -0x14(%ebp)
80104381:	ff 75 f4             	push   -0xc(%ebp)
80104384:	e8 cc ca ff ff       	call   80100e55 <filewrite>
80104389:	83 c4 10             	add    $0x10,%esp
}
8010438c:	c9                   	leave  
8010438d:	c3                   	ret    
    return -1;
8010438e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104393:	eb f7                	jmp    8010438c <sys_write+0x5d>

80104395 <sys_close>:
{
80104395:	55                   	push   %ebp
80104396:	89 e5                	mov    %esp,%ebp
80104398:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
8010439b:	8d 4d f0             	lea    -0x10(%ebp),%ecx
8010439e:	8d 55 f4             	lea    -0xc(%ebp),%edx
801043a1:	b8 00 00 00 00       	mov    $0x0,%eax
801043a6:	e8 5c fc ff ff       	call   80104007 <argfd>
801043ab:	85 c0                	test   %eax,%eax
801043ad:	78 25                	js     801043d4 <sys_close+0x3f>
  myproc()->ofile[fd] = 0;
801043af:	e8 01 ee ff ff       	call   801031b5 <myproc>
801043b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
801043b7:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
801043be:	00 
  fileclose(f);
801043bf:	83 ec 0c             	sub    $0xc,%esp
801043c2:	ff 75 f0             	push   -0x10(%ebp)
801043c5:	e8 f9 c8 ff ff       	call   80100cc3 <fileclose>
  return 0;
801043ca:	83 c4 10             	add    $0x10,%esp
801043cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
801043d2:	c9                   	leave  
801043d3:	c3                   	ret    
    return -1;
801043d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043d9:	eb f7                	jmp    801043d2 <sys_close+0x3d>

801043db <sys_fstat>:
{
801043db:	55                   	push   %ebp
801043dc:	89 e5                	mov    %esp,%ebp
801043de:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801043e1:	8d 4d f4             	lea    -0xc(%ebp),%ecx
801043e4:	ba 00 00 00 00       	mov    $0x0,%edx
801043e9:	b8 00 00 00 00       	mov    $0x0,%eax
801043ee:	e8 14 fc ff ff       	call   80104007 <argfd>
801043f3:	85 c0                	test   %eax,%eax
801043f5:	78 2a                	js     80104421 <sys_fstat+0x46>
801043f7:	83 ec 04             	sub    $0x4,%esp
801043fa:	6a 14                	push   $0x14
801043fc:	8d 45 f0             	lea    -0x10(%ebp),%eax
801043ff:	50                   	push   %eax
80104400:	6a 01                	push   $0x1
80104402:	e8 0e fb ff ff       	call   80103f15 <argptr>
80104407:	83 c4 10             	add    $0x10,%esp
8010440a:	85 c0                	test   %eax,%eax
8010440c:	78 13                	js     80104421 <sys_fstat+0x46>
  return filestat(f, st);
8010440e:	83 ec 08             	sub    $0x8,%esp
80104411:	ff 75 f0             	push   -0x10(%ebp)
80104414:	ff 75 f4             	push   -0xc(%ebp)
80104417:	e8 6d c9 ff ff       	call   80100d89 <filestat>
8010441c:	83 c4 10             	add    $0x10,%esp
}
8010441f:	c9                   	leave  
80104420:	c3                   	ret    
    return -1;
80104421:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104426:	eb f7                	jmp    8010441f <sys_fstat+0x44>

80104428 <sys_link>:
{
80104428:	55                   	push   %ebp
80104429:	89 e5                	mov    %esp,%ebp
8010442b:	56                   	push   %esi
8010442c:	53                   	push   %ebx
8010442d:	83 ec 28             	sub    $0x28,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104430:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104433:	50                   	push   %eax
80104434:	6a 00                	push   $0x0
80104436:	e8 42 fb ff ff       	call   80103f7d <argstr>
8010443b:	83 c4 10             	add    $0x10,%esp
8010443e:	85 c0                	test   %eax,%eax
80104440:	0f 88 d3 00 00 00    	js     80104519 <sys_link+0xf1>
80104446:	83 ec 08             	sub    $0x8,%esp
80104449:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010444c:	50                   	push   %eax
8010444d:	6a 01                	push   $0x1
8010444f:	e8 29 fb ff ff       	call   80103f7d <argstr>
80104454:	83 c4 10             	add    $0x10,%esp
80104457:	85 c0                	test   %eax,%eax
80104459:	0f 88 ba 00 00 00    	js     80104519 <sys_link+0xf1>
  begin_op();
8010445f:	e8 1a e3 ff ff       	call   8010277e <begin_op>
  if((ip = namei(old)) == 0){
80104464:	83 ec 0c             	sub    $0xc,%esp
80104467:	ff 75 e0             	push   -0x20(%ebp)
8010446a:	e8 5e d7 ff ff       	call   80101bcd <namei>
8010446f:	89 c3                	mov    %eax,%ebx
80104471:	83 c4 10             	add    $0x10,%esp
80104474:	85 c0                	test   %eax,%eax
80104476:	0f 84 a4 00 00 00    	je     80104520 <sys_link+0xf8>
  ilock(ip);
8010447c:	83 ec 0c             	sub    $0xc,%esp
8010447f:	50                   	push   %eax
80104480:	e8 ea d0 ff ff       	call   8010156f <ilock>
  if(ip->type == T_DIR){
80104485:	83 c4 10             	add    $0x10,%esp
80104488:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010448d:	0f 84 99 00 00 00    	je     8010452c <sys_link+0x104>
  ip->nlink++;
80104493:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
80104497:	83 c0 01             	add    $0x1,%eax
8010449a:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
8010449e:	83 ec 0c             	sub    $0xc,%esp
801044a1:	53                   	push   %ebx
801044a2:	e8 67 cf ff ff       	call   8010140e <iupdate>
  iunlock(ip);
801044a7:	89 1c 24             	mov    %ebx,(%esp)
801044aa:	e8 82 d1 ff ff       	call   80101631 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
801044af:	83 c4 08             	add    $0x8,%esp
801044b2:	8d 45 ea             	lea    -0x16(%ebp),%eax
801044b5:	50                   	push   %eax
801044b6:	ff 75 e4             	push   -0x1c(%ebp)
801044b9:	e8 27 d7 ff ff       	call   80101be5 <nameiparent>
801044be:	89 c6                	mov    %eax,%esi
801044c0:	83 c4 10             	add    $0x10,%esp
801044c3:	85 c0                	test   %eax,%eax
801044c5:	0f 84 85 00 00 00    	je     80104550 <sys_link+0x128>
  ilock(dp);
801044cb:	83 ec 0c             	sub    $0xc,%esp
801044ce:	50                   	push   %eax
801044cf:	e8 9b d0 ff ff       	call   8010156f <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
801044d4:	83 c4 10             	add    $0x10,%esp
801044d7:	8b 03                	mov    (%ebx),%eax
801044d9:	39 06                	cmp    %eax,(%esi)
801044db:	75 67                	jne    80104544 <sys_link+0x11c>
801044dd:	83 ec 04             	sub    $0x4,%esp
801044e0:	ff 73 04             	push   0x4(%ebx)
801044e3:	8d 45 ea             	lea    -0x16(%ebp),%eax
801044e6:	50                   	push   %eax
801044e7:	56                   	push   %esi
801044e8:	e8 2f d6 ff ff       	call   80101b1c <dirlink>
801044ed:	83 c4 10             	add    $0x10,%esp
801044f0:	85 c0                	test   %eax,%eax
801044f2:	78 50                	js     80104544 <sys_link+0x11c>
  iunlockput(dp);
801044f4:	83 ec 0c             	sub    $0xc,%esp
801044f7:	56                   	push   %esi
801044f8:	e8 19 d2 ff ff       	call   80101716 <iunlockput>
  iput(ip);
801044fd:	89 1c 24             	mov    %ebx,(%esp)
80104500:	e8 71 d1 ff ff       	call   80101676 <iput>
  end_op();
80104505:	e8 ee e2 ff ff       	call   801027f8 <end_op>
  return 0;
8010450a:	83 c4 10             	add    $0x10,%esp
8010450d:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104512:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104515:	5b                   	pop    %ebx
80104516:	5e                   	pop    %esi
80104517:	5d                   	pop    %ebp
80104518:	c3                   	ret    
    return -1;
80104519:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010451e:	eb f2                	jmp    80104512 <sys_link+0xea>
    end_op();
80104520:	e8 d3 e2 ff ff       	call   801027f8 <end_op>
    return -1;
80104525:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010452a:	eb e6                	jmp    80104512 <sys_link+0xea>
    iunlockput(ip);
8010452c:	83 ec 0c             	sub    $0xc,%esp
8010452f:	53                   	push   %ebx
80104530:	e8 e1 d1 ff ff       	call   80101716 <iunlockput>
    end_op();
80104535:	e8 be e2 ff ff       	call   801027f8 <end_op>
    return -1;
8010453a:	83 c4 10             	add    $0x10,%esp
8010453d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104542:	eb ce                	jmp    80104512 <sys_link+0xea>
    iunlockput(dp);
80104544:	83 ec 0c             	sub    $0xc,%esp
80104547:	56                   	push   %esi
80104548:	e8 c9 d1 ff ff       	call   80101716 <iunlockput>
    goto bad;
8010454d:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104550:	83 ec 0c             	sub    $0xc,%esp
80104553:	53                   	push   %ebx
80104554:	e8 16 d0 ff ff       	call   8010156f <ilock>
  ip->nlink--;
80104559:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
8010455d:	83 e8 01             	sub    $0x1,%eax
80104560:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104564:	89 1c 24             	mov    %ebx,(%esp)
80104567:	e8 a2 ce ff ff       	call   8010140e <iupdate>
  iunlockput(ip);
8010456c:	89 1c 24             	mov    %ebx,(%esp)
8010456f:	e8 a2 d1 ff ff       	call   80101716 <iunlockput>
  end_op();
80104574:	e8 7f e2 ff ff       	call   801027f8 <end_op>
  return -1;
80104579:	83 c4 10             	add    $0x10,%esp
8010457c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104581:	eb 8f                	jmp    80104512 <sys_link+0xea>

80104583 <sys_unlink>:
{
80104583:	55                   	push   %ebp
80104584:	89 e5                	mov    %esp,%ebp
80104586:	57                   	push   %edi
80104587:	56                   	push   %esi
80104588:	53                   	push   %ebx
80104589:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
8010458c:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010458f:	50                   	push   %eax
80104590:	6a 00                	push   $0x0
80104592:	e8 e6 f9 ff ff       	call   80103f7d <argstr>
80104597:	83 c4 10             	add    $0x10,%esp
8010459a:	85 c0                	test   %eax,%eax
8010459c:	0f 88 83 01 00 00    	js     80104725 <sys_unlink+0x1a2>
  begin_op();
801045a2:	e8 d7 e1 ff ff       	call   8010277e <begin_op>
  if((dp = nameiparent(path, name)) == 0){
801045a7:	83 ec 08             	sub    $0x8,%esp
801045aa:	8d 45 ca             	lea    -0x36(%ebp),%eax
801045ad:	50                   	push   %eax
801045ae:	ff 75 c4             	push   -0x3c(%ebp)
801045b1:	e8 2f d6 ff ff       	call   80101be5 <nameiparent>
801045b6:	89 c6                	mov    %eax,%esi
801045b8:	83 c4 10             	add    $0x10,%esp
801045bb:	85 c0                	test   %eax,%eax
801045bd:	0f 84 ed 00 00 00    	je     801046b0 <sys_unlink+0x12d>
  ilock(dp);
801045c3:	83 ec 0c             	sub    $0xc,%esp
801045c6:	50                   	push   %eax
801045c7:	e8 a3 cf ff ff       	call   8010156f <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
801045cc:	83 c4 08             	add    $0x8,%esp
801045cf:	68 62 6d 10 80       	push   $0x80106d62
801045d4:	8d 45 ca             	lea    -0x36(%ebp),%eax
801045d7:	50                   	push   %eax
801045d8:	e8 ad d3 ff ff       	call   8010198a <namecmp>
801045dd:	83 c4 10             	add    $0x10,%esp
801045e0:	85 c0                	test   %eax,%eax
801045e2:	0f 84 fc 00 00 00    	je     801046e4 <sys_unlink+0x161>
801045e8:	83 ec 08             	sub    $0x8,%esp
801045eb:	68 61 6d 10 80       	push   $0x80106d61
801045f0:	8d 45 ca             	lea    -0x36(%ebp),%eax
801045f3:	50                   	push   %eax
801045f4:	e8 91 d3 ff ff       	call   8010198a <namecmp>
801045f9:	83 c4 10             	add    $0x10,%esp
801045fc:	85 c0                	test   %eax,%eax
801045fe:	0f 84 e0 00 00 00    	je     801046e4 <sys_unlink+0x161>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104604:	83 ec 04             	sub    $0x4,%esp
80104607:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010460a:	50                   	push   %eax
8010460b:	8d 45 ca             	lea    -0x36(%ebp),%eax
8010460e:	50                   	push   %eax
8010460f:	56                   	push   %esi
80104610:	e8 8a d3 ff ff       	call   8010199f <dirlookup>
80104615:	89 c3                	mov    %eax,%ebx
80104617:	83 c4 10             	add    $0x10,%esp
8010461a:	85 c0                	test   %eax,%eax
8010461c:	0f 84 c2 00 00 00    	je     801046e4 <sys_unlink+0x161>
  ilock(ip);
80104622:	83 ec 0c             	sub    $0xc,%esp
80104625:	50                   	push   %eax
80104626:	e8 44 cf ff ff       	call   8010156f <ilock>
  if(ip->nlink < 1)
8010462b:	83 c4 10             	add    $0x10,%esp
8010462e:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104633:	0f 8e 83 00 00 00    	jle    801046bc <sys_unlink+0x139>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104639:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010463e:	0f 84 85 00 00 00    	je     801046c9 <sys_unlink+0x146>
  memset(&de, 0, sizeof(de));
80104644:	83 ec 04             	sub    $0x4,%esp
80104647:	6a 10                	push   $0x10
80104649:	6a 00                	push   $0x0
8010464b:	8d 7d d8             	lea    -0x28(%ebp),%edi
8010464e:	57                   	push   %edi
8010464f:	e8 49 f6 ff ff       	call   80103c9d <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104654:	6a 10                	push   $0x10
80104656:	ff 75 c0             	push   -0x40(%ebp)
80104659:	57                   	push   %edi
8010465a:	56                   	push   %esi
8010465b:	e8 fe d1 ff ff       	call   8010185e <writei>
80104660:	83 c4 20             	add    $0x20,%esp
80104663:	83 f8 10             	cmp    $0x10,%eax
80104666:	0f 85 90 00 00 00    	jne    801046fc <sys_unlink+0x179>
  if(ip->type == T_DIR){
8010466c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104671:	0f 84 92 00 00 00    	je     80104709 <sys_unlink+0x186>
  iunlockput(dp);
80104677:	83 ec 0c             	sub    $0xc,%esp
8010467a:	56                   	push   %esi
8010467b:	e8 96 d0 ff ff       	call   80101716 <iunlockput>
  ip->nlink--;
80104680:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
80104684:	83 e8 01             	sub    $0x1,%eax
80104687:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
8010468b:	89 1c 24             	mov    %ebx,(%esp)
8010468e:	e8 7b cd ff ff       	call   8010140e <iupdate>
  iunlockput(ip);
80104693:	89 1c 24             	mov    %ebx,(%esp)
80104696:	e8 7b d0 ff ff       	call   80101716 <iunlockput>
  end_op();
8010469b:	e8 58 e1 ff ff       	call   801027f8 <end_op>
  return 0;
801046a0:	83 c4 10             	add    $0x10,%esp
801046a3:	b8 00 00 00 00       	mov    $0x0,%eax
}
801046a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046ab:	5b                   	pop    %ebx
801046ac:	5e                   	pop    %esi
801046ad:	5f                   	pop    %edi
801046ae:	5d                   	pop    %ebp
801046af:	c3                   	ret    
    end_op();
801046b0:	e8 43 e1 ff ff       	call   801027f8 <end_op>
    return -1;
801046b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046ba:	eb ec                	jmp    801046a8 <sys_unlink+0x125>
    panic("unlink: nlink < 1");
801046bc:	83 ec 0c             	sub    $0xc,%esp
801046bf:	68 80 6d 10 80       	push   $0x80106d80
801046c4:	e8 7f bc ff ff       	call   80100348 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
801046c9:	89 d8                	mov    %ebx,%eax
801046cb:	e8 cd f9 ff ff       	call   8010409d <isdirempty>
801046d0:	85 c0                	test   %eax,%eax
801046d2:	0f 85 6c ff ff ff    	jne    80104644 <sys_unlink+0xc1>
    iunlockput(ip);
801046d8:	83 ec 0c             	sub    $0xc,%esp
801046db:	53                   	push   %ebx
801046dc:	e8 35 d0 ff ff       	call   80101716 <iunlockput>
    goto bad;
801046e1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
801046e4:	83 ec 0c             	sub    $0xc,%esp
801046e7:	56                   	push   %esi
801046e8:	e8 29 d0 ff ff       	call   80101716 <iunlockput>
  end_op();
801046ed:	e8 06 e1 ff ff       	call   801027f8 <end_op>
  return -1;
801046f2:	83 c4 10             	add    $0x10,%esp
801046f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046fa:	eb ac                	jmp    801046a8 <sys_unlink+0x125>
    panic("unlink: writei");
801046fc:	83 ec 0c             	sub    $0xc,%esp
801046ff:	68 92 6d 10 80       	push   $0x80106d92
80104704:	e8 3f bc ff ff       	call   80100348 <panic>
    dp->nlink--;
80104709:	0f b7 46 56          	movzwl 0x56(%esi),%eax
8010470d:	83 e8 01             	sub    $0x1,%eax
80104710:	66 89 46 56          	mov    %ax,0x56(%esi)
    iupdate(dp);
80104714:	83 ec 0c             	sub    $0xc,%esp
80104717:	56                   	push   %esi
80104718:	e8 f1 cc ff ff       	call   8010140e <iupdate>
8010471d:	83 c4 10             	add    $0x10,%esp
80104720:	e9 52 ff ff ff       	jmp    80104677 <sys_unlink+0xf4>
    return -1;
80104725:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010472a:	e9 79 ff ff ff       	jmp    801046a8 <sys_unlink+0x125>

8010472f <sys_open>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_open(void)
{
<<<<<<< HEAD
80104783:	55                   	push   %ebp
80104784:	89 e5                	mov    %esp,%ebp
80104786:	57                   	push   %edi
80104787:	56                   	push   %esi
80104788:	53                   	push   %ebx
80104789:	83 ec 24             	sub    $0x24,%esp
=======
8010472f:	55                   	push   %ebp
80104730:	89 e5                	mov    %esp,%ebp
80104732:	57                   	push   %edi
80104733:	56                   	push   %esi
80104734:	53                   	push   %ebx
80104735:	83 ec 24             	sub    $0x24,%esp
>>>>>>> d669a6c (ulib and makefile)
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
<<<<<<< HEAD
8010478c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010478f:	50                   	push   %eax
80104790:	6a 00                	push   $0x0
80104792:	e8 3a f8 ff ff       	call   80103fd1 <argstr>
80104797:	83 c4 10             	add    $0x10,%esp
8010479a:	85 c0                	test   %eax,%eax
8010479c:	0f 88 a0 00 00 00    	js     80104842 <sys_open+0xbf>
801047a2:	83 ec 08             	sub    $0x8,%esp
801047a5:	8d 45 e0             	lea    -0x20(%ebp),%eax
801047a8:	50                   	push   %eax
801047a9:	6a 01                	push   $0x1
801047ab:	e8 91 f7 ff ff       	call   80103f41 <argint>
801047b0:	83 c4 10             	add    $0x10,%esp
801047b3:	85 c0                	test   %eax,%eax
801047b5:	0f 88 87 00 00 00    	js     80104842 <sys_open+0xbf>
    return -1;

  begin_op();
801047bb:	e8 be df ff ff       	call   8010277e <begin_op>

  if(omode & O_CREATE){
801047c0:	f6 45 e1 02          	testb  $0x2,-0x1f(%ebp)
801047c4:	0f 84 8b 00 00 00    	je     80104855 <sys_open+0xd2>
    ip = create(path, T_FILE, 0, 0);
801047ca:	83 ec 0c             	sub    $0xc,%esp
801047cd:	6a 00                	push   $0x0
801047cf:	b9 00 00 00 00       	mov    $0x0,%ecx
801047d4:	ba 02 00 00 00       	mov    $0x2,%edx
801047d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801047dc:	e8 67 f9 ff ff       	call   80104148 <create>
801047e1:	89 c6                	mov    %eax,%esi
    if(ip == 0){
801047e3:	83 c4 10             	add    $0x10,%esp
801047e6:	85 c0                	test   %eax,%eax
801047e8:	74 5f                	je     80104849 <sys_open+0xc6>
=======
80104738:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010473b:	50                   	push   %eax
8010473c:	6a 00                	push   $0x0
8010473e:	e8 3a f8 ff ff       	call   80103f7d <argstr>
80104743:	83 c4 10             	add    $0x10,%esp
80104746:	85 c0                	test   %eax,%eax
80104748:	0f 88 a0 00 00 00    	js     801047ee <sys_open+0xbf>
8010474e:	83 ec 08             	sub    $0x8,%esp
80104751:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104754:	50                   	push   %eax
80104755:	6a 01                	push   $0x1
80104757:	e8 91 f7 ff ff       	call   80103eed <argint>
8010475c:	83 c4 10             	add    $0x10,%esp
8010475f:	85 c0                	test   %eax,%eax
80104761:	0f 88 87 00 00 00    	js     801047ee <sys_open+0xbf>
    return -1;

  begin_op();
80104767:	e8 12 e0 ff ff       	call   8010277e <begin_op>

  if(omode & O_CREATE){
8010476c:	f6 45 e1 02          	testb  $0x2,-0x1f(%ebp)
80104770:	0f 84 8b 00 00 00    	je     80104801 <sys_open+0xd2>
    ip = create(path, T_FILE, 0, 0);
80104776:	83 ec 0c             	sub    $0xc,%esp
80104779:	6a 00                	push   $0x0
8010477b:	b9 00 00 00 00       	mov    $0x0,%ecx
80104780:	ba 02 00 00 00       	mov    $0x2,%edx
80104785:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104788:	e8 67 f9 ff ff       	call   801040f4 <create>
8010478d:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010478f:	83 c4 10             	add    $0x10,%esp
80104792:	85 c0                	test   %eax,%eax
80104794:	74 5f                	je     801047f5 <sys_open+0xc6>
>>>>>>> d669a6c (ulib and makefile)
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
<<<<<<< HEAD
801047ea:	e8 2e c4 ff ff       	call   80100c1d <filealloc>
801047ef:	89 c3                	mov    %eax,%ebx
801047f1:	85 c0                	test   %eax,%eax
801047f3:	0f 84 b5 00 00 00    	je     801048ae <sys_open+0x12b>
801047f9:	e8 bd f8 ff ff       	call   801040bb <fdalloc>
801047fe:	89 c7                	mov    %eax,%edi
80104800:	85 c0                	test   %eax,%eax
80104802:	0f 88 a6 00 00 00    	js     801048ae <sys_open+0x12b>
=======
80104796:	e8 82 c4 ff ff       	call   80100c1d <filealloc>
8010479b:	89 c3                	mov    %eax,%ebx
8010479d:	85 c0                	test   %eax,%eax
8010479f:	0f 84 b5 00 00 00    	je     8010485a <sys_open+0x12b>
801047a5:	e8 bd f8 ff ff       	call   80104067 <fdalloc>
801047aa:	89 c7                	mov    %eax,%edi
801047ac:	85 c0                	test   %eax,%eax
801047ae:	0f 88 a6 00 00 00    	js     8010485a <sys_open+0x12b>
>>>>>>> d669a6c (ulib and makefile)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
<<<<<<< HEAD
80104808:	83 ec 0c             	sub    $0xc,%esp
8010480b:	56                   	push   %esi
8010480c:	e8 20 ce ff ff       	call   80101631 <iunlock>
  end_op();
80104811:	e8 e2 df ff ff       	call   801027f8 <end_op>

  f->type = FD_INODE;
80104816:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  f->ip = ip;
8010481c:	89 73 10             	mov    %esi,0x10(%ebx)
  f->off = 0;
8010481f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  f->readable = !(omode & O_WRONLY);
80104826:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104829:	83 c4 10             	add    $0x10,%esp
8010482c:	a8 01                	test   $0x1,%al
8010482e:	0f 94 43 08          	sete   0x8(%ebx)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104832:	a8 03                	test   $0x3,%al
80104834:	0f 95 43 09          	setne  0x9(%ebx)
  return fd;
}
80104838:	89 f8                	mov    %edi,%eax
8010483a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010483d:	5b                   	pop    %ebx
8010483e:	5e                   	pop    %esi
8010483f:	5f                   	pop    %edi
80104840:	5d                   	pop    %ebp
80104841:	c3                   	ret    
    return -1;
80104842:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104847:	eb ef                	jmp    80104838 <sys_open+0xb5>
      end_op();
80104849:	e8 aa df ff ff       	call   801027f8 <end_op>
      return -1;
8010484e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104853:	eb e3                	jmp    80104838 <sys_open+0xb5>
    if((ip = namei(path)) == 0){
80104855:	83 ec 0c             	sub    $0xc,%esp
80104858:	ff 75 e4             	push   -0x1c(%ebp)
8010485b:	e8 6d d3 ff ff       	call   80101bcd <namei>
80104860:	89 c6                	mov    %eax,%esi
80104862:	83 c4 10             	add    $0x10,%esp
80104865:	85 c0                	test   %eax,%eax
80104867:	74 39                	je     801048a2 <sys_open+0x11f>
    ilock(ip);
80104869:	83 ec 0c             	sub    $0xc,%esp
8010486c:	50                   	push   %eax
8010486d:	e8 fd cc ff ff       	call   8010156f <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104872:	83 c4 10             	add    $0x10,%esp
80104875:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
8010487a:	0f 85 6a ff ff ff    	jne    801047ea <sys_open+0x67>
80104880:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80104884:	0f 84 60 ff ff ff    	je     801047ea <sys_open+0x67>
      iunlockput(ip);
8010488a:	83 ec 0c             	sub    $0xc,%esp
8010488d:	56                   	push   %esi
8010488e:	e8 83 ce ff ff       	call   80101716 <iunlockput>
      end_op();
80104893:	e8 60 df ff ff       	call   801027f8 <end_op>
      return -1;
80104898:	83 c4 10             	add    $0x10,%esp
8010489b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048a0:	eb 96                	jmp    80104838 <sys_open+0xb5>
      end_op();
801048a2:	e8 51 df ff ff       	call   801027f8 <end_op>
      return -1;
801048a7:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048ac:	eb 8a                	jmp    80104838 <sys_open+0xb5>
    if(f)
801048ae:	85 db                	test   %ebx,%ebx
801048b0:	74 0c                	je     801048be <sys_open+0x13b>
      fileclose(f);
801048b2:	83 ec 0c             	sub    $0xc,%esp
801048b5:	53                   	push   %ebx
801048b6:	e8 08 c4 ff ff       	call   80100cc3 <fileclose>
801048bb:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801048be:	83 ec 0c             	sub    $0xc,%esp
801048c1:	56                   	push   %esi
801048c2:	e8 4f ce ff ff       	call   80101716 <iunlockput>
    end_op();
801048c7:	e8 2c df ff ff       	call   801027f8 <end_op>
    return -1;
801048cc:	83 c4 10             	add    $0x10,%esp
801048cf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048d4:	e9 5f ff ff ff       	jmp    80104838 <sys_open+0xb5>

801048d9 <sys_mkdir>:
=======
801047b4:	83 ec 0c             	sub    $0xc,%esp
801047b7:	56                   	push   %esi
801047b8:	e8 74 ce ff ff       	call   80101631 <iunlock>
  end_op();
801047bd:	e8 36 e0 ff ff       	call   801027f8 <end_op>

  f->type = FD_INODE;
801047c2:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  f->ip = ip;
801047c8:	89 73 10             	mov    %esi,0x10(%ebx)
  f->off = 0;
801047cb:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  f->readable = !(omode & O_WRONLY);
801047d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801047d5:	83 c4 10             	add    $0x10,%esp
801047d8:	a8 01                	test   $0x1,%al
801047da:	0f 94 43 08          	sete   0x8(%ebx)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801047de:	a8 03                	test   $0x3,%al
801047e0:	0f 95 43 09          	setne  0x9(%ebx)
  return fd;
}
801047e4:	89 f8                	mov    %edi,%eax
801047e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801047e9:	5b                   	pop    %ebx
801047ea:	5e                   	pop    %esi
801047eb:	5f                   	pop    %edi
801047ec:	5d                   	pop    %ebp
801047ed:	c3                   	ret    
    return -1;
801047ee:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801047f3:	eb ef                	jmp    801047e4 <sys_open+0xb5>
      end_op();
801047f5:	e8 fe df ff ff       	call   801027f8 <end_op>
      return -1;
801047fa:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801047ff:	eb e3                	jmp    801047e4 <sys_open+0xb5>
    if((ip = namei(path)) == 0){
80104801:	83 ec 0c             	sub    $0xc,%esp
80104804:	ff 75 e4             	push   -0x1c(%ebp)
80104807:	e8 c1 d3 ff ff       	call   80101bcd <namei>
8010480c:	89 c6                	mov    %eax,%esi
8010480e:	83 c4 10             	add    $0x10,%esp
80104811:	85 c0                	test   %eax,%eax
80104813:	74 39                	je     8010484e <sys_open+0x11f>
    ilock(ip);
80104815:	83 ec 0c             	sub    $0xc,%esp
80104818:	50                   	push   %eax
80104819:	e8 51 cd ff ff       	call   8010156f <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
8010481e:	83 c4 10             	add    $0x10,%esp
80104821:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104826:	0f 85 6a ff ff ff    	jne    80104796 <sys_open+0x67>
8010482c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80104830:	0f 84 60 ff ff ff    	je     80104796 <sys_open+0x67>
      iunlockput(ip);
80104836:	83 ec 0c             	sub    $0xc,%esp
80104839:	56                   	push   %esi
8010483a:	e8 d7 ce ff ff       	call   80101716 <iunlockput>
      end_op();
8010483f:	e8 b4 df ff ff       	call   801027f8 <end_op>
      return -1;
80104844:	83 c4 10             	add    $0x10,%esp
80104847:	bf ff ff ff ff       	mov    $0xffffffff,%edi
8010484c:	eb 96                	jmp    801047e4 <sys_open+0xb5>
      end_op();
8010484e:	e8 a5 df ff ff       	call   801027f8 <end_op>
      return -1;
80104853:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104858:	eb 8a                	jmp    801047e4 <sys_open+0xb5>
    if(f)
8010485a:	85 db                	test   %ebx,%ebx
8010485c:	74 0c                	je     8010486a <sys_open+0x13b>
      fileclose(f);
8010485e:	83 ec 0c             	sub    $0xc,%esp
80104861:	53                   	push   %ebx
80104862:	e8 5c c4 ff ff       	call   80100cc3 <fileclose>
80104867:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010486a:	83 ec 0c             	sub    $0xc,%esp
8010486d:	56                   	push   %esi
8010486e:	e8 a3 ce ff ff       	call   80101716 <iunlockput>
    end_op();
80104873:	e8 80 df ff ff       	call   801027f8 <end_op>
    return -1;
80104878:	83 c4 10             	add    $0x10,%esp
8010487b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104880:	e9 5f ff ff ff       	jmp    801047e4 <sys_open+0xb5>

80104885 <sys_mkdir>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_mkdir(void)
{
<<<<<<< HEAD
801048d9:	55                   	push   %ebp
801048da:	89 e5                	mov    %esp,%ebp
801048dc:	83 ec 18             	sub    $0x18,%esp
=======
80104885:	55                   	push   %ebp
80104886:	89 e5                	mov    %esp,%ebp
80104888:	83 ec 18             	sub    $0x18,%esp
>>>>>>> d669a6c (ulib and makefile)
  char *path;
  struct inode *ip;

  begin_op();
<<<<<<< HEAD
801048df:	e8 9a de ff ff       	call   8010277e <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801048e4:	83 ec 08             	sub    $0x8,%esp
801048e7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048ea:	50                   	push   %eax
801048eb:	6a 00                	push   $0x0
801048ed:	e8 df f6 ff ff       	call   80103fd1 <argstr>
801048f2:	83 c4 10             	add    $0x10,%esp
801048f5:	85 c0                	test   %eax,%eax
801048f7:	78 36                	js     8010492f <sys_mkdir+0x56>
801048f9:	83 ec 0c             	sub    $0xc,%esp
801048fc:	6a 00                	push   $0x0
801048fe:	b9 00 00 00 00       	mov    $0x0,%ecx
80104903:	ba 01 00 00 00       	mov    $0x1,%edx
80104908:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010490b:	e8 38 f8 ff ff       	call   80104148 <create>
80104910:	83 c4 10             	add    $0x10,%esp
80104913:	85 c0                	test   %eax,%eax
80104915:	74 18                	je     8010492f <sys_mkdir+0x56>
=======
8010488b:	e8 ee de ff ff       	call   8010277e <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80104890:	83 ec 08             	sub    $0x8,%esp
80104893:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104896:	50                   	push   %eax
80104897:	6a 00                	push   $0x0
80104899:	e8 df f6 ff ff       	call   80103f7d <argstr>
8010489e:	83 c4 10             	add    $0x10,%esp
801048a1:	85 c0                	test   %eax,%eax
801048a3:	78 36                	js     801048db <sys_mkdir+0x56>
801048a5:	83 ec 0c             	sub    $0xc,%esp
801048a8:	6a 00                	push   $0x0
801048aa:	b9 00 00 00 00       	mov    $0x0,%ecx
801048af:	ba 01 00 00 00       	mov    $0x1,%edx
801048b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801048b7:	e8 38 f8 ff ff       	call   801040f4 <create>
801048bc:	83 c4 10             	add    $0x10,%esp
801048bf:	85 c0                	test   %eax,%eax
801048c1:	74 18                	je     801048db <sys_mkdir+0x56>
>>>>>>> d669a6c (ulib and makefile)
    end_op();
    return -1;
  }
  iunlockput(ip);
<<<<<<< HEAD
80104917:	83 ec 0c             	sub    $0xc,%esp
8010491a:	50                   	push   %eax
8010491b:	e8 f6 cd ff ff       	call   80101716 <iunlockput>
  end_op();
80104920:	e8 d3 de ff ff       	call   801027f8 <end_op>
  return 0;
80104925:	83 c4 10             	add    $0x10,%esp
80104928:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010492d:	c9                   	leave  
8010492e:	c3                   	ret    
    end_op();
8010492f:	e8 c4 de ff ff       	call   801027f8 <end_op>
    return -1;
80104934:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104939:	eb f2                	jmp    8010492d <sys_mkdir+0x54>

8010493b <sys_mknod>:
=======
801048c3:	83 ec 0c             	sub    $0xc,%esp
801048c6:	50                   	push   %eax
801048c7:	e8 4a ce ff ff       	call   80101716 <iunlockput>
  end_op();
801048cc:	e8 27 df ff ff       	call   801027f8 <end_op>
  return 0;
801048d1:	83 c4 10             	add    $0x10,%esp
801048d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
801048d9:	c9                   	leave  
801048da:	c3                   	ret    
    end_op();
801048db:	e8 18 df ff ff       	call   801027f8 <end_op>
    return -1;
801048e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048e5:	eb f2                	jmp    801048d9 <sys_mkdir+0x54>

801048e7 <sys_mknod>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_mknod(void)
{
<<<<<<< HEAD
8010493b:	55                   	push   %ebp
8010493c:	89 e5                	mov    %esp,%ebp
8010493e:	83 ec 18             	sub    $0x18,%esp
=======
801048e7:	55                   	push   %ebp
801048e8:	89 e5                	mov    %esp,%ebp
801048ea:	83 ec 18             	sub    $0x18,%esp
>>>>>>> d669a6c (ulib and makefile)
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
<<<<<<< HEAD
80104941:	e8 38 de ff ff       	call   8010277e <begin_op>
  if((argstr(0, &path)) < 0 ||
80104946:	83 ec 08             	sub    $0x8,%esp
80104949:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010494c:	50                   	push   %eax
8010494d:	6a 00                	push   $0x0
8010494f:	e8 7d f6 ff ff       	call   80103fd1 <argstr>
80104954:	83 c4 10             	add    $0x10,%esp
80104957:	85 c0                	test   %eax,%eax
80104959:	78 62                	js     801049bd <sys_mknod+0x82>
     argint(1, &major) < 0 ||
8010495b:	83 ec 08             	sub    $0x8,%esp
8010495e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104961:	50                   	push   %eax
80104962:	6a 01                	push   $0x1
80104964:	e8 d8 f5 ff ff       	call   80103f41 <argint>
  if((argstr(0, &path)) < 0 ||
80104969:	83 c4 10             	add    $0x10,%esp
8010496c:	85 c0                	test   %eax,%eax
8010496e:	78 4d                	js     801049bd <sys_mknod+0x82>
     argint(2, &minor) < 0 ||
80104970:	83 ec 08             	sub    $0x8,%esp
80104973:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104976:	50                   	push   %eax
80104977:	6a 02                	push   $0x2
80104979:	e8 c3 f5 ff ff       	call   80103f41 <argint>
     argint(1, &major) < 0 ||
8010497e:	83 c4 10             	add    $0x10,%esp
80104981:	85 c0                	test   %eax,%eax
80104983:	78 38                	js     801049bd <sys_mknod+0x82>
     (ip = create(path, T_DEV, major, minor)) == 0){
80104985:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104989:	83 ec 0c             	sub    $0xc,%esp
8010498c:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
80104990:	50                   	push   %eax
80104991:	ba 03 00 00 00       	mov    $0x3,%edx
80104996:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104999:	e8 aa f7 ff ff       	call   80104148 <create>
     argint(2, &minor) < 0 ||
8010499e:	83 c4 10             	add    $0x10,%esp
801049a1:	85 c0                	test   %eax,%eax
801049a3:	74 18                	je     801049bd <sys_mknod+0x82>
=======
801048ed:	e8 8c de ff ff       	call   8010277e <begin_op>
  if((argstr(0, &path)) < 0 ||
801048f2:	83 ec 08             	sub    $0x8,%esp
801048f5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048f8:	50                   	push   %eax
801048f9:	6a 00                	push   $0x0
801048fb:	e8 7d f6 ff ff       	call   80103f7d <argstr>
80104900:	83 c4 10             	add    $0x10,%esp
80104903:	85 c0                	test   %eax,%eax
80104905:	78 62                	js     80104969 <sys_mknod+0x82>
     argint(1, &major) < 0 ||
80104907:	83 ec 08             	sub    $0x8,%esp
8010490a:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010490d:	50                   	push   %eax
8010490e:	6a 01                	push   $0x1
80104910:	e8 d8 f5 ff ff       	call   80103eed <argint>
  if((argstr(0, &path)) < 0 ||
80104915:	83 c4 10             	add    $0x10,%esp
80104918:	85 c0                	test   %eax,%eax
8010491a:	78 4d                	js     80104969 <sys_mknod+0x82>
     argint(2, &minor) < 0 ||
8010491c:	83 ec 08             	sub    $0x8,%esp
8010491f:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104922:	50                   	push   %eax
80104923:	6a 02                	push   $0x2
80104925:	e8 c3 f5 ff ff       	call   80103eed <argint>
     argint(1, &major) < 0 ||
8010492a:	83 c4 10             	add    $0x10,%esp
8010492d:	85 c0                	test   %eax,%eax
8010492f:	78 38                	js     80104969 <sys_mknod+0x82>
     (ip = create(path, T_DEV, major, minor)) == 0){
80104931:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104935:	83 ec 0c             	sub    $0xc,%esp
80104938:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
8010493c:	50                   	push   %eax
8010493d:	ba 03 00 00 00       	mov    $0x3,%edx
80104942:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104945:	e8 aa f7 ff ff       	call   801040f4 <create>
     argint(2, &minor) < 0 ||
8010494a:	83 c4 10             	add    $0x10,%esp
8010494d:	85 c0                	test   %eax,%eax
8010494f:	74 18                	je     80104969 <sys_mknod+0x82>
>>>>>>> d669a6c (ulib and makefile)
    end_op();
    return -1;
  }
  iunlockput(ip);
<<<<<<< HEAD
801049a5:	83 ec 0c             	sub    $0xc,%esp
801049a8:	50                   	push   %eax
801049a9:	e8 68 cd ff ff       	call   80101716 <iunlockput>
  end_op();
801049ae:	e8 45 de ff ff       	call   801027f8 <end_op>
  return 0;
801049b3:	83 c4 10             	add    $0x10,%esp
801049b6:	b8 00 00 00 00       	mov    $0x0,%eax
}
801049bb:	c9                   	leave  
801049bc:	c3                   	ret    
    end_op();
801049bd:	e8 36 de ff ff       	call   801027f8 <end_op>
    return -1;
801049c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049c7:	eb f2                	jmp    801049bb <sys_mknod+0x80>

801049c9 <sys_chdir>:
=======
80104951:	83 ec 0c             	sub    $0xc,%esp
80104954:	50                   	push   %eax
80104955:	e8 bc cd ff ff       	call   80101716 <iunlockput>
  end_op();
8010495a:	e8 99 de ff ff       	call   801027f8 <end_op>
  return 0;
8010495f:	83 c4 10             	add    $0x10,%esp
80104962:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104967:	c9                   	leave  
80104968:	c3                   	ret    
    end_op();
80104969:	e8 8a de ff ff       	call   801027f8 <end_op>
    return -1;
8010496e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104973:	eb f2                	jmp    80104967 <sys_mknod+0x80>

80104975 <sys_chdir>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_chdir(void)
{
<<<<<<< HEAD
801049c9:	55                   	push   %ebp
801049ca:	89 e5                	mov    %esp,%ebp
801049cc:	56                   	push   %esi
801049cd:	53                   	push   %ebx
801049ce:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801049d1:	e8 df e7 ff ff       	call   801031b5 <myproc>
801049d6:	89 c6                	mov    %eax,%esi
  
  begin_op();
801049d8:	e8 a1 dd ff ff       	call   8010277e <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801049dd:	83 ec 08             	sub    $0x8,%esp
801049e0:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049e3:	50                   	push   %eax
801049e4:	6a 00                	push   $0x0
801049e6:	e8 e6 f5 ff ff       	call   80103fd1 <argstr>
801049eb:	83 c4 10             	add    $0x10,%esp
801049ee:	85 c0                	test   %eax,%eax
801049f0:	78 52                	js     80104a44 <sys_chdir+0x7b>
801049f2:	83 ec 0c             	sub    $0xc,%esp
801049f5:	ff 75 f4             	push   -0xc(%ebp)
801049f8:	e8 d0 d1 ff ff       	call   80101bcd <namei>
801049fd:	89 c3                	mov    %eax,%ebx
801049ff:	83 c4 10             	add    $0x10,%esp
80104a02:	85 c0                	test   %eax,%eax
80104a04:	74 3e                	je     80104a44 <sys_chdir+0x7b>
=======
80104975:	55                   	push   %ebp
80104976:	89 e5                	mov    %esp,%ebp
80104978:	56                   	push   %esi
80104979:	53                   	push   %ebx
8010497a:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
8010497d:	e8 33 e8 ff ff       	call   801031b5 <myproc>
80104982:	89 c6                	mov    %eax,%esi
  
  begin_op();
80104984:	e8 f5 dd ff ff       	call   8010277e <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80104989:	83 ec 08             	sub    $0x8,%esp
8010498c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010498f:	50                   	push   %eax
80104990:	6a 00                	push   $0x0
80104992:	e8 e6 f5 ff ff       	call   80103f7d <argstr>
80104997:	83 c4 10             	add    $0x10,%esp
8010499a:	85 c0                	test   %eax,%eax
8010499c:	78 52                	js     801049f0 <sys_chdir+0x7b>
8010499e:	83 ec 0c             	sub    $0xc,%esp
801049a1:	ff 75 f4             	push   -0xc(%ebp)
801049a4:	e8 24 d2 ff ff       	call   80101bcd <namei>
801049a9:	89 c3                	mov    %eax,%ebx
801049ab:	83 c4 10             	add    $0x10,%esp
801049ae:	85 c0                	test   %eax,%eax
801049b0:	74 3e                	je     801049f0 <sys_chdir+0x7b>
>>>>>>> d669a6c (ulib and makefile)
    end_op();
    return -1;
  }
  ilock(ip);
<<<<<<< HEAD
80104a06:	83 ec 0c             	sub    $0xc,%esp
80104a09:	50                   	push   %eax
80104a0a:	e8 60 cb ff ff       	call   8010156f <ilock>
  if(ip->type != T_DIR){
80104a0f:	83 c4 10             	add    $0x10,%esp
80104a12:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104a17:	75 37                	jne    80104a50 <sys_chdir+0x87>
=======
801049b2:	83 ec 0c             	sub    $0xc,%esp
801049b5:	50                   	push   %eax
801049b6:	e8 b4 cb ff ff       	call   8010156f <ilock>
  if(ip->type != T_DIR){
801049bb:	83 c4 10             	add    $0x10,%esp
801049be:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801049c3:	75 37                	jne    801049fc <sys_chdir+0x87>
>>>>>>> d669a6c (ulib and makefile)
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
<<<<<<< HEAD
80104a19:	83 ec 0c             	sub    $0xc,%esp
80104a1c:	53                   	push   %ebx
80104a1d:	e8 0f cc ff ff       	call   80101631 <iunlock>
  iput(curproc->cwd);
80104a22:	83 c4 04             	add    $0x4,%esp
80104a25:	ff 76 68             	push   0x68(%esi)
80104a28:	e8 49 cc ff ff       	call   80101676 <iput>
  end_op();
80104a2d:	e8 c6 dd ff ff       	call   801027f8 <end_op>
  curproc->cwd = ip;
80104a32:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
80104a35:	83 c4 10             	add    $0x10,%esp
80104a38:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104a3d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a40:	5b                   	pop    %ebx
80104a41:	5e                   	pop    %esi
80104a42:	5d                   	pop    %ebp
80104a43:	c3                   	ret    
    end_op();
80104a44:	e8 af dd ff ff       	call   801027f8 <end_op>
    return -1;
80104a49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a4e:	eb ed                	jmp    80104a3d <sys_chdir+0x74>
    iunlockput(ip);
80104a50:	83 ec 0c             	sub    $0xc,%esp
80104a53:	53                   	push   %ebx
80104a54:	e8 bd cc ff ff       	call   80101716 <iunlockput>
    end_op();
80104a59:	e8 9a dd ff ff       	call   801027f8 <end_op>
    return -1;
80104a5e:	83 c4 10             	add    $0x10,%esp
80104a61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a66:	eb d5                	jmp    80104a3d <sys_chdir+0x74>

80104a68 <sys_exec>:
=======
801049c5:	83 ec 0c             	sub    $0xc,%esp
801049c8:	53                   	push   %ebx
801049c9:	e8 63 cc ff ff       	call   80101631 <iunlock>
  iput(curproc->cwd);
801049ce:	83 c4 04             	add    $0x4,%esp
801049d1:	ff 76 68             	push   0x68(%esi)
801049d4:	e8 9d cc ff ff       	call   80101676 <iput>
  end_op();
801049d9:	e8 1a de ff ff       	call   801027f8 <end_op>
  curproc->cwd = ip;
801049de:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801049e1:	83 c4 10             	add    $0x10,%esp
801049e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
801049e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801049ec:	5b                   	pop    %ebx
801049ed:	5e                   	pop    %esi
801049ee:	5d                   	pop    %ebp
801049ef:	c3                   	ret    
    end_op();
801049f0:	e8 03 de ff ff       	call   801027f8 <end_op>
    return -1;
801049f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049fa:	eb ed                	jmp    801049e9 <sys_chdir+0x74>
    iunlockput(ip);
801049fc:	83 ec 0c             	sub    $0xc,%esp
801049ff:	53                   	push   %ebx
80104a00:	e8 11 cd ff ff       	call   80101716 <iunlockput>
    end_op();
80104a05:	e8 ee dd ff ff       	call   801027f8 <end_op>
    return -1;
80104a0a:	83 c4 10             	add    $0x10,%esp
80104a0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a12:	eb d5                	jmp    801049e9 <sys_chdir+0x74>

80104a14 <sys_exec>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_exec(void)
{
<<<<<<< HEAD
80104a68:	55                   	push   %ebp
80104a69:	89 e5                	mov    %esp,%ebp
80104a6b:	53                   	push   %ebx
80104a6c:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
=======
80104a14:	55                   	push   %ebp
80104a15:	89 e5                	mov    %esp,%ebp
80104a17:	53                   	push   %ebx
80104a18:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
>>>>>>> d669a6c (ulib and makefile)
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
<<<<<<< HEAD
80104a72:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a75:	50                   	push   %eax
80104a76:	6a 00                	push   $0x0
80104a78:	e8 54 f5 ff ff       	call   80103fd1 <argstr>
80104a7d:	83 c4 10             	add    $0x10,%esp
80104a80:	85 c0                	test   %eax,%eax
80104a82:	78 38                	js     80104abc <sys_exec+0x54>
80104a84:	83 ec 08             	sub    $0x8,%esp
80104a87:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
80104a8d:	50                   	push   %eax
80104a8e:	6a 01                	push   $0x1
80104a90:	e8 ac f4 ff ff       	call   80103f41 <argint>
80104a95:	83 c4 10             	add    $0x10,%esp
80104a98:	85 c0                	test   %eax,%eax
80104a9a:	78 20                	js     80104abc <sys_exec+0x54>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80104a9c:	83 ec 04             	sub    $0x4,%esp
80104a9f:	68 80 00 00 00       	push   $0x80
80104aa4:	6a 00                	push   $0x0
80104aa6:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
80104aac:	50                   	push   %eax
80104aad:	e8 3f f2 ff ff       	call   80103cf1 <memset>
80104ab2:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
80104ab5:	bb 00 00 00 00       	mov    $0x0,%ebx
80104aba:	eb 2c                	jmp    80104ae8 <sys_exec+0x80>
    return -1;
80104abc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ac1:	eb 78                	jmp    80104b3b <sys_exec+0xd3>
=======
80104a1e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a21:	50                   	push   %eax
80104a22:	6a 00                	push   $0x0
80104a24:	e8 54 f5 ff ff       	call   80103f7d <argstr>
80104a29:	83 c4 10             	add    $0x10,%esp
80104a2c:	85 c0                	test   %eax,%eax
80104a2e:	78 38                	js     80104a68 <sys_exec+0x54>
80104a30:	83 ec 08             	sub    $0x8,%esp
80104a33:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
80104a39:	50                   	push   %eax
80104a3a:	6a 01                	push   $0x1
80104a3c:	e8 ac f4 ff ff       	call   80103eed <argint>
80104a41:	83 c4 10             	add    $0x10,%esp
80104a44:	85 c0                	test   %eax,%eax
80104a46:	78 20                	js     80104a68 <sys_exec+0x54>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80104a48:	83 ec 04             	sub    $0x4,%esp
80104a4b:	68 80 00 00 00       	push   $0x80
80104a50:	6a 00                	push   $0x0
80104a52:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
80104a58:	50                   	push   %eax
80104a59:	e8 3f f2 ff ff       	call   80103c9d <memset>
80104a5e:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
80104a61:	bb 00 00 00 00       	mov    $0x0,%ebx
80104a66:	eb 2c                	jmp    80104a94 <sys_exec+0x80>
    return -1;
80104a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a6d:	eb 78                	jmp    80104ae7 <sys_exec+0xd3>
>>>>>>> d669a6c (ulib and makefile)
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
<<<<<<< HEAD
80104ac3:	c7 84 9d 74 ff ff ff 	movl   $0x0,-0x8c(%ebp,%ebx,4)
80104aca:	00 00 00 00 
=======
80104a6f:	c7 84 9d 74 ff ff ff 	movl   $0x0,-0x8c(%ebp,%ebx,4)
80104a76:	00 00 00 00 
>>>>>>> d669a6c (ulib and makefile)
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
<<<<<<< HEAD
80104ace:	83 ec 08             	sub    $0x8,%esp
80104ad1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
80104ad7:	50                   	push   %eax
80104ad8:	ff 75 f4             	push   -0xc(%ebp)
80104adb:	e8 ee bd ff ff       	call   801008ce <exec>
80104ae0:	83 c4 10             	add    $0x10,%esp
80104ae3:	eb 56                	jmp    80104b3b <sys_exec+0xd3>
  for(i=0;; i++){
80104ae5:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80104ae8:	83 fb 1f             	cmp    $0x1f,%ebx
80104aeb:	77 49                	ja     80104b36 <sys_exec+0xce>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80104aed:	83 ec 08             	sub    $0x8,%esp
80104af0:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
80104af6:	50                   	push   %eax
80104af7:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
80104afd:	8d 04 98             	lea    (%eax,%ebx,4),%eax
80104b00:	50                   	push   %eax
80104b01:	e8 c1 f3 ff ff       	call   80103ec7 <fetchint>
80104b06:	83 c4 10             	add    $0x10,%esp
80104b09:	85 c0                	test   %eax,%eax
80104b0b:	78 33                	js     80104b40 <sys_exec+0xd8>
    if(uarg == 0){
80104b0d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
80104b13:	85 c0                	test   %eax,%eax
80104b15:	74 ac                	je     80104ac3 <sys_exec+0x5b>
    if(fetchstr(uarg, &argv[i]) < 0)
80104b17:	83 ec 08             	sub    $0x8,%esp
80104b1a:	8d 94 9d 74 ff ff ff 	lea    -0x8c(%ebp,%ebx,4),%edx
80104b21:	52                   	push   %edx
80104b22:	50                   	push   %eax
80104b23:	e8 da f3 ff ff       	call   80103f02 <fetchstr>
80104b28:	83 c4 10             	add    $0x10,%esp
80104b2b:	85 c0                	test   %eax,%eax
80104b2d:	79 b6                	jns    80104ae5 <sys_exec+0x7d>
      return -1;
80104b2f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b34:	eb 05                	jmp    80104b3b <sys_exec+0xd3>
      return -1;
80104b36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104b3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b3e:	c9                   	leave  
80104b3f:	c3                   	ret    
      return -1;
80104b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b45:	eb f4                	jmp    80104b3b <sys_exec+0xd3>

80104b47 <sys_pipe>:
=======
80104a7a:	83 ec 08             	sub    $0x8,%esp
80104a7d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
80104a83:	50                   	push   %eax
80104a84:	ff 75 f4             	push   -0xc(%ebp)
80104a87:	e8 42 be ff ff       	call   801008ce <exec>
80104a8c:	83 c4 10             	add    $0x10,%esp
80104a8f:	eb 56                	jmp    80104ae7 <sys_exec+0xd3>
  for(i=0;; i++){
80104a91:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80104a94:	83 fb 1f             	cmp    $0x1f,%ebx
80104a97:	77 49                	ja     80104ae2 <sys_exec+0xce>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80104a99:	83 ec 08             	sub    $0x8,%esp
80104a9c:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
80104aa2:	50                   	push   %eax
80104aa3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
80104aa9:	8d 04 98             	lea    (%eax,%ebx,4),%eax
80104aac:	50                   	push   %eax
80104aad:	e8 c1 f3 ff ff       	call   80103e73 <fetchint>
80104ab2:	83 c4 10             	add    $0x10,%esp
80104ab5:	85 c0                	test   %eax,%eax
80104ab7:	78 33                	js     80104aec <sys_exec+0xd8>
    if(uarg == 0){
80104ab9:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
80104abf:	85 c0                	test   %eax,%eax
80104ac1:	74 ac                	je     80104a6f <sys_exec+0x5b>
    if(fetchstr(uarg, &argv[i]) < 0)
80104ac3:	83 ec 08             	sub    $0x8,%esp
80104ac6:	8d 94 9d 74 ff ff ff 	lea    -0x8c(%ebp,%ebx,4),%edx
80104acd:	52                   	push   %edx
80104ace:	50                   	push   %eax
80104acf:	e8 da f3 ff ff       	call   80103eae <fetchstr>
80104ad4:	83 c4 10             	add    $0x10,%esp
80104ad7:	85 c0                	test   %eax,%eax
80104ad9:	79 b6                	jns    80104a91 <sys_exec+0x7d>
      return -1;
80104adb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ae0:	eb 05                	jmp    80104ae7 <sys_exec+0xd3>
      return -1;
80104ae2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ae7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104aea:	c9                   	leave  
80104aeb:	c3                   	ret    
      return -1;
80104aec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104af1:	eb f4                	jmp    80104ae7 <sys_exec+0xd3>

80104af3 <sys_pipe>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_pipe(void)
{
<<<<<<< HEAD
80104b47:	55                   	push   %ebp
80104b48:	89 e5                	mov    %esp,%ebp
80104b4a:	53                   	push   %ebx
80104b4b:	83 ec 18             	sub    $0x18,%esp
=======
80104af3:	55                   	push   %ebp
80104af4:	89 e5                	mov    %esp,%ebp
80104af6:	53                   	push   %ebx
80104af7:	83 ec 18             	sub    $0x18,%esp
>>>>>>> d669a6c (ulib and makefile)
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
<<<<<<< HEAD
80104b4e:	6a 08                	push   $0x8
80104b50:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b53:	50                   	push   %eax
80104b54:	6a 00                	push   $0x0
80104b56:	e8 0e f4 ff ff       	call   80103f69 <argptr>
80104b5b:	83 c4 10             	add    $0x10,%esp
80104b5e:	85 c0                	test   %eax,%eax
80104b60:	78 79                	js     80104bdb <sys_pipe+0x94>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80104b62:	83 ec 08             	sub    $0x8,%esp
80104b65:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104b68:	50                   	push   %eax
80104b69:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b6c:	50                   	push   %eax
80104b6d:	e8 95 e1 ff ff       	call   80102d07 <pipealloc>
80104b72:	83 c4 10             	add    $0x10,%esp
80104b75:	85 c0                	test   %eax,%eax
80104b77:	78 69                	js     80104be2 <sys_pipe+0x9b>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80104b79:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b7c:	e8 3a f5 ff ff       	call   801040bb <fdalloc>
80104b81:	89 c3                	mov    %eax,%ebx
80104b83:	85 c0                	test   %eax,%eax
80104b85:	78 21                	js     80104ba8 <sys_pipe+0x61>
80104b87:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104b8a:	e8 2c f5 ff ff       	call   801040bb <fdalloc>
80104b8f:	85 c0                	test   %eax,%eax
80104b91:	78 15                	js     80104ba8 <sys_pipe+0x61>
=======
80104afa:	6a 08                	push   $0x8
80104afc:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104aff:	50                   	push   %eax
80104b00:	6a 00                	push   $0x0
80104b02:	e8 0e f4 ff ff       	call   80103f15 <argptr>
80104b07:	83 c4 10             	add    $0x10,%esp
80104b0a:	85 c0                	test   %eax,%eax
80104b0c:	78 79                	js     80104b87 <sys_pipe+0x94>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80104b0e:	83 ec 08             	sub    $0x8,%esp
80104b11:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104b14:	50                   	push   %eax
80104b15:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b18:	50                   	push   %eax
80104b19:	e8 e9 e1 ff ff       	call   80102d07 <pipealloc>
80104b1e:	83 c4 10             	add    $0x10,%esp
80104b21:	85 c0                	test   %eax,%eax
80104b23:	78 69                	js     80104b8e <sys_pipe+0x9b>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80104b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b28:	e8 3a f5 ff ff       	call   80104067 <fdalloc>
80104b2d:	89 c3                	mov    %eax,%ebx
80104b2f:	85 c0                	test   %eax,%eax
80104b31:	78 21                	js     80104b54 <sys_pipe+0x61>
80104b33:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104b36:	e8 2c f5 ff ff       	call   80104067 <fdalloc>
80104b3b:	85 c0                	test   %eax,%eax
80104b3d:	78 15                	js     80104b54 <sys_pipe+0x61>
>>>>>>> d669a6c (ulib and makefile)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
<<<<<<< HEAD
80104b93:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b96:	89 1a                	mov    %ebx,(%edx)
  fd[1] = fd1;
80104b98:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b9b:	89 42 04             	mov    %eax,0x4(%edx)
  return 0;
80104b9e:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104ba3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ba6:	c9                   	leave  
80104ba7:	c3                   	ret    
    if(fd0 >= 0)
80104ba8:	85 db                	test   %ebx,%ebx
80104baa:	79 20                	jns    80104bcc <sys_pipe+0x85>
    fileclose(rf);
80104bac:	83 ec 0c             	sub    $0xc,%esp
80104baf:	ff 75 f0             	push   -0x10(%ebp)
80104bb2:	e8 0c c1 ff ff       	call   80100cc3 <fileclose>
    fileclose(wf);
80104bb7:	83 c4 04             	add    $0x4,%esp
80104bba:	ff 75 ec             	push   -0x14(%ebp)
80104bbd:	e8 01 c1 ff ff       	call   80100cc3 <fileclose>
    return -1;
80104bc2:	83 c4 10             	add    $0x10,%esp
80104bc5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bca:	eb d7                	jmp    80104ba3 <sys_pipe+0x5c>
      myproc()->ofile[fd0] = 0;
80104bcc:	e8 e4 e5 ff ff       	call   801031b5 <myproc>
80104bd1:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
80104bd8:	00 
80104bd9:	eb d1                	jmp    80104bac <sys_pipe+0x65>
    return -1;
80104bdb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104be0:	eb c1                	jmp    80104ba3 <sys_pipe+0x5c>
    return -1;
80104be2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104be7:	eb ba                	jmp    80104ba3 <sys_pipe+0x5c>

80104be9 <sys_fork>:
=======
80104b3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b42:	89 1a                	mov    %ebx,(%edx)
  fd[1] = fd1;
80104b44:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b47:	89 42 04             	mov    %eax,0x4(%edx)
  return 0;
80104b4a:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104b4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b52:	c9                   	leave  
80104b53:	c3                   	ret    
    if(fd0 >= 0)
80104b54:	85 db                	test   %ebx,%ebx
80104b56:	79 20                	jns    80104b78 <sys_pipe+0x85>
    fileclose(rf);
80104b58:	83 ec 0c             	sub    $0xc,%esp
80104b5b:	ff 75 f0             	push   -0x10(%ebp)
80104b5e:	e8 60 c1 ff ff       	call   80100cc3 <fileclose>
    fileclose(wf);
80104b63:	83 c4 04             	add    $0x4,%esp
80104b66:	ff 75 ec             	push   -0x14(%ebp)
80104b69:	e8 55 c1 ff ff       	call   80100cc3 <fileclose>
    return -1;
80104b6e:	83 c4 10             	add    $0x10,%esp
80104b71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b76:	eb d7                	jmp    80104b4f <sys_pipe+0x5c>
      myproc()->ofile[fd0] = 0;
80104b78:	e8 38 e6 ff ff       	call   801031b5 <myproc>
80104b7d:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
80104b84:	00 
80104b85:	eb d1                	jmp    80104b58 <sys_pipe+0x65>
    return -1;
80104b87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b8c:	eb c1                	jmp    80104b4f <sys_pipe+0x5c>
    return -1;
80104b8e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b93:	eb ba                	jmp    80104b4f <sys_pipe+0x5c>

80104b95 <sys_fork>:
>>>>>>> d669a6c (ulib and makefile)
#include "proc.h"


int
sys_fork(void)
{
<<<<<<< HEAD
80104be9:	55                   	push   %ebp
80104bea:	89 e5                	mov    %esp,%ebp
80104bec:	83 ec 08             	sub    $0x8,%esp
  return fork();
80104bef:	e8 2a e8 ff ff       	call   8010341e <fork>
}
80104bf4:	c9                   	leave  
80104bf5:	c3                   	ret    

80104bf6 <sys_exit>:
=======
80104b95:	55                   	push   %ebp
80104b96:	89 e5                	mov    %esp,%ebp
80104b98:	83 ec 08             	sub    $0x8,%esp
  return fork();
80104b9b:	e8 2a e8 ff ff       	call   801033ca <fork>
}
80104ba0:	c9                   	leave  
80104ba1:	c3                   	ret    

80104ba2 <sys_exit>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_exit(void)
{
<<<<<<< HEAD
80104bf6:	55                   	push   %ebp
80104bf7:	89 e5                	mov    %esp,%ebp
80104bf9:	83 ec 08             	sub    $0x8,%esp
  exit();
80104bfc:	e8 51 ea ff ff       	call   80103652 <exit>
  return 0;  // not reached
}
80104c01:	b8 00 00 00 00       	mov    $0x0,%eax
80104c06:	c9                   	leave  
80104c07:	c3                   	ret    

80104c08 <sys_wait>:
=======
80104ba2:	55                   	push   %ebp
80104ba3:	89 e5                	mov    %esp,%ebp
80104ba5:	83 ec 08             	sub    $0x8,%esp
  exit();
80104ba8:	e8 51 ea ff ff       	call   801035fe <exit>
  return 0;  // not reached
}
80104bad:	b8 00 00 00 00       	mov    $0x0,%eax
80104bb2:	c9                   	leave  
80104bb3:	c3                   	ret    

80104bb4 <sys_wait>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_wait(void)
{
<<<<<<< HEAD
80104c08:	55                   	push   %ebp
80104c09:	89 e5                	mov    %esp,%ebp
80104c0b:	83 ec 08             	sub    $0x8,%esp
  return wait();
80104c0e:	e8 c8 eb ff ff       	call   801037db <wait>
}
80104c13:	c9                   	leave  
80104c14:	c3                   	ret    

80104c15 <sys_kill>:
=======
80104bb4:	55                   	push   %ebp
80104bb5:	89 e5                	mov    %esp,%ebp
80104bb7:	83 ec 08             	sub    $0x8,%esp
  return wait();
80104bba:	e8 c8 eb ff ff       	call   80103787 <wait>
}
80104bbf:	c9                   	leave  
80104bc0:	c3                   	ret    

80104bc1 <sys_kill>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_kill(void)
{
<<<<<<< HEAD
80104c15:	55                   	push   %ebp
80104c16:	89 e5                	mov    %esp,%ebp
80104c18:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80104c1b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c1e:	50                   	push   %eax
80104c1f:	6a 00                	push   $0x0
80104c21:	e8 1b f3 ff ff       	call   80103f41 <argint>
80104c26:	83 c4 10             	add    $0x10,%esp
80104c29:	85 c0                	test   %eax,%eax
80104c2b:	78 10                	js     80104c3d <sys_kill+0x28>
    return -1;
  return kill(pid);
80104c2d:	83 ec 0c             	sub    $0xc,%esp
80104c30:	ff 75 f4             	push   -0xc(%ebp)
80104c33:	e8 a0 ec ff ff       	call   801038d8 <kill>
80104c38:	83 c4 10             	add    $0x10,%esp
}
80104c3b:	c9                   	leave  
80104c3c:	c3                   	ret    
    return -1;
80104c3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c42:	eb f7                	jmp    80104c3b <sys_kill+0x26>

80104c44 <sys_getpid>:
=======
80104bc1:	55                   	push   %ebp
80104bc2:	89 e5                	mov    %esp,%ebp
80104bc4:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80104bc7:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bca:	50                   	push   %eax
80104bcb:	6a 00                	push   $0x0
80104bcd:	e8 1b f3 ff ff       	call   80103eed <argint>
80104bd2:	83 c4 10             	add    $0x10,%esp
80104bd5:	85 c0                	test   %eax,%eax
80104bd7:	78 10                	js     80104be9 <sys_kill+0x28>
    return -1;
  return kill(pid);
80104bd9:	83 ec 0c             	sub    $0xc,%esp
80104bdc:	ff 75 f4             	push   -0xc(%ebp)
80104bdf:	e8 a0 ec ff ff       	call   80103884 <kill>
80104be4:	83 c4 10             	add    $0x10,%esp
}
80104be7:	c9                   	leave  
80104be8:	c3                   	ret    
    return -1;
80104be9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bee:	eb f7                	jmp    80104be7 <sys_kill+0x26>

80104bf0 <sys_getpid>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_getpid(void)
{
<<<<<<< HEAD
80104c44:	55                   	push   %ebp
80104c45:	89 e5                	mov    %esp,%ebp
80104c47:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80104c4a:	e8 66 e5 ff ff       	call   801031b5 <myproc>
80104c4f:	8b 40 10             	mov    0x10(%eax),%eax
}
80104c52:	c9                   	leave  
80104c53:	c3                   	ret    

80104c54 <sys_sbrk>:
=======
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80104bf6:	e8 ba e5 ff ff       	call   801031b5 <myproc>
80104bfb:	8b 40 10             	mov    0x10(%eax),%eax
}
80104bfe:	c9                   	leave  
80104bff:	c3                   	ret    

80104c00 <sys_sbrk>:
>>>>>>> d669a6c (ulib and makefile)
// sbrk may be called when addr space grown by a thread - trace 
// and find out where we need to add a lock and update other 
// relevant things
int
sys_sbrk(void)
{
<<<<<<< HEAD
80104c54:	55                   	push   %ebp
80104c55:	89 e5                	mov    %esp,%ebp
80104c57:	53                   	push   %ebx
80104c58:	83 ec 1c             	sub    $0x1c,%esp
=======
80104c00:	55                   	push   %ebp
80104c01:	89 e5                	mov    %esp,%ebp
80104c03:	53                   	push   %ebx
80104c04:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> d669a6c (ulib and makefile)
  int addr;
  int n;

  if(argint(0, &n) < 0)
<<<<<<< HEAD
80104c5b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c5e:	50                   	push   %eax
80104c5f:	6a 00                	push   $0x0
80104c61:	e8 db f2 ff ff       	call   80103f41 <argint>
80104c66:	83 c4 10             	add    $0x10,%esp
80104c69:	85 c0                	test   %eax,%eax
80104c6b:	78 20                	js     80104c8d <sys_sbrk+0x39>
    return -1;
  addr = myproc()->sz;
80104c6d:	e8 43 e5 ff ff       	call   801031b5 <myproc>
80104c72:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80104c74:	83 ec 0c             	sub    $0xc,%esp
80104c77:	ff 75 f4             	push   -0xc(%ebp)
80104c7a:	e8 41 e6 ff ff       	call   801032c0 <growproc>
80104c7f:	83 c4 10             	add    $0x10,%esp
80104c82:	85 c0                	test   %eax,%eax
80104c84:	78 0e                	js     80104c94 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80104c86:	89 d8                	mov    %ebx,%eax
80104c88:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c8b:	c9                   	leave  
80104c8c:	c3                   	ret    
    return -1;
80104c8d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c92:	eb f2                	jmp    80104c86 <sys_sbrk+0x32>
    return -1;
80104c94:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c99:	eb eb                	jmp    80104c86 <sys_sbrk+0x32>

80104c9b <sys_sleep>:
=======
80104c07:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c0a:	50                   	push   %eax
80104c0b:	6a 00                	push   $0x0
80104c0d:	e8 db f2 ff ff       	call   80103eed <argint>
80104c12:	83 c4 10             	add    $0x10,%esp
80104c15:	85 c0                	test   %eax,%eax
80104c17:	78 20                	js     80104c39 <sys_sbrk+0x39>
    return -1;
  addr = myproc()->sz;
80104c19:	e8 97 e5 ff ff       	call   801031b5 <myproc>
80104c1e:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80104c20:	83 ec 0c             	sub    $0xc,%esp
80104c23:	ff 75 f4             	push   -0xc(%ebp)
80104c26:	e8 95 e6 ff ff       	call   801032c0 <growproc>
80104c2b:	83 c4 10             	add    $0x10,%esp
80104c2e:	85 c0                	test   %eax,%eax
80104c30:	78 0e                	js     80104c40 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80104c32:	89 d8                	mov    %ebx,%eax
80104c34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c37:	c9                   	leave  
80104c38:	c3                   	ret    
    return -1;
80104c39:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c3e:	eb f2                	jmp    80104c32 <sys_sbrk+0x32>
    return -1;
80104c40:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c45:	eb eb                	jmp    80104c32 <sys_sbrk+0x32>

80104c47 <sys_sleep>:
>>>>>>> d669a6c (ulib and makefile)

int
sys_sleep(void)
{
<<<<<<< HEAD
80104c9b:	55                   	push   %ebp
80104c9c:	89 e5                	mov    %esp,%ebp
80104c9e:	53                   	push   %ebx
80104c9f:	83 ec 1c             	sub    $0x1c,%esp
=======
80104c47:	55                   	push   %ebp
80104c48:	89 e5                	mov    %esp,%ebp
80104c4a:	53                   	push   %ebx
80104c4b:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> d669a6c (ulib and makefile)
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
<<<<<<< HEAD
80104ca2:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ca5:	50                   	push   %eax
80104ca6:	6a 00                	push   $0x0
80104ca8:	e8 94 f2 ff ff       	call   80103f41 <argint>
80104cad:	83 c4 10             	add    $0x10,%esp
80104cb0:	85 c0                	test   %eax,%eax
80104cb2:	78 75                	js     80104d29 <sys_sleep+0x8e>
    return -1;
  acquire(&tickslock);
80104cb4:	83 ec 0c             	sub    $0xc,%esp
80104cb7:	68 80 3c 11 80       	push   $0x80113c80
80104cbc:	e8 84 ef ff ff       	call   80103c45 <acquire>
  ticks0 = ticks;
80104cc1:	8b 1d 60 3c 11 80    	mov    0x80113c60,%ebx
  while(ticks - ticks0 < n){
80104cc7:	83 c4 10             	add    $0x10,%esp
80104cca:	a1 60 3c 11 80       	mov    0x80113c60,%eax
80104ccf:	29 d8                	sub    %ebx,%eax
80104cd1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80104cd4:	73 39                	jae    80104d0f <sys_sleep+0x74>
    if(myproc()->killed){
80104cd6:	e8 da e4 ff ff       	call   801031b5 <myproc>
80104cdb:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104cdf:	75 17                	jne    80104cf8 <sys_sleep+0x5d>
=======
80104c4e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c51:	50                   	push   %eax
80104c52:	6a 00                	push   $0x0
80104c54:	e8 94 f2 ff ff       	call   80103eed <argint>
80104c59:	83 c4 10             	add    $0x10,%esp
80104c5c:	85 c0                	test   %eax,%eax
80104c5e:	78 75                	js     80104cd5 <sys_sleep+0x8e>
    return -1;
  acquire(&tickslock);
80104c60:	83 ec 0c             	sub    $0xc,%esp
80104c63:	68 80 2c 11 80       	push   $0x80112c80
80104c68:	e8 84 ef ff ff       	call   80103bf1 <acquire>
  ticks0 = ticks;
80104c6d:	8b 1d 60 2c 11 80    	mov    0x80112c60,%ebx
  while(ticks - ticks0 < n){
80104c73:	83 c4 10             	add    $0x10,%esp
80104c76:	a1 60 2c 11 80       	mov    0x80112c60,%eax
80104c7b:	29 d8                	sub    %ebx,%eax
80104c7d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80104c80:	73 39                	jae    80104cbb <sys_sleep+0x74>
    if(myproc()->killed){
80104c82:	e8 2e e5 ff ff       	call   801031b5 <myproc>
80104c87:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104c8b:	75 17                	jne    80104ca4 <sys_sleep+0x5d>
>>>>>>> d669a6c (ulib and makefile)
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
<<<<<<< HEAD
80104ce1:	83 ec 08             	sub    $0x8,%esp
80104ce4:	68 80 3c 11 80       	push   $0x80113c80
80104ce9:	68 60 3c 11 80       	push   $0x80113c60
80104cee:	e8 57 ea ff ff       	call   8010374a <sleep>
80104cf3:	83 c4 10             	add    $0x10,%esp
80104cf6:	eb d2                	jmp    80104cca <sys_sleep+0x2f>
      release(&tickslock);
80104cf8:	83 ec 0c             	sub    $0xc,%esp
80104cfb:	68 80 3c 11 80       	push   $0x80113c80
80104d00:	e8 a5 ef ff ff       	call   80103caa <release>
      return -1;
80104d05:	83 c4 10             	add    $0x10,%esp
80104d08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d0d:	eb 15                	jmp    80104d24 <sys_sleep+0x89>
  }
  release(&tickslock);
80104d0f:	83 ec 0c             	sub    $0xc,%esp
80104d12:	68 80 3c 11 80       	push   $0x80113c80
80104d17:	e8 8e ef ff ff       	call   80103caa <release>
  return 0;
80104d1c:	83 c4 10             	add    $0x10,%esp
80104d1f:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104d24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d27:	c9                   	leave  
80104d28:	c3                   	ret    
    return -1;
80104d29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d2e:	eb f4                	jmp    80104d24 <sys_sleep+0x89>

80104d30 <sys_uptime>:
=======
80104c8d:	83 ec 08             	sub    $0x8,%esp
80104c90:	68 80 2c 11 80       	push   $0x80112c80
80104c95:	68 60 2c 11 80       	push   $0x80112c60
80104c9a:	e8 57 ea ff ff       	call   801036f6 <sleep>
80104c9f:	83 c4 10             	add    $0x10,%esp
80104ca2:	eb d2                	jmp    80104c76 <sys_sleep+0x2f>
      release(&tickslock);
80104ca4:	83 ec 0c             	sub    $0xc,%esp
80104ca7:	68 80 2c 11 80       	push   $0x80112c80
80104cac:	e8 a5 ef ff ff       	call   80103c56 <release>
      return -1;
80104cb1:	83 c4 10             	add    $0x10,%esp
80104cb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cb9:	eb 15                	jmp    80104cd0 <sys_sleep+0x89>
  }
  release(&tickslock);
80104cbb:	83 ec 0c             	sub    $0xc,%esp
80104cbe:	68 80 2c 11 80       	push   $0x80112c80
80104cc3:	e8 8e ef ff ff       	call   80103c56 <release>
  return 0;
80104cc8:	83 c4 10             	add    $0x10,%esp
80104ccb:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104cd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104cd3:	c9                   	leave  
80104cd4:	c3                   	ret    
    return -1;
80104cd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cda:	eb f4                	jmp    80104cd0 <sys_sleep+0x89>

80104cdc <sys_uptime>:
>>>>>>> d669a6c (ulib and makefile)

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
<<<<<<< HEAD
80104d30:	55                   	push   %ebp
80104d31:	89 e5                	mov    %esp,%ebp
80104d33:	53                   	push   %ebx
80104d34:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80104d37:	68 80 3c 11 80       	push   $0x80113c80
80104d3c:	e8 04 ef ff ff       	call   80103c45 <acquire>
  xticks = ticks;
80104d41:	8b 1d 60 3c 11 80    	mov    0x80113c60,%ebx
  release(&tickslock);
80104d47:	c7 04 24 80 3c 11 80 	movl   $0x80113c80,(%esp)
80104d4e:	e8 57 ef ff ff       	call   80103caa <release>
  return xticks;
}
80104d53:	89 d8                	mov    %ebx,%eax
80104d55:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d58:	c9                   	leave  
80104d59:	c3                   	ret    

80104d5a <alltraps>:
=======
80104cdc:	55                   	push   %ebp
80104cdd:	89 e5                	mov    %esp,%ebp
80104cdf:	53                   	push   %ebx
80104ce0:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80104ce3:	68 80 2c 11 80       	push   $0x80112c80
80104ce8:	e8 04 ef ff ff       	call   80103bf1 <acquire>
  xticks = ticks;
80104ced:	8b 1d 60 2c 11 80    	mov    0x80112c60,%ebx
  release(&tickslock);
80104cf3:	c7 04 24 80 2c 11 80 	movl   $0x80112c80,(%esp)
80104cfa:	e8 57 ef ff ff       	call   80103c56 <release>
  return xticks;
}
80104cff:	89 d8                	mov    %ebx,%eax
80104d01:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d04:	c9                   	leave  
80104d05:	c3                   	ret    

80104d06 <alltraps>:
>>>>>>> d669a6c (ulib and makefile)

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
<<<<<<< HEAD
80104d5a:	1e                   	push   %ds
  pushl %es
80104d5b:	06                   	push   %es
  pushl %fs
80104d5c:	0f a0                	push   %fs
  pushl %gs
80104d5e:	0f a8                	push   %gs
  pushal
80104d60:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80104d61:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80104d65:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80104d67:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80104d69:	54                   	push   %esp
  call trap
80104d6a:	e8 37 01 00 00       	call   80104ea6 <trap>
  addl $4, %esp
80104d6f:	83 c4 04             	add    $0x4,%esp

80104d72 <trapret>:
=======
80104d06:	1e                   	push   %ds
  pushl %es
80104d07:	06                   	push   %es
  pushl %fs
80104d08:	0f a0                	push   %fs
  pushl %gs
80104d0a:	0f a8                	push   %gs
  pushal
80104d0c:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80104d0d:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80104d11:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80104d13:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80104d15:	54                   	push   %esp
  call trap
80104d16:	e8 37 01 00 00       	call   80104e52 <trap>
  addl $4, %esp
80104d1b:	83 c4 04             	add    $0x4,%esp

80104d1e <trapret>:
>>>>>>> d669a6c (ulib and makefile)

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
<<<<<<< HEAD
80104d72:	61                   	popa   
  popl %gs
80104d73:	0f a9                	pop    %gs
  popl %fs
80104d75:	0f a1                	pop    %fs
  popl %es
80104d77:	07                   	pop    %es
  popl %ds
80104d78:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80104d79:	83 c4 08             	add    $0x8,%esp
  iret
80104d7c:	cf                   	iret   

80104d7d <tvinit>:
=======
80104d1e:	61                   	popa   
  popl %gs
80104d1f:	0f a9                	pop    %gs
  popl %fs
80104d21:	0f a1                	pop    %fs
  popl %es
80104d23:	07                   	pop    %es
  popl %ds
80104d24:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80104d25:	83 c4 08             	add    $0x8,%esp
  iret
80104d28:	cf                   	iret   

80104d29 <tvinit>:
>>>>>>> d669a6c (ulib and makefile)
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
<<<<<<< HEAD
80104d7d:	55                   	push   %ebp
80104d7e:	89 e5                	mov    %esp,%ebp
80104d80:	53                   	push   %ebx
80104d81:	83 ec 04             	sub    $0x4,%esp
  int i;

  for(i = 0; i < 256; i++)
80104d84:	b8 00 00 00 00       	mov    $0x0,%eax
80104d89:	eb 76                	jmp    80104e01 <tvinit+0x84>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80104d8b:	8b 0c 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%ecx
80104d92:	66 89 0c c5 c0 3c 11 	mov    %cx,-0x7feec340(,%eax,8)
80104d99:	80 
80104d9a:	66 c7 04 c5 c2 3c 11 	movw   $0x8,-0x7feec33e(,%eax,8)
80104da1:	80 08 00 
80104da4:	0f b6 14 c5 c4 3c 11 	movzbl -0x7feec33c(,%eax,8),%edx
80104dab:	80 
80104dac:	83 e2 e0             	and    $0xffffffe0,%edx
80104daf:	88 14 c5 c4 3c 11 80 	mov    %dl,-0x7feec33c(,%eax,8)
80104db6:	c6 04 c5 c4 3c 11 80 	movb   $0x0,-0x7feec33c(,%eax,8)
80104dbd:	00 
80104dbe:	0f b6 14 c5 c5 3c 11 	movzbl -0x7feec33b(,%eax,8),%edx
80104dc5:	80 
80104dc6:	83 e2 f0             	and    $0xfffffff0,%edx
80104dc9:	83 ca 0e             	or     $0xe,%edx
80104dcc:	88 14 c5 c5 3c 11 80 	mov    %dl,-0x7feec33b(,%eax,8)
80104dd3:	89 d3                	mov    %edx,%ebx
80104dd5:	83 e3 ef             	and    $0xffffffef,%ebx
80104dd8:	88 1c c5 c5 3c 11 80 	mov    %bl,-0x7feec33b(,%eax,8)
80104ddf:	83 e2 8f             	and    $0xffffff8f,%edx
80104de2:	88 14 c5 c5 3c 11 80 	mov    %dl,-0x7feec33b(,%eax,8)
80104de9:	83 ca 80             	or     $0xffffff80,%edx
80104dec:	88 14 c5 c5 3c 11 80 	mov    %dl,-0x7feec33b(,%eax,8)
80104df3:	c1 e9 10             	shr    $0x10,%ecx
80104df6:	66 89 0c c5 c6 3c 11 	mov    %cx,-0x7feec33a(,%eax,8)
80104dfd:	80 
  for(i = 0; i < 256; i++)
80104dfe:	83 c0 01             	add    $0x1,%eax
80104e01:	3d ff 00 00 00       	cmp    $0xff,%eax
80104e06:	7e 83                	jle    80104d8b <tvinit+0xe>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80104e08:	8b 15 08 a1 10 80    	mov    0x8010a108,%edx
80104e0e:	66 89 15 c0 3e 11 80 	mov    %dx,0x80113ec0
80104e15:	66 c7 05 c2 3e 11 80 	movw   $0x8,0x80113ec2
80104e1c:	08 00 
80104e1e:	0f b6 05 c4 3e 11 80 	movzbl 0x80113ec4,%eax
80104e25:	83 e0 e0             	and    $0xffffffe0,%eax
80104e28:	a2 c4 3e 11 80       	mov    %al,0x80113ec4
80104e2d:	c6 05 c4 3e 11 80 00 	movb   $0x0,0x80113ec4
80104e34:	0f b6 05 c5 3e 11 80 	movzbl 0x80113ec5,%eax
80104e3b:	83 c8 0f             	or     $0xf,%eax
80104e3e:	a2 c5 3e 11 80       	mov    %al,0x80113ec5
80104e43:	83 e0 ef             	and    $0xffffffef,%eax
80104e46:	a2 c5 3e 11 80       	mov    %al,0x80113ec5
80104e4b:	89 c1                	mov    %eax,%ecx
80104e4d:	83 c9 60             	or     $0x60,%ecx
80104e50:	88 0d c5 3e 11 80    	mov    %cl,0x80113ec5
80104e56:	83 c8 e0             	or     $0xffffffe0,%eax
80104e59:	a2 c5 3e 11 80       	mov    %al,0x80113ec5
80104e5e:	c1 ea 10             	shr    $0x10,%edx
80104e61:	66 89 15 c6 3e 11 80 	mov    %dx,0x80113ec6

  initlock(&tickslock, "time");
80104e68:	83 ec 08             	sub    $0x8,%esp
80104e6b:	68 e1 6d 10 80       	push   $0x80106de1
80104e70:	68 80 3c 11 80       	push   $0x80113c80
80104e75:	e8 8f ec ff ff       	call   80103b09 <initlock>
}
80104e7a:	83 c4 10             	add    $0x10,%esp
80104e7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e80:	c9                   	leave  
80104e81:	c3                   	ret    

80104e82 <idtinit>:
=======
80104d29:	55                   	push   %ebp
80104d2a:	89 e5                	mov    %esp,%ebp
80104d2c:	53                   	push   %ebx
80104d2d:	83 ec 04             	sub    $0x4,%esp
  int i;

  for(i = 0; i < 256; i++)
80104d30:	b8 00 00 00 00       	mov    $0x0,%eax
80104d35:	eb 76                	jmp    80104dad <tvinit+0x84>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80104d37:	8b 0c 85 08 90 10 80 	mov    -0x7fef6ff8(,%eax,4),%ecx
80104d3e:	66 89 0c c5 c0 2c 11 	mov    %cx,-0x7feed340(,%eax,8)
80104d45:	80 
80104d46:	66 c7 04 c5 c2 2c 11 	movw   $0x8,-0x7feed33e(,%eax,8)
80104d4d:	80 08 00 
80104d50:	0f b6 14 c5 c4 2c 11 	movzbl -0x7feed33c(,%eax,8),%edx
80104d57:	80 
80104d58:	83 e2 e0             	and    $0xffffffe0,%edx
80104d5b:	88 14 c5 c4 2c 11 80 	mov    %dl,-0x7feed33c(,%eax,8)
80104d62:	c6 04 c5 c4 2c 11 80 	movb   $0x0,-0x7feed33c(,%eax,8)
80104d69:	00 
80104d6a:	0f b6 14 c5 c5 2c 11 	movzbl -0x7feed33b(,%eax,8),%edx
80104d71:	80 
80104d72:	83 e2 f0             	and    $0xfffffff0,%edx
80104d75:	83 ca 0e             	or     $0xe,%edx
80104d78:	88 14 c5 c5 2c 11 80 	mov    %dl,-0x7feed33b(,%eax,8)
80104d7f:	89 d3                	mov    %edx,%ebx
80104d81:	83 e3 ef             	and    $0xffffffef,%ebx
80104d84:	88 1c c5 c5 2c 11 80 	mov    %bl,-0x7feed33b(,%eax,8)
80104d8b:	83 e2 8f             	and    $0xffffff8f,%edx
80104d8e:	88 14 c5 c5 2c 11 80 	mov    %dl,-0x7feed33b(,%eax,8)
80104d95:	83 ca 80             	or     $0xffffff80,%edx
80104d98:	88 14 c5 c5 2c 11 80 	mov    %dl,-0x7feed33b(,%eax,8)
80104d9f:	c1 e9 10             	shr    $0x10,%ecx
80104da2:	66 89 0c c5 c6 2c 11 	mov    %cx,-0x7feed33a(,%eax,8)
80104da9:	80 
  for(i = 0; i < 256; i++)
80104daa:	83 c0 01             	add    $0x1,%eax
80104dad:	3d ff 00 00 00       	cmp    $0xff,%eax
80104db2:	7e 83                	jle    80104d37 <tvinit+0xe>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80104db4:	8b 15 08 91 10 80    	mov    0x80109108,%edx
80104dba:	66 89 15 c0 2e 11 80 	mov    %dx,0x80112ec0
80104dc1:	66 c7 05 c2 2e 11 80 	movw   $0x8,0x80112ec2
80104dc8:	08 00 
80104dca:	0f b6 05 c4 2e 11 80 	movzbl 0x80112ec4,%eax
80104dd1:	83 e0 e0             	and    $0xffffffe0,%eax
80104dd4:	a2 c4 2e 11 80       	mov    %al,0x80112ec4
80104dd9:	c6 05 c4 2e 11 80 00 	movb   $0x0,0x80112ec4
80104de0:	0f b6 05 c5 2e 11 80 	movzbl 0x80112ec5,%eax
80104de7:	83 c8 0f             	or     $0xf,%eax
80104dea:	a2 c5 2e 11 80       	mov    %al,0x80112ec5
80104def:	83 e0 ef             	and    $0xffffffef,%eax
80104df2:	a2 c5 2e 11 80       	mov    %al,0x80112ec5
80104df7:	89 c1                	mov    %eax,%ecx
80104df9:	83 c9 60             	or     $0x60,%ecx
80104dfc:	88 0d c5 2e 11 80    	mov    %cl,0x80112ec5
80104e02:	83 c8 e0             	or     $0xffffffe0,%eax
80104e05:	a2 c5 2e 11 80       	mov    %al,0x80112ec5
80104e0a:	c1 ea 10             	shr    $0x10,%edx
80104e0d:	66 89 15 c6 2e 11 80 	mov    %dx,0x80112ec6

  initlock(&tickslock, "time");
80104e14:	83 ec 08             	sub    $0x8,%esp
80104e17:	68 a1 6d 10 80       	push   $0x80106da1
80104e1c:	68 80 2c 11 80       	push   $0x80112c80
80104e21:	e8 8f ec ff ff       	call   80103ab5 <initlock>
}
80104e26:	83 c4 10             	add    $0x10,%esp
80104e29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e2c:	c9                   	leave  
80104e2d:	c3                   	ret    

80104e2e <idtinit>:
>>>>>>> d669a6c (ulib and makefile)

void
idtinit(void)
{
<<<<<<< HEAD
80104e82:	55                   	push   %ebp
80104e83:	89 e5                	mov    %esp,%ebp
80104e85:	83 ec 10             	sub    $0x10,%esp
  pd[0] = size-1;
80104e88:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
80104e8e:	b8 c0 3c 11 80       	mov    $0x80113cc0,%eax
80104e93:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80104e97:	c1 e8 10             	shr    $0x10,%eax
80104e9a:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80104e9e:	8d 45 fa             	lea    -0x6(%ebp),%eax
80104ea1:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80104ea4:	c9                   	leave  
80104ea5:	c3                   	ret    

80104ea6 <trap>:
=======
80104e2e:	55                   	push   %ebp
80104e2f:	89 e5                	mov    %esp,%ebp
80104e31:	83 ec 10             	sub    $0x10,%esp
  pd[0] = size-1;
80104e34:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
80104e3a:	b8 c0 2c 11 80       	mov    $0x80112cc0,%eax
80104e3f:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80104e43:	c1 e8 10             	shr    $0x10,%eax
80104e46:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80104e4a:	8d 45 fa             	lea    -0x6(%ebp),%eax
80104e4d:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80104e50:	c9                   	leave  
80104e51:	c3                   	ret    

80104e52 <trap>:
>>>>>>> d669a6c (ulib and makefile)

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
<<<<<<< HEAD
80104ea6:	55                   	push   %ebp
80104ea7:	89 e5                	mov    %esp,%ebp
80104ea9:	57                   	push   %edi
80104eaa:	56                   	push   %esi
80104eab:	53                   	push   %ebx
80104eac:	83 ec 1c             	sub    $0x1c,%esp
80104eaf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80104eb2:	8b 43 30             	mov    0x30(%ebx),%eax
80104eb5:	83 f8 40             	cmp    $0x40,%eax
80104eb8:	74 13                	je     80104ecd <trap+0x27>
=======
80104e52:	55                   	push   %ebp
80104e53:	89 e5                	mov    %esp,%ebp
80104e55:	57                   	push   %edi
80104e56:	56                   	push   %esi
80104e57:	53                   	push   %ebx
80104e58:	83 ec 1c             	sub    $0x1c,%esp
80104e5b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80104e5e:	8b 43 30             	mov    0x30(%ebx),%eax
80104e61:	83 f8 40             	cmp    $0x40,%eax
80104e64:	74 13                	je     80104e79 <trap+0x27>
>>>>>>> d669a6c (ulib and makefile)
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
<<<<<<< HEAD
80104eba:	83 e8 20             	sub    $0x20,%eax
80104ebd:	83 f8 1f             	cmp    $0x1f,%eax
80104ec0:	0f 87 3a 01 00 00    	ja     80105000 <trap+0x15a>
80104ec6:	ff 24 85 88 6e 10 80 	jmp    *-0x7fef9178(,%eax,4)
    if(myproc()->killed)
80104ecd:	e8 e3 e2 ff ff       	call   801031b5 <myproc>
80104ed2:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104ed6:	75 1f                	jne    80104ef7 <trap+0x51>
    myproc()->tf = tf;
80104ed8:	e8 d8 e2 ff ff       	call   801031b5 <myproc>
80104edd:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80104ee0:	e8 1f f1 ff ff       	call   80104004 <syscall>
    if(myproc()->killed)
80104ee5:	e8 cb e2 ff ff       	call   801031b5 <myproc>
80104eea:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104eee:	74 7e                	je     80104f6e <trap+0xc8>
      exit();
80104ef0:	e8 5d e7 ff ff       	call   80103652 <exit>
    return;
80104ef5:	eb 77                	jmp    80104f6e <trap+0xc8>
      exit();
80104ef7:	e8 56 e7 ff ff       	call   80103652 <exit>
80104efc:	eb da                	jmp    80104ed8 <trap+0x32>
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80104efe:	e8 97 e2 ff ff       	call   8010319a <cpuid>
80104f03:	85 c0                	test   %eax,%eax
80104f05:	74 6f                	je     80104f76 <trap+0xd0>
=======
80104e66:	83 e8 20             	sub    $0x20,%eax
80104e69:	83 f8 1f             	cmp    $0x1f,%eax
80104e6c:	0f 87 3a 01 00 00    	ja     80104fac <trap+0x15a>
80104e72:	ff 24 85 48 6e 10 80 	jmp    *-0x7fef91b8(,%eax,4)
    if(myproc()->killed)
80104e79:	e8 37 e3 ff ff       	call   801031b5 <myproc>
80104e7e:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104e82:	75 1f                	jne    80104ea3 <trap+0x51>
    myproc()->tf = tf;
80104e84:	e8 2c e3 ff ff       	call   801031b5 <myproc>
80104e89:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80104e8c:	e8 1f f1 ff ff       	call   80103fb0 <syscall>
    if(myproc()->killed)
80104e91:	e8 1f e3 ff ff       	call   801031b5 <myproc>
80104e96:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104e9a:	74 7e                	je     80104f1a <trap+0xc8>
      exit();
80104e9c:	e8 5d e7 ff ff       	call   801035fe <exit>
    return;
80104ea1:	eb 77                	jmp    80104f1a <trap+0xc8>
      exit();
80104ea3:	e8 56 e7 ff ff       	call   801035fe <exit>
80104ea8:	eb da                	jmp    80104e84 <trap+0x32>
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80104eaa:	e8 eb e2 ff ff       	call   8010319a <cpuid>
80104eaf:	85 c0                	test   %eax,%eax
80104eb1:	74 6f                	je     80104f22 <trap+0xd0>
>>>>>>> d669a6c (ulib and makefile)
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
<<<<<<< HEAD
80104f07:	e8 6a d4 ff ff       	call   80102376 <lapiceoi>
=======
80104eb3:	e8 be d4 ff ff       	call   80102376 <lapiceoi>
>>>>>>> d669a6c (ulib and makefile)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
<<<<<<< HEAD
80104f0c:	e8 a4 e2 ff ff       	call   801031b5 <myproc>
80104f11:	85 c0                	test   %eax,%eax
80104f13:	74 1c                	je     80104f31 <trap+0x8b>
80104f15:	e8 9b e2 ff ff       	call   801031b5 <myproc>
80104f1a:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104f1e:	74 11                	je     80104f31 <trap+0x8b>
80104f20:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104f24:	83 e0 03             	and    $0x3,%eax
80104f27:	66 83 f8 03          	cmp    $0x3,%ax
80104f2b:	0f 84 62 01 00 00    	je     80105093 <trap+0x1ed>
=======
80104eb8:	e8 f8 e2 ff ff       	call   801031b5 <myproc>
80104ebd:	85 c0                	test   %eax,%eax
80104ebf:	74 1c                	je     80104edd <trap+0x8b>
80104ec1:	e8 ef e2 ff ff       	call   801031b5 <myproc>
80104ec6:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104eca:	74 11                	je     80104edd <trap+0x8b>
80104ecc:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104ed0:	83 e0 03             	and    $0x3,%eax
80104ed3:	66 83 f8 03          	cmp    $0x3,%ax
80104ed7:	0f 84 62 01 00 00    	je     8010503f <trap+0x1ed>
>>>>>>> d669a6c (ulib and makefile)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
<<<<<<< HEAD
80104f31:	e8 7f e2 ff ff       	call   801031b5 <myproc>
80104f36:	85 c0                	test   %eax,%eax
80104f38:	74 0f                	je     80104f49 <trap+0xa3>
80104f3a:	e8 76 e2 ff ff       	call   801031b5 <myproc>
80104f3f:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80104f43:	0f 84 54 01 00 00    	je     8010509d <trap+0x1f7>
=======
80104edd:	e8 d3 e2 ff ff       	call   801031b5 <myproc>
80104ee2:	85 c0                	test   %eax,%eax
80104ee4:	74 0f                	je     80104ef5 <trap+0xa3>
80104ee6:	e8 ca e2 ff ff       	call   801031b5 <myproc>
80104eeb:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80104eef:	0f 84 54 01 00 00    	je     80105049 <trap+0x1f7>
>>>>>>> d669a6c (ulib and makefile)
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
<<<<<<< HEAD
80104f49:	e8 67 e2 ff ff       	call   801031b5 <myproc>
80104f4e:	85 c0                	test   %eax,%eax
80104f50:	74 1c                	je     80104f6e <trap+0xc8>
80104f52:	e8 5e e2 ff ff       	call   801031b5 <myproc>
80104f57:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104f5b:	74 11                	je     80104f6e <trap+0xc8>
80104f5d:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104f61:	83 e0 03             	and    $0x3,%eax
80104f64:	66 83 f8 03          	cmp    $0x3,%ax
80104f68:	0f 84 43 01 00 00    	je     801050b1 <trap+0x20b>
    exit();
}
80104f6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f71:	5b                   	pop    %ebx
80104f72:	5e                   	pop    %esi
80104f73:	5f                   	pop    %edi
80104f74:	5d                   	pop    %ebp
80104f75:	c3                   	ret    
      acquire(&tickslock);
80104f76:	83 ec 0c             	sub    $0xc,%esp
80104f79:	68 80 3c 11 80       	push   $0x80113c80
80104f7e:	e8 c2 ec ff ff       	call   80103c45 <acquire>
      ticks++;
80104f83:	83 05 60 3c 11 80 01 	addl   $0x1,0x80113c60
      wakeup(&ticks);
80104f8a:	c7 04 24 60 3c 11 80 	movl   $0x80113c60,(%esp)
80104f91:	e8 19 e9 ff ff       	call   801038af <wakeup>
      release(&tickslock);
80104f96:	c7 04 24 80 3c 11 80 	movl   $0x80113c80,(%esp)
80104f9d:	e8 08 ed ff ff       	call   80103caa <release>
80104fa2:	83 c4 10             	add    $0x10,%esp
80104fa5:	e9 5d ff ff ff       	jmp    80104f07 <trap+0x61>
    ideintr();
80104faa:	e8 ad cd ff ff       	call   80101d5c <ideintr>
    lapiceoi();
80104faf:	e8 c2 d3 ff ff       	call   80102376 <lapiceoi>
    break;
80104fb4:	e9 53 ff ff ff       	jmp    80104f0c <trap+0x66>
    kbdintr();
80104fb9:	e8 02 d2 ff ff       	call   801021c0 <kbdintr>
    lapiceoi();
80104fbe:	e8 b3 d3 ff ff       	call   80102376 <lapiceoi>
    break;
80104fc3:	e9 44 ff ff ff       	jmp    80104f0c <trap+0x66>
    uartintr();
80104fc8:	e8 fe 01 00 00       	call   801051cb <uartintr>
    lapiceoi();
80104fcd:	e8 a4 d3 ff ff       	call   80102376 <lapiceoi>
    break;
80104fd2:	e9 35 ff ff ff       	jmp    80104f0c <trap+0x66>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80104fd7:	8b 7b 38             	mov    0x38(%ebx),%edi
            cpuid(), tf->cs, tf->eip);
80104fda:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80104fde:	e8 b7 e1 ff ff       	call   8010319a <cpuid>
80104fe3:	57                   	push   %edi
80104fe4:	0f b7 f6             	movzwl %si,%esi
80104fe7:	56                   	push   %esi
80104fe8:	50                   	push   %eax
80104fe9:	68 ec 6d 10 80       	push   $0x80106dec
80104fee:	e8 14 b6 ff ff       	call   80100607 <cprintf>
    lapiceoi();
80104ff3:	e8 7e d3 ff ff       	call   80102376 <lapiceoi>
    break;
80104ff8:	83 c4 10             	add    $0x10,%esp
80104ffb:	e9 0c ff ff ff       	jmp    80104f0c <trap+0x66>
    if(myproc() == 0 || (tf->cs&3) == 0){
80105000:	e8 b0 e1 ff ff       	call   801031b5 <myproc>
80105005:	85 c0                	test   %eax,%eax
80105007:	74 5f                	je     80105068 <trap+0x1c2>
80105009:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
8010500d:	74 59                	je     80105068 <trap+0x1c2>
=======
80104ef5:	e8 bb e2 ff ff       	call   801031b5 <myproc>
80104efa:	85 c0                	test   %eax,%eax
80104efc:	74 1c                	je     80104f1a <trap+0xc8>
80104efe:	e8 b2 e2 ff ff       	call   801031b5 <myproc>
80104f03:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104f07:	74 11                	je     80104f1a <trap+0xc8>
80104f09:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104f0d:	83 e0 03             	and    $0x3,%eax
80104f10:	66 83 f8 03          	cmp    $0x3,%ax
80104f14:	0f 84 43 01 00 00    	je     8010505d <trap+0x20b>
    exit();
}
80104f1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f1d:	5b                   	pop    %ebx
80104f1e:	5e                   	pop    %esi
80104f1f:	5f                   	pop    %edi
80104f20:	5d                   	pop    %ebp
80104f21:	c3                   	ret    
      acquire(&tickslock);
80104f22:	83 ec 0c             	sub    $0xc,%esp
80104f25:	68 80 2c 11 80       	push   $0x80112c80
80104f2a:	e8 c2 ec ff ff       	call   80103bf1 <acquire>
      ticks++;
80104f2f:	83 05 60 2c 11 80 01 	addl   $0x1,0x80112c60
      wakeup(&ticks);
80104f36:	c7 04 24 60 2c 11 80 	movl   $0x80112c60,(%esp)
80104f3d:	e8 19 e9 ff ff       	call   8010385b <wakeup>
      release(&tickslock);
80104f42:	c7 04 24 80 2c 11 80 	movl   $0x80112c80,(%esp)
80104f49:	e8 08 ed ff ff       	call   80103c56 <release>
80104f4e:	83 c4 10             	add    $0x10,%esp
80104f51:	e9 5d ff ff ff       	jmp    80104eb3 <trap+0x61>
    ideintr();
80104f56:	e8 01 ce ff ff       	call   80101d5c <ideintr>
    lapiceoi();
80104f5b:	e8 16 d4 ff ff       	call   80102376 <lapiceoi>
    break;
80104f60:	e9 53 ff ff ff       	jmp    80104eb8 <trap+0x66>
    kbdintr();
80104f65:	e8 56 d2 ff ff       	call   801021c0 <kbdintr>
    lapiceoi();
80104f6a:	e8 07 d4 ff ff       	call   80102376 <lapiceoi>
    break;
80104f6f:	e9 44 ff ff ff       	jmp    80104eb8 <trap+0x66>
    uartintr();
80104f74:	e8 fe 01 00 00       	call   80105177 <uartintr>
    lapiceoi();
80104f79:	e8 f8 d3 ff ff       	call   80102376 <lapiceoi>
    break;
80104f7e:	e9 35 ff ff ff       	jmp    80104eb8 <trap+0x66>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80104f83:	8b 7b 38             	mov    0x38(%ebx),%edi
            cpuid(), tf->cs, tf->eip);
80104f86:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80104f8a:	e8 0b e2 ff ff       	call   8010319a <cpuid>
80104f8f:	57                   	push   %edi
80104f90:	0f b7 f6             	movzwl %si,%esi
80104f93:	56                   	push   %esi
80104f94:	50                   	push   %eax
80104f95:	68 ac 6d 10 80       	push   $0x80106dac
80104f9a:	e8 68 b6 ff ff       	call   80100607 <cprintf>
    lapiceoi();
80104f9f:	e8 d2 d3 ff ff       	call   80102376 <lapiceoi>
    break;
80104fa4:	83 c4 10             	add    $0x10,%esp
80104fa7:	e9 0c ff ff ff       	jmp    80104eb8 <trap+0x66>
    if(myproc() == 0 || (tf->cs&3) == 0){
80104fac:	e8 04 e2 ff ff       	call   801031b5 <myproc>
80104fb1:	85 c0                	test   %eax,%eax
80104fb3:	74 5f                	je     80105014 <trap+0x1c2>
80104fb5:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80104fb9:	74 59                	je     80105014 <trap+0x1c2>
>>>>>>> d669a6c (ulib and makefile)

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
<<<<<<< HEAD
8010500f:	0f 20 d7             	mov    %cr2,%edi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105012:	8b 43 38             	mov    0x38(%ebx),%eax
80105015:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105018:	e8 7d e1 ff ff       	call   8010319a <cpuid>
8010501d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105020:	8b 53 34             	mov    0x34(%ebx),%edx
80105023:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105026:	8b 73 30             	mov    0x30(%ebx),%esi
            myproc()->pid, myproc()->name, tf->trapno,
80105029:	e8 87 e1 ff ff       	call   801031b5 <myproc>
8010502e:	8d 48 6c             	lea    0x6c(%eax),%ecx
80105031:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105034:	e8 7c e1 ff ff       	call   801031b5 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105039:	57                   	push   %edi
8010503a:	ff 75 e4             	push   -0x1c(%ebp)
8010503d:	ff 75 e0             	push   -0x20(%ebp)
80105040:	ff 75 dc             	push   -0x24(%ebp)
80105043:	56                   	push   %esi
80105044:	ff 75 d8             	push   -0x28(%ebp)
80105047:	ff 70 10             	push   0x10(%eax)
8010504a:	68 44 6e 10 80       	push   $0x80106e44
8010504f:	e8 b3 b5 ff ff       	call   80100607 <cprintf>
    myproc()->killed = 1;
80105054:	83 c4 20             	add    $0x20,%esp
80105057:	e8 59 e1 ff ff       	call   801031b5 <myproc>
8010505c:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105063:	e9 a4 fe ff ff       	jmp    80104f0c <trap+0x66>
80105068:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010506b:	8b 73 38             	mov    0x38(%ebx),%esi
8010506e:	e8 27 e1 ff ff       	call   8010319a <cpuid>
80105073:	83 ec 0c             	sub    $0xc,%esp
80105076:	57                   	push   %edi
80105077:	56                   	push   %esi
80105078:	50                   	push   %eax
80105079:	ff 73 30             	push   0x30(%ebx)
8010507c:	68 10 6e 10 80       	push   $0x80106e10
80105081:	e8 81 b5 ff ff       	call   80100607 <cprintf>
      panic("trap");
80105086:	83 c4 14             	add    $0x14,%esp
80105089:	68 e6 6d 10 80       	push   $0x80106de6
8010508e:	e8 b5 b2 ff ff       	call   80100348 <panic>
    exit();
80105093:	e8 ba e5 ff ff       	call   80103652 <exit>
80105098:	e9 94 fe ff ff       	jmp    80104f31 <trap+0x8b>
  if(myproc() && myproc()->state == RUNNING &&
8010509d:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801050a1:	0f 85 a2 fe ff ff    	jne    80104f49 <trap+0xa3>
    yield();
801050a7:	e8 6c e6 ff ff       	call   80103718 <yield>
801050ac:	e9 98 fe ff ff       	jmp    80104f49 <trap+0xa3>
    exit();
801050b1:	e8 9c e5 ff ff       	call   80103652 <exit>
801050b6:	e9 b3 fe ff ff       	jmp    80104f6e <trap+0xc8>

801050bb <uartgetc>:
=======
80104fbb:	0f 20 d7             	mov    %cr2,%edi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80104fbe:	8b 43 38             	mov    0x38(%ebx),%eax
80104fc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80104fc4:	e8 d1 e1 ff ff       	call   8010319a <cpuid>
80104fc9:	89 45 e0             	mov    %eax,-0x20(%ebp)
80104fcc:	8b 53 34             	mov    0x34(%ebx),%edx
80104fcf:	89 55 dc             	mov    %edx,-0x24(%ebp)
80104fd2:	8b 73 30             	mov    0x30(%ebx),%esi
            myproc()->pid, myproc()->name, tf->trapno,
80104fd5:	e8 db e1 ff ff       	call   801031b5 <myproc>
80104fda:	8d 48 6c             	lea    0x6c(%eax),%ecx
80104fdd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80104fe0:	e8 d0 e1 ff ff       	call   801031b5 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80104fe5:	57                   	push   %edi
80104fe6:	ff 75 e4             	push   -0x1c(%ebp)
80104fe9:	ff 75 e0             	push   -0x20(%ebp)
80104fec:	ff 75 dc             	push   -0x24(%ebp)
80104fef:	56                   	push   %esi
80104ff0:	ff 75 d8             	push   -0x28(%ebp)
80104ff3:	ff 70 10             	push   0x10(%eax)
80104ff6:	68 04 6e 10 80       	push   $0x80106e04
80104ffb:	e8 07 b6 ff ff       	call   80100607 <cprintf>
    myproc()->killed = 1;
80105000:	83 c4 20             	add    $0x20,%esp
80105003:	e8 ad e1 ff ff       	call   801031b5 <myproc>
80105008:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010500f:	e9 a4 fe ff ff       	jmp    80104eb8 <trap+0x66>
80105014:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105017:	8b 73 38             	mov    0x38(%ebx),%esi
8010501a:	e8 7b e1 ff ff       	call   8010319a <cpuid>
8010501f:	83 ec 0c             	sub    $0xc,%esp
80105022:	57                   	push   %edi
80105023:	56                   	push   %esi
80105024:	50                   	push   %eax
80105025:	ff 73 30             	push   0x30(%ebx)
80105028:	68 d0 6d 10 80       	push   $0x80106dd0
8010502d:	e8 d5 b5 ff ff       	call   80100607 <cprintf>
      panic("trap");
80105032:	83 c4 14             	add    $0x14,%esp
80105035:	68 a6 6d 10 80       	push   $0x80106da6
8010503a:	e8 09 b3 ff ff       	call   80100348 <panic>
    exit();
8010503f:	e8 ba e5 ff ff       	call   801035fe <exit>
80105044:	e9 94 fe ff ff       	jmp    80104edd <trap+0x8b>
  if(myproc() && myproc()->state == RUNNING &&
80105049:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
8010504d:	0f 85 a2 fe ff ff    	jne    80104ef5 <trap+0xa3>
    yield();
80105053:	e8 6c e6 ff ff       	call   801036c4 <yield>
80105058:	e9 98 fe ff ff       	jmp    80104ef5 <trap+0xa3>
    exit();
8010505d:	e8 9c e5 ff ff       	call   801035fe <exit>
80105062:	e9 b3 fe ff ff       	jmp    80104f1a <trap+0xc8>

80105067 <uartgetc>:
>>>>>>> d669a6c (ulib and makefile)
}

static int
uartgetc(void)
{
  if(!uart)
<<<<<<< HEAD
801050bb:	83 3d c0 44 11 80 00 	cmpl   $0x0,0x801144c0
801050c2:	74 14                	je     801050d8 <uartgetc+0x1d>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801050c4:	ba fd 03 00 00       	mov    $0x3fd,%edx
801050c9:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
801050ca:	a8 01                	test   $0x1,%al
801050cc:	74 10                	je     801050de <uartgetc+0x23>
801050ce:	ba f8 03 00 00       	mov    $0x3f8,%edx
801050d3:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
801050d4:	0f b6 c0             	movzbl %al,%eax
801050d7:	c3                   	ret    
    return -1;
801050d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050dd:	c3                   	ret    
    return -1;
801050de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050e3:	c3                   	ret    

801050e4 <uartputc>:
  if(!uart)
801050e4:	83 3d c0 44 11 80 00 	cmpl   $0x0,0x801144c0
801050eb:	74 3b                	je     80105128 <uartputc+0x44>
{
801050ed:	55                   	push   %ebp
801050ee:	89 e5                	mov    %esp,%ebp
801050f0:	53                   	push   %ebx
801050f1:	83 ec 04             	sub    $0x4,%esp
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801050f4:	bb 00 00 00 00       	mov    $0x0,%ebx
801050f9:	eb 10                	jmp    8010510b <uartputc+0x27>
    microdelay(10);
801050fb:	83 ec 0c             	sub    $0xc,%esp
801050fe:	6a 0a                	push   $0xa
80105100:	e8 92 d2 ff ff       	call   80102397 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105105:	83 c3 01             	add    $0x1,%ebx
80105108:	83 c4 10             	add    $0x10,%esp
8010510b:	83 fb 7f             	cmp    $0x7f,%ebx
8010510e:	7f 0a                	jg     8010511a <uartputc+0x36>
80105110:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105115:	ec                   	in     (%dx),%al
80105116:	a8 20                	test   $0x20,%al
80105118:	74 e1                	je     801050fb <uartputc+0x17>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010511a:	8b 45 08             	mov    0x8(%ebp),%eax
8010511d:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105122:	ee                   	out    %al,(%dx)
}
80105123:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105126:	c9                   	leave  
80105127:	c3                   	ret    
80105128:	c3                   	ret    

80105129 <uartinit>:
{
80105129:	55                   	push   %ebp
8010512a:	89 e5                	mov    %esp,%ebp
8010512c:	56                   	push   %esi
8010512d:	53                   	push   %ebx
8010512e:	b9 00 00 00 00       	mov    $0x0,%ecx
80105133:	ba fa 03 00 00       	mov    $0x3fa,%edx
80105138:	89 c8                	mov    %ecx,%eax
8010513a:	ee                   	out    %al,(%dx)
8010513b:	be fb 03 00 00       	mov    $0x3fb,%esi
80105140:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105145:	89 f2                	mov    %esi,%edx
80105147:	ee                   	out    %al,(%dx)
80105148:	b8 0c 00 00 00       	mov    $0xc,%eax
8010514d:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105152:	ee                   	out    %al,(%dx)
80105153:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105158:	89 c8                	mov    %ecx,%eax
8010515a:	89 da                	mov    %ebx,%edx
8010515c:	ee                   	out    %al,(%dx)
8010515d:	b8 03 00 00 00       	mov    $0x3,%eax
80105162:	89 f2                	mov    %esi,%edx
80105164:	ee                   	out    %al,(%dx)
80105165:	ba fc 03 00 00       	mov    $0x3fc,%edx
8010516a:	89 c8                	mov    %ecx,%eax
8010516c:	ee                   	out    %al,(%dx)
8010516d:	b8 01 00 00 00       	mov    $0x1,%eax
80105172:	89 da                	mov    %ebx,%edx
80105174:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105175:	ba fd 03 00 00       	mov    $0x3fd,%edx
8010517a:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
8010517b:	3c ff                	cmp    $0xff,%al
8010517d:	74 45                	je     801051c4 <uartinit+0x9b>
  uart = 1;
8010517f:	c7 05 c0 44 11 80 01 	movl   $0x1,0x801144c0
80105186:	00 00 00 
80105189:	ba fa 03 00 00       	mov    $0x3fa,%edx
8010518e:	ec                   	in     (%dx),%al
8010518f:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105194:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105195:	83 ec 08             	sub    $0x8,%esp
80105198:	6a 00                	push   $0x0
8010519a:	6a 04                	push   $0x4
8010519c:	e8 c0 cd ff ff       	call   80101f61 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
801051a1:	83 c4 10             	add    $0x10,%esp
801051a4:	bb 08 6f 10 80       	mov    $0x80106f08,%ebx
801051a9:	eb 12                	jmp    801051bd <uartinit+0x94>
    uartputc(*p);
801051ab:	83 ec 0c             	sub    $0xc,%esp
801051ae:	0f be c0             	movsbl %al,%eax
801051b1:	50                   	push   %eax
801051b2:	e8 2d ff ff ff       	call   801050e4 <uartputc>
  for(p="xv6...\n"; *p; p++)
801051b7:	83 c3 01             	add    $0x1,%ebx
801051ba:	83 c4 10             	add    $0x10,%esp
801051bd:	0f b6 03             	movzbl (%ebx),%eax
801051c0:	84 c0                	test   %al,%al
801051c2:	75 e7                	jne    801051ab <uartinit+0x82>
}
801051c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801051c7:	5b                   	pop    %ebx
801051c8:	5e                   	pop    %esi
801051c9:	5d                   	pop    %ebp
801051ca:	c3                   	ret    

801051cb <uartintr>:
=======
80105067:	83 3d c0 34 11 80 00 	cmpl   $0x0,0x801134c0
8010506e:	74 14                	je     80105084 <uartgetc+0x1d>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105070:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105075:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105076:	a8 01                	test   $0x1,%al
80105078:	74 10                	je     8010508a <uartgetc+0x23>
8010507a:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010507f:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105080:	0f b6 c0             	movzbl %al,%eax
80105083:	c3                   	ret    
    return -1;
80105084:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105089:	c3                   	ret    
    return -1;
8010508a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010508f:	c3                   	ret    

80105090 <uartputc>:
  if(!uart)
80105090:	83 3d c0 34 11 80 00 	cmpl   $0x0,0x801134c0
80105097:	74 3b                	je     801050d4 <uartputc+0x44>
{
80105099:	55                   	push   %ebp
8010509a:	89 e5                	mov    %esp,%ebp
8010509c:	53                   	push   %ebx
8010509d:	83 ec 04             	sub    $0x4,%esp
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801050a0:	bb 00 00 00 00       	mov    $0x0,%ebx
801050a5:	eb 10                	jmp    801050b7 <uartputc+0x27>
    microdelay(10);
801050a7:	83 ec 0c             	sub    $0xc,%esp
801050aa:	6a 0a                	push   $0xa
801050ac:	e8 e6 d2 ff ff       	call   80102397 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801050b1:	83 c3 01             	add    $0x1,%ebx
801050b4:	83 c4 10             	add    $0x10,%esp
801050b7:	83 fb 7f             	cmp    $0x7f,%ebx
801050ba:	7f 0a                	jg     801050c6 <uartputc+0x36>
801050bc:	ba fd 03 00 00       	mov    $0x3fd,%edx
801050c1:	ec                   	in     (%dx),%al
801050c2:	a8 20                	test   $0x20,%al
801050c4:	74 e1                	je     801050a7 <uartputc+0x17>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801050c6:	8b 45 08             	mov    0x8(%ebp),%eax
801050c9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801050ce:	ee                   	out    %al,(%dx)
}
801050cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801050d2:	c9                   	leave  
801050d3:	c3                   	ret    
801050d4:	c3                   	ret    

801050d5 <uartinit>:
{
801050d5:	55                   	push   %ebp
801050d6:	89 e5                	mov    %esp,%ebp
801050d8:	56                   	push   %esi
801050d9:	53                   	push   %ebx
801050da:	b9 00 00 00 00       	mov    $0x0,%ecx
801050df:	ba fa 03 00 00       	mov    $0x3fa,%edx
801050e4:	89 c8                	mov    %ecx,%eax
801050e6:	ee                   	out    %al,(%dx)
801050e7:	be fb 03 00 00       	mov    $0x3fb,%esi
801050ec:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801050f1:	89 f2                	mov    %esi,%edx
801050f3:	ee                   	out    %al,(%dx)
801050f4:	b8 0c 00 00 00       	mov    $0xc,%eax
801050f9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801050fe:	ee                   	out    %al,(%dx)
801050ff:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105104:	89 c8                	mov    %ecx,%eax
80105106:	89 da                	mov    %ebx,%edx
80105108:	ee                   	out    %al,(%dx)
80105109:	b8 03 00 00 00       	mov    $0x3,%eax
8010510e:	89 f2                	mov    %esi,%edx
80105110:	ee                   	out    %al,(%dx)
80105111:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105116:	89 c8                	mov    %ecx,%eax
80105118:	ee                   	out    %al,(%dx)
80105119:	b8 01 00 00 00       	mov    $0x1,%eax
8010511e:	89 da                	mov    %ebx,%edx
80105120:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105121:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105126:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105127:	3c ff                	cmp    $0xff,%al
80105129:	74 45                	je     80105170 <uartinit+0x9b>
  uart = 1;
8010512b:	c7 05 c0 34 11 80 01 	movl   $0x1,0x801134c0
80105132:	00 00 00 
80105135:	ba fa 03 00 00       	mov    $0x3fa,%edx
8010513a:	ec                   	in     (%dx),%al
8010513b:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105140:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105141:	83 ec 08             	sub    $0x8,%esp
80105144:	6a 00                	push   $0x0
80105146:	6a 04                	push   $0x4
80105148:	e8 14 ce ff ff       	call   80101f61 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
8010514d:	83 c4 10             	add    $0x10,%esp
80105150:	bb c8 6e 10 80       	mov    $0x80106ec8,%ebx
80105155:	eb 12                	jmp    80105169 <uartinit+0x94>
    uartputc(*p);
80105157:	83 ec 0c             	sub    $0xc,%esp
8010515a:	0f be c0             	movsbl %al,%eax
8010515d:	50                   	push   %eax
8010515e:	e8 2d ff ff ff       	call   80105090 <uartputc>
  for(p="xv6...\n"; *p; p++)
80105163:	83 c3 01             	add    $0x1,%ebx
80105166:	83 c4 10             	add    $0x10,%esp
80105169:	0f b6 03             	movzbl (%ebx),%eax
8010516c:	84 c0                	test   %al,%al
8010516e:	75 e7                	jne    80105157 <uartinit+0x82>
}
80105170:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105173:	5b                   	pop    %ebx
80105174:	5e                   	pop    %esi
80105175:	5d                   	pop    %ebp
80105176:	c3                   	ret    

80105177 <uartintr>:
>>>>>>> d669a6c (ulib and makefile)

void
uartintr(void)
{
<<<<<<< HEAD
801051cb:	55                   	push   %ebp
801051cc:	89 e5                	mov    %esp,%ebp
801051ce:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
801051d1:	68 bb 50 10 80       	push   $0x801050bb
801051d6:	e8 58 b5 ff ff       	call   80100733 <consoleintr>
}
801051db:	83 c4 10             	add    $0x10,%esp
801051de:	c9                   	leave  
801051df:	c3                   	ret    

801051e0 <vector0>:
=======
80105177:	55                   	push   %ebp
80105178:	89 e5                	mov    %esp,%ebp
8010517a:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
8010517d:	68 67 50 10 80       	push   $0x80105067
80105182:	e8 ac b5 ff ff       	call   80100733 <consoleintr>
}
80105187:	83 c4 10             	add    $0x10,%esp
8010518a:	c9                   	leave  
8010518b:	c3                   	ret    

8010518c <vector0>:
>>>>>>> d669a6c (ulib and makefile)
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
<<<<<<< HEAD
801051e0:	6a 00                	push   $0x0
  pushl $0
801051e2:	6a 00                	push   $0x0
  jmp alltraps
801051e4:	e9 71 fb ff ff       	jmp    80104d5a <alltraps>

801051e9 <vector1>:
.globl vector1
vector1:
  pushl $0
801051e9:	6a 00                	push   $0x0
  pushl $1
801051eb:	6a 01                	push   $0x1
  jmp alltraps
801051ed:	e9 68 fb ff ff       	jmp    80104d5a <alltraps>

801051f2 <vector2>:
.globl vector2
vector2:
  pushl $0
801051f2:	6a 00                	push   $0x0
  pushl $2
801051f4:	6a 02                	push   $0x2
  jmp alltraps
801051f6:	e9 5f fb ff ff       	jmp    80104d5a <alltraps>

801051fb <vector3>:
.globl vector3
vector3:
  pushl $0
801051fb:	6a 00                	push   $0x0
  pushl $3
801051fd:	6a 03                	push   $0x3
  jmp alltraps
801051ff:	e9 56 fb ff ff       	jmp    80104d5a <alltraps>

80105204 <vector4>:
.globl vector4
vector4:
  pushl $0
80105204:	6a 00                	push   $0x0
  pushl $4
80105206:	6a 04                	push   $0x4
  jmp alltraps
80105208:	e9 4d fb ff ff       	jmp    80104d5a <alltraps>

8010520d <vector5>:
.globl vector5
vector5:
  pushl $0
8010520d:	6a 00                	push   $0x0
  pushl $5
8010520f:	6a 05                	push   $0x5
  jmp alltraps
80105211:	e9 44 fb ff ff       	jmp    80104d5a <alltraps>

80105216 <vector6>:
.globl vector6
vector6:
  pushl $0
80105216:	6a 00                	push   $0x0
  pushl $6
80105218:	6a 06                	push   $0x6
  jmp alltraps
8010521a:	e9 3b fb ff ff       	jmp    80104d5a <alltraps>

8010521f <vector7>:
.globl vector7
vector7:
  pushl $0
8010521f:	6a 00                	push   $0x0
  pushl $7
80105221:	6a 07                	push   $0x7
  jmp alltraps
80105223:	e9 32 fb ff ff       	jmp    80104d5a <alltraps>

80105228 <vector8>:
.globl vector8
vector8:
  pushl $8
80105228:	6a 08                	push   $0x8
  jmp alltraps
8010522a:	e9 2b fb ff ff       	jmp    80104d5a <alltraps>

8010522f <vector9>:
.globl vector9
vector9:
  pushl $0
8010522f:	6a 00                	push   $0x0
  pushl $9
80105231:	6a 09                	push   $0x9
  jmp alltraps
80105233:	e9 22 fb ff ff       	jmp    80104d5a <alltraps>

80105238 <vector10>:
.globl vector10
vector10:
  pushl $10
80105238:	6a 0a                	push   $0xa
  jmp alltraps
8010523a:	e9 1b fb ff ff       	jmp    80104d5a <alltraps>

8010523f <vector11>:
.globl vector11
vector11:
  pushl $11
8010523f:	6a 0b                	push   $0xb
  jmp alltraps
80105241:	e9 14 fb ff ff       	jmp    80104d5a <alltraps>

80105246 <vector12>:
.globl vector12
vector12:
  pushl $12
80105246:	6a 0c                	push   $0xc
  jmp alltraps
80105248:	e9 0d fb ff ff       	jmp    80104d5a <alltraps>

8010524d <vector13>:
.globl vector13
vector13:
  pushl $13
8010524d:	6a 0d                	push   $0xd
  jmp alltraps
8010524f:	e9 06 fb ff ff       	jmp    80104d5a <alltraps>

80105254 <vector14>:
.globl vector14
vector14:
  pushl $14
80105254:	6a 0e                	push   $0xe
  jmp alltraps
80105256:	e9 ff fa ff ff       	jmp    80104d5a <alltraps>

8010525b <vector15>:
.globl vector15
vector15:
  pushl $0
8010525b:	6a 00                	push   $0x0
  pushl $15
8010525d:	6a 0f                	push   $0xf
  jmp alltraps
8010525f:	e9 f6 fa ff ff       	jmp    80104d5a <alltraps>

80105264 <vector16>:
.globl vector16
vector16:
  pushl $0
80105264:	6a 00                	push   $0x0
  pushl $16
80105266:	6a 10                	push   $0x10
  jmp alltraps
80105268:	e9 ed fa ff ff       	jmp    80104d5a <alltraps>

8010526d <vector17>:
.globl vector17
vector17:
  pushl $17
8010526d:	6a 11                	push   $0x11
  jmp alltraps
8010526f:	e9 e6 fa ff ff       	jmp    80104d5a <alltraps>

80105274 <vector18>:
.globl vector18
vector18:
  pushl $0
80105274:	6a 00                	push   $0x0
  pushl $18
80105276:	6a 12                	push   $0x12
  jmp alltraps
80105278:	e9 dd fa ff ff       	jmp    80104d5a <alltraps>

8010527d <vector19>:
.globl vector19
vector19:
  pushl $0
8010527d:	6a 00                	push   $0x0
  pushl $19
8010527f:	6a 13                	push   $0x13
  jmp alltraps
80105281:	e9 d4 fa ff ff       	jmp    80104d5a <alltraps>

80105286 <vector20>:
.globl vector20
vector20:
  pushl $0
80105286:	6a 00                	push   $0x0
  pushl $20
80105288:	6a 14                	push   $0x14
  jmp alltraps
8010528a:	e9 cb fa ff ff       	jmp    80104d5a <alltraps>

8010528f <vector21>:
.globl vector21
vector21:
  pushl $0
8010528f:	6a 00                	push   $0x0
  pushl $21
80105291:	6a 15                	push   $0x15
  jmp alltraps
80105293:	e9 c2 fa ff ff       	jmp    80104d5a <alltraps>

80105298 <vector22>:
.globl vector22
vector22:
  pushl $0
80105298:	6a 00                	push   $0x0
  pushl $22
8010529a:	6a 16                	push   $0x16
  jmp alltraps
8010529c:	e9 b9 fa ff ff       	jmp    80104d5a <alltraps>

801052a1 <vector23>:
.globl vector23
vector23:
  pushl $0
801052a1:	6a 00                	push   $0x0
  pushl $23
801052a3:	6a 17                	push   $0x17
  jmp alltraps
801052a5:	e9 b0 fa ff ff       	jmp    80104d5a <alltraps>

801052aa <vector24>:
.globl vector24
vector24:
  pushl $0
801052aa:	6a 00                	push   $0x0
  pushl $24
801052ac:	6a 18                	push   $0x18
  jmp alltraps
801052ae:	e9 a7 fa ff ff       	jmp    80104d5a <alltraps>

801052b3 <vector25>:
.globl vector25
vector25:
  pushl $0
801052b3:	6a 00                	push   $0x0
  pushl $25
801052b5:	6a 19                	push   $0x19
  jmp alltraps
801052b7:	e9 9e fa ff ff       	jmp    80104d5a <alltraps>

801052bc <vector26>:
.globl vector26
vector26:
  pushl $0
801052bc:	6a 00                	push   $0x0
  pushl $26
801052be:	6a 1a                	push   $0x1a
  jmp alltraps
801052c0:	e9 95 fa ff ff       	jmp    80104d5a <alltraps>

801052c5 <vector27>:
.globl vector27
vector27:
  pushl $0
801052c5:	6a 00                	push   $0x0
  pushl $27
801052c7:	6a 1b                	push   $0x1b
  jmp alltraps
801052c9:	e9 8c fa ff ff       	jmp    80104d5a <alltraps>

801052ce <vector28>:
.globl vector28
vector28:
  pushl $0
801052ce:	6a 00                	push   $0x0
  pushl $28
801052d0:	6a 1c                	push   $0x1c
  jmp alltraps
801052d2:	e9 83 fa ff ff       	jmp    80104d5a <alltraps>

801052d7 <vector29>:
.globl vector29
vector29:
  pushl $0
801052d7:	6a 00                	push   $0x0
  pushl $29
801052d9:	6a 1d                	push   $0x1d
  jmp alltraps
801052db:	e9 7a fa ff ff       	jmp    80104d5a <alltraps>

801052e0 <vector30>:
.globl vector30
vector30:
  pushl $0
801052e0:	6a 00                	push   $0x0
  pushl $30
801052e2:	6a 1e                	push   $0x1e
  jmp alltraps
801052e4:	e9 71 fa ff ff       	jmp    80104d5a <alltraps>

801052e9 <vector31>:
.globl vector31
vector31:
  pushl $0
801052e9:	6a 00                	push   $0x0
  pushl $31
801052eb:	6a 1f                	push   $0x1f
  jmp alltraps
801052ed:	e9 68 fa ff ff       	jmp    80104d5a <alltraps>

801052f2 <vector32>:
.globl vector32
vector32:
  pushl $0
801052f2:	6a 00                	push   $0x0
  pushl $32
801052f4:	6a 20                	push   $0x20
  jmp alltraps
801052f6:	e9 5f fa ff ff       	jmp    80104d5a <alltraps>

801052fb <vector33>:
.globl vector33
vector33:
  pushl $0
801052fb:	6a 00                	push   $0x0
  pushl $33
801052fd:	6a 21                	push   $0x21
  jmp alltraps
801052ff:	e9 56 fa ff ff       	jmp    80104d5a <alltraps>

80105304 <vector34>:
.globl vector34
vector34:
  pushl $0
80105304:	6a 00                	push   $0x0
  pushl $34
80105306:	6a 22                	push   $0x22
  jmp alltraps
80105308:	e9 4d fa ff ff       	jmp    80104d5a <alltraps>

8010530d <vector35>:
.globl vector35
vector35:
  pushl $0
8010530d:	6a 00                	push   $0x0
  pushl $35
8010530f:	6a 23                	push   $0x23
  jmp alltraps
80105311:	e9 44 fa ff ff       	jmp    80104d5a <alltraps>

80105316 <vector36>:
.globl vector36
vector36:
  pushl $0
80105316:	6a 00                	push   $0x0
  pushl $36
80105318:	6a 24                	push   $0x24
  jmp alltraps
8010531a:	e9 3b fa ff ff       	jmp    80104d5a <alltraps>

8010531f <vector37>:
.globl vector37
vector37:
  pushl $0
8010531f:	6a 00                	push   $0x0
  pushl $37
80105321:	6a 25                	push   $0x25
  jmp alltraps
80105323:	e9 32 fa ff ff       	jmp    80104d5a <alltraps>

80105328 <vector38>:
.globl vector38
vector38:
  pushl $0
80105328:	6a 00                	push   $0x0
  pushl $38
8010532a:	6a 26                	push   $0x26
  jmp alltraps
8010532c:	e9 29 fa ff ff       	jmp    80104d5a <alltraps>

80105331 <vector39>:
.globl vector39
vector39:
  pushl $0
80105331:	6a 00                	push   $0x0
  pushl $39
80105333:	6a 27                	push   $0x27
  jmp alltraps
80105335:	e9 20 fa ff ff       	jmp    80104d5a <alltraps>

8010533a <vector40>:
.globl vector40
vector40:
  pushl $0
8010533a:	6a 00                	push   $0x0
  pushl $40
8010533c:	6a 28                	push   $0x28
  jmp alltraps
8010533e:	e9 17 fa ff ff       	jmp    80104d5a <alltraps>

80105343 <vector41>:
.globl vector41
vector41:
  pushl $0
80105343:	6a 00                	push   $0x0
  pushl $41
80105345:	6a 29                	push   $0x29
  jmp alltraps
80105347:	e9 0e fa ff ff       	jmp    80104d5a <alltraps>

8010534c <vector42>:
.globl vector42
vector42:
  pushl $0
8010534c:	6a 00                	push   $0x0
  pushl $42
8010534e:	6a 2a                	push   $0x2a
  jmp alltraps
80105350:	e9 05 fa ff ff       	jmp    80104d5a <alltraps>

80105355 <vector43>:
.globl vector43
vector43:
  pushl $0
80105355:	6a 00                	push   $0x0
  pushl $43
80105357:	6a 2b                	push   $0x2b
  jmp alltraps
80105359:	e9 fc f9 ff ff       	jmp    80104d5a <alltraps>

8010535e <vector44>:
.globl vector44
vector44:
  pushl $0
8010535e:	6a 00                	push   $0x0
  pushl $44
80105360:	6a 2c                	push   $0x2c
  jmp alltraps
80105362:	e9 f3 f9 ff ff       	jmp    80104d5a <alltraps>

80105367 <vector45>:
.globl vector45
vector45:
  pushl $0
80105367:	6a 00                	push   $0x0
  pushl $45
80105369:	6a 2d                	push   $0x2d
  jmp alltraps
8010536b:	e9 ea f9 ff ff       	jmp    80104d5a <alltraps>

80105370 <vector46>:
.globl vector46
vector46:
  pushl $0
80105370:	6a 00                	push   $0x0
  pushl $46
80105372:	6a 2e                	push   $0x2e
  jmp alltraps
80105374:	e9 e1 f9 ff ff       	jmp    80104d5a <alltraps>

80105379 <vector47>:
.globl vector47
vector47:
  pushl $0
80105379:	6a 00                	push   $0x0
  pushl $47
8010537b:	6a 2f                	push   $0x2f
  jmp alltraps
8010537d:	e9 d8 f9 ff ff       	jmp    80104d5a <alltraps>

80105382 <vector48>:
.globl vector48
vector48:
  pushl $0
80105382:	6a 00                	push   $0x0
  pushl $48
80105384:	6a 30                	push   $0x30
  jmp alltraps
80105386:	e9 cf f9 ff ff       	jmp    80104d5a <alltraps>

8010538b <vector49>:
.globl vector49
vector49:
  pushl $0
8010538b:	6a 00                	push   $0x0
  pushl $49
8010538d:	6a 31                	push   $0x31
  jmp alltraps
8010538f:	e9 c6 f9 ff ff       	jmp    80104d5a <alltraps>

80105394 <vector50>:
.globl vector50
vector50:
  pushl $0
80105394:	6a 00                	push   $0x0
  pushl $50
80105396:	6a 32                	push   $0x32
  jmp alltraps
80105398:	e9 bd f9 ff ff       	jmp    80104d5a <alltraps>

8010539d <vector51>:
.globl vector51
vector51:
  pushl $0
8010539d:	6a 00                	push   $0x0
  pushl $51
8010539f:	6a 33                	push   $0x33
  jmp alltraps
801053a1:	e9 b4 f9 ff ff       	jmp    80104d5a <alltraps>

801053a6 <vector52>:
.globl vector52
vector52:
  pushl $0
801053a6:	6a 00                	push   $0x0
  pushl $52
801053a8:	6a 34                	push   $0x34
  jmp alltraps
801053aa:	e9 ab f9 ff ff       	jmp    80104d5a <alltraps>

801053af <vector53>:
.globl vector53
vector53:
  pushl $0
801053af:	6a 00                	push   $0x0
  pushl $53
801053b1:	6a 35                	push   $0x35
  jmp alltraps
801053b3:	e9 a2 f9 ff ff       	jmp    80104d5a <alltraps>

801053b8 <vector54>:
.globl vector54
vector54:
  pushl $0
801053b8:	6a 00                	push   $0x0
  pushl $54
801053ba:	6a 36                	push   $0x36
  jmp alltraps
801053bc:	e9 99 f9 ff ff       	jmp    80104d5a <alltraps>

801053c1 <vector55>:
.globl vector55
vector55:
  pushl $0
801053c1:	6a 00                	push   $0x0
  pushl $55
801053c3:	6a 37                	push   $0x37
  jmp alltraps
801053c5:	e9 90 f9 ff ff       	jmp    80104d5a <alltraps>

801053ca <vector56>:
.globl vector56
vector56:
  pushl $0
801053ca:	6a 00                	push   $0x0
  pushl $56
801053cc:	6a 38                	push   $0x38
  jmp alltraps
801053ce:	e9 87 f9 ff ff       	jmp    80104d5a <alltraps>

801053d3 <vector57>:
.globl vector57
vector57:
  pushl $0
801053d3:	6a 00                	push   $0x0
  pushl $57
801053d5:	6a 39                	push   $0x39
  jmp alltraps
801053d7:	e9 7e f9 ff ff       	jmp    80104d5a <alltraps>

801053dc <vector58>:
.globl vector58
vector58:
  pushl $0
801053dc:	6a 00                	push   $0x0
  pushl $58
801053de:	6a 3a                	push   $0x3a
  jmp alltraps
801053e0:	e9 75 f9 ff ff       	jmp    80104d5a <alltraps>

801053e5 <vector59>:
.globl vector59
vector59:
  pushl $0
801053e5:	6a 00                	push   $0x0
  pushl $59
801053e7:	6a 3b                	push   $0x3b
  jmp alltraps
801053e9:	e9 6c f9 ff ff       	jmp    80104d5a <alltraps>

801053ee <vector60>:
.globl vector60
vector60:
  pushl $0
801053ee:	6a 00                	push   $0x0
  pushl $60
801053f0:	6a 3c                	push   $0x3c
  jmp alltraps
801053f2:	e9 63 f9 ff ff       	jmp    80104d5a <alltraps>

801053f7 <vector61>:
.globl vector61
vector61:
  pushl $0
801053f7:	6a 00                	push   $0x0
  pushl $61
801053f9:	6a 3d                	push   $0x3d
  jmp alltraps
801053fb:	e9 5a f9 ff ff       	jmp    80104d5a <alltraps>

80105400 <vector62>:
.globl vector62
vector62:
  pushl $0
80105400:	6a 00                	push   $0x0
  pushl $62
80105402:	6a 3e                	push   $0x3e
  jmp alltraps
80105404:	e9 51 f9 ff ff       	jmp    80104d5a <alltraps>

80105409 <vector63>:
.globl vector63
vector63:
  pushl $0
80105409:	6a 00                	push   $0x0
  pushl $63
8010540b:	6a 3f                	push   $0x3f
  jmp alltraps
8010540d:	e9 48 f9 ff ff       	jmp    80104d5a <alltraps>

80105412 <vector64>:
.globl vector64
vector64:
  pushl $0
80105412:	6a 00                	push   $0x0
  pushl $64
80105414:	6a 40                	push   $0x40
  jmp alltraps
80105416:	e9 3f f9 ff ff       	jmp    80104d5a <alltraps>

8010541b <vector65>:
.globl vector65
vector65:
  pushl $0
8010541b:	6a 00                	push   $0x0
  pushl $65
8010541d:	6a 41                	push   $0x41
  jmp alltraps
8010541f:	e9 36 f9 ff ff       	jmp    80104d5a <alltraps>

80105424 <vector66>:
.globl vector66
vector66:
  pushl $0
80105424:	6a 00                	push   $0x0
  pushl $66
80105426:	6a 42                	push   $0x42
  jmp alltraps
80105428:	e9 2d f9 ff ff       	jmp    80104d5a <alltraps>

8010542d <vector67>:
.globl vector67
vector67:
  pushl $0
8010542d:	6a 00                	push   $0x0
  pushl $67
8010542f:	6a 43                	push   $0x43
  jmp alltraps
80105431:	e9 24 f9 ff ff       	jmp    80104d5a <alltraps>

80105436 <vector68>:
.globl vector68
vector68:
  pushl $0
80105436:	6a 00                	push   $0x0
  pushl $68
80105438:	6a 44                	push   $0x44
  jmp alltraps
8010543a:	e9 1b f9 ff ff       	jmp    80104d5a <alltraps>

8010543f <vector69>:
.globl vector69
vector69:
  pushl $0
8010543f:	6a 00                	push   $0x0
  pushl $69
80105441:	6a 45                	push   $0x45
  jmp alltraps
80105443:	e9 12 f9 ff ff       	jmp    80104d5a <alltraps>

80105448 <vector70>:
.globl vector70
vector70:
  pushl $0
80105448:	6a 00                	push   $0x0
  pushl $70
8010544a:	6a 46                	push   $0x46
  jmp alltraps
8010544c:	e9 09 f9 ff ff       	jmp    80104d5a <alltraps>

80105451 <vector71>:
.globl vector71
vector71:
  pushl $0
80105451:	6a 00                	push   $0x0
  pushl $71
80105453:	6a 47                	push   $0x47
  jmp alltraps
80105455:	e9 00 f9 ff ff       	jmp    80104d5a <alltraps>

8010545a <vector72>:
.globl vector72
vector72:
  pushl $0
8010545a:	6a 00                	push   $0x0
  pushl $72
8010545c:	6a 48                	push   $0x48
  jmp alltraps
8010545e:	e9 f7 f8 ff ff       	jmp    80104d5a <alltraps>

80105463 <vector73>:
.globl vector73
vector73:
  pushl $0
80105463:	6a 00                	push   $0x0
  pushl $73
80105465:	6a 49                	push   $0x49
  jmp alltraps
80105467:	e9 ee f8 ff ff       	jmp    80104d5a <alltraps>

8010546c <vector74>:
.globl vector74
vector74:
  pushl $0
8010546c:	6a 00                	push   $0x0
  pushl $74
8010546e:	6a 4a                	push   $0x4a
  jmp alltraps
80105470:	e9 e5 f8 ff ff       	jmp    80104d5a <alltraps>

80105475 <vector75>:
.globl vector75
vector75:
  pushl $0
80105475:	6a 00                	push   $0x0
  pushl $75
80105477:	6a 4b                	push   $0x4b
  jmp alltraps
80105479:	e9 dc f8 ff ff       	jmp    80104d5a <alltraps>

8010547e <vector76>:
.globl vector76
vector76:
  pushl $0
8010547e:	6a 00                	push   $0x0
  pushl $76
80105480:	6a 4c                	push   $0x4c
  jmp alltraps
80105482:	e9 d3 f8 ff ff       	jmp    80104d5a <alltraps>

80105487 <vector77>:
.globl vector77
vector77:
  pushl $0
80105487:	6a 00                	push   $0x0
  pushl $77
80105489:	6a 4d                	push   $0x4d
  jmp alltraps
8010548b:	e9 ca f8 ff ff       	jmp    80104d5a <alltraps>

80105490 <vector78>:
.globl vector78
vector78:
  pushl $0
80105490:	6a 00                	push   $0x0
  pushl $78
80105492:	6a 4e                	push   $0x4e
  jmp alltraps
80105494:	e9 c1 f8 ff ff       	jmp    80104d5a <alltraps>

80105499 <vector79>:
.globl vector79
vector79:
  pushl $0
80105499:	6a 00                	push   $0x0
  pushl $79
8010549b:	6a 4f                	push   $0x4f
  jmp alltraps
8010549d:	e9 b8 f8 ff ff       	jmp    80104d5a <alltraps>

801054a2 <vector80>:
.globl vector80
vector80:
  pushl $0
801054a2:	6a 00                	push   $0x0
  pushl $80
801054a4:	6a 50                	push   $0x50
  jmp alltraps
801054a6:	e9 af f8 ff ff       	jmp    80104d5a <alltraps>

801054ab <vector81>:
.globl vector81
vector81:
  pushl $0
801054ab:	6a 00                	push   $0x0
  pushl $81
801054ad:	6a 51                	push   $0x51
  jmp alltraps
801054af:	e9 a6 f8 ff ff       	jmp    80104d5a <alltraps>

801054b4 <vector82>:
.globl vector82
vector82:
  pushl $0
801054b4:	6a 00                	push   $0x0
  pushl $82
801054b6:	6a 52                	push   $0x52
  jmp alltraps
801054b8:	e9 9d f8 ff ff       	jmp    80104d5a <alltraps>

801054bd <vector83>:
.globl vector83
vector83:
  pushl $0
801054bd:	6a 00                	push   $0x0
  pushl $83
801054bf:	6a 53                	push   $0x53
  jmp alltraps
801054c1:	e9 94 f8 ff ff       	jmp    80104d5a <alltraps>

801054c6 <vector84>:
.globl vector84
vector84:
  pushl $0
801054c6:	6a 00                	push   $0x0
  pushl $84
801054c8:	6a 54                	push   $0x54
  jmp alltraps
801054ca:	e9 8b f8 ff ff       	jmp    80104d5a <alltraps>

801054cf <vector85>:
.globl vector85
vector85:
  pushl $0
801054cf:	6a 00                	push   $0x0
  pushl $85
801054d1:	6a 55                	push   $0x55
  jmp alltraps
801054d3:	e9 82 f8 ff ff       	jmp    80104d5a <alltraps>

801054d8 <vector86>:
.globl vector86
vector86:
  pushl $0
801054d8:	6a 00                	push   $0x0
  pushl $86
801054da:	6a 56                	push   $0x56
  jmp alltraps
801054dc:	e9 79 f8 ff ff       	jmp    80104d5a <alltraps>

801054e1 <vector87>:
.globl vector87
vector87:
  pushl $0
801054e1:	6a 00                	push   $0x0
  pushl $87
801054e3:	6a 57                	push   $0x57
  jmp alltraps
801054e5:	e9 70 f8 ff ff       	jmp    80104d5a <alltraps>

801054ea <vector88>:
.globl vector88
vector88:
  pushl $0
801054ea:	6a 00                	push   $0x0
  pushl $88
801054ec:	6a 58                	push   $0x58
  jmp alltraps
801054ee:	e9 67 f8 ff ff       	jmp    80104d5a <alltraps>

801054f3 <vector89>:
.globl vector89
vector89:
  pushl $0
801054f3:	6a 00                	push   $0x0
  pushl $89
801054f5:	6a 59                	push   $0x59
  jmp alltraps
801054f7:	e9 5e f8 ff ff       	jmp    80104d5a <alltraps>

801054fc <vector90>:
.globl vector90
vector90:
  pushl $0
801054fc:	6a 00                	push   $0x0
  pushl $90
801054fe:	6a 5a                	push   $0x5a
  jmp alltraps
80105500:	e9 55 f8 ff ff       	jmp    80104d5a <alltraps>

80105505 <vector91>:
.globl vector91
vector91:
  pushl $0
80105505:	6a 00                	push   $0x0
  pushl $91
80105507:	6a 5b                	push   $0x5b
  jmp alltraps
80105509:	e9 4c f8 ff ff       	jmp    80104d5a <alltraps>

8010550e <vector92>:
.globl vector92
vector92:
  pushl $0
8010550e:	6a 00                	push   $0x0
  pushl $92
80105510:	6a 5c                	push   $0x5c
  jmp alltraps
80105512:	e9 43 f8 ff ff       	jmp    80104d5a <alltraps>

80105517 <vector93>:
.globl vector93
vector93:
  pushl $0
80105517:	6a 00                	push   $0x0
  pushl $93
80105519:	6a 5d                	push   $0x5d
  jmp alltraps
8010551b:	e9 3a f8 ff ff       	jmp    80104d5a <alltraps>

80105520 <vector94>:
.globl vector94
vector94:
  pushl $0
80105520:	6a 00                	push   $0x0
  pushl $94
80105522:	6a 5e                	push   $0x5e
  jmp alltraps
80105524:	e9 31 f8 ff ff       	jmp    80104d5a <alltraps>

80105529 <vector95>:
.globl vector95
vector95:
  pushl $0
80105529:	6a 00                	push   $0x0
  pushl $95
8010552b:	6a 5f                	push   $0x5f
  jmp alltraps
8010552d:	e9 28 f8 ff ff       	jmp    80104d5a <alltraps>

80105532 <vector96>:
.globl vector96
vector96:
  pushl $0
80105532:	6a 00                	push   $0x0
  pushl $96
80105534:	6a 60                	push   $0x60
  jmp alltraps
80105536:	e9 1f f8 ff ff       	jmp    80104d5a <alltraps>

8010553b <vector97>:
.globl vector97
vector97:
  pushl $0
8010553b:	6a 00                	push   $0x0
  pushl $97
8010553d:	6a 61                	push   $0x61
  jmp alltraps
8010553f:	e9 16 f8 ff ff       	jmp    80104d5a <alltraps>

80105544 <vector98>:
.globl vector98
vector98:
  pushl $0
80105544:	6a 00                	push   $0x0
  pushl $98
80105546:	6a 62                	push   $0x62
  jmp alltraps
80105548:	e9 0d f8 ff ff       	jmp    80104d5a <alltraps>

8010554d <vector99>:
.globl vector99
vector99:
  pushl $0
8010554d:	6a 00                	push   $0x0
  pushl $99
8010554f:	6a 63                	push   $0x63
  jmp alltraps
80105551:	e9 04 f8 ff ff       	jmp    80104d5a <alltraps>

80105556 <vector100>:
.globl vector100
vector100:
  pushl $0
80105556:	6a 00                	push   $0x0
  pushl $100
80105558:	6a 64                	push   $0x64
  jmp alltraps
8010555a:	e9 fb f7 ff ff       	jmp    80104d5a <alltraps>

8010555f <vector101>:
.globl vector101
vector101:
  pushl $0
8010555f:	6a 00                	push   $0x0
  pushl $101
80105561:	6a 65                	push   $0x65
  jmp alltraps
80105563:	e9 f2 f7 ff ff       	jmp    80104d5a <alltraps>

80105568 <vector102>:
.globl vector102
vector102:
  pushl $0
80105568:	6a 00                	push   $0x0
  pushl $102
8010556a:	6a 66                	push   $0x66
  jmp alltraps
8010556c:	e9 e9 f7 ff ff       	jmp    80104d5a <alltraps>

80105571 <vector103>:
.globl vector103
vector103:
  pushl $0
80105571:	6a 00                	push   $0x0
  pushl $103
80105573:	6a 67                	push   $0x67
  jmp alltraps
80105575:	e9 e0 f7 ff ff       	jmp    80104d5a <alltraps>

8010557a <vector104>:
.globl vector104
vector104:
  pushl $0
8010557a:	6a 00                	push   $0x0
  pushl $104
8010557c:	6a 68                	push   $0x68
  jmp alltraps
8010557e:	e9 d7 f7 ff ff       	jmp    80104d5a <alltraps>

80105583 <vector105>:
.globl vector105
vector105:
  pushl $0
80105583:	6a 00                	push   $0x0
  pushl $105
80105585:	6a 69                	push   $0x69
  jmp alltraps
80105587:	e9 ce f7 ff ff       	jmp    80104d5a <alltraps>

8010558c <vector106>:
.globl vector106
vector106:
  pushl $0
8010558c:	6a 00                	push   $0x0
  pushl $106
8010558e:	6a 6a                	push   $0x6a
  jmp alltraps
80105590:	e9 c5 f7 ff ff       	jmp    80104d5a <alltraps>

80105595 <vector107>:
.globl vector107
vector107:
  pushl $0
80105595:	6a 00                	push   $0x0
  pushl $107
80105597:	6a 6b                	push   $0x6b
  jmp alltraps
80105599:	e9 bc f7 ff ff       	jmp    80104d5a <alltraps>

8010559e <vector108>:
.globl vector108
vector108:
  pushl $0
8010559e:	6a 00                	push   $0x0
  pushl $108
801055a0:	6a 6c                	push   $0x6c
  jmp alltraps
801055a2:	e9 b3 f7 ff ff       	jmp    80104d5a <alltraps>

801055a7 <vector109>:
.globl vector109
vector109:
  pushl $0
801055a7:	6a 00                	push   $0x0
  pushl $109
801055a9:	6a 6d                	push   $0x6d
  jmp alltraps
801055ab:	e9 aa f7 ff ff       	jmp    80104d5a <alltraps>

801055b0 <vector110>:
.globl vector110
vector110:
  pushl $0
801055b0:	6a 00                	push   $0x0
  pushl $110
801055b2:	6a 6e                	push   $0x6e
  jmp alltraps
801055b4:	e9 a1 f7 ff ff       	jmp    80104d5a <alltraps>

801055b9 <vector111>:
.globl vector111
vector111:
  pushl $0
801055b9:	6a 00                	push   $0x0
  pushl $111
801055bb:	6a 6f                	push   $0x6f
  jmp alltraps
801055bd:	e9 98 f7 ff ff       	jmp    80104d5a <alltraps>

801055c2 <vector112>:
.globl vector112
vector112:
  pushl $0
801055c2:	6a 00                	push   $0x0
  pushl $112
801055c4:	6a 70                	push   $0x70
  jmp alltraps
801055c6:	e9 8f f7 ff ff       	jmp    80104d5a <alltraps>

801055cb <vector113>:
.globl vector113
vector113:
  pushl $0
801055cb:	6a 00                	push   $0x0
  pushl $113
801055cd:	6a 71                	push   $0x71
  jmp alltraps
801055cf:	e9 86 f7 ff ff       	jmp    80104d5a <alltraps>

801055d4 <vector114>:
.globl vector114
vector114:
  pushl $0
801055d4:	6a 00                	push   $0x0
  pushl $114
801055d6:	6a 72                	push   $0x72
  jmp alltraps
801055d8:	e9 7d f7 ff ff       	jmp    80104d5a <alltraps>

801055dd <vector115>:
.globl vector115
vector115:
  pushl $0
801055dd:	6a 00                	push   $0x0
  pushl $115
801055df:	6a 73                	push   $0x73
  jmp alltraps
801055e1:	e9 74 f7 ff ff       	jmp    80104d5a <alltraps>

801055e6 <vector116>:
.globl vector116
vector116:
  pushl $0
801055e6:	6a 00                	push   $0x0
  pushl $116
801055e8:	6a 74                	push   $0x74
  jmp alltraps
801055ea:	e9 6b f7 ff ff       	jmp    80104d5a <alltraps>

801055ef <vector117>:
.globl vector117
vector117:
  pushl $0
801055ef:	6a 00                	push   $0x0
  pushl $117
801055f1:	6a 75                	push   $0x75
  jmp alltraps
801055f3:	e9 62 f7 ff ff       	jmp    80104d5a <alltraps>

801055f8 <vector118>:
.globl vector118
vector118:
  pushl $0
801055f8:	6a 00                	push   $0x0
  pushl $118
801055fa:	6a 76                	push   $0x76
  jmp alltraps
801055fc:	e9 59 f7 ff ff       	jmp    80104d5a <alltraps>

80105601 <vector119>:
.globl vector119
vector119:
  pushl $0
80105601:	6a 00                	push   $0x0
  pushl $119
80105603:	6a 77                	push   $0x77
  jmp alltraps
80105605:	e9 50 f7 ff ff       	jmp    80104d5a <alltraps>

8010560a <vector120>:
.globl vector120
vector120:
  pushl $0
8010560a:	6a 00                	push   $0x0
  pushl $120
8010560c:	6a 78                	push   $0x78
  jmp alltraps
8010560e:	e9 47 f7 ff ff       	jmp    80104d5a <alltraps>

80105613 <vector121>:
.globl vector121
vector121:
  pushl $0
80105613:	6a 00                	push   $0x0
  pushl $121
80105615:	6a 79                	push   $0x79
  jmp alltraps
80105617:	e9 3e f7 ff ff       	jmp    80104d5a <alltraps>

8010561c <vector122>:
.globl vector122
vector122:
  pushl $0
8010561c:	6a 00                	push   $0x0
  pushl $122
8010561e:	6a 7a                	push   $0x7a
  jmp alltraps
80105620:	e9 35 f7 ff ff       	jmp    80104d5a <alltraps>

80105625 <vector123>:
.globl vector123
vector123:
  pushl $0
80105625:	6a 00                	push   $0x0
  pushl $123
80105627:	6a 7b                	push   $0x7b
  jmp alltraps
80105629:	e9 2c f7 ff ff       	jmp    80104d5a <alltraps>

8010562e <vector124>:
.globl vector124
vector124:
  pushl $0
8010562e:	6a 00                	push   $0x0
  pushl $124
80105630:	6a 7c                	push   $0x7c
  jmp alltraps
80105632:	e9 23 f7 ff ff       	jmp    80104d5a <alltraps>

80105637 <vector125>:
.globl vector125
vector125:
  pushl $0
80105637:	6a 00                	push   $0x0
  pushl $125
80105639:	6a 7d                	push   $0x7d
  jmp alltraps
8010563b:	e9 1a f7 ff ff       	jmp    80104d5a <alltraps>

80105640 <vector126>:
.globl vector126
vector126:
  pushl $0
80105640:	6a 00                	push   $0x0
  pushl $126
80105642:	6a 7e                	push   $0x7e
  jmp alltraps
80105644:	e9 11 f7 ff ff       	jmp    80104d5a <alltraps>

80105649 <vector127>:
.globl vector127
vector127:
  pushl $0
80105649:	6a 00                	push   $0x0
  pushl $127
8010564b:	6a 7f                	push   $0x7f
  jmp alltraps
8010564d:	e9 08 f7 ff ff       	jmp    80104d5a <alltraps>

80105652 <vector128>:
.globl vector128
vector128:
  pushl $0
80105652:	6a 00                	push   $0x0
  pushl $128
80105654:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80105659:	e9 fc f6 ff ff       	jmp    80104d5a <alltraps>

8010565e <vector129>:
.globl vector129
vector129:
  pushl $0
8010565e:	6a 00                	push   $0x0
  pushl $129
80105660:	68 81 00 00 00       	push   $0x81
  jmp alltraps
80105665:	e9 f0 f6 ff ff       	jmp    80104d5a <alltraps>

8010566a <vector130>:
.globl vector130
vector130:
  pushl $0
8010566a:	6a 00                	push   $0x0
  pushl $130
8010566c:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80105671:	e9 e4 f6 ff ff       	jmp    80104d5a <alltraps>

80105676 <vector131>:
.globl vector131
vector131:
  pushl $0
80105676:	6a 00                	push   $0x0
  pushl $131
80105678:	68 83 00 00 00       	push   $0x83
  jmp alltraps
8010567d:	e9 d8 f6 ff ff       	jmp    80104d5a <alltraps>

80105682 <vector132>:
.globl vector132
vector132:
  pushl $0
80105682:	6a 00                	push   $0x0
  pushl $132
80105684:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80105689:	e9 cc f6 ff ff       	jmp    80104d5a <alltraps>

8010568e <vector133>:
.globl vector133
vector133:
  pushl $0
8010568e:	6a 00                	push   $0x0
  pushl $133
80105690:	68 85 00 00 00       	push   $0x85
  jmp alltraps
80105695:	e9 c0 f6 ff ff       	jmp    80104d5a <alltraps>

8010569a <vector134>:
.globl vector134
vector134:
  pushl $0
8010569a:	6a 00                	push   $0x0
  pushl $134
8010569c:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801056a1:	e9 b4 f6 ff ff       	jmp    80104d5a <alltraps>

801056a6 <vector135>:
.globl vector135
vector135:
  pushl $0
801056a6:	6a 00                	push   $0x0
  pushl $135
801056a8:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801056ad:	e9 a8 f6 ff ff       	jmp    80104d5a <alltraps>

801056b2 <vector136>:
.globl vector136
vector136:
  pushl $0
801056b2:	6a 00                	push   $0x0
  pushl $136
801056b4:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801056b9:	e9 9c f6 ff ff       	jmp    80104d5a <alltraps>

801056be <vector137>:
.globl vector137
vector137:
  pushl $0
801056be:	6a 00                	push   $0x0
  pushl $137
801056c0:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801056c5:	e9 90 f6 ff ff       	jmp    80104d5a <alltraps>

801056ca <vector138>:
.globl vector138
vector138:
  pushl $0
801056ca:	6a 00                	push   $0x0
  pushl $138
801056cc:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801056d1:	e9 84 f6 ff ff       	jmp    80104d5a <alltraps>

801056d6 <vector139>:
.globl vector139
vector139:
  pushl $0
801056d6:	6a 00                	push   $0x0
  pushl $139
801056d8:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801056dd:	e9 78 f6 ff ff       	jmp    80104d5a <alltraps>

801056e2 <vector140>:
.globl vector140
vector140:
  pushl $0
801056e2:	6a 00                	push   $0x0
  pushl $140
801056e4:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801056e9:	e9 6c f6 ff ff       	jmp    80104d5a <alltraps>

801056ee <vector141>:
.globl vector141
vector141:
  pushl $0
801056ee:	6a 00                	push   $0x0
  pushl $141
801056f0:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801056f5:	e9 60 f6 ff ff       	jmp    80104d5a <alltraps>

801056fa <vector142>:
.globl vector142
vector142:
  pushl $0
801056fa:	6a 00                	push   $0x0
  pushl $142
801056fc:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80105701:	e9 54 f6 ff ff       	jmp    80104d5a <alltraps>

80105706 <vector143>:
.globl vector143
vector143:
  pushl $0
80105706:	6a 00                	push   $0x0
  pushl $143
80105708:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
8010570d:	e9 48 f6 ff ff       	jmp    80104d5a <alltraps>

80105712 <vector144>:
.globl vector144
vector144:
  pushl $0
80105712:	6a 00                	push   $0x0
  pushl $144
80105714:	68 90 00 00 00       	push   $0x90
  jmp alltraps
80105719:	e9 3c f6 ff ff       	jmp    80104d5a <alltraps>

8010571e <vector145>:
.globl vector145
vector145:
  pushl $0
8010571e:	6a 00                	push   $0x0
  pushl $145
80105720:	68 91 00 00 00       	push   $0x91
  jmp alltraps
80105725:	e9 30 f6 ff ff       	jmp    80104d5a <alltraps>

8010572a <vector146>:
.globl vector146
vector146:
  pushl $0
8010572a:	6a 00                	push   $0x0
  pushl $146
8010572c:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80105731:	e9 24 f6 ff ff       	jmp    80104d5a <alltraps>

80105736 <vector147>:
.globl vector147
vector147:
  pushl $0
80105736:	6a 00                	push   $0x0
  pushl $147
80105738:	68 93 00 00 00       	push   $0x93
  jmp alltraps
8010573d:	e9 18 f6 ff ff       	jmp    80104d5a <alltraps>

80105742 <vector148>:
.globl vector148
vector148:
  pushl $0
80105742:	6a 00                	push   $0x0
  pushl $148
80105744:	68 94 00 00 00       	push   $0x94
  jmp alltraps
80105749:	e9 0c f6 ff ff       	jmp    80104d5a <alltraps>

8010574e <vector149>:
.globl vector149
vector149:
  pushl $0
8010574e:	6a 00                	push   $0x0
  pushl $149
80105750:	68 95 00 00 00       	push   $0x95
  jmp alltraps
80105755:	e9 00 f6 ff ff       	jmp    80104d5a <alltraps>

8010575a <vector150>:
.globl vector150
vector150:
  pushl $0
8010575a:	6a 00                	push   $0x0
  pushl $150
8010575c:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80105761:	e9 f4 f5 ff ff       	jmp    80104d5a <alltraps>

80105766 <vector151>:
.globl vector151
vector151:
  pushl $0
80105766:	6a 00                	push   $0x0
  pushl $151
80105768:	68 97 00 00 00       	push   $0x97
  jmp alltraps
8010576d:	e9 e8 f5 ff ff       	jmp    80104d5a <alltraps>

80105772 <vector152>:
.globl vector152
vector152:
  pushl $0
80105772:	6a 00                	push   $0x0
  pushl $152
80105774:	68 98 00 00 00       	push   $0x98
  jmp alltraps
80105779:	e9 dc f5 ff ff       	jmp    80104d5a <alltraps>

8010577e <vector153>:
.globl vector153
vector153:
  pushl $0
8010577e:	6a 00                	push   $0x0
  pushl $153
80105780:	68 99 00 00 00       	push   $0x99
  jmp alltraps
80105785:	e9 d0 f5 ff ff       	jmp    80104d5a <alltraps>

8010578a <vector154>:
.globl vector154
vector154:
  pushl $0
8010578a:	6a 00                	push   $0x0
  pushl $154
8010578c:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80105791:	e9 c4 f5 ff ff       	jmp    80104d5a <alltraps>

80105796 <vector155>:
.globl vector155
vector155:
  pushl $0
80105796:	6a 00                	push   $0x0
  pushl $155
80105798:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
8010579d:	e9 b8 f5 ff ff       	jmp    80104d5a <alltraps>

801057a2 <vector156>:
.globl vector156
vector156:
  pushl $0
801057a2:	6a 00                	push   $0x0
  pushl $156
801057a4:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801057a9:	e9 ac f5 ff ff       	jmp    80104d5a <alltraps>

801057ae <vector157>:
.globl vector157
vector157:
  pushl $0
801057ae:	6a 00                	push   $0x0
  pushl $157
801057b0:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801057b5:	e9 a0 f5 ff ff       	jmp    80104d5a <alltraps>

801057ba <vector158>:
.globl vector158
vector158:
  pushl $0
801057ba:	6a 00                	push   $0x0
  pushl $158
801057bc:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801057c1:	e9 94 f5 ff ff       	jmp    80104d5a <alltraps>

801057c6 <vector159>:
.globl vector159
vector159:
  pushl $0
801057c6:	6a 00                	push   $0x0
  pushl $159
801057c8:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801057cd:	e9 88 f5 ff ff       	jmp    80104d5a <alltraps>

801057d2 <vector160>:
.globl vector160
vector160:
  pushl $0
801057d2:	6a 00                	push   $0x0
  pushl $160
801057d4:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801057d9:	e9 7c f5 ff ff       	jmp    80104d5a <alltraps>

801057de <vector161>:
.globl vector161
vector161:
  pushl $0
801057de:	6a 00                	push   $0x0
  pushl $161
801057e0:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801057e5:	e9 70 f5 ff ff       	jmp    80104d5a <alltraps>

801057ea <vector162>:
.globl vector162
vector162:
  pushl $0
801057ea:	6a 00                	push   $0x0
  pushl $162
801057ec:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801057f1:	e9 64 f5 ff ff       	jmp    80104d5a <alltraps>

801057f6 <vector163>:
.globl vector163
vector163:
  pushl $0
801057f6:	6a 00                	push   $0x0
  pushl $163
801057f8:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801057fd:	e9 58 f5 ff ff       	jmp    80104d5a <alltraps>

80105802 <vector164>:
.globl vector164
vector164:
  pushl $0
80105802:	6a 00                	push   $0x0
  pushl $164
80105804:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
80105809:	e9 4c f5 ff ff       	jmp    80104d5a <alltraps>

8010580e <vector165>:
.globl vector165
vector165:
  pushl $0
8010580e:	6a 00                	push   $0x0
  pushl $165
80105810:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
80105815:	e9 40 f5 ff ff       	jmp    80104d5a <alltraps>

8010581a <vector166>:
.globl vector166
vector166:
  pushl $0
8010581a:	6a 00                	push   $0x0
  pushl $166
8010581c:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80105821:	e9 34 f5 ff ff       	jmp    80104d5a <alltraps>

80105826 <vector167>:
.globl vector167
vector167:
  pushl $0
80105826:	6a 00                	push   $0x0
  pushl $167
80105828:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
8010582d:	e9 28 f5 ff ff       	jmp    80104d5a <alltraps>

80105832 <vector168>:
.globl vector168
vector168:
  pushl $0
80105832:	6a 00                	push   $0x0
  pushl $168
80105834:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
80105839:	e9 1c f5 ff ff       	jmp    80104d5a <alltraps>

8010583e <vector169>:
.globl vector169
vector169:
  pushl $0
8010583e:	6a 00                	push   $0x0
  pushl $169
80105840:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
80105845:	e9 10 f5 ff ff       	jmp    80104d5a <alltraps>

8010584a <vector170>:
.globl vector170
vector170:
  pushl $0
8010584a:	6a 00                	push   $0x0
  pushl $170
8010584c:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80105851:	e9 04 f5 ff ff       	jmp    80104d5a <alltraps>

80105856 <vector171>:
.globl vector171
vector171:
  pushl $0
80105856:	6a 00                	push   $0x0
  pushl $171
80105858:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
8010585d:	e9 f8 f4 ff ff       	jmp    80104d5a <alltraps>

80105862 <vector172>:
.globl vector172
vector172:
  pushl $0
80105862:	6a 00                	push   $0x0
  pushl $172
80105864:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
80105869:	e9 ec f4 ff ff       	jmp    80104d5a <alltraps>

8010586e <vector173>:
.globl vector173
vector173:
  pushl $0
8010586e:	6a 00                	push   $0x0
  pushl $173
80105870:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
80105875:	e9 e0 f4 ff ff       	jmp    80104d5a <alltraps>

8010587a <vector174>:
.globl vector174
vector174:
  pushl $0
8010587a:	6a 00                	push   $0x0
  pushl $174
8010587c:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80105881:	e9 d4 f4 ff ff       	jmp    80104d5a <alltraps>

80105886 <vector175>:
.globl vector175
vector175:
  pushl $0
80105886:	6a 00                	push   $0x0
  pushl $175
80105888:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
8010588d:	e9 c8 f4 ff ff       	jmp    80104d5a <alltraps>

80105892 <vector176>:
.globl vector176
vector176:
  pushl $0
80105892:	6a 00                	push   $0x0
  pushl $176
80105894:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
80105899:	e9 bc f4 ff ff       	jmp    80104d5a <alltraps>

8010589e <vector177>:
.globl vector177
vector177:
  pushl $0
8010589e:	6a 00                	push   $0x0
  pushl $177
801058a0:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801058a5:	e9 b0 f4 ff ff       	jmp    80104d5a <alltraps>

801058aa <vector178>:
.globl vector178
vector178:
  pushl $0
801058aa:	6a 00                	push   $0x0
  pushl $178
801058ac:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801058b1:	e9 a4 f4 ff ff       	jmp    80104d5a <alltraps>

801058b6 <vector179>:
.globl vector179
vector179:
  pushl $0
801058b6:	6a 00                	push   $0x0
  pushl $179
801058b8:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801058bd:	e9 98 f4 ff ff       	jmp    80104d5a <alltraps>

801058c2 <vector180>:
.globl vector180
vector180:
  pushl $0
801058c2:	6a 00                	push   $0x0
  pushl $180
801058c4:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801058c9:	e9 8c f4 ff ff       	jmp    80104d5a <alltraps>

801058ce <vector181>:
.globl vector181
vector181:
  pushl $0
801058ce:	6a 00                	push   $0x0
  pushl $181
801058d0:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801058d5:	e9 80 f4 ff ff       	jmp    80104d5a <alltraps>

801058da <vector182>:
.globl vector182
vector182:
  pushl $0
801058da:	6a 00                	push   $0x0
  pushl $182
801058dc:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801058e1:	e9 74 f4 ff ff       	jmp    80104d5a <alltraps>

801058e6 <vector183>:
.globl vector183
vector183:
  pushl $0
801058e6:	6a 00                	push   $0x0
  pushl $183
801058e8:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801058ed:	e9 68 f4 ff ff       	jmp    80104d5a <alltraps>

801058f2 <vector184>:
.globl vector184
vector184:
  pushl $0
801058f2:	6a 00                	push   $0x0
  pushl $184
801058f4:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801058f9:	e9 5c f4 ff ff       	jmp    80104d5a <alltraps>

801058fe <vector185>:
.globl vector185
vector185:
  pushl $0
801058fe:	6a 00                	push   $0x0
  pushl $185
80105900:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
80105905:	e9 50 f4 ff ff       	jmp    80104d5a <alltraps>

8010590a <vector186>:
.globl vector186
vector186:
  pushl $0
8010590a:	6a 00                	push   $0x0
  pushl $186
8010590c:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80105911:	e9 44 f4 ff ff       	jmp    80104d5a <alltraps>

80105916 <vector187>:
.globl vector187
vector187:
  pushl $0
80105916:	6a 00                	push   $0x0
  pushl $187
80105918:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
8010591d:	e9 38 f4 ff ff       	jmp    80104d5a <alltraps>

80105922 <vector188>:
.globl vector188
vector188:
  pushl $0
80105922:	6a 00                	push   $0x0
  pushl $188
80105924:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
80105929:	e9 2c f4 ff ff       	jmp    80104d5a <alltraps>

8010592e <vector189>:
.globl vector189
vector189:
  pushl $0
8010592e:	6a 00                	push   $0x0
  pushl $189
80105930:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
80105935:	e9 20 f4 ff ff       	jmp    80104d5a <alltraps>

8010593a <vector190>:
.globl vector190
vector190:
  pushl $0
8010593a:	6a 00                	push   $0x0
  pushl $190
8010593c:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80105941:	e9 14 f4 ff ff       	jmp    80104d5a <alltraps>

80105946 <vector191>:
.globl vector191
vector191:
  pushl $0
80105946:	6a 00                	push   $0x0
  pushl $191
80105948:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
8010594d:	e9 08 f4 ff ff       	jmp    80104d5a <alltraps>

80105952 <vector192>:
.globl vector192
vector192:
  pushl $0
80105952:	6a 00                	push   $0x0
  pushl $192
80105954:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80105959:	e9 fc f3 ff ff       	jmp    80104d5a <alltraps>

8010595e <vector193>:
.globl vector193
vector193:
  pushl $0
8010595e:	6a 00                	push   $0x0
  pushl $193
80105960:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80105965:	e9 f0 f3 ff ff       	jmp    80104d5a <alltraps>

8010596a <vector194>:
.globl vector194
vector194:
  pushl $0
8010596a:	6a 00                	push   $0x0
  pushl $194
8010596c:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80105971:	e9 e4 f3 ff ff       	jmp    80104d5a <alltraps>

80105976 <vector195>:
.globl vector195
vector195:
  pushl $0
80105976:	6a 00                	push   $0x0
  pushl $195
80105978:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
8010597d:	e9 d8 f3 ff ff       	jmp    80104d5a <alltraps>

80105982 <vector196>:
.globl vector196
vector196:
  pushl $0
80105982:	6a 00                	push   $0x0
  pushl $196
80105984:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80105989:	e9 cc f3 ff ff       	jmp    80104d5a <alltraps>

8010598e <vector197>:
.globl vector197
vector197:
  pushl $0
8010598e:	6a 00                	push   $0x0
  pushl $197
80105990:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80105995:	e9 c0 f3 ff ff       	jmp    80104d5a <alltraps>

8010599a <vector198>:
.globl vector198
vector198:
  pushl $0
8010599a:	6a 00                	push   $0x0
  pushl $198
8010599c:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
801059a1:	e9 b4 f3 ff ff       	jmp    80104d5a <alltraps>

801059a6 <vector199>:
.globl vector199
vector199:
  pushl $0
801059a6:	6a 00                	push   $0x0
  pushl $199
801059a8:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801059ad:	e9 a8 f3 ff ff       	jmp    80104d5a <alltraps>

801059b2 <vector200>:
.globl vector200
vector200:
  pushl $0
801059b2:	6a 00                	push   $0x0
  pushl $200
801059b4:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801059b9:	e9 9c f3 ff ff       	jmp    80104d5a <alltraps>

801059be <vector201>:
.globl vector201
vector201:
  pushl $0
801059be:	6a 00                	push   $0x0
  pushl $201
801059c0:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801059c5:	e9 90 f3 ff ff       	jmp    80104d5a <alltraps>

801059ca <vector202>:
.globl vector202
vector202:
  pushl $0
801059ca:	6a 00                	push   $0x0
  pushl $202
801059cc:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801059d1:	e9 84 f3 ff ff       	jmp    80104d5a <alltraps>

801059d6 <vector203>:
.globl vector203
vector203:
  pushl $0
801059d6:	6a 00                	push   $0x0
  pushl $203
801059d8:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801059dd:	e9 78 f3 ff ff       	jmp    80104d5a <alltraps>

801059e2 <vector204>:
.globl vector204
vector204:
  pushl $0
801059e2:	6a 00                	push   $0x0
  pushl $204
801059e4:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801059e9:	e9 6c f3 ff ff       	jmp    80104d5a <alltraps>

801059ee <vector205>:
.globl vector205
vector205:
  pushl $0
801059ee:	6a 00                	push   $0x0
  pushl $205
801059f0:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801059f5:	e9 60 f3 ff ff       	jmp    80104d5a <alltraps>

801059fa <vector206>:
.globl vector206
vector206:
  pushl $0
801059fa:	6a 00                	push   $0x0
  pushl $206
801059fc:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80105a01:	e9 54 f3 ff ff       	jmp    80104d5a <alltraps>

80105a06 <vector207>:
.globl vector207
vector207:
  pushl $0
80105a06:	6a 00                	push   $0x0
  pushl $207
80105a08:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80105a0d:	e9 48 f3 ff ff       	jmp    80104d5a <alltraps>

80105a12 <vector208>:
.globl vector208
vector208:
  pushl $0
80105a12:	6a 00                	push   $0x0
  pushl $208
80105a14:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80105a19:	e9 3c f3 ff ff       	jmp    80104d5a <alltraps>

80105a1e <vector209>:
.globl vector209
vector209:
  pushl $0
80105a1e:	6a 00                	push   $0x0
  pushl $209
80105a20:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80105a25:	e9 30 f3 ff ff       	jmp    80104d5a <alltraps>

80105a2a <vector210>:
.globl vector210
vector210:
  pushl $0
80105a2a:	6a 00                	push   $0x0
  pushl $210
80105a2c:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80105a31:	e9 24 f3 ff ff       	jmp    80104d5a <alltraps>

80105a36 <vector211>:
.globl vector211
vector211:
  pushl $0
80105a36:	6a 00                	push   $0x0
  pushl $211
80105a38:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80105a3d:	e9 18 f3 ff ff       	jmp    80104d5a <alltraps>

80105a42 <vector212>:
.globl vector212
vector212:
  pushl $0
80105a42:	6a 00                	push   $0x0
  pushl $212
80105a44:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80105a49:	e9 0c f3 ff ff       	jmp    80104d5a <alltraps>

80105a4e <vector213>:
.globl vector213
vector213:
  pushl $0
80105a4e:	6a 00                	push   $0x0
  pushl $213
80105a50:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80105a55:	e9 00 f3 ff ff       	jmp    80104d5a <alltraps>

80105a5a <vector214>:
.globl vector214
vector214:
  pushl $0
80105a5a:	6a 00                	push   $0x0
  pushl $214
80105a5c:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80105a61:	e9 f4 f2 ff ff       	jmp    80104d5a <alltraps>

80105a66 <vector215>:
.globl vector215
vector215:
  pushl $0
80105a66:	6a 00                	push   $0x0
  pushl $215
80105a68:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80105a6d:	e9 e8 f2 ff ff       	jmp    80104d5a <alltraps>

80105a72 <vector216>:
.globl vector216
vector216:
  pushl $0
80105a72:	6a 00                	push   $0x0
  pushl $216
80105a74:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80105a79:	e9 dc f2 ff ff       	jmp    80104d5a <alltraps>

80105a7e <vector217>:
.globl vector217
vector217:
  pushl $0
80105a7e:	6a 00                	push   $0x0
  pushl $217
80105a80:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80105a85:	e9 d0 f2 ff ff       	jmp    80104d5a <alltraps>

80105a8a <vector218>:
.globl vector218
vector218:
  pushl $0
80105a8a:	6a 00                	push   $0x0
  pushl $218
80105a8c:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80105a91:	e9 c4 f2 ff ff       	jmp    80104d5a <alltraps>

80105a96 <vector219>:
.globl vector219
vector219:
  pushl $0
80105a96:	6a 00                	push   $0x0
  pushl $219
80105a98:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80105a9d:	e9 b8 f2 ff ff       	jmp    80104d5a <alltraps>

80105aa2 <vector220>:
.globl vector220
vector220:
  pushl $0
80105aa2:	6a 00                	push   $0x0
  pushl $220
80105aa4:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80105aa9:	e9 ac f2 ff ff       	jmp    80104d5a <alltraps>

80105aae <vector221>:
.globl vector221
vector221:
  pushl $0
80105aae:	6a 00                	push   $0x0
  pushl $221
80105ab0:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80105ab5:	e9 a0 f2 ff ff       	jmp    80104d5a <alltraps>

80105aba <vector222>:
.globl vector222
vector222:
  pushl $0
80105aba:	6a 00                	push   $0x0
  pushl $222
80105abc:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80105ac1:	e9 94 f2 ff ff       	jmp    80104d5a <alltraps>

80105ac6 <vector223>:
.globl vector223
vector223:
  pushl $0
80105ac6:	6a 00                	push   $0x0
  pushl $223
80105ac8:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80105acd:	e9 88 f2 ff ff       	jmp    80104d5a <alltraps>

80105ad2 <vector224>:
.globl vector224
vector224:
  pushl $0
80105ad2:	6a 00                	push   $0x0
  pushl $224
80105ad4:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80105ad9:	e9 7c f2 ff ff       	jmp    80104d5a <alltraps>

80105ade <vector225>:
.globl vector225
vector225:
  pushl $0
80105ade:	6a 00                	push   $0x0
  pushl $225
80105ae0:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80105ae5:	e9 70 f2 ff ff       	jmp    80104d5a <alltraps>

80105aea <vector226>:
.globl vector226
vector226:
  pushl $0
80105aea:	6a 00                	push   $0x0
  pushl $226
80105aec:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80105af1:	e9 64 f2 ff ff       	jmp    80104d5a <alltraps>

80105af6 <vector227>:
.globl vector227
vector227:
  pushl $0
80105af6:	6a 00                	push   $0x0
  pushl $227
80105af8:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80105afd:	e9 58 f2 ff ff       	jmp    80104d5a <alltraps>

80105b02 <vector228>:
.globl vector228
vector228:
  pushl $0
80105b02:	6a 00                	push   $0x0
  pushl $228
80105b04:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80105b09:	e9 4c f2 ff ff       	jmp    80104d5a <alltraps>

80105b0e <vector229>:
.globl vector229
vector229:
  pushl $0
80105b0e:	6a 00                	push   $0x0
  pushl $229
80105b10:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80105b15:	e9 40 f2 ff ff       	jmp    80104d5a <alltraps>

80105b1a <vector230>:
.globl vector230
vector230:
  pushl $0
80105b1a:	6a 00                	push   $0x0
  pushl $230
80105b1c:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80105b21:	e9 34 f2 ff ff       	jmp    80104d5a <alltraps>

80105b26 <vector231>:
.globl vector231
vector231:
  pushl $0
80105b26:	6a 00                	push   $0x0
  pushl $231
80105b28:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80105b2d:	e9 28 f2 ff ff       	jmp    80104d5a <alltraps>

80105b32 <vector232>:
.globl vector232
vector232:
  pushl $0
80105b32:	6a 00                	push   $0x0
  pushl $232
80105b34:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80105b39:	e9 1c f2 ff ff       	jmp    80104d5a <alltraps>

80105b3e <vector233>:
.globl vector233
vector233:
  pushl $0
80105b3e:	6a 00                	push   $0x0
  pushl $233
80105b40:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80105b45:	e9 10 f2 ff ff       	jmp    80104d5a <alltraps>

80105b4a <vector234>:
.globl vector234
vector234:
  pushl $0
80105b4a:	6a 00                	push   $0x0
  pushl $234
80105b4c:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80105b51:	e9 04 f2 ff ff       	jmp    80104d5a <alltraps>

80105b56 <vector235>:
.globl vector235
vector235:
  pushl $0
80105b56:	6a 00                	push   $0x0
  pushl $235
80105b58:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80105b5d:	e9 f8 f1 ff ff       	jmp    80104d5a <alltraps>

80105b62 <vector236>:
.globl vector236
vector236:
  pushl $0
80105b62:	6a 00                	push   $0x0
  pushl $236
80105b64:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80105b69:	e9 ec f1 ff ff       	jmp    80104d5a <alltraps>

80105b6e <vector237>:
.globl vector237
vector237:
  pushl $0
80105b6e:	6a 00                	push   $0x0
  pushl $237
80105b70:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80105b75:	e9 e0 f1 ff ff       	jmp    80104d5a <alltraps>

80105b7a <vector238>:
.globl vector238
vector238:
  pushl $0
80105b7a:	6a 00                	push   $0x0
  pushl $238
80105b7c:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80105b81:	e9 d4 f1 ff ff       	jmp    80104d5a <alltraps>

80105b86 <vector239>:
.globl vector239
vector239:
  pushl $0
80105b86:	6a 00                	push   $0x0
  pushl $239
80105b88:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80105b8d:	e9 c8 f1 ff ff       	jmp    80104d5a <alltraps>

80105b92 <vector240>:
.globl vector240
vector240:
  pushl $0
80105b92:	6a 00                	push   $0x0
  pushl $240
80105b94:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80105b99:	e9 bc f1 ff ff       	jmp    80104d5a <alltraps>

80105b9e <vector241>:
.globl vector241
vector241:
  pushl $0
80105b9e:	6a 00                	push   $0x0
  pushl $241
80105ba0:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80105ba5:	e9 b0 f1 ff ff       	jmp    80104d5a <alltraps>

80105baa <vector242>:
.globl vector242
vector242:
  pushl $0
80105baa:	6a 00                	push   $0x0
  pushl $242
80105bac:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80105bb1:	e9 a4 f1 ff ff       	jmp    80104d5a <alltraps>

80105bb6 <vector243>:
.globl vector243
vector243:
  pushl $0
80105bb6:	6a 00                	push   $0x0
  pushl $243
80105bb8:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80105bbd:	e9 98 f1 ff ff       	jmp    80104d5a <alltraps>

80105bc2 <vector244>:
.globl vector244
vector244:
  pushl $0
80105bc2:	6a 00                	push   $0x0
  pushl $244
80105bc4:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80105bc9:	e9 8c f1 ff ff       	jmp    80104d5a <alltraps>

80105bce <vector245>:
.globl vector245
vector245:
  pushl $0
80105bce:	6a 00                	push   $0x0
  pushl $245
80105bd0:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80105bd5:	e9 80 f1 ff ff       	jmp    80104d5a <alltraps>

80105bda <vector246>:
.globl vector246
vector246:
  pushl $0
80105bda:	6a 00                	push   $0x0
  pushl $246
80105bdc:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80105be1:	e9 74 f1 ff ff       	jmp    80104d5a <alltraps>

80105be6 <vector247>:
.globl vector247
vector247:
  pushl $0
80105be6:	6a 00                	push   $0x0
  pushl $247
80105be8:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80105bed:	e9 68 f1 ff ff       	jmp    80104d5a <alltraps>

80105bf2 <vector248>:
.globl vector248
vector248:
  pushl $0
80105bf2:	6a 00                	push   $0x0
  pushl $248
80105bf4:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80105bf9:	e9 5c f1 ff ff       	jmp    80104d5a <alltraps>

80105bfe <vector249>:
.globl vector249
vector249:
  pushl $0
80105bfe:	6a 00                	push   $0x0
  pushl $249
80105c00:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80105c05:	e9 50 f1 ff ff       	jmp    80104d5a <alltraps>

80105c0a <vector250>:
.globl vector250
vector250:
  pushl $0
80105c0a:	6a 00                	push   $0x0
  pushl $250
80105c0c:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80105c11:	e9 44 f1 ff ff       	jmp    80104d5a <alltraps>

80105c16 <vector251>:
.globl vector251
vector251:
  pushl $0
80105c16:	6a 00                	push   $0x0
  pushl $251
80105c18:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80105c1d:	e9 38 f1 ff ff       	jmp    80104d5a <alltraps>

80105c22 <vector252>:
.globl vector252
vector252:
  pushl $0
80105c22:	6a 00                	push   $0x0
  pushl $252
80105c24:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80105c29:	e9 2c f1 ff ff       	jmp    80104d5a <alltraps>

80105c2e <vector253>:
.globl vector253
vector253:
  pushl $0
80105c2e:	6a 00                	push   $0x0
  pushl $253
80105c30:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80105c35:	e9 20 f1 ff ff       	jmp    80104d5a <alltraps>

80105c3a <vector254>:
.globl vector254
vector254:
  pushl $0
80105c3a:	6a 00                	push   $0x0
  pushl $254
80105c3c:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80105c41:	e9 14 f1 ff ff       	jmp    80104d5a <alltraps>

80105c46 <vector255>:
.globl vector255
vector255:
  pushl $0
80105c46:	6a 00                	push   $0x0
  pushl $255
80105c48:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80105c4d:	e9 08 f1 ff ff       	jmp    80104d5a <alltraps>

80105c52 <walkpgdir>:
=======
8010518c:	6a 00                	push   $0x0
  pushl $0
8010518e:	6a 00                	push   $0x0
  jmp alltraps
80105190:	e9 71 fb ff ff       	jmp    80104d06 <alltraps>

80105195 <vector1>:
.globl vector1
vector1:
  pushl $0
80105195:	6a 00                	push   $0x0
  pushl $1
80105197:	6a 01                	push   $0x1
  jmp alltraps
80105199:	e9 68 fb ff ff       	jmp    80104d06 <alltraps>

8010519e <vector2>:
.globl vector2
vector2:
  pushl $0
8010519e:	6a 00                	push   $0x0
  pushl $2
801051a0:	6a 02                	push   $0x2
  jmp alltraps
801051a2:	e9 5f fb ff ff       	jmp    80104d06 <alltraps>

801051a7 <vector3>:
.globl vector3
vector3:
  pushl $0
801051a7:	6a 00                	push   $0x0
  pushl $3
801051a9:	6a 03                	push   $0x3
  jmp alltraps
801051ab:	e9 56 fb ff ff       	jmp    80104d06 <alltraps>

801051b0 <vector4>:
.globl vector4
vector4:
  pushl $0
801051b0:	6a 00                	push   $0x0
  pushl $4
801051b2:	6a 04                	push   $0x4
  jmp alltraps
801051b4:	e9 4d fb ff ff       	jmp    80104d06 <alltraps>

801051b9 <vector5>:
.globl vector5
vector5:
  pushl $0
801051b9:	6a 00                	push   $0x0
  pushl $5
801051bb:	6a 05                	push   $0x5
  jmp alltraps
801051bd:	e9 44 fb ff ff       	jmp    80104d06 <alltraps>

801051c2 <vector6>:
.globl vector6
vector6:
  pushl $0
801051c2:	6a 00                	push   $0x0
  pushl $6
801051c4:	6a 06                	push   $0x6
  jmp alltraps
801051c6:	e9 3b fb ff ff       	jmp    80104d06 <alltraps>

801051cb <vector7>:
.globl vector7
vector7:
  pushl $0
801051cb:	6a 00                	push   $0x0
  pushl $7
801051cd:	6a 07                	push   $0x7
  jmp alltraps
801051cf:	e9 32 fb ff ff       	jmp    80104d06 <alltraps>

801051d4 <vector8>:
.globl vector8
vector8:
  pushl $8
801051d4:	6a 08                	push   $0x8
  jmp alltraps
801051d6:	e9 2b fb ff ff       	jmp    80104d06 <alltraps>

801051db <vector9>:
.globl vector9
vector9:
  pushl $0
801051db:	6a 00                	push   $0x0
  pushl $9
801051dd:	6a 09                	push   $0x9
  jmp alltraps
801051df:	e9 22 fb ff ff       	jmp    80104d06 <alltraps>

801051e4 <vector10>:
.globl vector10
vector10:
  pushl $10
801051e4:	6a 0a                	push   $0xa
  jmp alltraps
801051e6:	e9 1b fb ff ff       	jmp    80104d06 <alltraps>

801051eb <vector11>:
.globl vector11
vector11:
  pushl $11
801051eb:	6a 0b                	push   $0xb
  jmp alltraps
801051ed:	e9 14 fb ff ff       	jmp    80104d06 <alltraps>

801051f2 <vector12>:
.globl vector12
vector12:
  pushl $12
801051f2:	6a 0c                	push   $0xc
  jmp alltraps
801051f4:	e9 0d fb ff ff       	jmp    80104d06 <alltraps>

801051f9 <vector13>:
.globl vector13
vector13:
  pushl $13
801051f9:	6a 0d                	push   $0xd
  jmp alltraps
801051fb:	e9 06 fb ff ff       	jmp    80104d06 <alltraps>

80105200 <vector14>:
.globl vector14
vector14:
  pushl $14
80105200:	6a 0e                	push   $0xe
  jmp alltraps
80105202:	e9 ff fa ff ff       	jmp    80104d06 <alltraps>

80105207 <vector15>:
.globl vector15
vector15:
  pushl $0
80105207:	6a 00                	push   $0x0
  pushl $15
80105209:	6a 0f                	push   $0xf
  jmp alltraps
8010520b:	e9 f6 fa ff ff       	jmp    80104d06 <alltraps>

80105210 <vector16>:
.globl vector16
vector16:
  pushl $0
80105210:	6a 00                	push   $0x0
  pushl $16
80105212:	6a 10                	push   $0x10
  jmp alltraps
80105214:	e9 ed fa ff ff       	jmp    80104d06 <alltraps>

80105219 <vector17>:
.globl vector17
vector17:
  pushl $17
80105219:	6a 11                	push   $0x11
  jmp alltraps
8010521b:	e9 e6 fa ff ff       	jmp    80104d06 <alltraps>

80105220 <vector18>:
.globl vector18
vector18:
  pushl $0
80105220:	6a 00                	push   $0x0
  pushl $18
80105222:	6a 12                	push   $0x12
  jmp alltraps
80105224:	e9 dd fa ff ff       	jmp    80104d06 <alltraps>

80105229 <vector19>:
.globl vector19
vector19:
  pushl $0
80105229:	6a 00                	push   $0x0
  pushl $19
8010522b:	6a 13                	push   $0x13
  jmp alltraps
8010522d:	e9 d4 fa ff ff       	jmp    80104d06 <alltraps>

80105232 <vector20>:
.globl vector20
vector20:
  pushl $0
80105232:	6a 00                	push   $0x0
  pushl $20
80105234:	6a 14                	push   $0x14
  jmp alltraps
80105236:	e9 cb fa ff ff       	jmp    80104d06 <alltraps>

8010523b <vector21>:
.globl vector21
vector21:
  pushl $0
8010523b:	6a 00                	push   $0x0
  pushl $21
8010523d:	6a 15                	push   $0x15
  jmp alltraps
8010523f:	e9 c2 fa ff ff       	jmp    80104d06 <alltraps>

80105244 <vector22>:
.globl vector22
vector22:
  pushl $0
80105244:	6a 00                	push   $0x0
  pushl $22
80105246:	6a 16                	push   $0x16
  jmp alltraps
80105248:	e9 b9 fa ff ff       	jmp    80104d06 <alltraps>

8010524d <vector23>:
.globl vector23
vector23:
  pushl $0
8010524d:	6a 00                	push   $0x0
  pushl $23
8010524f:	6a 17                	push   $0x17
  jmp alltraps
80105251:	e9 b0 fa ff ff       	jmp    80104d06 <alltraps>

80105256 <vector24>:
.globl vector24
vector24:
  pushl $0
80105256:	6a 00                	push   $0x0
  pushl $24
80105258:	6a 18                	push   $0x18
  jmp alltraps
8010525a:	e9 a7 fa ff ff       	jmp    80104d06 <alltraps>

8010525f <vector25>:
.globl vector25
vector25:
  pushl $0
8010525f:	6a 00                	push   $0x0
  pushl $25
80105261:	6a 19                	push   $0x19
  jmp alltraps
80105263:	e9 9e fa ff ff       	jmp    80104d06 <alltraps>

80105268 <vector26>:
.globl vector26
vector26:
  pushl $0
80105268:	6a 00                	push   $0x0
  pushl $26
8010526a:	6a 1a                	push   $0x1a
  jmp alltraps
8010526c:	e9 95 fa ff ff       	jmp    80104d06 <alltraps>

80105271 <vector27>:
.globl vector27
vector27:
  pushl $0
80105271:	6a 00                	push   $0x0
  pushl $27
80105273:	6a 1b                	push   $0x1b
  jmp alltraps
80105275:	e9 8c fa ff ff       	jmp    80104d06 <alltraps>

8010527a <vector28>:
.globl vector28
vector28:
  pushl $0
8010527a:	6a 00                	push   $0x0
  pushl $28
8010527c:	6a 1c                	push   $0x1c
  jmp alltraps
8010527e:	e9 83 fa ff ff       	jmp    80104d06 <alltraps>

80105283 <vector29>:
.globl vector29
vector29:
  pushl $0
80105283:	6a 00                	push   $0x0
  pushl $29
80105285:	6a 1d                	push   $0x1d
  jmp alltraps
80105287:	e9 7a fa ff ff       	jmp    80104d06 <alltraps>

8010528c <vector30>:
.globl vector30
vector30:
  pushl $0
8010528c:	6a 00                	push   $0x0
  pushl $30
8010528e:	6a 1e                	push   $0x1e
  jmp alltraps
80105290:	e9 71 fa ff ff       	jmp    80104d06 <alltraps>

80105295 <vector31>:
.globl vector31
vector31:
  pushl $0
80105295:	6a 00                	push   $0x0
  pushl $31
80105297:	6a 1f                	push   $0x1f
  jmp alltraps
80105299:	e9 68 fa ff ff       	jmp    80104d06 <alltraps>

8010529e <vector32>:
.globl vector32
vector32:
  pushl $0
8010529e:	6a 00                	push   $0x0
  pushl $32
801052a0:	6a 20                	push   $0x20
  jmp alltraps
801052a2:	e9 5f fa ff ff       	jmp    80104d06 <alltraps>

801052a7 <vector33>:
.globl vector33
vector33:
  pushl $0
801052a7:	6a 00                	push   $0x0
  pushl $33
801052a9:	6a 21                	push   $0x21
  jmp alltraps
801052ab:	e9 56 fa ff ff       	jmp    80104d06 <alltraps>

801052b0 <vector34>:
.globl vector34
vector34:
  pushl $0
801052b0:	6a 00                	push   $0x0
  pushl $34
801052b2:	6a 22                	push   $0x22
  jmp alltraps
801052b4:	e9 4d fa ff ff       	jmp    80104d06 <alltraps>

801052b9 <vector35>:
.globl vector35
vector35:
  pushl $0
801052b9:	6a 00                	push   $0x0
  pushl $35
801052bb:	6a 23                	push   $0x23
  jmp alltraps
801052bd:	e9 44 fa ff ff       	jmp    80104d06 <alltraps>

801052c2 <vector36>:
.globl vector36
vector36:
  pushl $0
801052c2:	6a 00                	push   $0x0
  pushl $36
801052c4:	6a 24                	push   $0x24
  jmp alltraps
801052c6:	e9 3b fa ff ff       	jmp    80104d06 <alltraps>

801052cb <vector37>:
.globl vector37
vector37:
  pushl $0
801052cb:	6a 00                	push   $0x0
  pushl $37
801052cd:	6a 25                	push   $0x25
  jmp alltraps
801052cf:	e9 32 fa ff ff       	jmp    80104d06 <alltraps>

801052d4 <vector38>:
.globl vector38
vector38:
  pushl $0
801052d4:	6a 00                	push   $0x0
  pushl $38
801052d6:	6a 26                	push   $0x26
  jmp alltraps
801052d8:	e9 29 fa ff ff       	jmp    80104d06 <alltraps>

801052dd <vector39>:
.globl vector39
vector39:
  pushl $0
801052dd:	6a 00                	push   $0x0
  pushl $39
801052df:	6a 27                	push   $0x27
  jmp alltraps
801052e1:	e9 20 fa ff ff       	jmp    80104d06 <alltraps>

801052e6 <vector40>:
.globl vector40
vector40:
  pushl $0
801052e6:	6a 00                	push   $0x0
  pushl $40
801052e8:	6a 28                	push   $0x28
  jmp alltraps
801052ea:	e9 17 fa ff ff       	jmp    80104d06 <alltraps>

801052ef <vector41>:
.globl vector41
vector41:
  pushl $0
801052ef:	6a 00                	push   $0x0
  pushl $41
801052f1:	6a 29                	push   $0x29
  jmp alltraps
801052f3:	e9 0e fa ff ff       	jmp    80104d06 <alltraps>

801052f8 <vector42>:
.globl vector42
vector42:
  pushl $0
801052f8:	6a 00                	push   $0x0
  pushl $42
801052fa:	6a 2a                	push   $0x2a
  jmp alltraps
801052fc:	e9 05 fa ff ff       	jmp    80104d06 <alltraps>

80105301 <vector43>:
.globl vector43
vector43:
  pushl $0
80105301:	6a 00                	push   $0x0
  pushl $43
80105303:	6a 2b                	push   $0x2b
  jmp alltraps
80105305:	e9 fc f9 ff ff       	jmp    80104d06 <alltraps>

8010530a <vector44>:
.globl vector44
vector44:
  pushl $0
8010530a:	6a 00                	push   $0x0
  pushl $44
8010530c:	6a 2c                	push   $0x2c
  jmp alltraps
8010530e:	e9 f3 f9 ff ff       	jmp    80104d06 <alltraps>

80105313 <vector45>:
.globl vector45
vector45:
  pushl $0
80105313:	6a 00                	push   $0x0
  pushl $45
80105315:	6a 2d                	push   $0x2d
  jmp alltraps
80105317:	e9 ea f9 ff ff       	jmp    80104d06 <alltraps>

8010531c <vector46>:
.globl vector46
vector46:
  pushl $0
8010531c:	6a 00                	push   $0x0
  pushl $46
8010531e:	6a 2e                	push   $0x2e
  jmp alltraps
80105320:	e9 e1 f9 ff ff       	jmp    80104d06 <alltraps>

80105325 <vector47>:
.globl vector47
vector47:
  pushl $0
80105325:	6a 00                	push   $0x0
  pushl $47
80105327:	6a 2f                	push   $0x2f
  jmp alltraps
80105329:	e9 d8 f9 ff ff       	jmp    80104d06 <alltraps>

8010532e <vector48>:
.globl vector48
vector48:
  pushl $0
8010532e:	6a 00                	push   $0x0
  pushl $48
80105330:	6a 30                	push   $0x30
  jmp alltraps
80105332:	e9 cf f9 ff ff       	jmp    80104d06 <alltraps>

80105337 <vector49>:
.globl vector49
vector49:
  pushl $0
80105337:	6a 00                	push   $0x0
  pushl $49
80105339:	6a 31                	push   $0x31
  jmp alltraps
8010533b:	e9 c6 f9 ff ff       	jmp    80104d06 <alltraps>

80105340 <vector50>:
.globl vector50
vector50:
  pushl $0
80105340:	6a 00                	push   $0x0
  pushl $50
80105342:	6a 32                	push   $0x32
  jmp alltraps
80105344:	e9 bd f9 ff ff       	jmp    80104d06 <alltraps>

80105349 <vector51>:
.globl vector51
vector51:
  pushl $0
80105349:	6a 00                	push   $0x0
  pushl $51
8010534b:	6a 33                	push   $0x33
  jmp alltraps
8010534d:	e9 b4 f9 ff ff       	jmp    80104d06 <alltraps>

80105352 <vector52>:
.globl vector52
vector52:
  pushl $0
80105352:	6a 00                	push   $0x0
  pushl $52
80105354:	6a 34                	push   $0x34
  jmp alltraps
80105356:	e9 ab f9 ff ff       	jmp    80104d06 <alltraps>

8010535b <vector53>:
.globl vector53
vector53:
  pushl $0
8010535b:	6a 00                	push   $0x0
  pushl $53
8010535d:	6a 35                	push   $0x35
  jmp alltraps
8010535f:	e9 a2 f9 ff ff       	jmp    80104d06 <alltraps>

80105364 <vector54>:
.globl vector54
vector54:
  pushl $0
80105364:	6a 00                	push   $0x0
  pushl $54
80105366:	6a 36                	push   $0x36
  jmp alltraps
80105368:	e9 99 f9 ff ff       	jmp    80104d06 <alltraps>

8010536d <vector55>:
.globl vector55
vector55:
  pushl $0
8010536d:	6a 00                	push   $0x0
  pushl $55
8010536f:	6a 37                	push   $0x37
  jmp alltraps
80105371:	e9 90 f9 ff ff       	jmp    80104d06 <alltraps>

80105376 <vector56>:
.globl vector56
vector56:
  pushl $0
80105376:	6a 00                	push   $0x0
  pushl $56
80105378:	6a 38                	push   $0x38
  jmp alltraps
8010537a:	e9 87 f9 ff ff       	jmp    80104d06 <alltraps>

8010537f <vector57>:
.globl vector57
vector57:
  pushl $0
8010537f:	6a 00                	push   $0x0
  pushl $57
80105381:	6a 39                	push   $0x39
  jmp alltraps
80105383:	e9 7e f9 ff ff       	jmp    80104d06 <alltraps>

80105388 <vector58>:
.globl vector58
vector58:
  pushl $0
80105388:	6a 00                	push   $0x0
  pushl $58
8010538a:	6a 3a                	push   $0x3a
  jmp alltraps
8010538c:	e9 75 f9 ff ff       	jmp    80104d06 <alltraps>

80105391 <vector59>:
.globl vector59
vector59:
  pushl $0
80105391:	6a 00                	push   $0x0
  pushl $59
80105393:	6a 3b                	push   $0x3b
  jmp alltraps
80105395:	e9 6c f9 ff ff       	jmp    80104d06 <alltraps>

8010539a <vector60>:
.globl vector60
vector60:
  pushl $0
8010539a:	6a 00                	push   $0x0
  pushl $60
8010539c:	6a 3c                	push   $0x3c
  jmp alltraps
8010539e:	e9 63 f9 ff ff       	jmp    80104d06 <alltraps>

801053a3 <vector61>:
.globl vector61
vector61:
  pushl $0
801053a3:	6a 00                	push   $0x0
  pushl $61
801053a5:	6a 3d                	push   $0x3d
  jmp alltraps
801053a7:	e9 5a f9 ff ff       	jmp    80104d06 <alltraps>

801053ac <vector62>:
.globl vector62
vector62:
  pushl $0
801053ac:	6a 00                	push   $0x0
  pushl $62
801053ae:	6a 3e                	push   $0x3e
  jmp alltraps
801053b0:	e9 51 f9 ff ff       	jmp    80104d06 <alltraps>

801053b5 <vector63>:
.globl vector63
vector63:
  pushl $0
801053b5:	6a 00                	push   $0x0
  pushl $63
801053b7:	6a 3f                	push   $0x3f
  jmp alltraps
801053b9:	e9 48 f9 ff ff       	jmp    80104d06 <alltraps>

801053be <vector64>:
.globl vector64
vector64:
  pushl $0
801053be:	6a 00                	push   $0x0
  pushl $64
801053c0:	6a 40                	push   $0x40
  jmp alltraps
801053c2:	e9 3f f9 ff ff       	jmp    80104d06 <alltraps>

801053c7 <vector65>:
.globl vector65
vector65:
  pushl $0
801053c7:	6a 00                	push   $0x0
  pushl $65
801053c9:	6a 41                	push   $0x41
  jmp alltraps
801053cb:	e9 36 f9 ff ff       	jmp    80104d06 <alltraps>

801053d0 <vector66>:
.globl vector66
vector66:
  pushl $0
801053d0:	6a 00                	push   $0x0
  pushl $66
801053d2:	6a 42                	push   $0x42
  jmp alltraps
801053d4:	e9 2d f9 ff ff       	jmp    80104d06 <alltraps>

801053d9 <vector67>:
.globl vector67
vector67:
  pushl $0
801053d9:	6a 00                	push   $0x0
  pushl $67
801053db:	6a 43                	push   $0x43
  jmp alltraps
801053dd:	e9 24 f9 ff ff       	jmp    80104d06 <alltraps>

801053e2 <vector68>:
.globl vector68
vector68:
  pushl $0
801053e2:	6a 00                	push   $0x0
  pushl $68
801053e4:	6a 44                	push   $0x44
  jmp alltraps
801053e6:	e9 1b f9 ff ff       	jmp    80104d06 <alltraps>

801053eb <vector69>:
.globl vector69
vector69:
  pushl $0
801053eb:	6a 00                	push   $0x0
  pushl $69
801053ed:	6a 45                	push   $0x45
  jmp alltraps
801053ef:	e9 12 f9 ff ff       	jmp    80104d06 <alltraps>

801053f4 <vector70>:
.globl vector70
vector70:
  pushl $0
801053f4:	6a 00                	push   $0x0
  pushl $70
801053f6:	6a 46                	push   $0x46
  jmp alltraps
801053f8:	e9 09 f9 ff ff       	jmp    80104d06 <alltraps>

801053fd <vector71>:
.globl vector71
vector71:
  pushl $0
801053fd:	6a 00                	push   $0x0
  pushl $71
801053ff:	6a 47                	push   $0x47
  jmp alltraps
80105401:	e9 00 f9 ff ff       	jmp    80104d06 <alltraps>

80105406 <vector72>:
.globl vector72
vector72:
  pushl $0
80105406:	6a 00                	push   $0x0
  pushl $72
80105408:	6a 48                	push   $0x48
  jmp alltraps
8010540a:	e9 f7 f8 ff ff       	jmp    80104d06 <alltraps>

8010540f <vector73>:
.globl vector73
vector73:
  pushl $0
8010540f:	6a 00                	push   $0x0
  pushl $73
80105411:	6a 49                	push   $0x49
  jmp alltraps
80105413:	e9 ee f8 ff ff       	jmp    80104d06 <alltraps>

80105418 <vector74>:
.globl vector74
vector74:
  pushl $0
80105418:	6a 00                	push   $0x0
  pushl $74
8010541a:	6a 4a                	push   $0x4a
  jmp alltraps
8010541c:	e9 e5 f8 ff ff       	jmp    80104d06 <alltraps>

80105421 <vector75>:
.globl vector75
vector75:
  pushl $0
80105421:	6a 00                	push   $0x0
  pushl $75
80105423:	6a 4b                	push   $0x4b
  jmp alltraps
80105425:	e9 dc f8 ff ff       	jmp    80104d06 <alltraps>

8010542a <vector76>:
.globl vector76
vector76:
  pushl $0
8010542a:	6a 00                	push   $0x0
  pushl $76
8010542c:	6a 4c                	push   $0x4c
  jmp alltraps
8010542e:	e9 d3 f8 ff ff       	jmp    80104d06 <alltraps>

80105433 <vector77>:
.globl vector77
vector77:
  pushl $0
80105433:	6a 00                	push   $0x0
  pushl $77
80105435:	6a 4d                	push   $0x4d
  jmp alltraps
80105437:	e9 ca f8 ff ff       	jmp    80104d06 <alltraps>

8010543c <vector78>:
.globl vector78
vector78:
  pushl $0
8010543c:	6a 00                	push   $0x0
  pushl $78
8010543e:	6a 4e                	push   $0x4e
  jmp alltraps
80105440:	e9 c1 f8 ff ff       	jmp    80104d06 <alltraps>

80105445 <vector79>:
.globl vector79
vector79:
  pushl $0
80105445:	6a 00                	push   $0x0
  pushl $79
80105447:	6a 4f                	push   $0x4f
  jmp alltraps
80105449:	e9 b8 f8 ff ff       	jmp    80104d06 <alltraps>

8010544e <vector80>:
.globl vector80
vector80:
  pushl $0
8010544e:	6a 00                	push   $0x0
  pushl $80
80105450:	6a 50                	push   $0x50
  jmp alltraps
80105452:	e9 af f8 ff ff       	jmp    80104d06 <alltraps>

80105457 <vector81>:
.globl vector81
vector81:
  pushl $0
80105457:	6a 00                	push   $0x0
  pushl $81
80105459:	6a 51                	push   $0x51
  jmp alltraps
8010545b:	e9 a6 f8 ff ff       	jmp    80104d06 <alltraps>

80105460 <vector82>:
.globl vector82
vector82:
  pushl $0
80105460:	6a 00                	push   $0x0
  pushl $82
80105462:	6a 52                	push   $0x52
  jmp alltraps
80105464:	e9 9d f8 ff ff       	jmp    80104d06 <alltraps>

80105469 <vector83>:
.globl vector83
vector83:
  pushl $0
80105469:	6a 00                	push   $0x0
  pushl $83
8010546b:	6a 53                	push   $0x53
  jmp alltraps
8010546d:	e9 94 f8 ff ff       	jmp    80104d06 <alltraps>

80105472 <vector84>:
.globl vector84
vector84:
  pushl $0
80105472:	6a 00                	push   $0x0
  pushl $84
80105474:	6a 54                	push   $0x54
  jmp alltraps
80105476:	e9 8b f8 ff ff       	jmp    80104d06 <alltraps>

8010547b <vector85>:
.globl vector85
vector85:
  pushl $0
8010547b:	6a 00                	push   $0x0
  pushl $85
8010547d:	6a 55                	push   $0x55
  jmp alltraps
8010547f:	e9 82 f8 ff ff       	jmp    80104d06 <alltraps>

80105484 <vector86>:
.globl vector86
vector86:
  pushl $0
80105484:	6a 00                	push   $0x0
  pushl $86
80105486:	6a 56                	push   $0x56
  jmp alltraps
80105488:	e9 79 f8 ff ff       	jmp    80104d06 <alltraps>

8010548d <vector87>:
.globl vector87
vector87:
  pushl $0
8010548d:	6a 00                	push   $0x0
  pushl $87
8010548f:	6a 57                	push   $0x57
  jmp alltraps
80105491:	e9 70 f8 ff ff       	jmp    80104d06 <alltraps>

80105496 <vector88>:
.globl vector88
vector88:
  pushl $0
80105496:	6a 00                	push   $0x0
  pushl $88
80105498:	6a 58                	push   $0x58
  jmp alltraps
8010549a:	e9 67 f8 ff ff       	jmp    80104d06 <alltraps>

8010549f <vector89>:
.globl vector89
vector89:
  pushl $0
8010549f:	6a 00                	push   $0x0
  pushl $89
801054a1:	6a 59                	push   $0x59
  jmp alltraps
801054a3:	e9 5e f8 ff ff       	jmp    80104d06 <alltraps>

801054a8 <vector90>:
.globl vector90
vector90:
  pushl $0
801054a8:	6a 00                	push   $0x0
  pushl $90
801054aa:	6a 5a                	push   $0x5a
  jmp alltraps
801054ac:	e9 55 f8 ff ff       	jmp    80104d06 <alltraps>

801054b1 <vector91>:
.globl vector91
vector91:
  pushl $0
801054b1:	6a 00                	push   $0x0
  pushl $91
801054b3:	6a 5b                	push   $0x5b
  jmp alltraps
801054b5:	e9 4c f8 ff ff       	jmp    80104d06 <alltraps>

801054ba <vector92>:
.globl vector92
vector92:
  pushl $0
801054ba:	6a 00                	push   $0x0
  pushl $92
801054bc:	6a 5c                	push   $0x5c
  jmp alltraps
801054be:	e9 43 f8 ff ff       	jmp    80104d06 <alltraps>

801054c3 <vector93>:
.globl vector93
vector93:
  pushl $0
801054c3:	6a 00                	push   $0x0
  pushl $93
801054c5:	6a 5d                	push   $0x5d
  jmp alltraps
801054c7:	e9 3a f8 ff ff       	jmp    80104d06 <alltraps>

801054cc <vector94>:
.globl vector94
vector94:
  pushl $0
801054cc:	6a 00                	push   $0x0
  pushl $94
801054ce:	6a 5e                	push   $0x5e
  jmp alltraps
801054d0:	e9 31 f8 ff ff       	jmp    80104d06 <alltraps>

801054d5 <vector95>:
.globl vector95
vector95:
  pushl $0
801054d5:	6a 00                	push   $0x0
  pushl $95
801054d7:	6a 5f                	push   $0x5f
  jmp alltraps
801054d9:	e9 28 f8 ff ff       	jmp    80104d06 <alltraps>

801054de <vector96>:
.globl vector96
vector96:
  pushl $0
801054de:	6a 00                	push   $0x0
  pushl $96
801054e0:	6a 60                	push   $0x60
  jmp alltraps
801054e2:	e9 1f f8 ff ff       	jmp    80104d06 <alltraps>

801054e7 <vector97>:
.globl vector97
vector97:
  pushl $0
801054e7:	6a 00                	push   $0x0
  pushl $97
801054e9:	6a 61                	push   $0x61
  jmp alltraps
801054eb:	e9 16 f8 ff ff       	jmp    80104d06 <alltraps>

801054f0 <vector98>:
.globl vector98
vector98:
  pushl $0
801054f0:	6a 00                	push   $0x0
  pushl $98
801054f2:	6a 62                	push   $0x62
  jmp alltraps
801054f4:	e9 0d f8 ff ff       	jmp    80104d06 <alltraps>

801054f9 <vector99>:
.globl vector99
vector99:
  pushl $0
801054f9:	6a 00                	push   $0x0
  pushl $99
801054fb:	6a 63                	push   $0x63
  jmp alltraps
801054fd:	e9 04 f8 ff ff       	jmp    80104d06 <alltraps>

80105502 <vector100>:
.globl vector100
vector100:
  pushl $0
80105502:	6a 00                	push   $0x0
  pushl $100
80105504:	6a 64                	push   $0x64
  jmp alltraps
80105506:	e9 fb f7 ff ff       	jmp    80104d06 <alltraps>

8010550b <vector101>:
.globl vector101
vector101:
  pushl $0
8010550b:	6a 00                	push   $0x0
  pushl $101
8010550d:	6a 65                	push   $0x65
  jmp alltraps
8010550f:	e9 f2 f7 ff ff       	jmp    80104d06 <alltraps>

80105514 <vector102>:
.globl vector102
vector102:
  pushl $0
80105514:	6a 00                	push   $0x0
  pushl $102
80105516:	6a 66                	push   $0x66
  jmp alltraps
80105518:	e9 e9 f7 ff ff       	jmp    80104d06 <alltraps>

8010551d <vector103>:
.globl vector103
vector103:
  pushl $0
8010551d:	6a 00                	push   $0x0
  pushl $103
8010551f:	6a 67                	push   $0x67
  jmp alltraps
80105521:	e9 e0 f7 ff ff       	jmp    80104d06 <alltraps>

80105526 <vector104>:
.globl vector104
vector104:
  pushl $0
80105526:	6a 00                	push   $0x0
  pushl $104
80105528:	6a 68                	push   $0x68
  jmp alltraps
8010552a:	e9 d7 f7 ff ff       	jmp    80104d06 <alltraps>

8010552f <vector105>:
.globl vector105
vector105:
  pushl $0
8010552f:	6a 00                	push   $0x0
  pushl $105
80105531:	6a 69                	push   $0x69
  jmp alltraps
80105533:	e9 ce f7 ff ff       	jmp    80104d06 <alltraps>

80105538 <vector106>:
.globl vector106
vector106:
  pushl $0
80105538:	6a 00                	push   $0x0
  pushl $106
8010553a:	6a 6a                	push   $0x6a
  jmp alltraps
8010553c:	e9 c5 f7 ff ff       	jmp    80104d06 <alltraps>

80105541 <vector107>:
.globl vector107
vector107:
  pushl $0
80105541:	6a 00                	push   $0x0
  pushl $107
80105543:	6a 6b                	push   $0x6b
  jmp alltraps
80105545:	e9 bc f7 ff ff       	jmp    80104d06 <alltraps>

8010554a <vector108>:
.globl vector108
vector108:
  pushl $0
8010554a:	6a 00                	push   $0x0
  pushl $108
8010554c:	6a 6c                	push   $0x6c
  jmp alltraps
8010554e:	e9 b3 f7 ff ff       	jmp    80104d06 <alltraps>

80105553 <vector109>:
.globl vector109
vector109:
  pushl $0
80105553:	6a 00                	push   $0x0
  pushl $109
80105555:	6a 6d                	push   $0x6d
  jmp alltraps
80105557:	e9 aa f7 ff ff       	jmp    80104d06 <alltraps>

8010555c <vector110>:
.globl vector110
vector110:
  pushl $0
8010555c:	6a 00                	push   $0x0
  pushl $110
8010555e:	6a 6e                	push   $0x6e
  jmp alltraps
80105560:	e9 a1 f7 ff ff       	jmp    80104d06 <alltraps>

80105565 <vector111>:
.globl vector111
vector111:
  pushl $0
80105565:	6a 00                	push   $0x0
  pushl $111
80105567:	6a 6f                	push   $0x6f
  jmp alltraps
80105569:	e9 98 f7 ff ff       	jmp    80104d06 <alltraps>

8010556e <vector112>:
.globl vector112
vector112:
  pushl $0
8010556e:	6a 00                	push   $0x0
  pushl $112
80105570:	6a 70                	push   $0x70
  jmp alltraps
80105572:	e9 8f f7 ff ff       	jmp    80104d06 <alltraps>

80105577 <vector113>:
.globl vector113
vector113:
  pushl $0
80105577:	6a 00                	push   $0x0
  pushl $113
80105579:	6a 71                	push   $0x71
  jmp alltraps
8010557b:	e9 86 f7 ff ff       	jmp    80104d06 <alltraps>

80105580 <vector114>:
.globl vector114
vector114:
  pushl $0
80105580:	6a 00                	push   $0x0
  pushl $114
80105582:	6a 72                	push   $0x72
  jmp alltraps
80105584:	e9 7d f7 ff ff       	jmp    80104d06 <alltraps>

80105589 <vector115>:
.globl vector115
vector115:
  pushl $0
80105589:	6a 00                	push   $0x0
  pushl $115
8010558b:	6a 73                	push   $0x73
  jmp alltraps
8010558d:	e9 74 f7 ff ff       	jmp    80104d06 <alltraps>

80105592 <vector116>:
.globl vector116
vector116:
  pushl $0
80105592:	6a 00                	push   $0x0
  pushl $116
80105594:	6a 74                	push   $0x74
  jmp alltraps
80105596:	e9 6b f7 ff ff       	jmp    80104d06 <alltraps>

8010559b <vector117>:
.globl vector117
vector117:
  pushl $0
8010559b:	6a 00                	push   $0x0
  pushl $117
8010559d:	6a 75                	push   $0x75
  jmp alltraps
8010559f:	e9 62 f7 ff ff       	jmp    80104d06 <alltraps>

801055a4 <vector118>:
.globl vector118
vector118:
  pushl $0
801055a4:	6a 00                	push   $0x0
  pushl $118
801055a6:	6a 76                	push   $0x76
  jmp alltraps
801055a8:	e9 59 f7 ff ff       	jmp    80104d06 <alltraps>

801055ad <vector119>:
.globl vector119
vector119:
  pushl $0
801055ad:	6a 00                	push   $0x0
  pushl $119
801055af:	6a 77                	push   $0x77
  jmp alltraps
801055b1:	e9 50 f7 ff ff       	jmp    80104d06 <alltraps>

801055b6 <vector120>:
.globl vector120
vector120:
  pushl $0
801055b6:	6a 00                	push   $0x0
  pushl $120
801055b8:	6a 78                	push   $0x78
  jmp alltraps
801055ba:	e9 47 f7 ff ff       	jmp    80104d06 <alltraps>

801055bf <vector121>:
.globl vector121
vector121:
  pushl $0
801055bf:	6a 00                	push   $0x0
  pushl $121
801055c1:	6a 79                	push   $0x79
  jmp alltraps
801055c3:	e9 3e f7 ff ff       	jmp    80104d06 <alltraps>

801055c8 <vector122>:
.globl vector122
vector122:
  pushl $0
801055c8:	6a 00                	push   $0x0
  pushl $122
801055ca:	6a 7a                	push   $0x7a
  jmp alltraps
801055cc:	e9 35 f7 ff ff       	jmp    80104d06 <alltraps>

801055d1 <vector123>:
.globl vector123
vector123:
  pushl $0
801055d1:	6a 00                	push   $0x0
  pushl $123
801055d3:	6a 7b                	push   $0x7b
  jmp alltraps
801055d5:	e9 2c f7 ff ff       	jmp    80104d06 <alltraps>

801055da <vector124>:
.globl vector124
vector124:
  pushl $0
801055da:	6a 00                	push   $0x0
  pushl $124
801055dc:	6a 7c                	push   $0x7c
  jmp alltraps
801055de:	e9 23 f7 ff ff       	jmp    80104d06 <alltraps>

801055e3 <vector125>:
.globl vector125
vector125:
  pushl $0
801055e3:	6a 00                	push   $0x0
  pushl $125
801055e5:	6a 7d                	push   $0x7d
  jmp alltraps
801055e7:	e9 1a f7 ff ff       	jmp    80104d06 <alltraps>

801055ec <vector126>:
.globl vector126
vector126:
  pushl $0
801055ec:	6a 00                	push   $0x0
  pushl $126
801055ee:	6a 7e                	push   $0x7e
  jmp alltraps
801055f0:	e9 11 f7 ff ff       	jmp    80104d06 <alltraps>

801055f5 <vector127>:
.globl vector127
vector127:
  pushl $0
801055f5:	6a 00                	push   $0x0
  pushl $127
801055f7:	6a 7f                	push   $0x7f
  jmp alltraps
801055f9:	e9 08 f7 ff ff       	jmp    80104d06 <alltraps>

801055fe <vector128>:
.globl vector128
vector128:
  pushl $0
801055fe:	6a 00                	push   $0x0
  pushl $128
80105600:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80105605:	e9 fc f6 ff ff       	jmp    80104d06 <alltraps>

8010560a <vector129>:
.globl vector129
vector129:
  pushl $0
8010560a:	6a 00                	push   $0x0
  pushl $129
8010560c:	68 81 00 00 00       	push   $0x81
  jmp alltraps
80105611:	e9 f0 f6 ff ff       	jmp    80104d06 <alltraps>

80105616 <vector130>:
.globl vector130
vector130:
  pushl $0
80105616:	6a 00                	push   $0x0
  pushl $130
80105618:	68 82 00 00 00       	push   $0x82
  jmp alltraps
8010561d:	e9 e4 f6 ff ff       	jmp    80104d06 <alltraps>

80105622 <vector131>:
.globl vector131
vector131:
  pushl $0
80105622:	6a 00                	push   $0x0
  pushl $131
80105624:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80105629:	e9 d8 f6 ff ff       	jmp    80104d06 <alltraps>

8010562e <vector132>:
.globl vector132
vector132:
  pushl $0
8010562e:	6a 00                	push   $0x0
  pushl $132
80105630:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80105635:	e9 cc f6 ff ff       	jmp    80104d06 <alltraps>

8010563a <vector133>:
.globl vector133
vector133:
  pushl $0
8010563a:	6a 00                	push   $0x0
  pushl $133
8010563c:	68 85 00 00 00       	push   $0x85
  jmp alltraps
80105641:	e9 c0 f6 ff ff       	jmp    80104d06 <alltraps>

80105646 <vector134>:
.globl vector134
vector134:
  pushl $0
80105646:	6a 00                	push   $0x0
  pushl $134
80105648:	68 86 00 00 00       	push   $0x86
  jmp alltraps
8010564d:	e9 b4 f6 ff ff       	jmp    80104d06 <alltraps>

80105652 <vector135>:
.globl vector135
vector135:
  pushl $0
80105652:	6a 00                	push   $0x0
  pushl $135
80105654:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80105659:	e9 a8 f6 ff ff       	jmp    80104d06 <alltraps>

8010565e <vector136>:
.globl vector136
vector136:
  pushl $0
8010565e:	6a 00                	push   $0x0
  pushl $136
80105660:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80105665:	e9 9c f6 ff ff       	jmp    80104d06 <alltraps>

8010566a <vector137>:
.globl vector137
vector137:
  pushl $0
8010566a:	6a 00                	push   $0x0
  pushl $137
8010566c:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80105671:	e9 90 f6 ff ff       	jmp    80104d06 <alltraps>

80105676 <vector138>:
.globl vector138
vector138:
  pushl $0
80105676:	6a 00                	push   $0x0
  pushl $138
80105678:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
8010567d:	e9 84 f6 ff ff       	jmp    80104d06 <alltraps>

80105682 <vector139>:
.globl vector139
vector139:
  pushl $0
80105682:	6a 00                	push   $0x0
  pushl $139
80105684:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80105689:	e9 78 f6 ff ff       	jmp    80104d06 <alltraps>

8010568e <vector140>:
.globl vector140
vector140:
  pushl $0
8010568e:	6a 00                	push   $0x0
  pushl $140
80105690:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80105695:	e9 6c f6 ff ff       	jmp    80104d06 <alltraps>

8010569a <vector141>:
.globl vector141
vector141:
  pushl $0
8010569a:	6a 00                	push   $0x0
  pushl $141
8010569c:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801056a1:	e9 60 f6 ff ff       	jmp    80104d06 <alltraps>

801056a6 <vector142>:
.globl vector142
vector142:
  pushl $0
801056a6:	6a 00                	push   $0x0
  pushl $142
801056a8:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801056ad:	e9 54 f6 ff ff       	jmp    80104d06 <alltraps>

801056b2 <vector143>:
.globl vector143
vector143:
  pushl $0
801056b2:	6a 00                	push   $0x0
  pushl $143
801056b4:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
801056b9:	e9 48 f6 ff ff       	jmp    80104d06 <alltraps>

801056be <vector144>:
.globl vector144
vector144:
  pushl $0
801056be:	6a 00                	push   $0x0
  pushl $144
801056c0:	68 90 00 00 00       	push   $0x90
  jmp alltraps
801056c5:	e9 3c f6 ff ff       	jmp    80104d06 <alltraps>

801056ca <vector145>:
.globl vector145
vector145:
  pushl $0
801056ca:	6a 00                	push   $0x0
  pushl $145
801056cc:	68 91 00 00 00       	push   $0x91
  jmp alltraps
801056d1:	e9 30 f6 ff ff       	jmp    80104d06 <alltraps>

801056d6 <vector146>:
.globl vector146
vector146:
  pushl $0
801056d6:	6a 00                	push   $0x0
  pushl $146
801056d8:	68 92 00 00 00       	push   $0x92
  jmp alltraps
801056dd:	e9 24 f6 ff ff       	jmp    80104d06 <alltraps>

801056e2 <vector147>:
.globl vector147
vector147:
  pushl $0
801056e2:	6a 00                	push   $0x0
  pushl $147
801056e4:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801056e9:	e9 18 f6 ff ff       	jmp    80104d06 <alltraps>

801056ee <vector148>:
.globl vector148
vector148:
  pushl $0
801056ee:	6a 00                	push   $0x0
  pushl $148
801056f0:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801056f5:	e9 0c f6 ff ff       	jmp    80104d06 <alltraps>

801056fa <vector149>:
.globl vector149
vector149:
  pushl $0
801056fa:	6a 00                	push   $0x0
  pushl $149
801056fc:	68 95 00 00 00       	push   $0x95
  jmp alltraps
80105701:	e9 00 f6 ff ff       	jmp    80104d06 <alltraps>

80105706 <vector150>:
.globl vector150
vector150:
  pushl $0
80105706:	6a 00                	push   $0x0
  pushl $150
80105708:	68 96 00 00 00       	push   $0x96
  jmp alltraps
8010570d:	e9 f4 f5 ff ff       	jmp    80104d06 <alltraps>

80105712 <vector151>:
.globl vector151
vector151:
  pushl $0
80105712:	6a 00                	push   $0x0
  pushl $151
80105714:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80105719:	e9 e8 f5 ff ff       	jmp    80104d06 <alltraps>

8010571e <vector152>:
.globl vector152
vector152:
  pushl $0
8010571e:	6a 00                	push   $0x0
  pushl $152
80105720:	68 98 00 00 00       	push   $0x98
  jmp alltraps
80105725:	e9 dc f5 ff ff       	jmp    80104d06 <alltraps>

8010572a <vector153>:
.globl vector153
vector153:
  pushl $0
8010572a:	6a 00                	push   $0x0
  pushl $153
8010572c:	68 99 00 00 00       	push   $0x99
  jmp alltraps
80105731:	e9 d0 f5 ff ff       	jmp    80104d06 <alltraps>

80105736 <vector154>:
.globl vector154
vector154:
  pushl $0
80105736:	6a 00                	push   $0x0
  pushl $154
80105738:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
8010573d:	e9 c4 f5 ff ff       	jmp    80104d06 <alltraps>

80105742 <vector155>:
.globl vector155
vector155:
  pushl $0
80105742:	6a 00                	push   $0x0
  pushl $155
80105744:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80105749:	e9 b8 f5 ff ff       	jmp    80104d06 <alltraps>

8010574e <vector156>:
.globl vector156
vector156:
  pushl $0
8010574e:	6a 00                	push   $0x0
  pushl $156
80105750:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80105755:	e9 ac f5 ff ff       	jmp    80104d06 <alltraps>

8010575a <vector157>:
.globl vector157
vector157:
  pushl $0
8010575a:	6a 00                	push   $0x0
  pushl $157
8010575c:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
80105761:	e9 a0 f5 ff ff       	jmp    80104d06 <alltraps>

80105766 <vector158>:
.globl vector158
vector158:
  pushl $0
80105766:	6a 00                	push   $0x0
  pushl $158
80105768:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
8010576d:	e9 94 f5 ff ff       	jmp    80104d06 <alltraps>

80105772 <vector159>:
.globl vector159
vector159:
  pushl $0
80105772:	6a 00                	push   $0x0
  pushl $159
80105774:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80105779:	e9 88 f5 ff ff       	jmp    80104d06 <alltraps>

8010577e <vector160>:
.globl vector160
vector160:
  pushl $0
8010577e:	6a 00                	push   $0x0
  pushl $160
80105780:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
80105785:	e9 7c f5 ff ff       	jmp    80104d06 <alltraps>

8010578a <vector161>:
.globl vector161
vector161:
  pushl $0
8010578a:	6a 00                	push   $0x0
  pushl $161
8010578c:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
80105791:	e9 70 f5 ff ff       	jmp    80104d06 <alltraps>

80105796 <vector162>:
.globl vector162
vector162:
  pushl $0
80105796:	6a 00                	push   $0x0
  pushl $162
80105798:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
8010579d:	e9 64 f5 ff ff       	jmp    80104d06 <alltraps>

801057a2 <vector163>:
.globl vector163
vector163:
  pushl $0
801057a2:	6a 00                	push   $0x0
  pushl $163
801057a4:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801057a9:	e9 58 f5 ff ff       	jmp    80104d06 <alltraps>

801057ae <vector164>:
.globl vector164
vector164:
  pushl $0
801057ae:	6a 00                	push   $0x0
  pushl $164
801057b0:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801057b5:	e9 4c f5 ff ff       	jmp    80104d06 <alltraps>

801057ba <vector165>:
.globl vector165
vector165:
  pushl $0
801057ba:	6a 00                	push   $0x0
  pushl $165
801057bc:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
801057c1:	e9 40 f5 ff ff       	jmp    80104d06 <alltraps>

801057c6 <vector166>:
.globl vector166
vector166:
  pushl $0
801057c6:	6a 00                	push   $0x0
  pushl $166
801057c8:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
801057cd:	e9 34 f5 ff ff       	jmp    80104d06 <alltraps>

801057d2 <vector167>:
.globl vector167
vector167:
  pushl $0
801057d2:	6a 00                	push   $0x0
  pushl $167
801057d4:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
801057d9:	e9 28 f5 ff ff       	jmp    80104d06 <alltraps>

801057de <vector168>:
.globl vector168
vector168:
  pushl $0
801057de:	6a 00                	push   $0x0
  pushl $168
801057e0:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
801057e5:	e9 1c f5 ff ff       	jmp    80104d06 <alltraps>

801057ea <vector169>:
.globl vector169
vector169:
  pushl $0
801057ea:	6a 00                	push   $0x0
  pushl $169
801057ec:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801057f1:	e9 10 f5 ff ff       	jmp    80104d06 <alltraps>

801057f6 <vector170>:
.globl vector170
vector170:
  pushl $0
801057f6:	6a 00                	push   $0x0
  pushl $170
801057f8:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801057fd:	e9 04 f5 ff ff       	jmp    80104d06 <alltraps>

80105802 <vector171>:
.globl vector171
vector171:
  pushl $0
80105802:	6a 00                	push   $0x0
  pushl $171
80105804:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80105809:	e9 f8 f4 ff ff       	jmp    80104d06 <alltraps>

8010580e <vector172>:
.globl vector172
vector172:
  pushl $0
8010580e:	6a 00                	push   $0x0
  pushl $172
80105810:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
80105815:	e9 ec f4 ff ff       	jmp    80104d06 <alltraps>

8010581a <vector173>:
.globl vector173
vector173:
  pushl $0
8010581a:	6a 00                	push   $0x0
  pushl $173
8010581c:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
80105821:	e9 e0 f4 ff ff       	jmp    80104d06 <alltraps>

80105826 <vector174>:
.globl vector174
vector174:
  pushl $0
80105826:	6a 00                	push   $0x0
  pushl $174
80105828:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
8010582d:	e9 d4 f4 ff ff       	jmp    80104d06 <alltraps>

80105832 <vector175>:
.globl vector175
vector175:
  pushl $0
80105832:	6a 00                	push   $0x0
  pushl $175
80105834:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80105839:	e9 c8 f4 ff ff       	jmp    80104d06 <alltraps>

8010583e <vector176>:
.globl vector176
vector176:
  pushl $0
8010583e:	6a 00                	push   $0x0
  pushl $176
80105840:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
80105845:	e9 bc f4 ff ff       	jmp    80104d06 <alltraps>

8010584a <vector177>:
.globl vector177
vector177:
  pushl $0
8010584a:	6a 00                	push   $0x0
  pushl $177
8010584c:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
80105851:	e9 b0 f4 ff ff       	jmp    80104d06 <alltraps>

80105856 <vector178>:
.globl vector178
vector178:
  pushl $0
80105856:	6a 00                	push   $0x0
  pushl $178
80105858:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
8010585d:	e9 a4 f4 ff ff       	jmp    80104d06 <alltraps>

80105862 <vector179>:
.globl vector179
vector179:
  pushl $0
80105862:	6a 00                	push   $0x0
  pushl $179
80105864:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80105869:	e9 98 f4 ff ff       	jmp    80104d06 <alltraps>

8010586e <vector180>:
.globl vector180
vector180:
  pushl $0
8010586e:	6a 00                	push   $0x0
  pushl $180
80105870:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
80105875:	e9 8c f4 ff ff       	jmp    80104d06 <alltraps>

8010587a <vector181>:
.globl vector181
vector181:
  pushl $0
8010587a:	6a 00                	push   $0x0
  pushl $181
8010587c:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
80105881:	e9 80 f4 ff ff       	jmp    80104d06 <alltraps>

80105886 <vector182>:
.globl vector182
vector182:
  pushl $0
80105886:	6a 00                	push   $0x0
  pushl $182
80105888:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
8010588d:	e9 74 f4 ff ff       	jmp    80104d06 <alltraps>

80105892 <vector183>:
.globl vector183
vector183:
  pushl $0
80105892:	6a 00                	push   $0x0
  pushl $183
80105894:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80105899:	e9 68 f4 ff ff       	jmp    80104d06 <alltraps>

8010589e <vector184>:
.globl vector184
vector184:
  pushl $0
8010589e:	6a 00                	push   $0x0
  pushl $184
801058a0:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801058a5:	e9 5c f4 ff ff       	jmp    80104d06 <alltraps>

801058aa <vector185>:
.globl vector185
vector185:
  pushl $0
801058aa:	6a 00                	push   $0x0
  pushl $185
801058ac:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801058b1:	e9 50 f4 ff ff       	jmp    80104d06 <alltraps>

801058b6 <vector186>:
.globl vector186
vector186:
  pushl $0
801058b6:	6a 00                	push   $0x0
  pushl $186
801058b8:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
801058bd:	e9 44 f4 ff ff       	jmp    80104d06 <alltraps>

801058c2 <vector187>:
.globl vector187
vector187:
  pushl $0
801058c2:	6a 00                	push   $0x0
  pushl $187
801058c4:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
801058c9:	e9 38 f4 ff ff       	jmp    80104d06 <alltraps>

801058ce <vector188>:
.globl vector188
vector188:
  pushl $0
801058ce:	6a 00                	push   $0x0
  pushl $188
801058d0:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801058d5:	e9 2c f4 ff ff       	jmp    80104d06 <alltraps>

801058da <vector189>:
.globl vector189
vector189:
  pushl $0
801058da:	6a 00                	push   $0x0
  pushl $189
801058dc:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
801058e1:	e9 20 f4 ff ff       	jmp    80104d06 <alltraps>

801058e6 <vector190>:
.globl vector190
vector190:
  pushl $0
801058e6:	6a 00                	push   $0x0
  pushl $190
801058e8:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801058ed:	e9 14 f4 ff ff       	jmp    80104d06 <alltraps>

801058f2 <vector191>:
.globl vector191
vector191:
  pushl $0
801058f2:	6a 00                	push   $0x0
  pushl $191
801058f4:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801058f9:	e9 08 f4 ff ff       	jmp    80104d06 <alltraps>

801058fe <vector192>:
.globl vector192
vector192:
  pushl $0
801058fe:	6a 00                	push   $0x0
  pushl $192
80105900:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80105905:	e9 fc f3 ff ff       	jmp    80104d06 <alltraps>

8010590a <vector193>:
.globl vector193
vector193:
  pushl $0
8010590a:	6a 00                	push   $0x0
  pushl $193
8010590c:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80105911:	e9 f0 f3 ff ff       	jmp    80104d06 <alltraps>

80105916 <vector194>:
.globl vector194
vector194:
  pushl $0
80105916:	6a 00                	push   $0x0
  pushl $194
80105918:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
8010591d:	e9 e4 f3 ff ff       	jmp    80104d06 <alltraps>

80105922 <vector195>:
.globl vector195
vector195:
  pushl $0
80105922:	6a 00                	push   $0x0
  pushl $195
80105924:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80105929:	e9 d8 f3 ff ff       	jmp    80104d06 <alltraps>

8010592e <vector196>:
.globl vector196
vector196:
  pushl $0
8010592e:	6a 00                	push   $0x0
  pushl $196
80105930:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80105935:	e9 cc f3 ff ff       	jmp    80104d06 <alltraps>

8010593a <vector197>:
.globl vector197
vector197:
  pushl $0
8010593a:	6a 00                	push   $0x0
  pushl $197
8010593c:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80105941:	e9 c0 f3 ff ff       	jmp    80104d06 <alltraps>

80105946 <vector198>:
.globl vector198
vector198:
  pushl $0
80105946:	6a 00                	push   $0x0
  pushl $198
80105948:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
8010594d:	e9 b4 f3 ff ff       	jmp    80104d06 <alltraps>

80105952 <vector199>:
.globl vector199
vector199:
  pushl $0
80105952:	6a 00                	push   $0x0
  pushl $199
80105954:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80105959:	e9 a8 f3 ff ff       	jmp    80104d06 <alltraps>

8010595e <vector200>:
.globl vector200
vector200:
  pushl $0
8010595e:	6a 00                	push   $0x0
  pushl $200
80105960:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80105965:	e9 9c f3 ff ff       	jmp    80104d06 <alltraps>

8010596a <vector201>:
.globl vector201
vector201:
  pushl $0
8010596a:	6a 00                	push   $0x0
  pushl $201
8010596c:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80105971:	e9 90 f3 ff ff       	jmp    80104d06 <alltraps>

80105976 <vector202>:
.globl vector202
vector202:
  pushl $0
80105976:	6a 00                	push   $0x0
  pushl $202
80105978:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
8010597d:	e9 84 f3 ff ff       	jmp    80104d06 <alltraps>

80105982 <vector203>:
.globl vector203
vector203:
  pushl $0
80105982:	6a 00                	push   $0x0
  pushl $203
80105984:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80105989:	e9 78 f3 ff ff       	jmp    80104d06 <alltraps>

8010598e <vector204>:
.globl vector204
vector204:
  pushl $0
8010598e:	6a 00                	push   $0x0
  pushl $204
80105990:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80105995:	e9 6c f3 ff ff       	jmp    80104d06 <alltraps>

8010599a <vector205>:
.globl vector205
vector205:
  pushl $0
8010599a:	6a 00                	push   $0x0
  pushl $205
8010599c:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801059a1:	e9 60 f3 ff ff       	jmp    80104d06 <alltraps>

801059a6 <vector206>:
.globl vector206
vector206:
  pushl $0
801059a6:	6a 00                	push   $0x0
  pushl $206
801059a8:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801059ad:	e9 54 f3 ff ff       	jmp    80104d06 <alltraps>

801059b2 <vector207>:
.globl vector207
vector207:
  pushl $0
801059b2:	6a 00                	push   $0x0
  pushl $207
801059b4:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
801059b9:	e9 48 f3 ff ff       	jmp    80104d06 <alltraps>

801059be <vector208>:
.globl vector208
vector208:
  pushl $0
801059be:	6a 00                	push   $0x0
  pushl $208
801059c0:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
801059c5:	e9 3c f3 ff ff       	jmp    80104d06 <alltraps>

801059ca <vector209>:
.globl vector209
vector209:
  pushl $0
801059ca:	6a 00                	push   $0x0
  pushl $209
801059cc:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
801059d1:	e9 30 f3 ff ff       	jmp    80104d06 <alltraps>

801059d6 <vector210>:
.globl vector210
vector210:
  pushl $0
801059d6:	6a 00                	push   $0x0
  pushl $210
801059d8:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801059dd:	e9 24 f3 ff ff       	jmp    80104d06 <alltraps>

801059e2 <vector211>:
.globl vector211
vector211:
  pushl $0
801059e2:	6a 00                	push   $0x0
  pushl $211
801059e4:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801059e9:	e9 18 f3 ff ff       	jmp    80104d06 <alltraps>

801059ee <vector212>:
.globl vector212
vector212:
  pushl $0
801059ee:	6a 00                	push   $0x0
  pushl $212
801059f0:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801059f5:	e9 0c f3 ff ff       	jmp    80104d06 <alltraps>

801059fa <vector213>:
.globl vector213
vector213:
  pushl $0
801059fa:	6a 00                	push   $0x0
  pushl $213
801059fc:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80105a01:	e9 00 f3 ff ff       	jmp    80104d06 <alltraps>

80105a06 <vector214>:
.globl vector214
vector214:
  pushl $0
80105a06:	6a 00                	push   $0x0
  pushl $214
80105a08:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80105a0d:	e9 f4 f2 ff ff       	jmp    80104d06 <alltraps>

80105a12 <vector215>:
.globl vector215
vector215:
  pushl $0
80105a12:	6a 00                	push   $0x0
  pushl $215
80105a14:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80105a19:	e9 e8 f2 ff ff       	jmp    80104d06 <alltraps>

80105a1e <vector216>:
.globl vector216
vector216:
  pushl $0
80105a1e:	6a 00                	push   $0x0
  pushl $216
80105a20:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80105a25:	e9 dc f2 ff ff       	jmp    80104d06 <alltraps>

80105a2a <vector217>:
.globl vector217
vector217:
  pushl $0
80105a2a:	6a 00                	push   $0x0
  pushl $217
80105a2c:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80105a31:	e9 d0 f2 ff ff       	jmp    80104d06 <alltraps>

80105a36 <vector218>:
.globl vector218
vector218:
  pushl $0
80105a36:	6a 00                	push   $0x0
  pushl $218
80105a38:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80105a3d:	e9 c4 f2 ff ff       	jmp    80104d06 <alltraps>

80105a42 <vector219>:
.globl vector219
vector219:
  pushl $0
80105a42:	6a 00                	push   $0x0
  pushl $219
80105a44:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80105a49:	e9 b8 f2 ff ff       	jmp    80104d06 <alltraps>

80105a4e <vector220>:
.globl vector220
vector220:
  pushl $0
80105a4e:	6a 00                	push   $0x0
  pushl $220
80105a50:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80105a55:	e9 ac f2 ff ff       	jmp    80104d06 <alltraps>

80105a5a <vector221>:
.globl vector221
vector221:
  pushl $0
80105a5a:	6a 00                	push   $0x0
  pushl $221
80105a5c:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80105a61:	e9 a0 f2 ff ff       	jmp    80104d06 <alltraps>

80105a66 <vector222>:
.globl vector222
vector222:
  pushl $0
80105a66:	6a 00                	push   $0x0
  pushl $222
80105a68:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80105a6d:	e9 94 f2 ff ff       	jmp    80104d06 <alltraps>

80105a72 <vector223>:
.globl vector223
vector223:
  pushl $0
80105a72:	6a 00                	push   $0x0
  pushl $223
80105a74:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80105a79:	e9 88 f2 ff ff       	jmp    80104d06 <alltraps>

80105a7e <vector224>:
.globl vector224
vector224:
  pushl $0
80105a7e:	6a 00                	push   $0x0
  pushl $224
80105a80:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80105a85:	e9 7c f2 ff ff       	jmp    80104d06 <alltraps>

80105a8a <vector225>:
.globl vector225
vector225:
  pushl $0
80105a8a:	6a 00                	push   $0x0
  pushl $225
80105a8c:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80105a91:	e9 70 f2 ff ff       	jmp    80104d06 <alltraps>

80105a96 <vector226>:
.globl vector226
vector226:
  pushl $0
80105a96:	6a 00                	push   $0x0
  pushl $226
80105a98:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80105a9d:	e9 64 f2 ff ff       	jmp    80104d06 <alltraps>

80105aa2 <vector227>:
.globl vector227
vector227:
  pushl $0
80105aa2:	6a 00                	push   $0x0
  pushl $227
80105aa4:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80105aa9:	e9 58 f2 ff ff       	jmp    80104d06 <alltraps>

80105aae <vector228>:
.globl vector228
vector228:
  pushl $0
80105aae:	6a 00                	push   $0x0
  pushl $228
80105ab0:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80105ab5:	e9 4c f2 ff ff       	jmp    80104d06 <alltraps>

80105aba <vector229>:
.globl vector229
vector229:
  pushl $0
80105aba:	6a 00                	push   $0x0
  pushl $229
80105abc:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80105ac1:	e9 40 f2 ff ff       	jmp    80104d06 <alltraps>

80105ac6 <vector230>:
.globl vector230
vector230:
  pushl $0
80105ac6:	6a 00                	push   $0x0
  pushl $230
80105ac8:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80105acd:	e9 34 f2 ff ff       	jmp    80104d06 <alltraps>

80105ad2 <vector231>:
.globl vector231
vector231:
  pushl $0
80105ad2:	6a 00                	push   $0x0
  pushl $231
80105ad4:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80105ad9:	e9 28 f2 ff ff       	jmp    80104d06 <alltraps>

80105ade <vector232>:
.globl vector232
vector232:
  pushl $0
80105ade:	6a 00                	push   $0x0
  pushl $232
80105ae0:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80105ae5:	e9 1c f2 ff ff       	jmp    80104d06 <alltraps>

80105aea <vector233>:
.globl vector233
vector233:
  pushl $0
80105aea:	6a 00                	push   $0x0
  pushl $233
80105aec:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80105af1:	e9 10 f2 ff ff       	jmp    80104d06 <alltraps>

80105af6 <vector234>:
.globl vector234
vector234:
  pushl $0
80105af6:	6a 00                	push   $0x0
  pushl $234
80105af8:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80105afd:	e9 04 f2 ff ff       	jmp    80104d06 <alltraps>

80105b02 <vector235>:
.globl vector235
vector235:
  pushl $0
80105b02:	6a 00                	push   $0x0
  pushl $235
80105b04:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80105b09:	e9 f8 f1 ff ff       	jmp    80104d06 <alltraps>

80105b0e <vector236>:
.globl vector236
vector236:
  pushl $0
80105b0e:	6a 00                	push   $0x0
  pushl $236
80105b10:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80105b15:	e9 ec f1 ff ff       	jmp    80104d06 <alltraps>

80105b1a <vector237>:
.globl vector237
vector237:
  pushl $0
80105b1a:	6a 00                	push   $0x0
  pushl $237
80105b1c:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80105b21:	e9 e0 f1 ff ff       	jmp    80104d06 <alltraps>

80105b26 <vector238>:
.globl vector238
vector238:
  pushl $0
80105b26:	6a 00                	push   $0x0
  pushl $238
80105b28:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80105b2d:	e9 d4 f1 ff ff       	jmp    80104d06 <alltraps>

80105b32 <vector239>:
.globl vector239
vector239:
  pushl $0
80105b32:	6a 00                	push   $0x0
  pushl $239
80105b34:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80105b39:	e9 c8 f1 ff ff       	jmp    80104d06 <alltraps>

80105b3e <vector240>:
.globl vector240
vector240:
  pushl $0
80105b3e:	6a 00                	push   $0x0
  pushl $240
80105b40:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80105b45:	e9 bc f1 ff ff       	jmp    80104d06 <alltraps>

80105b4a <vector241>:
.globl vector241
vector241:
  pushl $0
80105b4a:	6a 00                	push   $0x0
  pushl $241
80105b4c:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80105b51:	e9 b0 f1 ff ff       	jmp    80104d06 <alltraps>

80105b56 <vector242>:
.globl vector242
vector242:
  pushl $0
80105b56:	6a 00                	push   $0x0
  pushl $242
80105b58:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80105b5d:	e9 a4 f1 ff ff       	jmp    80104d06 <alltraps>

80105b62 <vector243>:
.globl vector243
vector243:
  pushl $0
80105b62:	6a 00                	push   $0x0
  pushl $243
80105b64:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80105b69:	e9 98 f1 ff ff       	jmp    80104d06 <alltraps>

80105b6e <vector244>:
.globl vector244
vector244:
  pushl $0
80105b6e:	6a 00                	push   $0x0
  pushl $244
80105b70:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80105b75:	e9 8c f1 ff ff       	jmp    80104d06 <alltraps>

80105b7a <vector245>:
.globl vector245
vector245:
  pushl $0
80105b7a:	6a 00                	push   $0x0
  pushl $245
80105b7c:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80105b81:	e9 80 f1 ff ff       	jmp    80104d06 <alltraps>

80105b86 <vector246>:
.globl vector246
vector246:
  pushl $0
80105b86:	6a 00                	push   $0x0
  pushl $246
80105b88:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80105b8d:	e9 74 f1 ff ff       	jmp    80104d06 <alltraps>

80105b92 <vector247>:
.globl vector247
vector247:
  pushl $0
80105b92:	6a 00                	push   $0x0
  pushl $247
80105b94:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80105b99:	e9 68 f1 ff ff       	jmp    80104d06 <alltraps>

80105b9e <vector248>:
.globl vector248
vector248:
  pushl $0
80105b9e:	6a 00                	push   $0x0
  pushl $248
80105ba0:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80105ba5:	e9 5c f1 ff ff       	jmp    80104d06 <alltraps>

80105baa <vector249>:
.globl vector249
vector249:
  pushl $0
80105baa:	6a 00                	push   $0x0
  pushl $249
80105bac:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80105bb1:	e9 50 f1 ff ff       	jmp    80104d06 <alltraps>

80105bb6 <vector250>:
.globl vector250
vector250:
  pushl $0
80105bb6:	6a 00                	push   $0x0
  pushl $250
80105bb8:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80105bbd:	e9 44 f1 ff ff       	jmp    80104d06 <alltraps>

80105bc2 <vector251>:
.globl vector251
vector251:
  pushl $0
80105bc2:	6a 00                	push   $0x0
  pushl $251
80105bc4:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80105bc9:	e9 38 f1 ff ff       	jmp    80104d06 <alltraps>

80105bce <vector252>:
.globl vector252
vector252:
  pushl $0
80105bce:	6a 00                	push   $0x0
  pushl $252
80105bd0:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80105bd5:	e9 2c f1 ff ff       	jmp    80104d06 <alltraps>

80105bda <vector253>:
.globl vector253
vector253:
  pushl $0
80105bda:	6a 00                	push   $0x0
  pushl $253
80105bdc:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80105be1:	e9 20 f1 ff ff       	jmp    80104d06 <alltraps>

80105be6 <vector254>:
.globl vector254
vector254:
  pushl $0
80105be6:	6a 00                	push   $0x0
  pushl $254
80105be8:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80105bed:	e9 14 f1 ff ff       	jmp    80104d06 <alltraps>

80105bf2 <vector255>:
.globl vector255
vector255:
  pushl $0
80105bf2:	6a 00                	push   $0x0
  pushl $255
80105bf4:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80105bf9:	e9 08 f1 ff ff       	jmp    80104d06 <alltraps>

80105bfe <walkpgdir>:
>>>>>>> d669a6c (ulib and makefile)
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
<<<<<<< HEAD
80105c52:	55                   	push   %ebp
80105c53:	89 e5                	mov    %esp,%ebp
80105c55:	57                   	push   %edi
80105c56:	56                   	push   %esi
80105c57:	53                   	push   %ebx
80105c58:	83 ec 0c             	sub    $0xc,%esp
80105c5b:	89 d3                	mov    %edx,%ebx
=======
80105bfe:	55                   	push   %ebp
80105bff:	89 e5                	mov    %esp,%ebp
80105c01:	57                   	push   %edi
80105c02:	56                   	push   %esi
80105c03:	53                   	push   %ebx
80105c04:	83 ec 0c             	sub    $0xc,%esp
80105c07:	89 d3                	mov    %edx,%ebx
>>>>>>> d669a6c (ulib and makefile)
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
<<<<<<< HEAD
80105c5d:	c1 ea 16             	shr    $0x16,%edx
80105c60:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  if(*pde & PTE_P){
80105c63:	8b 37                	mov    (%edi),%esi
80105c65:	f7 c6 01 00 00 00    	test   $0x1,%esi
80105c6b:	74 20                	je     80105c8d <walkpgdir+0x3b>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80105c6d:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80105c73:	81 c6 00 00 00 80    	add    $0x80000000,%esi
=======
80105c09:	c1 ea 16             	shr    $0x16,%edx
80105c0c:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  if(*pde & PTE_P){
80105c0f:	8b 37                	mov    (%edi),%esi
80105c11:	f7 c6 01 00 00 00    	test   $0x1,%esi
80105c17:	74 20                	je     80105c39 <walkpgdir+0x3b>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80105c19:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80105c1f:	81 c6 00 00 00 80    	add    $0x80000000,%esi
>>>>>>> d669a6c (ulib and makefile)
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
<<<<<<< HEAD
80105c79:	c1 eb 0c             	shr    $0xc,%ebx
80105c7c:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
80105c82:	8d 04 9e             	lea    (%esi,%ebx,4),%eax
}
80105c85:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c88:	5b                   	pop    %ebx
80105c89:	5e                   	pop    %esi
80105c8a:	5f                   	pop    %edi
80105c8b:	5d                   	pop    %ebp
80105c8c:	c3                   	ret    
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80105c8d:	85 c9                	test   %ecx,%ecx
80105c8f:	74 2b                	je     80105cbc <walkpgdir+0x6a>
80105c91:	e8 0d c4 ff ff       	call   801020a3 <kalloc>
80105c96:	89 c6                	mov    %eax,%esi
80105c98:	85 c0                	test   %eax,%eax
80105c9a:	74 20                	je     80105cbc <walkpgdir+0x6a>
    memset(pgtab, 0, PGSIZE);
80105c9c:	83 ec 04             	sub    $0x4,%esp
80105c9f:	68 00 10 00 00       	push   $0x1000
80105ca4:	6a 00                	push   $0x0
80105ca6:	50                   	push   %eax
80105ca7:	e8 45 e0 ff ff       	call   80103cf1 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80105cac:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80105cb2:	83 c8 07             	or     $0x7,%eax
80105cb5:	89 07                	mov    %eax,(%edi)
80105cb7:	83 c4 10             	add    $0x10,%esp
80105cba:	eb bd                	jmp    80105c79 <walkpgdir+0x27>
      return 0;
80105cbc:	b8 00 00 00 00       	mov    $0x0,%eax
80105cc1:	eb c2                	jmp    80105c85 <walkpgdir+0x33>

80105cc3 <mappages>:
=======
80105c25:	c1 eb 0c             	shr    $0xc,%ebx
80105c28:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
80105c2e:	8d 04 9e             	lea    (%esi,%ebx,4),%eax
}
80105c31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c34:	5b                   	pop    %ebx
80105c35:	5e                   	pop    %esi
80105c36:	5f                   	pop    %edi
80105c37:	5d                   	pop    %ebp
80105c38:	c3                   	ret    
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80105c39:	85 c9                	test   %ecx,%ecx
80105c3b:	74 2b                	je     80105c68 <walkpgdir+0x6a>
80105c3d:	e8 61 c4 ff ff       	call   801020a3 <kalloc>
80105c42:	89 c6                	mov    %eax,%esi
80105c44:	85 c0                	test   %eax,%eax
80105c46:	74 20                	je     80105c68 <walkpgdir+0x6a>
    memset(pgtab, 0, PGSIZE);
80105c48:	83 ec 04             	sub    $0x4,%esp
80105c4b:	68 00 10 00 00       	push   $0x1000
80105c50:	6a 00                	push   $0x0
80105c52:	50                   	push   %eax
80105c53:	e8 45 e0 ff ff       	call   80103c9d <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80105c58:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80105c5e:	83 c8 07             	or     $0x7,%eax
80105c61:	89 07                	mov    %eax,(%edi)
80105c63:	83 c4 10             	add    $0x10,%esp
80105c66:	eb bd                	jmp    80105c25 <walkpgdir+0x27>
      return 0;
80105c68:	b8 00 00 00 00       	mov    $0x0,%eax
80105c6d:	eb c2                	jmp    80105c31 <walkpgdir+0x33>

80105c6f <mappages>:
>>>>>>> d669a6c (ulib and makefile)
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
<<<<<<< HEAD
80105cc3:	55                   	push   %ebp
80105cc4:	89 e5                	mov    %esp,%ebp
80105cc6:	57                   	push   %edi
80105cc7:	56                   	push   %esi
80105cc8:	53                   	push   %ebx
80105cc9:	83 ec 1c             	sub    $0x1c,%esp
80105ccc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105ccf:	8b 75 08             	mov    0x8(%ebp),%esi
=======
80105c6f:	55                   	push   %ebp
80105c70:	89 e5                	mov    %esp,%ebp
80105c72:	57                   	push   %edi
80105c73:	56                   	push   %esi
80105c74:	53                   	push   %ebx
80105c75:	83 ec 1c             	sub    $0x1c,%esp
80105c78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105c7b:	8b 75 08             	mov    0x8(%ebp),%esi
>>>>>>> d669a6c (ulib and makefile)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
<<<<<<< HEAD
80105cd2:	89 d3                	mov    %edx,%ebx
80105cd4:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80105cda:	8d 7c 0a ff          	lea    -0x1(%edx,%ecx,1),%edi
80105cde:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105ce4:	b9 01 00 00 00       	mov    $0x1,%ecx
80105ce9:	89 da                	mov    %ebx,%edx
80105ceb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105cee:	e8 5f ff ff ff       	call   80105c52 <walkpgdir>
80105cf3:	85 c0                	test   %eax,%eax
80105cf5:	74 2e                	je     80105d25 <mappages+0x62>
      return -1;
    if(*pte & PTE_P)
80105cf7:	f6 00 01             	testb  $0x1,(%eax)
80105cfa:	75 1c                	jne    80105d18 <mappages+0x55>
      panic("remap");
    *pte = pa | perm | PTE_P;
80105cfc:	89 f2                	mov    %esi,%edx
80105cfe:	0b 55 0c             	or     0xc(%ebp),%edx
80105d01:	83 ca 01             	or     $0x1,%edx
80105d04:	89 10                	mov    %edx,(%eax)
    if(a == last)
80105d06:	39 fb                	cmp    %edi,%ebx
80105d08:	74 28                	je     80105d32 <mappages+0x6f>
      break;
    a += PGSIZE;
80105d0a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    pa += PGSIZE;
80105d10:	81 c6 00 10 00 00    	add    $0x1000,%esi
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105d16:	eb cc                	jmp    80105ce4 <mappages+0x21>
      panic("remap");
80105d18:	83 ec 0c             	sub    $0xc,%esp
80105d1b:	68 10 6f 10 80       	push   $0x80106f10
80105d20:	e8 23 a6 ff ff       	call   80100348 <panic>
      return -1;
80105d25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80105d2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d2d:	5b                   	pop    %ebx
80105d2e:	5e                   	pop    %esi
80105d2f:	5f                   	pop    %edi
80105d30:	5d                   	pop    %ebp
80105d31:	c3                   	ret    
  return 0;
80105d32:	b8 00 00 00 00       	mov    $0x0,%eax
80105d37:	eb f1                	jmp    80105d2a <mappages+0x67>

80105d39 <seginit>:
{
80105d39:	55                   	push   %ebp
80105d3a:	89 e5                	mov    %esp,%ebp
80105d3c:	57                   	push   %edi
80105d3d:	56                   	push   %esi
80105d3e:	53                   	push   %ebx
80105d3f:	83 ec 1c             	sub    $0x1c,%esp
  c = &cpus[cpuid()];
80105d42:	e8 53 d4 ff ff       	call   8010319a <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80105d47:	69 f8 b0 00 00 00    	imul   $0xb0,%eax,%edi
80105d4d:	66 c7 87 18 18 11 80 	movw   $0xffff,-0x7feee7e8(%edi)
80105d54:	ff ff 
80105d56:	66 c7 87 1a 18 11 80 	movw   $0x0,-0x7feee7e6(%edi)
80105d5d:	00 00 
80105d5f:	c6 87 1c 18 11 80 00 	movb   $0x0,-0x7feee7e4(%edi)
80105d66:	0f b6 8f 1d 18 11 80 	movzbl -0x7feee7e3(%edi),%ecx
80105d6d:	83 e1 f0             	and    $0xfffffff0,%ecx
80105d70:	89 ce                	mov    %ecx,%esi
80105d72:	83 ce 0a             	or     $0xa,%esi
80105d75:	89 f2                	mov    %esi,%edx
80105d77:	88 97 1d 18 11 80    	mov    %dl,-0x7feee7e3(%edi)
80105d7d:	83 c9 1a             	or     $0x1a,%ecx
80105d80:	88 8f 1d 18 11 80    	mov    %cl,-0x7feee7e3(%edi)
80105d86:	83 e1 9f             	and    $0xffffff9f,%ecx
80105d89:	88 8f 1d 18 11 80    	mov    %cl,-0x7feee7e3(%edi)
80105d8f:	83 c9 80             	or     $0xffffff80,%ecx
80105d92:	88 8f 1d 18 11 80    	mov    %cl,-0x7feee7e3(%edi)
80105d98:	0f b6 8f 1e 18 11 80 	movzbl -0x7feee7e2(%edi),%ecx
80105d9f:	83 c9 0f             	or     $0xf,%ecx
80105da2:	88 8f 1e 18 11 80    	mov    %cl,-0x7feee7e2(%edi)
80105da8:	89 ce                	mov    %ecx,%esi
80105daa:	83 e6 ef             	and    $0xffffffef,%esi
80105dad:	89 f2                	mov    %esi,%edx
80105daf:	88 97 1e 18 11 80    	mov    %dl,-0x7feee7e2(%edi)
80105db5:	83 e1 cf             	and    $0xffffffcf,%ecx
80105db8:	88 8f 1e 18 11 80    	mov    %cl,-0x7feee7e2(%edi)
80105dbe:	89 ce                	mov    %ecx,%esi
80105dc0:	83 ce 40             	or     $0x40,%esi
80105dc3:	89 f2                	mov    %esi,%edx
80105dc5:	88 97 1e 18 11 80    	mov    %dl,-0x7feee7e2(%edi)
80105dcb:	83 c9 c0             	or     $0xffffffc0,%ecx
80105dce:	88 8f 1e 18 11 80    	mov    %cl,-0x7feee7e2(%edi)
80105dd4:	c6 87 1f 18 11 80 00 	movb   $0x0,-0x7feee7e1(%edi)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80105ddb:	66 c7 87 20 18 11 80 	movw   $0xffff,-0x7feee7e0(%edi)
80105de2:	ff ff 
80105de4:	66 c7 87 22 18 11 80 	movw   $0x0,-0x7feee7de(%edi)
80105deb:	00 00 
80105ded:	c6 87 24 18 11 80 00 	movb   $0x0,-0x7feee7dc(%edi)
80105df4:	0f b6 8f 25 18 11 80 	movzbl -0x7feee7db(%edi),%ecx
80105dfb:	83 e1 f0             	and    $0xfffffff0,%ecx
80105dfe:	89 ce                	mov    %ecx,%esi
80105e00:	83 ce 02             	or     $0x2,%esi
80105e03:	89 f2                	mov    %esi,%edx
80105e05:	88 97 25 18 11 80    	mov    %dl,-0x7feee7db(%edi)
80105e0b:	83 c9 12             	or     $0x12,%ecx
80105e0e:	88 8f 25 18 11 80    	mov    %cl,-0x7feee7db(%edi)
80105e14:	83 e1 9f             	and    $0xffffff9f,%ecx
80105e17:	88 8f 25 18 11 80    	mov    %cl,-0x7feee7db(%edi)
80105e1d:	83 c9 80             	or     $0xffffff80,%ecx
80105e20:	88 8f 25 18 11 80    	mov    %cl,-0x7feee7db(%edi)
80105e26:	0f b6 8f 26 18 11 80 	movzbl -0x7feee7da(%edi),%ecx
80105e2d:	83 c9 0f             	or     $0xf,%ecx
80105e30:	88 8f 26 18 11 80    	mov    %cl,-0x7feee7da(%edi)
80105e36:	89 ce                	mov    %ecx,%esi
80105e38:	83 e6 ef             	and    $0xffffffef,%esi
80105e3b:	89 f2                	mov    %esi,%edx
80105e3d:	88 97 26 18 11 80    	mov    %dl,-0x7feee7da(%edi)
80105e43:	83 e1 cf             	and    $0xffffffcf,%ecx
80105e46:	88 8f 26 18 11 80    	mov    %cl,-0x7feee7da(%edi)
80105e4c:	89 ce                	mov    %ecx,%esi
80105e4e:	83 ce 40             	or     $0x40,%esi
80105e51:	89 f2                	mov    %esi,%edx
80105e53:	88 97 26 18 11 80    	mov    %dl,-0x7feee7da(%edi)
80105e59:	83 c9 c0             	or     $0xffffffc0,%ecx
80105e5c:	88 8f 26 18 11 80    	mov    %cl,-0x7feee7da(%edi)
80105e62:	c6 87 27 18 11 80 00 	movb   $0x0,-0x7feee7d9(%edi)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80105e69:	66 c7 87 28 18 11 80 	movw   $0xffff,-0x7feee7d8(%edi)
80105e70:	ff ff 
80105e72:	66 c7 87 2a 18 11 80 	movw   $0x0,-0x7feee7d6(%edi)
80105e79:	00 00 
80105e7b:	c6 87 2c 18 11 80 00 	movb   $0x0,-0x7feee7d4(%edi)
80105e82:	0f b6 9f 2d 18 11 80 	movzbl -0x7feee7d3(%edi),%ebx
80105e89:	83 e3 f0             	and    $0xfffffff0,%ebx
80105e8c:	89 de                	mov    %ebx,%esi
80105e8e:	83 ce 0a             	or     $0xa,%esi
80105e91:	89 f2                	mov    %esi,%edx
80105e93:	88 97 2d 18 11 80    	mov    %dl,-0x7feee7d3(%edi)
80105e99:	89 de                	mov    %ebx,%esi
80105e9b:	83 ce 1a             	or     $0x1a,%esi
80105e9e:	89 f2                	mov    %esi,%edx
80105ea0:	88 97 2d 18 11 80    	mov    %dl,-0x7feee7d3(%edi)
80105ea6:	83 cb 7a             	or     $0x7a,%ebx
80105ea9:	88 9f 2d 18 11 80    	mov    %bl,-0x7feee7d3(%edi)
80105eaf:	c6 87 2d 18 11 80 fa 	movb   $0xfa,-0x7feee7d3(%edi)
80105eb6:	0f b6 9f 2e 18 11 80 	movzbl -0x7feee7d2(%edi),%ebx
80105ebd:	83 cb 0f             	or     $0xf,%ebx
80105ec0:	88 9f 2e 18 11 80    	mov    %bl,-0x7feee7d2(%edi)
80105ec6:	89 de                	mov    %ebx,%esi
80105ec8:	83 e6 ef             	and    $0xffffffef,%esi
80105ecb:	89 f2                	mov    %esi,%edx
80105ecd:	88 97 2e 18 11 80    	mov    %dl,-0x7feee7d2(%edi)
80105ed3:	83 e3 cf             	and    $0xffffffcf,%ebx
80105ed6:	88 9f 2e 18 11 80    	mov    %bl,-0x7feee7d2(%edi)
80105edc:	89 de                	mov    %ebx,%esi
80105ede:	83 ce 40             	or     $0x40,%esi
80105ee1:	89 f2                	mov    %esi,%edx
80105ee3:	88 97 2e 18 11 80    	mov    %dl,-0x7feee7d2(%edi)
80105ee9:	83 cb c0             	or     $0xffffffc0,%ebx
80105eec:	88 9f 2e 18 11 80    	mov    %bl,-0x7feee7d2(%edi)
80105ef2:	c6 87 2f 18 11 80 00 	movb   $0x0,-0x7feee7d1(%edi)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80105ef9:	66 c7 87 30 18 11 80 	movw   $0xffff,-0x7feee7d0(%edi)
80105f00:	ff ff 
80105f02:	66 c7 87 32 18 11 80 	movw   $0x0,-0x7feee7ce(%edi)
80105f09:	00 00 
80105f0b:	c6 87 34 18 11 80 00 	movb   $0x0,-0x7feee7cc(%edi)
80105f12:	0f b6 9f 35 18 11 80 	movzbl -0x7feee7cb(%edi),%ebx
80105f19:	83 e3 f0             	and    $0xfffffff0,%ebx
80105f1c:	89 de                	mov    %ebx,%esi
80105f1e:	83 ce 02             	or     $0x2,%esi
80105f21:	89 f2                	mov    %esi,%edx
80105f23:	88 97 35 18 11 80    	mov    %dl,-0x7feee7cb(%edi)
80105f29:	89 de                	mov    %ebx,%esi
80105f2b:	83 ce 12             	or     $0x12,%esi
80105f2e:	89 f2                	mov    %esi,%edx
80105f30:	88 97 35 18 11 80    	mov    %dl,-0x7feee7cb(%edi)
80105f36:	83 cb 72             	or     $0x72,%ebx
80105f39:	88 9f 35 18 11 80    	mov    %bl,-0x7feee7cb(%edi)
80105f3f:	c6 87 35 18 11 80 f2 	movb   $0xf2,-0x7feee7cb(%edi)
80105f46:	0f b6 9f 36 18 11 80 	movzbl -0x7feee7ca(%edi),%ebx
80105f4d:	83 cb 0f             	or     $0xf,%ebx
80105f50:	88 9f 36 18 11 80    	mov    %bl,-0x7feee7ca(%edi)
80105f56:	89 de                	mov    %ebx,%esi
80105f58:	83 e6 ef             	and    $0xffffffef,%esi
80105f5b:	89 f2                	mov    %esi,%edx
80105f5d:	88 97 36 18 11 80    	mov    %dl,-0x7feee7ca(%edi)
80105f63:	83 e3 cf             	and    $0xffffffcf,%ebx
80105f66:	88 9f 36 18 11 80    	mov    %bl,-0x7feee7ca(%edi)
80105f6c:	89 de                	mov    %ebx,%esi
80105f6e:	83 ce 40             	or     $0x40,%esi
80105f71:	89 f2                	mov    %esi,%edx
80105f73:	88 97 36 18 11 80    	mov    %dl,-0x7feee7ca(%edi)
80105f79:	83 cb c0             	or     $0xffffffc0,%ebx
80105f7c:	88 9f 36 18 11 80    	mov    %bl,-0x7feee7ca(%edi)
80105f82:	c6 87 37 18 11 80 00 	movb   $0x0,-0x7feee7c9(%edi)
  lgdt(c->gdt, sizeof(c->gdt));
80105f89:	8d 97 10 18 11 80    	lea    -0x7feee7f0(%edi),%edx
  pd[0] = size-1;
80105f8f:	66 c7 45 e2 2f 00    	movw   $0x2f,-0x1e(%ebp)
  pd[1] = (uint)p;
80105f95:	66 89 55 e4          	mov    %dx,-0x1c(%ebp)
  pd[2] = (uint)p >> 16;
80105f99:	c1 ea 10             	shr    $0x10,%edx
80105f9c:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80105fa0:	8d 45 e2             	lea    -0x1e(%ebp),%eax
80105fa3:	0f 01 10             	lgdtl  (%eax)
}
80105fa6:	83 c4 1c             	add    $0x1c,%esp
80105fa9:	5b                   	pop    %ebx
80105faa:	5e                   	pop    %esi
80105fab:	5f                   	pop    %edi
80105fac:	5d                   	pop    %ebp
80105fad:	c3                   	ret    

80105fae <switchkvm>:
=======
80105c7e:	89 d3                	mov    %edx,%ebx
80105c80:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80105c86:	8d 7c 0a ff          	lea    -0x1(%edx,%ecx,1),%edi
80105c8a:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105c90:	b9 01 00 00 00       	mov    $0x1,%ecx
80105c95:	89 da                	mov    %ebx,%edx
80105c97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105c9a:	e8 5f ff ff ff       	call   80105bfe <walkpgdir>
80105c9f:	85 c0                	test   %eax,%eax
80105ca1:	74 2e                	je     80105cd1 <mappages+0x62>
      return -1;
    if(*pte & PTE_P)
80105ca3:	f6 00 01             	testb  $0x1,(%eax)
80105ca6:	75 1c                	jne    80105cc4 <mappages+0x55>
      panic("remap");
    *pte = pa | perm | PTE_P;
80105ca8:	89 f2                	mov    %esi,%edx
80105caa:	0b 55 0c             	or     0xc(%ebp),%edx
80105cad:	83 ca 01             	or     $0x1,%edx
80105cb0:	89 10                	mov    %edx,(%eax)
    if(a == last)
80105cb2:	39 fb                	cmp    %edi,%ebx
80105cb4:	74 28                	je     80105cde <mappages+0x6f>
      break;
    a += PGSIZE;
80105cb6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    pa += PGSIZE;
80105cbc:	81 c6 00 10 00 00    	add    $0x1000,%esi
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105cc2:	eb cc                	jmp    80105c90 <mappages+0x21>
      panic("remap");
80105cc4:	83 ec 0c             	sub    $0xc,%esp
80105cc7:	68 d0 6e 10 80       	push   $0x80106ed0
80105ccc:	e8 77 a6 ff ff       	call   80100348 <panic>
      return -1;
80105cd1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80105cd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cd9:	5b                   	pop    %ebx
80105cda:	5e                   	pop    %esi
80105cdb:	5f                   	pop    %edi
80105cdc:	5d                   	pop    %ebp
80105cdd:	c3                   	ret    
  return 0;
80105cde:	b8 00 00 00 00       	mov    $0x0,%eax
80105ce3:	eb f1                	jmp    80105cd6 <mappages+0x67>

80105ce5 <seginit>:
{
80105ce5:	55                   	push   %ebp
80105ce6:	89 e5                	mov    %esp,%ebp
80105ce8:	57                   	push   %edi
80105ce9:	56                   	push   %esi
80105cea:	53                   	push   %ebx
80105ceb:	83 ec 1c             	sub    $0x1c,%esp
  c = &cpus[cpuid()];
80105cee:	e8 a7 d4 ff ff       	call   8010319a <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80105cf3:	69 f8 b0 00 00 00    	imul   $0xb0,%eax,%edi
80105cf9:	66 c7 87 18 08 11 80 	movw   $0xffff,-0x7feef7e8(%edi)
80105d00:	ff ff 
80105d02:	66 c7 87 1a 08 11 80 	movw   $0x0,-0x7feef7e6(%edi)
80105d09:	00 00 
80105d0b:	c6 87 1c 08 11 80 00 	movb   $0x0,-0x7feef7e4(%edi)
80105d12:	0f b6 8f 1d 08 11 80 	movzbl -0x7feef7e3(%edi),%ecx
80105d19:	83 e1 f0             	and    $0xfffffff0,%ecx
80105d1c:	89 ce                	mov    %ecx,%esi
80105d1e:	83 ce 0a             	or     $0xa,%esi
80105d21:	89 f2                	mov    %esi,%edx
80105d23:	88 97 1d 08 11 80    	mov    %dl,-0x7feef7e3(%edi)
80105d29:	83 c9 1a             	or     $0x1a,%ecx
80105d2c:	88 8f 1d 08 11 80    	mov    %cl,-0x7feef7e3(%edi)
80105d32:	83 e1 9f             	and    $0xffffff9f,%ecx
80105d35:	88 8f 1d 08 11 80    	mov    %cl,-0x7feef7e3(%edi)
80105d3b:	83 c9 80             	or     $0xffffff80,%ecx
80105d3e:	88 8f 1d 08 11 80    	mov    %cl,-0x7feef7e3(%edi)
80105d44:	0f b6 8f 1e 08 11 80 	movzbl -0x7feef7e2(%edi),%ecx
80105d4b:	83 c9 0f             	or     $0xf,%ecx
80105d4e:	88 8f 1e 08 11 80    	mov    %cl,-0x7feef7e2(%edi)
80105d54:	89 ce                	mov    %ecx,%esi
80105d56:	83 e6 ef             	and    $0xffffffef,%esi
80105d59:	89 f2                	mov    %esi,%edx
80105d5b:	88 97 1e 08 11 80    	mov    %dl,-0x7feef7e2(%edi)
80105d61:	83 e1 cf             	and    $0xffffffcf,%ecx
80105d64:	88 8f 1e 08 11 80    	mov    %cl,-0x7feef7e2(%edi)
80105d6a:	89 ce                	mov    %ecx,%esi
80105d6c:	83 ce 40             	or     $0x40,%esi
80105d6f:	89 f2                	mov    %esi,%edx
80105d71:	88 97 1e 08 11 80    	mov    %dl,-0x7feef7e2(%edi)
80105d77:	83 c9 c0             	or     $0xffffffc0,%ecx
80105d7a:	88 8f 1e 08 11 80    	mov    %cl,-0x7feef7e2(%edi)
80105d80:	c6 87 1f 08 11 80 00 	movb   $0x0,-0x7feef7e1(%edi)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80105d87:	66 c7 87 20 08 11 80 	movw   $0xffff,-0x7feef7e0(%edi)
80105d8e:	ff ff 
80105d90:	66 c7 87 22 08 11 80 	movw   $0x0,-0x7feef7de(%edi)
80105d97:	00 00 
80105d99:	c6 87 24 08 11 80 00 	movb   $0x0,-0x7feef7dc(%edi)
80105da0:	0f b6 8f 25 08 11 80 	movzbl -0x7feef7db(%edi),%ecx
80105da7:	83 e1 f0             	and    $0xfffffff0,%ecx
80105daa:	89 ce                	mov    %ecx,%esi
80105dac:	83 ce 02             	or     $0x2,%esi
80105daf:	89 f2                	mov    %esi,%edx
80105db1:	88 97 25 08 11 80    	mov    %dl,-0x7feef7db(%edi)
80105db7:	83 c9 12             	or     $0x12,%ecx
80105dba:	88 8f 25 08 11 80    	mov    %cl,-0x7feef7db(%edi)
80105dc0:	83 e1 9f             	and    $0xffffff9f,%ecx
80105dc3:	88 8f 25 08 11 80    	mov    %cl,-0x7feef7db(%edi)
80105dc9:	83 c9 80             	or     $0xffffff80,%ecx
80105dcc:	88 8f 25 08 11 80    	mov    %cl,-0x7feef7db(%edi)
80105dd2:	0f b6 8f 26 08 11 80 	movzbl -0x7feef7da(%edi),%ecx
80105dd9:	83 c9 0f             	or     $0xf,%ecx
80105ddc:	88 8f 26 08 11 80    	mov    %cl,-0x7feef7da(%edi)
80105de2:	89 ce                	mov    %ecx,%esi
80105de4:	83 e6 ef             	and    $0xffffffef,%esi
80105de7:	89 f2                	mov    %esi,%edx
80105de9:	88 97 26 08 11 80    	mov    %dl,-0x7feef7da(%edi)
80105def:	83 e1 cf             	and    $0xffffffcf,%ecx
80105df2:	88 8f 26 08 11 80    	mov    %cl,-0x7feef7da(%edi)
80105df8:	89 ce                	mov    %ecx,%esi
80105dfa:	83 ce 40             	or     $0x40,%esi
80105dfd:	89 f2                	mov    %esi,%edx
80105dff:	88 97 26 08 11 80    	mov    %dl,-0x7feef7da(%edi)
80105e05:	83 c9 c0             	or     $0xffffffc0,%ecx
80105e08:	88 8f 26 08 11 80    	mov    %cl,-0x7feef7da(%edi)
80105e0e:	c6 87 27 08 11 80 00 	movb   $0x0,-0x7feef7d9(%edi)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80105e15:	66 c7 87 28 08 11 80 	movw   $0xffff,-0x7feef7d8(%edi)
80105e1c:	ff ff 
80105e1e:	66 c7 87 2a 08 11 80 	movw   $0x0,-0x7feef7d6(%edi)
80105e25:	00 00 
80105e27:	c6 87 2c 08 11 80 00 	movb   $0x0,-0x7feef7d4(%edi)
80105e2e:	0f b6 9f 2d 08 11 80 	movzbl -0x7feef7d3(%edi),%ebx
80105e35:	83 e3 f0             	and    $0xfffffff0,%ebx
80105e38:	89 de                	mov    %ebx,%esi
80105e3a:	83 ce 0a             	or     $0xa,%esi
80105e3d:	89 f2                	mov    %esi,%edx
80105e3f:	88 97 2d 08 11 80    	mov    %dl,-0x7feef7d3(%edi)
80105e45:	89 de                	mov    %ebx,%esi
80105e47:	83 ce 1a             	or     $0x1a,%esi
80105e4a:	89 f2                	mov    %esi,%edx
80105e4c:	88 97 2d 08 11 80    	mov    %dl,-0x7feef7d3(%edi)
80105e52:	83 cb 7a             	or     $0x7a,%ebx
80105e55:	88 9f 2d 08 11 80    	mov    %bl,-0x7feef7d3(%edi)
80105e5b:	c6 87 2d 08 11 80 fa 	movb   $0xfa,-0x7feef7d3(%edi)
80105e62:	0f b6 9f 2e 08 11 80 	movzbl -0x7feef7d2(%edi),%ebx
80105e69:	83 cb 0f             	or     $0xf,%ebx
80105e6c:	88 9f 2e 08 11 80    	mov    %bl,-0x7feef7d2(%edi)
80105e72:	89 de                	mov    %ebx,%esi
80105e74:	83 e6 ef             	and    $0xffffffef,%esi
80105e77:	89 f2                	mov    %esi,%edx
80105e79:	88 97 2e 08 11 80    	mov    %dl,-0x7feef7d2(%edi)
80105e7f:	83 e3 cf             	and    $0xffffffcf,%ebx
80105e82:	88 9f 2e 08 11 80    	mov    %bl,-0x7feef7d2(%edi)
80105e88:	89 de                	mov    %ebx,%esi
80105e8a:	83 ce 40             	or     $0x40,%esi
80105e8d:	89 f2                	mov    %esi,%edx
80105e8f:	88 97 2e 08 11 80    	mov    %dl,-0x7feef7d2(%edi)
80105e95:	83 cb c0             	or     $0xffffffc0,%ebx
80105e98:	88 9f 2e 08 11 80    	mov    %bl,-0x7feef7d2(%edi)
80105e9e:	c6 87 2f 08 11 80 00 	movb   $0x0,-0x7feef7d1(%edi)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80105ea5:	66 c7 87 30 08 11 80 	movw   $0xffff,-0x7feef7d0(%edi)
80105eac:	ff ff 
80105eae:	66 c7 87 32 08 11 80 	movw   $0x0,-0x7feef7ce(%edi)
80105eb5:	00 00 
80105eb7:	c6 87 34 08 11 80 00 	movb   $0x0,-0x7feef7cc(%edi)
80105ebe:	0f b6 9f 35 08 11 80 	movzbl -0x7feef7cb(%edi),%ebx
80105ec5:	83 e3 f0             	and    $0xfffffff0,%ebx
80105ec8:	89 de                	mov    %ebx,%esi
80105eca:	83 ce 02             	or     $0x2,%esi
80105ecd:	89 f2                	mov    %esi,%edx
80105ecf:	88 97 35 08 11 80    	mov    %dl,-0x7feef7cb(%edi)
80105ed5:	89 de                	mov    %ebx,%esi
80105ed7:	83 ce 12             	or     $0x12,%esi
80105eda:	89 f2                	mov    %esi,%edx
80105edc:	88 97 35 08 11 80    	mov    %dl,-0x7feef7cb(%edi)
80105ee2:	83 cb 72             	or     $0x72,%ebx
80105ee5:	88 9f 35 08 11 80    	mov    %bl,-0x7feef7cb(%edi)
80105eeb:	c6 87 35 08 11 80 f2 	movb   $0xf2,-0x7feef7cb(%edi)
80105ef2:	0f b6 9f 36 08 11 80 	movzbl -0x7feef7ca(%edi),%ebx
80105ef9:	83 cb 0f             	or     $0xf,%ebx
80105efc:	88 9f 36 08 11 80    	mov    %bl,-0x7feef7ca(%edi)
80105f02:	89 de                	mov    %ebx,%esi
80105f04:	83 e6 ef             	and    $0xffffffef,%esi
80105f07:	89 f2                	mov    %esi,%edx
80105f09:	88 97 36 08 11 80    	mov    %dl,-0x7feef7ca(%edi)
80105f0f:	83 e3 cf             	and    $0xffffffcf,%ebx
80105f12:	88 9f 36 08 11 80    	mov    %bl,-0x7feef7ca(%edi)
80105f18:	89 de                	mov    %ebx,%esi
80105f1a:	83 ce 40             	or     $0x40,%esi
80105f1d:	89 f2                	mov    %esi,%edx
80105f1f:	88 97 36 08 11 80    	mov    %dl,-0x7feef7ca(%edi)
80105f25:	83 cb c0             	or     $0xffffffc0,%ebx
80105f28:	88 9f 36 08 11 80    	mov    %bl,-0x7feef7ca(%edi)
80105f2e:	c6 87 37 08 11 80 00 	movb   $0x0,-0x7feef7c9(%edi)
  lgdt(c->gdt, sizeof(c->gdt));
80105f35:	8d 97 10 08 11 80    	lea    -0x7feef7f0(%edi),%edx
  pd[0] = size-1;
80105f3b:	66 c7 45 e2 2f 00    	movw   $0x2f,-0x1e(%ebp)
  pd[1] = (uint)p;
80105f41:	66 89 55 e4          	mov    %dx,-0x1c(%ebp)
  pd[2] = (uint)p >> 16;
80105f45:	c1 ea 10             	shr    $0x10,%edx
80105f48:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80105f4c:	8d 45 e2             	lea    -0x1e(%ebp),%eax
80105f4f:	0f 01 10             	lgdtl  (%eax)
}
80105f52:	83 c4 1c             	add    $0x1c,%esp
80105f55:	5b                   	pop    %ebx
80105f56:	5e                   	pop    %esi
80105f57:	5f                   	pop    %edi
80105f58:	5d                   	pop    %ebp
80105f59:	c3                   	ret    

80105f5a <switchkvm>:
>>>>>>> d669a6c (ulib and makefile)
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
<<<<<<< HEAD
80105fae:	a1 c4 44 11 80       	mov    0x801144c4,%eax
80105fb3:	05 00 00 00 80       	add    $0x80000000,%eax
=======
80105f5a:	a1 c4 34 11 80       	mov    0x801134c4,%eax
80105f5f:	05 00 00 00 80       	add    $0x80000000,%eax
>>>>>>> d669a6c (ulib and makefile)
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
<<<<<<< HEAD
80105fb8:	0f 22 d8             	mov    %eax,%cr3
}
80105fbb:	c3                   	ret    

80105fbc <switchuvm>:
=======
80105f64:	0f 22 d8             	mov    %eax,%cr3
}
80105f67:	c3                   	ret    

80105f68 <switchuvm>:
>>>>>>> d669a6c (ulib and makefile)

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
<<<<<<< HEAD
80105fbc:	55                   	push   %ebp
80105fbd:	89 e5                	mov    %esp,%ebp
80105fbf:	57                   	push   %edi
80105fc0:	56                   	push   %esi
80105fc1:	53                   	push   %ebx
80105fc2:	83 ec 1c             	sub    $0x1c,%esp
80105fc5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80105fc8:	85 f6                	test   %esi,%esi
80105fca:	0f 84 25 01 00 00    	je     801060f5 <switchuvm+0x139>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80105fd0:	83 7e 08 00          	cmpl   $0x0,0x8(%esi)
80105fd4:	0f 84 28 01 00 00    	je     80106102 <switchuvm+0x146>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80105fda:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
80105fde:	0f 84 2b 01 00 00    	je     8010610f <switchuvm+0x153>
    panic("switchuvm: no pgdir");

  pushcli();
80105fe4:	e8 81 db ff ff       	call   80103b6a <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80105fe9:	e8 50 d1 ff ff       	call   8010313e <mycpu>
80105fee:	89 c3                	mov    %eax,%ebx
80105ff0:	e8 49 d1 ff ff       	call   8010313e <mycpu>
80105ff5:	8d 78 08             	lea    0x8(%eax),%edi
80105ff8:	e8 41 d1 ff ff       	call   8010313e <mycpu>
80105ffd:	83 c0 08             	add    $0x8,%eax
80106000:	c1 e8 10             	shr    $0x10,%eax
80106003:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106006:	e8 33 d1 ff ff       	call   8010313e <mycpu>
8010600b:	83 c0 08             	add    $0x8,%eax
8010600e:	c1 e8 18             	shr    $0x18,%eax
80106011:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80106018:	67 00 
8010601a:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106021:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
80106025:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
8010602b:	0f b6 93 9d 00 00 00 	movzbl 0x9d(%ebx),%edx
80106032:	83 e2 f0             	and    $0xfffffff0,%edx
80106035:	89 d1                	mov    %edx,%ecx
80106037:	83 c9 09             	or     $0x9,%ecx
8010603a:	88 8b 9d 00 00 00    	mov    %cl,0x9d(%ebx)
80106040:	83 ca 19             	or     $0x19,%edx
80106043:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
80106049:	83 e2 9f             	and    $0xffffff9f,%edx
8010604c:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
80106052:	83 ca 80             	or     $0xffffff80,%edx
80106055:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
8010605b:	0f b6 93 9e 00 00 00 	movzbl 0x9e(%ebx),%edx
80106062:	89 d1                	mov    %edx,%ecx
80106064:	83 e1 f0             	and    $0xfffffff0,%ecx
80106067:	88 8b 9e 00 00 00    	mov    %cl,0x9e(%ebx)
8010606d:	89 d1                	mov    %edx,%ecx
8010606f:	83 e1 e0             	and    $0xffffffe0,%ecx
80106072:	88 8b 9e 00 00 00    	mov    %cl,0x9e(%ebx)
80106078:	83 e2 c0             	and    $0xffffffc0,%edx
8010607b:	88 93 9e 00 00 00    	mov    %dl,0x9e(%ebx)
80106081:	83 ca 40             	or     $0x40,%edx
80106084:	88 93 9e 00 00 00    	mov    %dl,0x9e(%ebx)
8010608a:	83 e2 7f             	and    $0x7f,%edx
8010608d:	88 93 9e 00 00 00    	mov    %dl,0x9e(%ebx)
80106093:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
80106099:	e8 a0 d0 ff ff       	call   8010313e <mycpu>
8010609e:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
801060a5:	83 e2 ef             	and    $0xffffffef,%edx
801060a8:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801060ae:	e8 8b d0 ff ff       	call   8010313e <mycpu>
801060b3:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801060b9:	8b 5e 08             	mov    0x8(%esi),%ebx
801060bc:	e8 7d d0 ff ff       	call   8010313e <mycpu>
801060c1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801060c7:	89 58 0c             	mov    %ebx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801060ca:	e8 6f d0 ff ff       	call   8010313e <mycpu>
801060cf:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
801060d5:	b8 28 00 00 00       	mov    $0x28,%eax
801060da:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
801060dd:	8b 46 04             	mov    0x4(%esi),%eax
801060e0:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
801060e5:	0f 22 d8             	mov    %eax,%cr3
  popcli();
801060e8:	e8 b9 da ff ff       	call   80103ba6 <popcli>
}
801060ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801060f0:	5b                   	pop    %ebx
801060f1:	5e                   	pop    %esi
801060f2:	5f                   	pop    %edi
801060f3:	5d                   	pop    %ebp
801060f4:	c3                   	ret    
    panic("switchuvm: no process");
801060f5:	83 ec 0c             	sub    $0xc,%esp
801060f8:	68 16 6f 10 80       	push   $0x80106f16
801060fd:	e8 46 a2 ff ff       	call   80100348 <panic>
    panic("switchuvm: no kstack");
80106102:	83 ec 0c             	sub    $0xc,%esp
80106105:	68 2c 6f 10 80       	push   $0x80106f2c
8010610a:	e8 39 a2 ff ff       	call   80100348 <panic>
    panic("switchuvm: no pgdir");
8010610f:	83 ec 0c             	sub    $0xc,%esp
80106112:	68 41 6f 10 80       	push   $0x80106f41
80106117:	e8 2c a2 ff ff       	call   80100348 <panic>

8010611c <inituvm>:
=======
80105f68:	55                   	push   %ebp
80105f69:	89 e5                	mov    %esp,%ebp
80105f6b:	57                   	push   %edi
80105f6c:	56                   	push   %esi
80105f6d:	53                   	push   %ebx
80105f6e:	83 ec 1c             	sub    $0x1c,%esp
80105f71:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80105f74:	85 f6                	test   %esi,%esi
80105f76:	0f 84 25 01 00 00    	je     801060a1 <switchuvm+0x139>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80105f7c:	83 7e 08 00          	cmpl   $0x0,0x8(%esi)
80105f80:	0f 84 28 01 00 00    	je     801060ae <switchuvm+0x146>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80105f86:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
80105f8a:	0f 84 2b 01 00 00    	je     801060bb <switchuvm+0x153>
    panic("switchuvm: no pgdir");

  pushcli();
80105f90:	e8 81 db ff ff       	call   80103b16 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80105f95:	e8 a4 d1 ff ff       	call   8010313e <mycpu>
80105f9a:	89 c3                	mov    %eax,%ebx
80105f9c:	e8 9d d1 ff ff       	call   8010313e <mycpu>
80105fa1:	8d 78 08             	lea    0x8(%eax),%edi
80105fa4:	e8 95 d1 ff ff       	call   8010313e <mycpu>
80105fa9:	83 c0 08             	add    $0x8,%eax
80105fac:	c1 e8 10             	shr    $0x10,%eax
80105faf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105fb2:	e8 87 d1 ff ff       	call   8010313e <mycpu>
80105fb7:	83 c0 08             	add    $0x8,%eax
80105fba:	c1 e8 18             	shr    $0x18,%eax
80105fbd:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80105fc4:	67 00 
80105fc6:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80105fcd:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
80105fd1:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80105fd7:	0f b6 93 9d 00 00 00 	movzbl 0x9d(%ebx),%edx
80105fde:	83 e2 f0             	and    $0xfffffff0,%edx
80105fe1:	89 d1                	mov    %edx,%ecx
80105fe3:	83 c9 09             	or     $0x9,%ecx
80105fe6:	88 8b 9d 00 00 00    	mov    %cl,0x9d(%ebx)
80105fec:	83 ca 19             	or     $0x19,%edx
80105fef:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
80105ff5:	83 e2 9f             	and    $0xffffff9f,%edx
80105ff8:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
80105ffe:	83 ca 80             	or     $0xffffff80,%edx
80106001:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
80106007:	0f b6 93 9e 00 00 00 	movzbl 0x9e(%ebx),%edx
8010600e:	89 d1                	mov    %edx,%ecx
80106010:	83 e1 f0             	and    $0xfffffff0,%ecx
80106013:	88 8b 9e 00 00 00    	mov    %cl,0x9e(%ebx)
80106019:	89 d1                	mov    %edx,%ecx
8010601b:	83 e1 e0             	and    $0xffffffe0,%ecx
8010601e:	88 8b 9e 00 00 00    	mov    %cl,0x9e(%ebx)
80106024:	83 e2 c0             	and    $0xffffffc0,%edx
80106027:	88 93 9e 00 00 00    	mov    %dl,0x9e(%ebx)
8010602d:	83 ca 40             	or     $0x40,%edx
80106030:	88 93 9e 00 00 00    	mov    %dl,0x9e(%ebx)
80106036:	83 e2 7f             	and    $0x7f,%edx
80106039:	88 93 9e 00 00 00    	mov    %dl,0x9e(%ebx)
8010603f:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
80106045:	e8 f4 d0 ff ff       	call   8010313e <mycpu>
8010604a:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80106051:	83 e2 ef             	and    $0xffffffef,%edx
80106054:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
8010605a:	e8 df d0 ff ff       	call   8010313e <mycpu>
8010605f:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106065:	8b 5e 08             	mov    0x8(%esi),%ebx
80106068:	e8 d1 d0 ff ff       	call   8010313e <mycpu>
8010606d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106073:	89 58 0c             	mov    %ebx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106076:	e8 c3 d0 ff ff       	call   8010313e <mycpu>
8010607b:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106081:	b8 28 00 00 00       	mov    $0x28,%eax
80106086:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106089:	8b 46 04             	mov    0x4(%esi),%eax
8010608c:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106091:	0f 22 d8             	mov    %eax,%cr3
  popcli();
80106094:	e8 b9 da ff ff       	call   80103b52 <popcli>
}
80106099:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010609c:	5b                   	pop    %ebx
8010609d:	5e                   	pop    %esi
8010609e:	5f                   	pop    %edi
8010609f:	5d                   	pop    %ebp
801060a0:	c3                   	ret    
    panic("switchuvm: no process");
801060a1:	83 ec 0c             	sub    $0xc,%esp
801060a4:	68 d6 6e 10 80       	push   $0x80106ed6
801060a9:	e8 9a a2 ff ff       	call   80100348 <panic>
    panic("switchuvm: no kstack");
801060ae:	83 ec 0c             	sub    $0xc,%esp
801060b1:	68 ec 6e 10 80       	push   $0x80106eec
801060b6:	e8 8d a2 ff ff       	call   80100348 <panic>
    panic("switchuvm: no pgdir");
801060bb:	83 ec 0c             	sub    $0xc,%esp
801060be:	68 01 6f 10 80       	push   $0x80106f01
801060c3:	e8 80 a2 ff ff       	call   80100348 <panic>

801060c8 <inituvm>:
>>>>>>> d669a6c (ulib and makefile)

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
<<<<<<< HEAD
8010611c:	55                   	push   %ebp
8010611d:	89 e5                	mov    %esp,%ebp
8010611f:	56                   	push   %esi
80106120:	53                   	push   %ebx
80106121:	8b 75 10             	mov    0x10(%ebp),%esi
  char *mem;

  if(sz >= PGSIZE)
80106124:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
8010612a:	77 4c                	ja     80106178 <inituvm+0x5c>
    panic("inituvm: more than a page");
  mem = kalloc();
8010612c:	e8 72 bf ff ff       	call   801020a3 <kalloc>
80106131:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106133:	83 ec 04             	sub    $0x4,%esp
80106136:	68 00 10 00 00       	push   $0x1000
8010613b:	6a 00                	push   $0x0
8010613d:	50                   	push   %eax
8010613e:	e8 ae db ff ff       	call   80103cf1 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106143:	83 c4 08             	add    $0x8,%esp
80106146:	6a 06                	push   $0x6
80106148:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010614e:	50                   	push   %eax
8010614f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106154:	ba 00 00 00 00       	mov    $0x0,%edx
80106159:	8b 45 08             	mov    0x8(%ebp),%eax
8010615c:	e8 62 fb ff ff       	call   80105cc3 <mappages>
  memmove(mem, init, sz);
80106161:	83 c4 0c             	add    $0xc,%esp
80106164:	56                   	push   %esi
80106165:	ff 75 0c             	push   0xc(%ebp)
80106168:	53                   	push   %ebx
80106169:	e8 fb db ff ff       	call   80103d69 <memmove>
}
8010616e:	83 c4 10             	add    $0x10,%esp
80106171:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106174:	5b                   	pop    %ebx
80106175:	5e                   	pop    %esi
80106176:	5d                   	pop    %ebp
80106177:	c3                   	ret    
    panic("inituvm: more than a page");
80106178:	83 ec 0c             	sub    $0xc,%esp
8010617b:	68 55 6f 10 80       	push   $0x80106f55
80106180:	e8 c3 a1 ff ff       	call   80100348 <panic>

80106185 <loaduvm>:
=======
801060c8:	55                   	push   %ebp
801060c9:	89 e5                	mov    %esp,%ebp
801060cb:	56                   	push   %esi
801060cc:	53                   	push   %ebx
801060cd:	8b 75 10             	mov    0x10(%ebp),%esi
  char *mem;

  if(sz >= PGSIZE)
801060d0:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801060d6:	77 4c                	ja     80106124 <inituvm+0x5c>
    panic("inituvm: more than a page");
  mem = kalloc();
801060d8:	e8 c6 bf ff ff       	call   801020a3 <kalloc>
801060dd:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
801060df:	83 ec 04             	sub    $0x4,%esp
801060e2:	68 00 10 00 00       	push   $0x1000
801060e7:	6a 00                	push   $0x0
801060e9:	50                   	push   %eax
801060ea:	e8 ae db ff ff       	call   80103c9d <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
801060ef:	83 c4 08             	add    $0x8,%esp
801060f2:	6a 06                	push   $0x6
801060f4:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801060fa:	50                   	push   %eax
801060fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106100:	ba 00 00 00 00       	mov    $0x0,%edx
80106105:	8b 45 08             	mov    0x8(%ebp),%eax
80106108:	e8 62 fb ff ff       	call   80105c6f <mappages>
  memmove(mem, init, sz);
8010610d:	83 c4 0c             	add    $0xc,%esp
80106110:	56                   	push   %esi
80106111:	ff 75 0c             	push   0xc(%ebp)
80106114:	53                   	push   %ebx
80106115:	e8 fb db ff ff       	call   80103d15 <memmove>
}
8010611a:	83 c4 10             	add    $0x10,%esp
8010611d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106120:	5b                   	pop    %ebx
80106121:	5e                   	pop    %esi
80106122:	5d                   	pop    %ebp
80106123:	c3                   	ret    
    panic("inituvm: more than a page");
80106124:	83 ec 0c             	sub    $0xc,%esp
80106127:	68 15 6f 10 80       	push   $0x80106f15
8010612c:	e8 17 a2 ff ff       	call   80100348 <panic>

80106131 <loaduvm>:
>>>>>>> d669a6c (ulib and makefile)

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
<<<<<<< HEAD
80106185:	55                   	push   %ebp
80106186:	89 e5                	mov    %esp,%ebp
80106188:	57                   	push   %edi
80106189:	56                   	push   %esi
8010618a:	53                   	push   %ebx
8010618b:	83 ec 0c             	sub    $0xc,%esp
8010618e:	8b 7d 18             	mov    0x18(%ebp),%edi
=======
80106131:	55                   	push   %ebp
80106132:	89 e5                	mov    %esp,%ebp
80106134:	57                   	push   %edi
80106135:	56                   	push   %esi
80106136:	53                   	push   %ebx
80106137:	83 ec 0c             	sub    $0xc,%esp
8010613a:	8b 7d 18             	mov    0x18(%ebp),%edi
>>>>>>> d669a6c (ulib and makefile)
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
<<<<<<< HEAD
80106191:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80106194:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
8010619a:	74 3c                	je     801061d8 <loaduvm+0x53>
    panic("loaduvm: addr must be page aligned");
8010619c:	83 ec 0c             	sub    $0xc,%esp
8010619f:	68 10 70 10 80       	push   $0x80107010
801061a4:	e8 9f a1 ff ff       	call   80100348 <panic>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
801061a9:	83 ec 0c             	sub    $0xc,%esp
801061ac:	68 6f 6f 10 80       	push   $0x80106f6f
801061b1:	e8 92 a1 ff ff       	call   80100348 <panic>
=======
8010613d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80106140:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106146:	74 3c                	je     80106184 <loaduvm+0x53>
    panic("loaduvm: addr must be page aligned");
80106148:	83 ec 0c             	sub    $0xc,%esp
8010614b:	68 d0 6f 10 80       	push   $0x80106fd0
80106150:	e8 f3 a1 ff ff       	call   80100348 <panic>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106155:	83 ec 0c             	sub    $0xc,%esp
80106158:	68 2f 6f 10 80       	push   $0x80106f2f
8010615d:	e8 e6 a1 ff ff       	call   80100348 <panic>
>>>>>>> d669a6c (ulib and makefile)
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
<<<<<<< HEAD
801061b6:	05 00 00 00 80       	add    $0x80000000,%eax
801061bb:	56                   	push   %esi
801061bc:	89 da                	mov    %ebx,%edx
801061be:	03 55 14             	add    0x14(%ebp),%edx
801061c1:	52                   	push   %edx
801061c2:	50                   	push   %eax
801061c3:	ff 75 10             	push   0x10(%ebp)
801061c6:	e8 96 b5 ff ff       	call   80101761 <readi>
801061cb:	83 c4 10             	add    $0x10,%esp
801061ce:	39 f0                	cmp    %esi,%eax
801061d0:	75 47                	jne    80106219 <loaduvm+0x94>
  for(i = 0; i < sz; i += PGSIZE){
801061d2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801061d8:	39 fb                	cmp    %edi,%ebx
801061da:	73 30                	jae    8010620c <loaduvm+0x87>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801061dc:	89 da                	mov    %ebx,%edx
801061de:	03 55 0c             	add    0xc(%ebp),%edx
801061e1:	b9 00 00 00 00       	mov    $0x0,%ecx
801061e6:	8b 45 08             	mov    0x8(%ebp),%eax
801061e9:	e8 64 fa ff ff       	call   80105c52 <walkpgdir>
801061ee:	85 c0                	test   %eax,%eax
801061f0:	74 b7                	je     801061a9 <loaduvm+0x24>
    pa = PTE_ADDR(*pte);
801061f2:	8b 00                	mov    (%eax),%eax
801061f4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
801061f9:	89 fe                	mov    %edi,%esi
801061fb:	29 de                	sub    %ebx,%esi
801061fd:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106203:	76 b1                	jbe    801061b6 <loaduvm+0x31>
      n = PGSIZE;
80106205:	be 00 10 00 00       	mov    $0x1000,%esi
8010620a:	eb aa                	jmp    801061b6 <loaduvm+0x31>
      return -1;
  }
  return 0;
8010620c:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106211:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106214:	5b                   	pop    %ebx
80106215:	5e                   	pop    %esi
80106216:	5f                   	pop    %edi
80106217:	5d                   	pop    %ebp
80106218:	c3                   	ret    
      return -1;
80106219:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010621e:	eb f1                	jmp    80106211 <loaduvm+0x8c>

80106220 <deallocuvm>:
=======
80106162:	05 00 00 00 80       	add    $0x80000000,%eax
80106167:	56                   	push   %esi
80106168:	89 da                	mov    %ebx,%edx
8010616a:	03 55 14             	add    0x14(%ebp),%edx
8010616d:	52                   	push   %edx
8010616e:	50                   	push   %eax
8010616f:	ff 75 10             	push   0x10(%ebp)
80106172:	e8 ea b5 ff ff       	call   80101761 <readi>
80106177:	83 c4 10             	add    $0x10,%esp
8010617a:	39 f0                	cmp    %esi,%eax
8010617c:	75 47                	jne    801061c5 <loaduvm+0x94>
  for(i = 0; i < sz; i += PGSIZE){
8010617e:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106184:	39 fb                	cmp    %edi,%ebx
80106186:	73 30                	jae    801061b8 <loaduvm+0x87>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106188:	89 da                	mov    %ebx,%edx
8010618a:	03 55 0c             	add    0xc(%ebp),%edx
8010618d:	b9 00 00 00 00       	mov    $0x0,%ecx
80106192:	8b 45 08             	mov    0x8(%ebp),%eax
80106195:	e8 64 fa ff ff       	call   80105bfe <walkpgdir>
8010619a:	85 c0                	test   %eax,%eax
8010619c:	74 b7                	je     80106155 <loaduvm+0x24>
    pa = PTE_ADDR(*pte);
8010619e:	8b 00                	mov    (%eax),%eax
801061a0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
801061a5:	89 fe                	mov    %edi,%esi
801061a7:	29 de                	sub    %ebx,%esi
801061a9:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801061af:	76 b1                	jbe    80106162 <loaduvm+0x31>
      n = PGSIZE;
801061b1:	be 00 10 00 00       	mov    $0x1000,%esi
801061b6:	eb aa                	jmp    80106162 <loaduvm+0x31>
      return -1;
  }
  return 0;
801061b8:	b8 00 00 00 00       	mov    $0x0,%eax
}
801061bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801061c0:	5b                   	pop    %ebx
801061c1:	5e                   	pop    %esi
801061c2:	5f                   	pop    %edi
801061c3:	5d                   	pop    %ebp
801061c4:	c3                   	ret    
      return -1;
801061c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801061ca:	eb f1                	jmp    801061bd <loaduvm+0x8c>

801061cc <deallocuvm>:
>>>>>>> d669a6c (ulib and makefile)
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
<<<<<<< HEAD
80106220:	55                   	push   %ebp
80106221:	89 e5                	mov    %esp,%ebp
80106223:	57                   	push   %edi
80106224:	56                   	push   %esi
80106225:	53                   	push   %ebx
80106226:	83 ec 0c             	sub    $0xc,%esp
80106229:	8b 7d 0c             	mov    0xc(%ebp),%edi
=======
801061cc:	55                   	push   %ebp
801061cd:	89 e5                	mov    %esp,%ebp
801061cf:	57                   	push   %edi
801061d0:	56                   	push   %esi
801061d1:	53                   	push   %ebx
801061d2:	83 ec 0c             	sub    $0xc,%esp
801061d5:	8b 7d 0c             	mov    0xc(%ebp),%edi
>>>>>>> d669a6c (ulib and makefile)
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
<<<<<<< HEAD
8010622c:	39 7d 10             	cmp    %edi,0x10(%ebp)
8010622f:	73 11                	jae    80106242 <deallocuvm+0x22>
    return oldsz;

  a = PGROUNDUP(newsz);
80106231:	8b 45 10             	mov    0x10(%ebp),%eax
80106234:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
8010623a:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106240:	eb 19                	jmp    8010625b <deallocuvm+0x3b>
    return oldsz;
80106242:	89 f8                	mov    %edi,%eax
80106244:	eb 64                	jmp    801062aa <deallocuvm+0x8a>
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106246:	c1 eb 16             	shr    $0x16,%ebx
80106249:	83 c3 01             	add    $0x1,%ebx
8010624c:	c1 e3 16             	shl    $0x16,%ebx
8010624f:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106255:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010625b:	39 fb                	cmp    %edi,%ebx
8010625d:	73 48                	jae    801062a7 <deallocuvm+0x87>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010625f:	b9 00 00 00 00       	mov    $0x0,%ecx
80106264:	89 da                	mov    %ebx,%edx
80106266:	8b 45 08             	mov    0x8(%ebp),%eax
80106269:	e8 e4 f9 ff ff       	call   80105c52 <walkpgdir>
8010626e:	89 c6                	mov    %eax,%esi
    if(!pte)
80106270:	85 c0                	test   %eax,%eax
80106272:	74 d2                	je     80106246 <deallocuvm+0x26>
    else if((*pte & PTE_P) != 0){
80106274:	8b 00                	mov    (%eax),%eax
80106276:	a8 01                	test   $0x1,%al
80106278:	74 db                	je     80106255 <deallocuvm+0x35>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010627a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010627f:	74 19                	je     8010629a <deallocuvm+0x7a>
        panic("kfree");
      char *v = P2V(pa);
80106281:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106286:	83 ec 0c             	sub    $0xc,%esp
80106289:	50                   	push   %eax
8010628a:	e8 fd bc ff ff       	call   80101f8c <kfree>
      *pte = 0;
8010628f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80106295:	83 c4 10             	add    $0x10,%esp
80106298:	eb bb                	jmp    80106255 <deallocuvm+0x35>
        panic("kfree");
8010629a:	83 ec 0c             	sub    $0xc,%esp
8010629d:	68 c6 68 10 80       	push   $0x801068c6
801062a2:	e8 a1 a0 ff ff       	call   80100348 <panic>
    }
  }
  return newsz;
801062a7:	8b 45 10             	mov    0x10(%ebp),%eax
}
801062aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801062ad:	5b                   	pop    %ebx
801062ae:	5e                   	pop    %esi
801062af:	5f                   	pop    %edi
801062b0:	5d                   	pop    %ebp
801062b1:	c3                   	ret    

801062b2 <allocuvm>:
{
801062b2:	55                   	push   %ebp
801062b3:	89 e5                	mov    %esp,%ebp
801062b5:	57                   	push   %edi
801062b6:	56                   	push   %esi
801062b7:	53                   	push   %ebx
801062b8:	83 ec 1c             	sub    $0x1c,%esp
801062bb:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
801062be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801062c1:	85 ff                	test   %edi,%edi
801062c3:	0f 88 c1 00 00 00    	js     8010638a <allocuvm+0xd8>
  if(newsz < oldsz)
801062c9:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801062cc:	72 5c                	jb     8010632a <allocuvm+0x78>
  a = PGROUNDUP(oldsz);
801062ce:	8b 45 0c             	mov    0xc(%ebp),%eax
801062d1:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
801062d7:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
801062dd:	39 fe                	cmp    %edi,%esi
801062df:	0f 83 ac 00 00 00    	jae    80106391 <allocuvm+0xdf>
    mem = kalloc();
801062e5:	e8 b9 bd ff ff       	call   801020a3 <kalloc>
801062ea:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
801062ec:	85 c0                	test   %eax,%eax
801062ee:	74 42                	je     80106332 <allocuvm+0x80>
    memset(mem, 0, PGSIZE);
801062f0:	83 ec 04             	sub    $0x4,%esp
801062f3:	68 00 10 00 00       	push   $0x1000
801062f8:	6a 00                	push   $0x0
801062fa:	50                   	push   %eax
801062fb:	e8 f1 d9 ff ff       	call   80103cf1 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106300:	83 c4 08             	add    $0x8,%esp
80106303:	6a 06                	push   $0x6
80106305:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010630b:	50                   	push   %eax
8010630c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106311:	89 f2                	mov    %esi,%edx
80106313:	8b 45 08             	mov    0x8(%ebp),%eax
80106316:	e8 a8 f9 ff ff       	call   80105cc3 <mappages>
8010631b:	83 c4 10             	add    $0x10,%esp
8010631e:	85 c0                	test   %eax,%eax
80106320:	78 38                	js     8010635a <allocuvm+0xa8>
  for(; a < newsz; a += PGSIZE){
80106322:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106328:	eb b3                	jmp    801062dd <allocuvm+0x2b>
    return oldsz;
8010632a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010632d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106330:	eb 5f                	jmp    80106391 <allocuvm+0xdf>
      cprintf("allocuvm out of memory\n");
80106332:	83 ec 0c             	sub    $0xc,%esp
80106335:	68 8d 6f 10 80       	push   $0x80106f8d
8010633a:	e8 c8 a2 ff ff       	call   80100607 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
8010633f:	83 c4 0c             	add    $0xc,%esp
80106342:	ff 75 0c             	push   0xc(%ebp)
80106345:	57                   	push   %edi
80106346:	ff 75 08             	push   0x8(%ebp)
80106349:	e8 d2 fe ff ff       	call   80106220 <deallocuvm>
      return 0;
8010634e:	83 c4 10             	add    $0x10,%esp
80106351:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106358:	eb 37                	jmp    80106391 <allocuvm+0xdf>
      cprintf("allocuvm out of memory (2)\n");
8010635a:	83 ec 0c             	sub    $0xc,%esp
8010635d:	68 a5 6f 10 80       	push   $0x80106fa5
80106362:	e8 a0 a2 ff ff       	call   80100607 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80106367:	83 c4 0c             	add    $0xc,%esp
8010636a:	ff 75 0c             	push   0xc(%ebp)
8010636d:	57                   	push   %edi
8010636e:	ff 75 08             	push   0x8(%ebp)
80106371:	e8 aa fe ff ff       	call   80106220 <deallocuvm>
      kfree(mem);
80106376:	89 1c 24             	mov    %ebx,(%esp)
80106379:	e8 0e bc ff ff       	call   80101f8c <kfree>
      return 0;
8010637e:	83 c4 10             	add    $0x10,%esp
80106381:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106388:	eb 07                	jmp    80106391 <allocuvm+0xdf>
    return 0;
8010638a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
80106391:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106394:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106397:	5b                   	pop    %ebx
80106398:	5e                   	pop    %esi
80106399:	5f                   	pop    %edi
8010639a:	5d                   	pop    %ebp
8010639b:	c3                   	ret    

8010639c <freevm>:
=======
801061d8:	39 7d 10             	cmp    %edi,0x10(%ebp)
801061db:	73 11                	jae    801061ee <deallocuvm+0x22>
    return oldsz;

  a = PGROUNDUP(newsz);
801061dd:	8b 45 10             	mov    0x10(%ebp),%eax
801061e0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801061e6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
801061ec:	eb 19                	jmp    80106207 <deallocuvm+0x3b>
    return oldsz;
801061ee:	89 f8                	mov    %edi,%eax
801061f0:	eb 64                	jmp    80106256 <deallocuvm+0x8a>
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
801061f2:	c1 eb 16             	shr    $0x16,%ebx
801061f5:	83 c3 01             	add    $0x1,%ebx
801061f8:	c1 e3 16             	shl    $0x16,%ebx
801061fb:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106201:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106207:	39 fb                	cmp    %edi,%ebx
80106209:	73 48                	jae    80106253 <deallocuvm+0x87>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010620b:	b9 00 00 00 00       	mov    $0x0,%ecx
80106210:	89 da                	mov    %ebx,%edx
80106212:	8b 45 08             	mov    0x8(%ebp),%eax
80106215:	e8 e4 f9 ff ff       	call   80105bfe <walkpgdir>
8010621a:	89 c6                	mov    %eax,%esi
    if(!pte)
8010621c:	85 c0                	test   %eax,%eax
8010621e:	74 d2                	je     801061f2 <deallocuvm+0x26>
    else if((*pte & PTE_P) != 0){
80106220:	8b 00                	mov    (%eax),%eax
80106222:	a8 01                	test   $0x1,%al
80106224:	74 db                	je     80106201 <deallocuvm+0x35>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106226:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010622b:	74 19                	je     80106246 <deallocuvm+0x7a>
        panic("kfree");
      char *v = P2V(pa);
8010622d:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106232:	83 ec 0c             	sub    $0xc,%esp
80106235:	50                   	push   %eax
80106236:	e8 51 bd ff ff       	call   80101f8c <kfree>
      *pte = 0;
8010623b:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80106241:	83 c4 10             	add    $0x10,%esp
80106244:	eb bb                	jmp    80106201 <deallocuvm+0x35>
        panic("kfree");
80106246:	83 ec 0c             	sub    $0xc,%esp
80106249:	68 86 68 10 80       	push   $0x80106886
8010624e:	e8 f5 a0 ff ff       	call   80100348 <panic>
    }
  }
  return newsz;
80106253:	8b 45 10             	mov    0x10(%ebp),%eax
}
80106256:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106259:	5b                   	pop    %ebx
8010625a:	5e                   	pop    %esi
8010625b:	5f                   	pop    %edi
8010625c:	5d                   	pop    %ebp
8010625d:	c3                   	ret    

8010625e <allocuvm>:
{
8010625e:	55                   	push   %ebp
8010625f:	89 e5                	mov    %esp,%ebp
80106261:	57                   	push   %edi
80106262:	56                   	push   %esi
80106263:	53                   	push   %ebx
80106264:	83 ec 1c             	sub    $0x1c,%esp
80106267:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
8010626a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010626d:	85 ff                	test   %edi,%edi
8010626f:	0f 88 c1 00 00 00    	js     80106336 <allocuvm+0xd8>
  if(newsz < oldsz)
80106275:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106278:	72 5c                	jb     801062d6 <allocuvm+0x78>
  a = PGROUNDUP(oldsz);
8010627a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010627d:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
80106283:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
80106289:	39 fe                	cmp    %edi,%esi
8010628b:	0f 83 ac 00 00 00    	jae    8010633d <allocuvm+0xdf>
    mem = kalloc();
80106291:	e8 0d be ff ff       	call   801020a3 <kalloc>
80106296:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
80106298:	85 c0                	test   %eax,%eax
8010629a:	74 42                	je     801062de <allocuvm+0x80>
    memset(mem, 0, PGSIZE);
8010629c:	83 ec 04             	sub    $0x4,%esp
8010629f:	68 00 10 00 00       	push   $0x1000
801062a4:	6a 00                	push   $0x0
801062a6:	50                   	push   %eax
801062a7:	e8 f1 d9 ff ff       	call   80103c9d <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
801062ac:	83 c4 08             	add    $0x8,%esp
801062af:	6a 06                	push   $0x6
801062b1:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801062b7:	50                   	push   %eax
801062b8:	b9 00 10 00 00       	mov    $0x1000,%ecx
801062bd:	89 f2                	mov    %esi,%edx
801062bf:	8b 45 08             	mov    0x8(%ebp),%eax
801062c2:	e8 a8 f9 ff ff       	call   80105c6f <mappages>
801062c7:	83 c4 10             	add    $0x10,%esp
801062ca:	85 c0                	test   %eax,%eax
801062cc:	78 38                	js     80106306 <allocuvm+0xa8>
  for(; a < newsz; a += PGSIZE){
801062ce:	81 c6 00 10 00 00    	add    $0x1000,%esi
801062d4:	eb b3                	jmp    80106289 <allocuvm+0x2b>
    return oldsz;
801062d6:	8b 45 0c             	mov    0xc(%ebp),%eax
801062d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801062dc:	eb 5f                	jmp    8010633d <allocuvm+0xdf>
      cprintf("allocuvm out of memory\n");
801062de:	83 ec 0c             	sub    $0xc,%esp
801062e1:	68 4d 6f 10 80       	push   $0x80106f4d
801062e6:	e8 1c a3 ff ff       	call   80100607 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
801062eb:	83 c4 0c             	add    $0xc,%esp
801062ee:	ff 75 0c             	push   0xc(%ebp)
801062f1:	57                   	push   %edi
801062f2:	ff 75 08             	push   0x8(%ebp)
801062f5:	e8 d2 fe ff ff       	call   801061cc <deallocuvm>
      return 0;
801062fa:	83 c4 10             	add    $0x10,%esp
801062fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106304:	eb 37                	jmp    8010633d <allocuvm+0xdf>
      cprintf("allocuvm out of memory (2)\n");
80106306:	83 ec 0c             	sub    $0xc,%esp
80106309:	68 65 6f 10 80       	push   $0x80106f65
8010630e:	e8 f4 a2 ff ff       	call   80100607 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80106313:	83 c4 0c             	add    $0xc,%esp
80106316:	ff 75 0c             	push   0xc(%ebp)
80106319:	57                   	push   %edi
8010631a:	ff 75 08             	push   0x8(%ebp)
8010631d:	e8 aa fe ff ff       	call   801061cc <deallocuvm>
      kfree(mem);
80106322:	89 1c 24             	mov    %ebx,(%esp)
80106325:	e8 62 bc ff ff       	call   80101f8c <kfree>
      return 0;
8010632a:	83 c4 10             	add    $0x10,%esp
8010632d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106334:	eb 07                	jmp    8010633d <allocuvm+0xdf>
    return 0;
80106336:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
8010633d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106340:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106343:	5b                   	pop    %ebx
80106344:	5e                   	pop    %esi
80106345:	5f                   	pop    %edi
80106346:	5d                   	pop    %ebp
80106347:	c3                   	ret    

80106348 <freevm>:
>>>>>>> d669a6c (ulib and makefile)

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
<<<<<<< HEAD
8010639c:	55                   	push   %ebp
8010639d:	89 e5                	mov    %esp,%ebp
8010639f:	56                   	push   %esi
801063a0:	53                   	push   %ebx
801063a1:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
801063a4:	85 f6                	test   %esi,%esi
801063a6:	74 1a                	je     801063c2 <freevm+0x26>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
801063a8:	83 ec 04             	sub    $0x4,%esp
801063ab:	6a 00                	push   $0x0
801063ad:	68 00 00 00 80       	push   $0x80000000
801063b2:	56                   	push   %esi
801063b3:	e8 68 fe ff ff       	call   80106220 <deallocuvm>
  for(i = 0; i < NPDENTRIES; i++){
801063b8:	83 c4 10             	add    $0x10,%esp
801063bb:	bb 00 00 00 00       	mov    $0x0,%ebx
801063c0:	eb 10                	jmp    801063d2 <freevm+0x36>
    panic("freevm: no pgdir");
801063c2:	83 ec 0c             	sub    $0xc,%esp
801063c5:	68 c1 6f 10 80       	push   $0x80106fc1
801063ca:	e8 79 9f ff ff       	call   80100348 <panic>
  for(i = 0; i < NPDENTRIES; i++){
801063cf:	83 c3 01             	add    $0x1,%ebx
801063d2:	81 fb ff 03 00 00    	cmp    $0x3ff,%ebx
801063d8:	77 1f                	ja     801063f9 <freevm+0x5d>
    if(pgdir[i] & PTE_P){
801063da:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
801063dd:	a8 01                	test   $0x1,%al
801063df:	74 ee                	je     801063cf <freevm+0x33>
      char * v = P2V(PTE_ADDR(pgdir[i]));
801063e1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801063e6:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
801063eb:	83 ec 0c             	sub    $0xc,%esp
801063ee:	50                   	push   %eax
801063ef:	e8 98 bb ff ff       	call   80101f8c <kfree>
801063f4:	83 c4 10             	add    $0x10,%esp
801063f7:	eb d6                	jmp    801063cf <freevm+0x33>
    }
  }
  kfree((char*)pgdir);
801063f9:	83 ec 0c             	sub    $0xc,%esp
801063fc:	56                   	push   %esi
801063fd:	e8 8a bb ff ff       	call   80101f8c <kfree>
}
80106402:	83 c4 10             	add    $0x10,%esp
80106405:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106408:	5b                   	pop    %ebx
80106409:	5e                   	pop    %esi
8010640a:	5d                   	pop    %ebp
8010640b:	c3                   	ret    

8010640c <setupkvm>:
{
8010640c:	55                   	push   %ebp
8010640d:	89 e5                	mov    %esp,%ebp
8010640f:	56                   	push   %esi
80106410:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106411:	e8 8d bc ff ff       	call   801020a3 <kalloc>
80106416:	89 c6                	mov    %eax,%esi
80106418:	85 c0                	test   %eax,%eax
8010641a:	74 55                	je     80106471 <setupkvm+0x65>
  memset(pgdir, 0, PGSIZE);
8010641c:	83 ec 04             	sub    $0x4,%esp
8010641f:	68 00 10 00 00       	push   $0x1000
80106424:	6a 00                	push   $0x0
80106426:	50                   	push   %eax
80106427:	e8 c5 d8 ff ff       	call   80103cf1 <memset>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010642c:	83 c4 10             	add    $0x10,%esp
8010642f:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106434:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
8010643a:	73 35                	jae    80106471 <setupkvm+0x65>
                (uint)k->phys_start, k->perm) < 0) {
8010643c:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010643f:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106442:	29 c1                	sub    %eax,%ecx
80106444:	83 ec 08             	sub    $0x8,%esp
80106447:	ff 73 0c             	push   0xc(%ebx)
8010644a:	50                   	push   %eax
8010644b:	8b 13                	mov    (%ebx),%edx
8010644d:	89 f0                	mov    %esi,%eax
8010644f:	e8 6f f8 ff ff       	call   80105cc3 <mappages>
80106454:	83 c4 10             	add    $0x10,%esp
80106457:	85 c0                	test   %eax,%eax
80106459:	78 05                	js     80106460 <setupkvm+0x54>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010645b:	83 c3 10             	add    $0x10,%ebx
8010645e:	eb d4                	jmp    80106434 <setupkvm+0x28>
      freevm(pgdir);
80106460:	83 ec 0c             	sub    $0xc,%esp
80106463:	56                   	push   %esi
80106464:	e8 33 ff ff ff       	call   8010639c <freevm>
      return 0;
80106469:	83 c4 10             	add    $0x10,%esp
8010646c:	be 00 00 00 00       	mov    $0x0,%esi
}
80106471:	89 f0                	mov    %esi,%eax
80106473:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106476:	5b                   	pop    %ebx
80106477:	5e                   	pop    %esi
80106478:	5d                   	pop    %ebp
80106479:	c3                   	ret    

8010647a <kvmalloc>:
{
8010647a:	55                   	push   %ebp
8010647b:	89 e5                	mov    %esp,%ebp
8010647d:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106480:	e8 87 ff ff ff       	call   8010640c <setupkvm>
80106485:	a3 c4 44 11 80       	mov    %eax,0x801144c4
  switchkvm();
8010648a:	e8 1f fb ff ff       	call   80105fae <switchkvm>
}
8010648f:	c9                   	leave  
80106490:	c3                   	ret    

80106491 <clearpteu>:
=======
80106348:	55                   	push   %ebp
80106349:	89 e5                	mov    %esp,%ebp
8010634b:	56                   	push   %esi
8010634c:	53                   	push   %ebx
8010634d:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106350:	85 f6                	test   %esi,%esi
80106352:	74 1a                	je     8010636e <freevm+0x26>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
80106354:	83 ec 04             	sub    $0x4,%esp
80106357:	6a 00                	push   $0x0
80106359:	68 00 00 00 80       	push   $0x80000000
8010635e:	56                   	push   %esi
8010635f:	e8 68 fe ff ff       	call   801061cc <deallocuvm>
  for(i = 0; i < NPDENTRIES; i++){
80106364:	83 c4 10             	add    $0x10,%esp
80106367:	bb 00 00 00 00       	mov    $0x0,%ebx
8010636c:	eb 10                	jmp    8010637e <freevm+0x36>
    panic("freevm: no pgdir");
8010636e:	83 ec 0c             	sub    $0xc,%esp
80106371:	68 81 6f 10 80       	push   $0x80106f81
80106376:	e8 cd 9f ff ff       	call   80100348 <panic>
  for(i = 0; i < NPDENTRIES; i++){
8010637b:	83 c3 01             	add    $0x1,%ebx
8010637e:	81 fb ff 03 00 00    	cmp    $0x3ff,%ebx
80106384:	77 1f                	ja     801063a5 <freevm+0x5d>
    if(pgdir[i] & PTE_P){
80106386:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
80106389:	a8 01                	test   $0x1,%al
8010638b:	74 ee                	je     8010637b <freevm+0x33>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010638d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106392:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106397:	83 ec 0c             	sub    $0xc,%esp
8010639a:	50                   	push   %eax
8010639b:	e8 ec bb ff ff       	call   80101f8c <kfree>
801063a0:	83 c4 10             	add    $0x10,%esp
801063a3:	eb d6                	jmp    8010637b <freevm+0x33>
    }
  }
  kfree((char*)pgdir);
801063a5:	83 ec 0c             	sub    $0xc,%esp
801063a8:	56                   	push   %esi
801063a9:	e8 de bb ff ff       	call   80101f8c <kfree>
}
801063ae:	83 c4 10             	add    $0x10,%esp
801063b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801063b4:	5b                   	pop    %ebx
801063b5:	5e                   	pop    %esi
801063b6:	5d                   	pop    %ebp
801063b7:	c3                   	ret    

801063b8 <setupkvm>:
{
801063b8:	55                   	push   %ebp
801063b9:	89 e5                	mov    %esp,%ebp
801063bb:	56                   	push   %esi
801063bc:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
801063bd:	e8 e1 bc ff ff       	call   801020a3 <kalloc>
801063c2:	89 c6                	mov    %eax,%esi
801063c4:	85 c0                	test   %eax,%eax
801063c6:	74 55                	je     8010641d <setupkvm+0x65>
  memset(pgdir, 0, PGSIZE);
801063c8:	83 ec 04             	sub    $0x4,%esp
801063cb:	68 00 10 00 00       	push   $0x1000
801063d0:	6a 00                	push   $0x0
801063d2:	50                   	push   %eax
801063d3:	e8 c5 d8 ff ff       	call   80103c9d <memset>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801063d8:	83 c4 10             	add    $0x10,%esp
801063db:	bb 20 94 10 80       	mov    $0x80109420,%ebx
801063e0:	81 fb 60 94 10 80    	cmp    $0x80109460,%ebx
801063e6:	73 35                	jae    8010641d <setupkvm+0x65>
                (uint)k->phys_start, k->perm) < 0) {
801063e8:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801063eb:	8b 4b 08             	mov    0x8(%ebx),%ecx
801063ee:	29 c1                	sub    %eax,%ecx
801063f0:	83 ec 08             	sub    $0x8,%esp
801063f3:	ff 73 0c             	push   0xc(%ebx)
801063f6:	50                   	push   %eax
801063f7:	8b 13                	mov    (%ebx),%edx
801063f9:	89 f0                	mov    %esi,%eax
801063fb:	e8 6f f8 ff ff       	call   80105c6f <mappages>
80106400:	83 c4 10             	add    $0x10,%esp
80106403:	85 c0                	test   %eax,%eax
80106405:	78 05                	js     8010640c <setupkvm+0x54>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106407:	83 c3 10             	add    $0x10,%ebx
8010640a:	eb d4                	jmp    801063e0 <setupkvm+0x28>
      freevm(pgdir);
8010640c:	83 ec 0c             	sub    $0xc,%esp
8010640f:	56                   	push   %esi
80106410:	e8 33 ff ff ff       	call   80106348 <freevm>
      return 0;
80106415:	83 c4 10             	add    $0x10,%esp
80106418:	be 00 00 00 00       	mov    $0x0,%esi
}
8010641d:	89 f0                	mov    %esi,%eax
8010641f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106422:	5b                   	pop    %ebx
80106423:	5e                   	pop    %esi
80106424:	5d                   	pop    %ebp
80106425:	c3                   	ret    

80106426 <kvmalloc>:
{
80106426:	55                   	push   %ebp
80106427:	89 e5                	mov    %esp,%ebp
80106429:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
8010642c:	e8 87 ff ff ff       	call   801063b8 <setupkvm>
80106431:	a3 c4 34 11 80       	mov    %eax,0x801134c4
  switchkvm();
80106436:	e8 1f fb ff ff       	call   80105f5a <switchkvm>
}
8010643b:	c9                   	leave  
8010643c:	c3                   	ret    

8010643d <clearpteu>:
>>>>>>> d669a6c (ulib and makefile)

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
<<<<<<< HEAD
80106491:	55                   	push   %ebp
80106492:	89 e5                	mov    %esp,%ebp
80106494:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106497:	b9 00 00 00 00       	mov    $0x0,%ecx
8010649c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010649f:	8b 45 08             	mov    0x8(%ebp),%eax
801064a2:	e8 ab f7 ff ff       	call   80105c52 <walkpgdir>
  if(pte == 0)
801064a7:	85 c0                	test   %eax,%eax
801064a9:	74 05                	je     801064b0 <clearpteu+0x1f>
    panic("clearpteu");
  *pte &= ~PTE_U;
801064ab:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801064ae:	c9                   	leave  
801064af:	c3                   	ret    
    panic("clearpteu");
801064b0:	83 ec 0c             	sub    $0xc,%esp
801064b3:	68 d2 6f 10 80       	push   $0x80106fd2
801064b8:	e8 8b 9e ff ff       	call   80100348 <panic>

801064bd <copyuvm>:
=======
8010643d:	55                   	push   %ebp
8010643e:	89 e5                	mov    %esp,%ebp
80106440:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106443:	b9 00 00 00 00       	mov    $0x0,%ecx
80106448:	8b 55 0c             	mov    0xc(%ebp),%edx
8010644b:	8b 45 08             	mov    0x8(%ebp),%eax
8010644e:	e8 ab f7 ff ff       	call   80105bfe <walkpgdir>
  if(pte == 0)
80106453:	85 c0                	test   %eax,%eax
80106455:	74 05                	je     8010645c <clearpteu+0x1f>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106457:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010645a:	c9                   	leave  
8010645b:	c3                   	ret    
    panic("clearpteu");
8010645c:	83 ec 0c             	sub    $0xc,%esp
8010645f:	68 92 6f 10 80       	push   $0x80106f92
80106464:	e8 df 9e ff ff       	call   80100348 <panic>

80106469 <copyuvm>:
>>>>>>> d669a6c (ulib and makefile)

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
<<<<<<< HEAD
801064bd:	55                   	push   %ebp
801064be:	89 e5                	mov    %esp,%ebp
801064c0:	57                   	push   %edi
801064c1:	56                   	push   %esi
801064c2:	53                   	push   %ebx
801064c3:	83 ec 1c             	sub    $0x1c,%esp
=======
80106469:	55                   	push   %ebp
8010646a:	89 e5                	mov    %esp,%ebp
8010646c:	57                   	push   %edi
8010646d:	56                   	push   %esi
8010646e:	53                   	push   %ebx
8010646f:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> d669a6c (ulib and makefile)
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
<<<<<<< HEAD
801064c6:	e8 41 ff ff ff       	call   8010640c <setupkvm>
801064cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801064ce:	85 c0                	test   %eax,%eax
801064d0:	0f 84 c4 00 00 00    	je     8010659a <copyuvm+0xdd>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801064d6:	bf 00 00 00 00       	mov    $0x0,%edi
801064db:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801064de:	0f 83 b6 00 00 00    	jae    8010659a <copyuvm+0xdd>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801064e4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801064e7:	b9 00 00 00 00       	mov    $0x0,%ecx
801064ec:	89 fa                	mov    %edi,%edx
801064ee:	8b 45 08             	mov    0x8(%ebp),%eax
801064f1:	e8 5c f7 ff ff       	call   80105c52 <walkpgdir>
801064f6:	85 c0                	test   %eax,%eax
801064f8:	74 65                	je     8010655f <copyuvm+0xa2>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
801064fa:	8b 00                	mov    (%eax),%eax
801064fc:	a8 01                	test   $0x1,%al
801064fe:	74 6c                	je     8010656c <copyuvm+0xaf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106500:	89 c6                	mov    %eax,%esi
80106502:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    flags = PTE_FLAGS(*pte);
80106508:	25 ff 0f 00 00       	and    $0xfff,%eax
8010650d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if((mem = kalloc()) == 0)
80106510:	e8 8e bb ff ff       	call   801020a3 <kalloc>
80106515:	89 c3                	mov    %eax,%ebx
80106517:	85 c0                	test   %eax,%eax
80106519:	74 6a                	je     80106585 <copyuvm+0xc8>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
8010651b:	81 c6 00 00 00 80    	add    $0x80000000,%esi
80106521:	83 ec 04             	sub    $0x4,%esp
80106524:	68 00 10 00 00       	push   $0x1000
80106529:	56                   	push   %esi
8010652a:	50                   	push   %eax
8010652b:	e8 39 d8 ff ff       	call   80103d69 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106530:	83 c4 08             	add    $0x8,%esp
80106533:	ff 75 e0             	push   -0x20(%ebp)
80106536:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010653c:	50                   	push   %eax
8010653d:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106542:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106545:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106548:	e8 76 f7 ff ff       	call   80105cc3 <mappages>
8010654d:	83 c4 10             	add    $0x10,%esp
80106550:	85 c0                	test   %eax,%eax
80106552:	78 25                	js     80106579 <copyuvm+0xbc>
  for(i = 0; i < sz; i += PGSIZE){
80106554:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010655a:	e9 7c ff ff ff       	jmp    801064db <copyuvm+0x1e>
      panic("copyuvm: pte should exist");
8010655f:	83 ec 0c             	sub    $0xc,%esp
80106562:	68 dc 6f 10 80       	push   $0x80106fdc
80106567:	e8 dc 9d ff ff       	call   80100348 <panic>
      panic("copyuvm: page not present");
8010656c:	83 ec 0c             	sub    $0xc,%esp
8010656f:	68 f6 6f 10 80       	push   $0x80106ff6
80106574:	e8 cf 9d ff ff       	call   80100348 <panic>
      kfree(mem);
80106579:	83 ec 0c             	sub    $0xc,%esp
8010657c:	53                   	push   %ebx
8010657d:	e8 0a ba ff ff       	call   80101f8c <kfree>
      goto bad;
80106582:	83 c4 10             	add    $0x10,%esp
=======
80106472:	e8 41 ff ff ff       	call   801063b8 <setupkvm>
80106477:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010647a:	85 c0                	test   %eax,%eax
8010647c:	0f 84 c4 00 00 00    	je     80106546 <copyuvm+0xdd>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106482:	bf 00 00 00 00       	mov    $0x0,%edi
80106487:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010648a:	0f 83 b6 00 00 00    	jae    80106546 <copyuvm+0xdd>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106490:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106493:	b9 00 00 00 00       	mov    $0x0,%ecx
80106498:	89 fa                	mov    %edi,%edx
8010649a:	8b 45 08             	mov    0x8(%ebp),%eax
8010649d:	e8 5c f7 ff ff       	call   80105bfe <walkpgdir>
801064a2:	85 c0                	test   %eax,%eax
801064a4:	74 65                	je     8010650b <copyuvm+0xa2>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
801064a6:	8b 00                	mov    (%eax),%eax
801064a8:	a8 01                	test   $0x1,%al
801064aa:	74 6c                	je     80106518 <copyuvm+0xaf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801064ac:	89 c6                	mov    %eax,%esi
801064ae:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    flags = PTE_FLAGS(*pte);
801064b4:	25 ff 0f 00 00       	and    $0xfff,%eax
801064b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if((mem = kalloc()) == 0)
801064bc:	e8 e2 bb ff ff       	call   801020a3 <kalloc>
801064c1:	89 c3                	mov    %eax,%ebx
801064c3:	85 c0                	test   %eax,%eax
801064c5:	74 6a                	je     80106531 <copyuvm+0xc8>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801064c7:	81 c6 00 00 00 80    	add    $0x80000000,%esi
801064cd:	83 ec 04             	sub    $0x4,%esp
801064d0:	68 00 10 00 00       	push   $0x1000
801064d5:	56                   	push   %esi
801064d6:	50                   	push   %eax
801064d7:	e8 39 d8 ff ff       	call   80103d15 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
801064dc:	83 c4 08             	add    $0x8,%esp
801064df:	ff 75 e0             	push   -0x20(%ebp)
801064e2:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801064e8:	50                   	push   %eax
801064e9:	b9 00 10 00 00       	mov    $0x1000,%ecx
801064ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801064f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801064f4:	e8 76 f7 ff ff       	call   80105c6f <mappages>
801064f9:	83 c4 10             	add    $0x10,%esp
801064fc:	85 c0                	test   %eax,%eax
801064fe:	78 25                	js     80106525 <copyuvm+0xbc>
  for(i = 0; i < sz; i += PGSIZE){
80106500:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106506:	e9 7c ff ff ff       	jmp    80106487 <copyuvm+0x1e>
      panic("copyuvm: pte should exist");
8010650b:	83 ec 0c             	sub    $0xc,%esp
8010650e:	68 9c 6f 10 80       	push   $0x80106f9c
80106513:	e8 30 9e ff ff       	call   80100348 <panic>
      panic("copyuvm: page not present");
80106518:	83 ec 0c             	sub    $0xc,%esp
8010651b:	68 b6 6f 10 80       	push   $0x80106fb6
80106520:	e8 23 9e ff ff       	call   80100348 <panic>
      kfree(mem);
80106525:	83 ec 0c             	sub    $0xc,%esp
80106528:	53                   	push   %ebx
80106529:	e8 5e ba ff ff       	call   80101f8c <kfree>
      goto bad;
8010652e:	83 c4 10             	add    $0x10,%esp
>>>>>>> d669a6c (ulib and makefile)
    }
  }
  return d;

bad:
  freevm(d);
<<<<<<< HEAD
80106585:	83 ec 0c             	sub    $0xc,%esp
80106588:	ff 75 dc             	push   -0x24(%ebp)
8010658b:	e8 0c fe ff ff       	call   8010639c <freevm>
  return 0;
80106590:	83 c4 10             	add    $0x10,%esp
80106593:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
}
8010659a:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010659d:	8d 65 f4             	lea    -0xc(%ebp),%esp
801065a0:	5b                   	pop    %ebx
801065a1:	5e                   	pop    %esi
801065a2:	5f                   	pop    %edi
801065a3:	5d                   	pop    %ebp
801065a4:	c3                   	ret    

801065a5 <uva2ka>:
=======
80106531:	83 ec 0c             	sub    $0xc,%esp
80106534:	ff 75 dc             	push   -0x24(%ebp)
80106537:	e8 0c fe ff ff       	call   80106348 <freevm>
  return 0;
8010653c:	83 c4 10             	add    $0x10,%esp
8010653f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
}
80106546:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106549:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010654c:	5b                   	pop    %ebx
8010654d:	5e                   	pop    %esi
8010654e:	5f                   	pop    %edi
8010654f:	5d                   	pop    %ebp
80106550:	c3                   	ret    

80106551 <uva2ka>:
>>>>>>> d669a6c (ulib and makefile)

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
<<<<<<< HEAD
801065a5:	55                   	push   %ebp
801065a6:	89 e5                	mov    %esp,%ebp
801065a8:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801065ab:	b9 00 00 00 00       	mov    $0x0,%ecx
801065b0:	8b 55 0c             	mov    0xc(%ebp),%edx
801065b3:	8b 45 08             	mov    0x8(%ebp),%eax
801065b6:	e8 97 f6 ff ff       	call   80105c52 <walkpgdir>
  if((*pte & PTE_P) == 0)
801065bb:	8b 00                	mov    (%eax),%eax
801065bd:	a8 01                	test   $0x1,%al
801065bf:	74 10                	je     801065d1 <uva2ka+0x2c>
    return 0;
  if((*pte & PTE_U) == 0)
801065c1:	a8 04                	test   $0x4,%al
801065c3:	74 13                	je     801065d8 <uva2ka+0x33>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801065c5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801065ca:	05 00 00 00 80       	add    $0x80000000,%eax
}
801065cf:	c9                   	leave  
801065d0:	c3                   	ret    
    return 0;
801065d1:	b8 00 00 00 00       	mov    $0x0,%eax
801065d6:	eb f7                	jmp    801065cf <uva2ka+0x2a>
    return 0;
801065d8:	b8 00 00 00 00       	mov    $0x0,%eax
801065dd:	eb f0                	jmp    801065cf <uva2ka+0x2a>

801065df <copyout>:
=======
80106551:	55                   	push   %ebp
80106552:	89 e5                	mov    %esp,%ebp
80106554:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106557:	b9 00 00 00 00       	mov    $0x0,%ecx
8010655c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010655f:	8b 45 08             	mov    0x8(%ebp),%eax
80106562:	e8 97 f6 ff ff       	call   80105bfe <walkpgdir>
  if((*pte & PTE_P) == 0)
80106567:	8b 00                	mov    (%eax),%eax
80106569:	a8 01                	test   $0x1,%al
8010656b:	74 10                	je     8010657d <uva2ka+0x2c>
    return 0;
  if((*pte & PTE_U) == 0)
8010656d:	a8 04                	test   $0x4,%al
8010656f:	74 13                	je     80106584 <uva2ka+0x33>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106571:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106576:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010657b:	c9                   	leave  
8010657c:	c3                   	ret    
    return 0;
8010657d:	b8 00 00 00 00       	mov    $0x0,%eax
80106582:	eb f7                	jmp    8010657b <uva2ka+0x2a>
    return 0;
80106584:	b8 00 00 00 00       	mov    $0x0,%eax
80106589:	eb f0                	jmp    8010657b <uva2ka+0x2a>

8010658b <copyout>:
>>>>>>> d669a6c (ulib and makefile)
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
<<<<<<< HEAD
801065df:	55                   	push   %ebp
801065e0:	89 e5                	mov    %esp,%ebp
801065e2:	57                   	push   %edi
801065e3:	56                   	push   %esi
801065e4:	53                   	push   %ebx
801065e5:	83 ec 0c             	sub    $0xc,%esp
801065e8:	8b 7d 14             	mov    0x14(%ebp),%edi
=======
8010658b:	55                   	push   %ebp
8010658c:	89 e5                	mov    %esp,%ebp
8010658e:	57                   	push   %edi
8010658f:	56                   	push   %esi
80106590:	53                   	push   %ebx
80106591:	83 ec 0c             	sub    $0xc,%esp
80106594:	8b 7d 14             	mov    0x14(%ebp),%edi
>>>>>>> d669a6c (ulib and makefile)
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
<<<<<<< HEAD
801065eb:	eb 25                	jmp    80106612 <copyout+0x33>
=======
80106597:	eb 25                	jmp    801065be <copyout+0x33>
>>>>>>> d669a6c (ulib and makefile)
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
<<<<<<< HEAD
801065ed:	8b 55 0c             	mov    0xc(%ebp),%edx
801065f0:	29 f2                	sub    %esi,%edx
801065f2:	01 d0                	add    %edx,%eax
801065f4:	83 ec 04             	sub    $0x4,%esp
801065f7:	53                   	push   %ebx
801065f8:	ff 75 10             	push   0x10(%ebp)
801065fb:	50                   	push   %eax
801065fc:	e8 68 d7 ff ff       	call   80103d69 <memmove>
    len -= n;
80106601:	29 df                	sub    %ebx,%edi
    buf += n;
80106603:	01 5d 10             	add    %ebx,0x10(%ebp)
    va = va0 + PGSIZE;
80106606:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
8010660c:	89 45 0c             	mov    %eax,0xc(%ebp)
8010660f:	83 c4 10             	add    $0x10,%esp
  while(len > 0){
80106612:	85 ff                	test   %edi,%edi
80106614:	74 2f                	je     80106645 <copyout+0x66>
    va0 = (uint)PGROUNDDOWN(va);
80106616:	8b 75 0c             	mov    0xc(%ebp),%esi
80106619:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
8010661f:	83 ec 08             	sub    $0x8,%esp
80106622:	56                   	push   %esi
80106623:	ff 75 08             	push   0x8(%ebp)
80106626:	e8 7a ff ff ff       	call   801065a5 <uva2ka>
    if(pa0 == 0)
8010662b:	83 c4 10             	add    $0x10,%esp
8010662e:	85 c0                	test   %eax,%eax
80106630:	74 20                	je     80106652 <copyout+0x73>
    n = PGSIZE - (va - va0);
80106632:	89 f3                	mov    %esi,%ebx
80106634:	2b 5d 0c             	sub    0xc(%ebp),%ebx
80106637:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if(n > len)
8010663d:	39 df                	cmp    %ebx,%edi
8010663f:	73 ac                	jae    801065ed <copyout+0xe>
      n = len;
80106641:	89 fb                	mov    %edi,%ebx
80106643:	eb a8                	jmp    801065ed <copyout+0xe>
  }
  return 0;
80106645:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010664a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010664d:	5b                   	pop    %ebx
8010664e:	5e                   	pop    %esi
8010664f:	5f                   	pop    %edi
80106650:	5d                   	pop    %ebp
80106651:	c3                   	ret    
      return -1;
80106652:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106657:	eb f1                	jmp    8010664a <copyout+0x6b>
=======
80106599:	8b 55 0c             	mov    0xc(%ebp),%edx
8010659c:	29 f2                	sub    %esi,%edx
8010659e:	01 d0                	add    %edx,%eax
801065a0:	83 ec 04             	sub    $0x4,%esp
801065a3:	53                   	push   %ebx
801065a4:	ff 75 10             	push   0x10(%ebp)
801065a7:	50                   	push   %eax
801065a8:	e8 68 d7 ff ff       	call   80103d15 <memmove>
    len -= n;
801065ad:	29 df                	sub    %ebx,%edi
    buf += n;
801065af:	01 5d 10             	add    %ebx,0x10(%ebp)
    va = va0 + PGSIZE;
801065b2:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
801065b8:	89 45 0c             	mov    %eax,0xc(%ebp)
801065bb:	83 c4 10             	add    $0x10,%esp
  while(len > 0){
801065be:	85 ff                	test   %edi,%edi
801065c0:	74 2f                	je     801065f1 <copyout+0x66>
    va0 = (uint)PGROUNDDOWN(va);
801065c2:	8b 75 0c             	mov    0xc(%ebp),%esi
801065c5:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801065cb:	83 ec 08             	sub    $0x8,%esp
801065ce:	56                   	push   %esi
801065cf:	ff 75 08             	push   0x8(%ebp)
801065d2:	e8 7a ff ff ff       	call   80106551 <uva2ka>
    if(pa0 == 0)
801065d7:	83 c4 10             	add    $0x10,%esp
801065da:	85 c0                	test   %eax,%eax
801065dc:	74 20                	je     801065fe <copyout+0x73>
    n = PGSIZE - (va - va0);
801065de:	89 f3                	mov    %esi,%ebx
801065e0:	2b 5d 0c             	sub    0xc(%ebp),%ebx
801065e3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if(n > len)
801065e9:	39 df                	cmp    %ebx,%edi
801065eb:	73 ac                	jae    80106599 <copyout+0xe>
      n = len;
801065ed:	89 fb                	mov    %edi,%ebx
801065ef:	eb a8                	jmp    80106599 <copyout+0xe>
  }
  return 0;
801065f1:	b8 00 00 00 00       	mov    $0x0,%eax
}
801065f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801065f9:	5b                   	pop    %ebx
801065fa:	5e                   	pop    %esi
801065fb:	5f                   	pop    %edi
801065fc:	5d                   	pop    %ebp
801065fd:	c3                   	ret    
      return -1;
801065fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106603:	eb f1                	jmp    801065f6 <copyout+0x6b>
>>>>>>> d669a6c (ulib and makefile)
