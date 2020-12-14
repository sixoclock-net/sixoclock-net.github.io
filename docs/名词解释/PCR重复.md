# PCR重复（PC﻿R duplication）

PCR duplication来源于NGS建库过程中的扩增过程，扩增是为了增强对序列的富集，但是当扩增完成后，同一条reads可能存在2N个拷贝，当这些不同的拷贝落在了不同的bead上，经测序后就会得到2N条read，那这2N条read就被认为是PCR duplication.