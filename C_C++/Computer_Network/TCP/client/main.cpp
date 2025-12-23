#pragma comment(lib,"ws2_32.lib")

#include <Winsock2.h>
#include <stdio.h>
#include <stdlib.h>

#define DATA_BUFFER 1024 //默认缓冲区大小

int main(int argc, char * argv[])
{
    WSADATA wsaData;
    SOCKET sClient;
    int iPort = 5050;
    int iLen; //从服务器端接收的数据长度
    char buf[DATA_BUFFER]; //接收缓冲区
    struct sockaddr_in ser; //服务器端地址
    if(argc<2) //判断参数输入是否正确：client [Server IP]
    {
        printf("Usage: client [server IP address]\n"); //命令行提示
        return -1;
    }
    memset(buf,0,sizeof(buf)); //初始化接收缓冲区
    if(WSAStartup(MAKEWORD(2,2),&wsaData)!=0)
    {
        printf("Failed to load Winsock.\n"); //Winsock 初始化错误
        return -1;
    }
    ser.sin_family = AF_INET; //初始化服务器地址信息
    ser.sin_port = htons(iPort); //端口转换为网络字节序
    ser.sin_addr.s_addr = inet_addr(argv[1]); //IP 地址转换为网络字节序
    sClient = socket(AF_INET,SOCK_STREAM,0); //创建客户端流式套接字
    if(sClient == INVALID_SOCKET)
    {
        printf("socket() Failed: %d\n",WSAGetLastError());
        return -1;
    }
        //请求与服务器端建立 TCP 连接
    if (connect(sClient, (struct sockaddr *)&ser, sizeof(ser)) == INVALID_SOCKET)
    {
        printf("connect() Failed: %d\n",WSAGetLastError());
        return -1;
    }
    else
    {
        iLen = recv(sClient,buf,sizeof(buf),0); //从服务器端接收数据
        if(iLen == 0)
        { 
            return -1;
        } 
        else if(iLen == SOCKET_ERROR)
        {
            printf("recv() Failed: %d\n",WSAGetLastError());
            return -1;
        }
        else
        {
            printf("recv() data from server: %s\n",buf); // 输出接收数据
        }
    }
    closesocket(sClient); //关闭 socket
    WSACleanup();
    return 0;
}
