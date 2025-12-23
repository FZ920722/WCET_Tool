#ifndef CHAIN_H
#define CHAIN_H

#include <stdio.h>
typedef struct student
{
	int score;
	struct student *next;
} LinkList;

//创建n个节点的链表 
LinkList *creat(int n);
//修改链表的第n个节点
/*void change(LinkList *list,int n);*/

void delet(LinkList *list, int n);

void insert(LinkList *list, int n);

#endif 
