/************************************************************
* Copyright (c) 20xx，
* All rights reserved.
* 
* 文件名称：cqueue.cpp 
* 当前版本：
* 内容摘要：基于嵌入式c语言的队列函数封装 
* 其他说明：
*
* 作    者：Low-sir
* 完成版本：1.0
* 完成日期：2019-11-23
*
************************************************************/

#include "cquene.h"
#include <string.h>

/**************************************************************
 * 函数名称：void cquene_crete(cquene_t *cquene, uint8_t *buf, uint32_t size)
 * 功能描述：创建队列 
 * 输入参数：	uint8_t *buf： 队列缓存空间地址的指针 
				uint32_t size： 队列的尺寸 
 * 输出参数：	cquene_t *cquene：输出队列对象 
 * 返 回 值：void 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/

void cquene_crete(cquene_t *cquene, uint8_t *buf, uint32_t size)
{
	cquene->fifo = buf;
	cquene->head = 0;		//队头 
	cquene->rear = 0;		//队尾 
	cquene->size = size;	//队列容量 
}

/**************************************************************
 * 函数名称：int cquene_byte_push(cquene_t *quene, uint8_t byte)
 * 功能描述：队列加入一个byte，（在队尾） 
 * 输入参数：	uint8_t byte：push的byte对象 
 * 输出参数：	cquene_t *cquene：队列对象 
 * 返 回 值：void 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/

int cquene_byte_push(cquene_t *quene, uint8_t byte)
{
	if ((quene->rear + 1) % quene->size != quene->head)
	{
		quene->fifo[quene->rear++] = byte;
		quene->rear %= quene->size;
	}
	else
	{
		return 0;
	}
	return 1;
}

/**************************************************************
 * 函数名称：int cquene_byte_pop(cquene_t *quene, uint8_t &byte)
 * 功能描述：队列输出一个byte 
 * 输入参数：	无 
 * 输出参数：	cquene_t *cquene：队列对象 
 				uint8_t &byte：输出byte本体 
 * 返 回 值：	0：错误
 				1：正确 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
int cquene_byte_pop(cquene_t *quene, uint8_t &byte)
{
	if (quene->head != quene->rear)
	{
		byte = quene->fifo[quene->head++];
		quene->head %= quene->size;
	}
	else
	{
		return 0;
	}
	return 1;
}

/**************************************************************
 * 函数名称：int cquene_buf_push(cquene_t *quene, uint8_t *buf, uint32_t len)
 * 功能描述：数据送入队 
 * 输入参数：	uint8_t *buf：送入队列数据的地址 
 				uint32_t len：送入长度 
 * 输出参数：	cquene_t *cquene：输出队列对象 
 * 返 回 值：返回输入数据的长度 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
int cquene_buf_push(cquene_t *quene, uint8_t *buf, uint32_t len)
{
	uint32_t empty, rear_rem;

	empty = (quene->head - quene->rear - 1 + quene->size)%quene->size;
	empty = min(empty, len);

	if (quene->rear < quene->head)
	{
		memcpy(&quene->fifo[quene->rear], buf, empty);
	}
	else
	{
		rear_rem = quene->size - quene->rear;

		if (empty <= rear_rem)
		{
			memcpy(&quene->fifo[quene->rear], buf, empty);
		}
		else{
			memcpy(&quene->fifo[quene->rear], buf, rear_rem);
			memcpy(quene->fifo, &buf[rear_rem], empty - rear_rem);
		}
	}
	quene->rear += empty;
	quene->rear %= quene->size;

	return empty;
}
/**************************************************************
 * 函数名称：int cquene_buf_pop(cquene_t *quene, uint8_t *buf, uint32_t len)
 * 功能描述：数据从队列输出 
 * 输入参数：	uint8_t *buf：输出队列数据的缓存地址 
 				uint32_t len：输出长度 
 * 输出参数：	cquene_t *cquene：输出队列对象 
 * 返 回 值：返回输出数据的长度 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
int cquene_buf_pop(cquene_t *quene, uint8_t *buf, uint32_t len)
{
	uint32_t used, rear_used;

	used = (quene->rear - quene->head + quene->size) % quene->size;
	used = min(used, len);

	if (quene->head <= quene->rear)
	{
		memcpy(buf, &quene->fifo[quene->head], used);
	}
	else
	{
		rear_used = quene->size - quene->head;

		if (used <= rear_used)
		{
			memcpy(buf, &quene->fifo[quene->head], used);
		}
		else
		{
			memcpy(buf, &quene->fifo[quene->head], rear_used);
			memcpy(&buf[rear_used], quene->fifo, used - rear_used);
		}
	}
	quene->head += used;
	quene->head %= quene->size;

	return used;
}
/**************************************************************
 * 函数名称：int cquene_size_used(cquene_t *quene)
 * 功能描述：查看队列还剩多少 
 * 输入参数：	cquene_t *cquene：队列对象 
 * 输出参数：	无 
 * 返 回 值：	数列空间剩余量 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
int cquene_size_remain(cquene_t *quene)
{
	return((quene->head - quene->rear - 1 + quene->size)%quene->size);
}
/**************************************************************
 * 函数名称：int cquene_size_used(cquene_t *quene)
 * 功能描述：查看队列使用了多少 
 * 输入参数：	cquene_t *cquene：队列对象 
 * 输出参数：	无 
 * 返 回 值：	数列空间使用量 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
int cquene_size_used(cquene_t *quene)
{
	return((quene->rear - quene->head + quene->size)%quene->size);
}
/**************************************************************
 * 函数名称：int cquene_full_is(cquene_t *quene)
 * 功能描述：判断是否已经满了 
 * 输入参数：	cquene_t *cquene：队列对象 
 * 输出参数：	无 
 * 返 回 值：	0:没有满
 				1：满了 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
int cquene_full_is(cquene_t *quene)
{
	return((quene->rear+1)%quene->size == quene->head);
}
/**************************************************************
 * 函数名称：void cquene_flush(cquene_t *quene)
 * 功能描述：队列数据清空 
 * 输入参数：	cquene_t *cquene：队列对象 
 * 输出参数：	无 
 * 返 回 值：	无 
 * 其他说明：其他说明
 * 修改日期            修改人          修改内容 * 
-------------------------------------------------------------
* 2019/11/23	   		Low-sir               XXXX
************************************************************/
void cquene_flush(cquene_t *quene)
{
	quene->head = 0;
	quene->rear = 0;
	memset(quene->fifo, 0, quene->size);
}

