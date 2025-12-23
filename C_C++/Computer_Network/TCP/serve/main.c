#pragma comment(lib,"ws2_32.lib")

#include <Winsock2.h>
#include <stdio.h>
#include <stdlib.h>

#define DEFAULT_PORT 5050 //服务端默认端口

int main(int argc, char* argv[])
{
    int iPort = DEFAULT_PORT;             //服务端默认端口
    WSADATA wsaData;
    SOCKET sListen,sAccept;
    int iLen;                             //客户机地址长度
    
    int iSend;                            //发送数据长度
    char buf[] = "I am a server";         //要发送给客户的信息
    struct sockaddr_in ser,cli;           //服务器和客户的地址
    
    if(WSAStartup(MAKEWORD(2,2),&wsaData)!=0)
    {
        printf("Failed to load Winsock.\n"); //Winsock 初始化错误
         return -1;
    }
    
    sListen = socket(AF_INET,SOCK_STREAM,0); //创建服务器端套接字
    if(sListen == INVALID_SOCKET)
    {
        printf("socket() Failed: %d\n",WSAGetLastError());
        return -1;
    }
    //以下初始化服务器端地址
    ser.sin_family = AF_INET; //使用 IP 地址族
    ser.sin_port = htons(iPort); //主机序端口号转换为网络字节序端口号
    ser.sin_addr.s_addr = htonl(INADDR_ANY); //主机序 IP 地址转换为网络字节序主机地址
    //使用系统指定的 IP 地址 INADDR_ANY
    if(bind(sListen,(LPSOCKADDR)&ser,sizeof(ser)) == SOCKET_ERROR) //套接定与地址的绑定
    {
        printf("bind() Failed: %d\n",WSAGetLastError());
        return -1;
    }
    if(listen(sListen,5) == SOCKET_ERROR) //进入监听状态
    {
        printf("lisiten() Failed: %d\n",WSAGetLastError());
        return -1;
    }
    iLen = sizeof(cli); //初始化客户端地址长度参数
    while(1) //进入循环等待客户的连接请求
    {
        sAccept = accept(sListen,(struct sockaddr *)&cli,&iLen);
        if(sAccept == INVALID_SOCKET){  printf("accept() Failed: %d\n",WSAGetLastError()); return -1;}
        printf("Accepted client IP:[%s],port:[%d]\n",inet_ntoa(cli.sin_addr),ntohs(cli.sin_port));
        //输出客户端 IP 地址和端口号
        iSend = send(sAccept,buf,sizeof(buf),0); //给客户端发送信息
        if(iSend == SOCKET_ERROR)   {   printf("send() Failed: %d\n", WSAGetLastError()); /*错误处理*/break;}
        else if(iSend == 0)         {   break;      }
        else                        {   printf("send() byte: %d\n",iSend); /*输出发送成功字节数*/  }
        closesocket(sAccept);
    }
    closesocket(sListen); //关闭 socket
    WSACleanup(); //输出发送成功字节数
    return 0;
}
