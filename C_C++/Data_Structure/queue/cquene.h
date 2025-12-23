/************************************************************
* Copyright (c) 20xx，
* All rights reserved.
* 
* 文件名称：cqueue.h
* 当前版本：
* 内容摘要：基于嵌入式c语言的队列函数封装 
* 其他说明：
*
* 作    者：Low-sir
* 完成版本：1.0
* 完成日期：2019-11-23
*
************************************************************/
#ifndef __CQUENE__
#define	__CQUENE__
/***********************************************************
*                   数据类型定义                                      *
***********************************************************/
typedef	unsigned int uint32_t;
typedef int int32_t;
typedef char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef long long int64_t;
typedef unsigned long long uint64_t;

#define min(x,y) x>y?y:x

typedef struct{
	uint8_t *fifo;
	uint32_t rear;
	uint32_t head;
	uint32_t size;
}cquene_t;

/************************************************************
*                      函数原型                                        *
***********************************************************/

void cquene_crete(cquene_t *cquene, uint8_t *buf, uint32_t size);
int cquene_byte_push(cquene_t *quene, uint8_t byte);
int cquene_byte_pop(cquene_t *quene, uint8_t &byte);

int cquene_buf_push(cquene_t *quene, uint8_t *buf, uint32_t len);
int cquene_buf_pop(cquene_t *quene, uint8_t *buf, uint32_t len);

int cquene_size_remain(cquene_t *quene);
int cquene_size_used(cquene_t *quene);

int cquene_full_is(cquene_t *quene);
void cquene_flush(cquene_t *quene);
#endif

