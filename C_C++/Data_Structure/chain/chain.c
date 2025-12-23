#include <stdio.h>
#include <stdlib.h>

typedef struct __RT_DESCRIPTION
{
  unsigned short BlockStatusWord;
  unsigned short TimeTag;
  unsigned short DataStackPointer;
  unsigned short CommandWord;
}RT_DESCRITION,*pRT_DESCRITION;

typedef struct student
{
	int score;
	struct student *next;
} LinkList; 

typedef struct RT_DESCRIPTION{
  unsigned short BlockStatusWord;
  unsigned short TimeTag;
  unsigned short DataStackPointer;
  unsigned short CommandWord;
};//RT_DESCRITION,*pRT_DESCRITION;

LinkList *creat()
{
	LinkList 	*head,		//定义头节点; 
				*node, 		//普通节点;
				*end;		//尾部节点；
	head = (LinkList*)malloc(sizeof(LinkList));//分配地址
	end = head;         //若是空链表则头尾节点一样
	end->next = NULL;//结束创建
	return head;
}
void delet(LinkList *list) {
	LinkList *t = list, *in;
	int i = 0;
	while (t != NULL) {
		in = t;
		t = t->next;
		if (t != NULL) {
			in->next = t->next;
			free(t);
		}
		else {	
			break;	
		}
	}
}
void insert(LinkList *list, RT_DESCRITION data) {
	LinkList *t = list, *in;
	int i = 0; 
	while (t->next != NULL) {
		t = t->next;
		i++;
	}
	if (t != NULL) {
		in = (LinkList*)malloc(sizeof(LinkList));
		puts("输入要插入的值");
		scanf("%d", &in->score);
		in->next = t->next;		//填充in节点的指针域，也就是说把in的指针域指向t的下一个节点
		t->next = in;			//填充t节点的指针域，把t的指针域重新指向in
	}
	else {	puts("节点不存在");
	}
}

/* 
//创建n个节点的链表 
LinkList *creat(int n)
{
	if(n<1)
	{	n=1;	}
	LinkList *head, *node, *end;//定义头节点，普通节点，尾部节点；
	head = (LinkList*)malloc(sizeof(LinkList));//分配地址
	end = head;         //若是空链表则头尾节点一样
	for (int i = 0; i < n; i++) 
	{
		node = (LinkList*)malloc(sizeof(LinkList));
		scanf("%d", &node->score);
		end->next = node;
		end = node;
	}
	end->next = NULL;//结束创建
	return head;
}


int detect_chain_num(LinkList *list)
{
	LinkList *t = list;
	unsigned int chain_num = 0;
	while (t->next != NULL) 
	{
		t = t->next;
		chain_num++;
	}
	return chain_num;
}

//从头开始删除知道结尾 
void delet_all(LinkList *list) 
{
	LinkList *t = list, *in;
	int i = 0;
	unsigned int chain_num = detect_chain_num(t);
	in = t;
	while (i < chain_num && t != NULL) {
		t = t->next;
	}
	if (t != NULL) {
		in->next = t->next;
	}
	else {
		in->next = NULL;
	}
	free(t);
}

void insert(LinkList *list, int data) {
	LinkList *t = list, *in;
	int i = 0;
	unsigned n = detect_chain_num(t);
	while (i < n && t != NULL) {
		t = t->next;
		i++;
	}
	if (t != NULL) {
		in = (LinkList*)malloc(sizeof(LinkList));
		in->score = data;
		in->next = NULL;//填充in节点的指针域，也就是说把in的指针域指向t的下一个节点
		t->next = in;//填充t节点的指针域，把t的指针域重新指向in
	}
	else {
		puts("节点不存在");
	}
}
//返回链表数量 
int print_chain(LinkList *list)
{
	LinkList *t = list, *h;
	unsigned int chain_num = 0;
	while (t->next != NULL) 
	{
		h = t;
		t = t->next;
		printf("%d 123\n ", t->score);
		chain_num++;
	}
	return chain_num;
}

int main()
{
	while(1)
	{
		LinkList *sit = creat(10);
		delet_all(sit);
		int ic = print_chain(sit);
		printf ("print %d\n",ic);
		ic = detect_chain_num(sit);
		printf ("dete %d\n",ic);
		for(int i=0;i<10;i++)
		{
			insert(sit, i);
		}
		ic = print_chain(sit);
		printf ("print %d\n",ic);
	}
	return 0; 
}*/
/*
void insert(LinkList *list, int n) {
	LinkList *t = list, *in;
	int i = 0;
	while (i < n && t != NULL) {
		t = t->next;
		i++;
	}
	if (t != NULL) {
		in = (LinkList*)malloc(sizeof(LinkList));
		puts("输入要插入的值");
		scanf("%d", &in->score);
		in->next = t->next;//填充in节点的指针域，也就是说把in的指针域指向t的下一个节点
		t->next = in;//填充t节点的指针域，把t的指针域重新指向in
	}
	else {
		puts("节点不存在");
	}
}*/

//修改链表的第n个节点
/*void change(LinkList *list,int n) 
{	
	LinkList *t = list;
	int i = 0;
	while (i < n && t != NULL) {
		t = t->next;
		i++;
	}
	if (t != NULL) {
		puts("输入要修改的值");
		scanf("%d", &t->score);
	}
	else {
		puts("节点不存在");
	}
}*/
/*
void delet(LinkList *list, int n) {
	LinkList *t = list, *in;
	int i = 0;
	while (i < n && t != NULL) {
		in = t;
		t = t->next;
		i++;
	}
	if (t != NULL) {
		in->next = t->next;
		free(t);
	}
	else {
		puts("节点不存在");
	}
}
void delet(LinkList *list, int bit_n, int num_n) 
{
	LinkList *t = list, *in;
	int i = 0;
	in = t;
	while (i < bit_n && t != NULL) {
		in = t;
		t = t->next;
		i++;
	}
	i=0;
	while (i < (num_n-1) && t != NULL) {
		t = t->next;
		i++;
	}
	if (t != NULL) {
		in->next = t->next;
		free(t);
	}
	else {
		puts("节点不存在");
	}
}*/
