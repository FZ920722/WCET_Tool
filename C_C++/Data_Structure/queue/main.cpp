/************************************************************
* Copyright (c) 20xx，
* All rights reserved.
* 
* 文件名称：cqueue.h
* 当前版本：2.0
* 内容摘要：简要描述本文件的内容
* 其他说明：
*
* 作    者：输入作者（或修改者）名字
* 完成版本：1.0
* 完成日期：20xx-xx-xx
*
************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "cquene.h"
int main()
{
	uint8_t i = 0;
	uint32_t len = 0; 
	uint8_t byte = 0;
	uint32_t cquene_size = 10;
	cquene_t test;
	uint8_t *buff = (uint8_t *)malloc(sizeof(uint8_t) *cquene_size);
	uint8_t *test_buff = (uint8_t *)malloc(sizeof(uint8_t) *cquene_size);
	/*1.创建队列*/ 
	cquene_crete(&test, buff, cquene_size+1);//需要加一位 
	cquene_flush(&test);
	/*2.队列按位输入*/ 
	for(i=0;i<cquene_size;i++) 
	{
		if(cquene_byte_push(&test, i) == 1)
		{
			printf("%d输入正确\n",i);
		}
		else
		{
			printf("%d输入错误\n",i);
		}
	}
	/*3.队列按位输出*/ 
	for(i=0;i<cquene_size;i++) 
	{
		if(cquene_byte_pop(&test, byte) == 1)
		{
			printf("%d输出正确\n",byte);
		}
		else
		{
			printf("%d输入错误\n",byte);
		}
	}  
	/*4.队列整体输入*/ 
	len =  cquene_size;
	for(i=0;i<cquene_size;i++) 
	{
		test_buff[i] = i;	
	} 
	if(len == cquene_buf_push(&test, test_buff, len))
	{
		printf("输入%d个数据正确\n", len);
	}
	else
	{
		printf("输入%d个数据错误\n", len);
	}
	/*4.1.判断队列是否满了*/ 
	if (1 == cquene_full_is(&test))
	{
		printf("队列已经满了\n");
	}
	else
	{
		printf("队列未满\n");
	}
	/*5.队列整体输出*/ 
	memset(test_buff, 0, cquene_size);
	if(len == cquene_buf_pop(&test, test_buff, len))
	{
		printf("输出%d个数据正确\n", len);
	}
	else
	{
		printf("输出%d个数据错误\n", len);
	}
	/*5.1.判断队列是否满了*/ 
	if (1 == cquene_full_is(&test))
	{
		printf("队列已经满了\n");
	}
	else
	{
		printf("队列未满\n");
	}	
	/*6.队列剩余量*/ 
	printf("队列剩余%d\n",cquene_size_remain(&test));
	/*7.队列使用量*/ 
	printf("队列使用%d\n",cquene_size_used(&test));
	/*8.队列归零*/ 
	//cquene_flush(&test);
	return 0; 
}
