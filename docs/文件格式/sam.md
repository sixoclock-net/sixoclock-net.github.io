# sam文件



# 功能简介

 SAM文件是一种比对好的存放reads比对结果信息的文件。 它被广泛用于存储由第二代测序技术生成的数据，例如核苷酸序列，并且该标准已经扩展为包括未映射的序列。[2] 该格式支持由不同测序平台产生的短读和长读（最高128 Mbp），可用于在Genome Analysis Toolkit（GATK）以及Broad Institute，Wellcome Sanger Institute和整个1000 Genomes Project中保存映射数据。  



# 格式

 SAM格式是由@开头的标题行（ header ）和比对结果组成的文本文件。标题行部分必须在比对结果之前（如果存在）。其中，

- header：标记了该SAM文件的一些基本信息，比如版本、按照什么方式排序的、Reference信息等等。
- 本体：每行为一个reads，不同列记录了不同的信息，列与列之间通过tab分隔。

SAM文件的二进制文件是Binary Alignment Map（BAM）文件，该文件以压缩的二进制表示形式存储相同的数据。SAM文件可以使用SAMtools软件进行分析和编辑。  比对部分具有11个必填字段，以及可变数量的可选字段。

一个sam文件示例，

```sam
@HD VN:1.6 SO:coordinate
@SQ SN:ref LN:45
r001 99 ref 7 30 8M2I4M1D3M = 37 39 TTAGATAAAGGATACTG *
r002 0 ref 9 30 3S6M1P1I4M * 0 0 AAAAGATAAGGATA *
r003 0 ref 9 30 5S6M * 0 0 GCCTAAGCTAA * SA:Z:ref,29,-,6H5M,17,0;
r004 0 ref 16 30 6M14N5M * 0 0 ATAGCTTCAGC *
r003 2064 ref 29 17 6H5M * 0 0 TAGGC * SA:Z:ref,9,+,5S6M,30,1;
r001 147 ref 37 30 9M = 7 -39 CAGCGGCAT * NM:i:1
```

### 11个必选字段的具体含义

| Col  | Field |  Type  |           Brief description           |
| :--: | :---: | :----: | :-----------------------------------: |
|  1   | QNAME | String |          Query template NAME          |
|  2   | FLAG  |  Int   |             bitwise FLAG              |
|  3   | RNAME | String |       References sequence NAME        |
|  4   |  POS  |  Int   |  1- based leftmost mapping POSition   |
|  5   | MAPQ  |  Int   |            MAPping Quality            |
|  6   | CIGAR | String |             CIGAR String              |
|  7   | RNEXT | String |    Ref. name of the mate/next read    |
|  8   | PNEXT |  Int   |    Position of the mate/next read     |
|  9   | TLEN  |  Int   |       observed Template LENgth        |
|  10  |  SEQ  | String |           segment SEQuence            |
|  11  | QUAL  | String | ASCII of Phred-scaled base QUALity+33 |

具体来说，

QNAME：测序的reads的名字。

FLAG：二进制数字之和，不同数字代表了不同的意义；比如正负链，R1/R2（双端测序的哪一端）等。

RNAME：map到参考基因组后的染色体名称。

POS：1-based 基因组起始位点。

MAPQ：map的质量。

CIGAR：一个数字与字母交替构成的字符串，标记了这段reads不同位置的match情况。不同字母的含义后边介绍。

RNEXT：如果是pair-end测序，这个为mate（另一端中对应的）的read的染色体名称；否则为下一条read的染色体名称。

PNEXT：同上，read对应的起始位点。

TLEN：模板的长度。

SEQ：序列。

QUAL：序列的质量打分（fastq文件中的那个）。



### FLAG的含义

第二个字段FLAG是一个十进制整数，但它的具体含义需要将十进制转为二进制，各二进制含义为，

| Integer |     Binary     |           Description (Paired Read Interpretation)           |
| :-----: | :------------: | :----------------------------------------------------------: |
|    1    | `000000000001` | template having multiple templates in sequencing (read is paired) |
|    2    | `000000000010` | each segment properly aligned according to the aligner (read mapped in proper pair) |
|    4    | `000000000100` |              segment unmapped (read1 unmapped)               |
|    8    | `000000001000` |    next segment in the template unmapped (read2 unmapped)    |
|   16    | `000000010000` | SEQ being reverse complemented (read1 reverse complemented)  |
|   32    | `000000100000` | SEQ of the next segment in the template being reverse complemented (read2 reverse complemented) |
|   64    | `000001000000` |         the first segment in the template (is read1)         |
|   128   | `000010000000` |         the last segment in the template (is read2)          |
|   256   | `000100000000` |                    not primary alignment                     |
|   512   | `001000000000` |                alignment fails quality checks                |
|  1024   | `010000000000` |                   PCR or optical duplicate                   |
|  2048   | `100000000000` | supplementary alignment (e.g. aligner specific, could be a portion of a split read or a tied region) |



FLAG的值通过将二进制按位求和，以表示该条reads同时具有多个属性 ，比如

| Flag Value |            Meaning             | Flag Sum |
| :--------: | :----------------------------: | :------: |
|     1      |         read is paired         |    1     |
|     32     | read2 was reverse complemented |    33    |
|     64     |             read1              |    97    |
|    2048    |    Supplementary alignment     |   2145   |

FLAG 值为33表示该reads同时具有属性`read is paired`和`read2 was reverse complemented`