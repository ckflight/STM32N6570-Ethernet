#include "app_threadx.h"
#include "app_netxduo.h"
#include <stdio.h>

#define APP_THREAD_STACK_SIZE 4096
#define APP_THREAD_PRIORITY 10
#define TCP_PORT 5000
#define TCP_BUFFER_SIZE 1536

static TX_THREAD EthernetEchoThread;

static VOID EthernetEchoThread_Entry(ULONG thread_input);

UCHAR tx_data[1400];

UINT App_ThreadX_Init(VOID *memory_ptr)
{
    UINT status;
    CHAR *stack;
    TX_BYTE_POOL *byte_pool = (TX_BYTE_POOL *)memory_ptr;

    status = tx_byte_allocate(byte_pool, (VOID **)&stack, APP_THREAD_STACK_SIZE, TX_NO_WAIT);
    if (status != TX_SUCCESS) return status;

    status = tx_thread_create(&EthernetEchoThread, "Echo Application", EthernetEchoThread_Entry, 0, stack, APP_THREAD_STACK_SIZE, APP_THREAD_PRIORITY, APP_THREAD_PRIORITY, TX_NO_TIME_SLICE, TX_AUTO_START);

    return status;
}

void MX_ThreadX_Init(void)
{
    tx_kernel_enter();
}

//// RX TX ECHO TEST
//static VOID EthernetEchoThread_Entry(ULONG thread_input)
//{
//    UINT status;
//    NX_PACKET *rx_packet;
//
//    (void)thread_input;
//
//    /* Fill TX test data once */
//    for (int i = 0; i < 1400; i++)
//    {
//        tx_data[i] = (UCHAR)i;
//    }
//
//    status = NetXDuo_DHCP_Wait();
//
//    if (status != NX_SUCCESS)
//        return;
//
//    status = NetXDuo_TCP_Server_Start(TCP_PORT);
//
//    if (status != NX_SUCCESS)
//        return;
//
//    while (1)
//    {
//        printf("Waiting TCP client...\r\n");
//
//        status = NetXDuo_TCP_Accept();
//
//        if (status != NX_SUCCESS)
//            continue;
//
//        printf("Client connected\r\n");
//
//        while (1)
//        {
//            /* RX */
//            status = NetXDuo_TCP_Receive_Packet(&rx_packet);
//
//            if (status == NX_SUCCESS)
//            {
//                nx_packet_release(rx_packet);
//            }
//
//            /* TX */
//            status = NetXDuo_TCP_Send(tx_data, 1400);
//
//            if (status != NX_SUCCESS)
//                break;
//        }
//
//        NetXDuo_TCP_Disconnect();
//    }
//}

// TX ONLY ZERO COPY
//static VOID EthernetEchoThread_Entry(ULONG thread_input)
//{
//    UINT status;
//    NX_PACKET *packet;
//    UCHAR *tx_ptr;
//    ULONG capacity;
//    ULONG send_length;
//
//    (void)thread_input;
//
//    status = NetXDuo_DHCP_Wait();
//
//    if (status != NX_SUCCESS)
//        return;
//
//    status = NetXDuo_TCP_Server_Start(TCP_PORT);
//
//    if (status != NX_SUCCESS)
//        return;
//
//    while (1)
//    {
//        printf("Waiting TCP client...\r\n");
//
//        status = NetXDuo_TCP_Accept();
//
//        if (status != NX_SUCCESS)
//            continue;
//
//        while (1)
//        {
//        	// Put NetX Ethernet packet's payload to tx_data,
//        	// so tx_data will point to the packet's payload.
//            status = NetXDuo_TCP_Get_TX_Buffer(&packet, &tx_ptr, &capacity);
//
//            if (status != NX_SUCCESS)
//                break;
//
//            send_length = 1400;
//
//            if (send_length > capacity)
//                send_length = capacity;
//
//            // Put send data to the payload since tx_ptr is pointing there
//            for (ULONG i = 0; i < send_length; i++)
//            {
//                tx_ptr[i] = (UCHAR)i;
//            }
//
//            // Send the data
//            status = NetXDuo_TCP_Send_ZeroCopy(packet, send_length);
//
//            if (status != NX_SUCCESS)
//            {
//                printf("TCP send error: 0x%02X\r\n", status);
//                break;
//            }
//        }
//
//        NetXDuo_TCP_Disconnect();
//    }
//}

//// TX ONLY TEST
static VOID EthernetEchoThread_Entry(ULONG thread_input)
{
    UINT status;

    (void)thread_input;

    status = NetXDuo_DHCP_Wait();
    if (status != NX_SUCCESS)
        return;

    status = NetXDuo_TCP_Server_Start(TCP_PORT);
    if (status != NX_SUCCESS)
        return;

    while (1)
    {
        printf("Waiting TCP client...\r\n");

        status = NetXDuo_TCP_Accept();

        if (status != NX_SUCCESS)
            continue;

        for (int i = 0; i < 1400; i++)
        {
            tx_data[i] = (UCHAR)i;
        }

        while (1)
        {

            status = NetXDuo_TCP_Send(tx_data, 1400);

            if (status != NX_SUCCESS)
            {
                printf("TCP send error: 0x%02X\r\n", status);
                break;
            }
        }

        NetXDuo_TCP_Disconnect();
    }
}

// RX ONLY TEST
//static VOID EthernetEchoThread_Entry(ULONG thread_input)
//{
//    UINT status;
//    NX_PACKET *packet;
//    ULONG total_received = 0;
//
//    (void)thread_input;
//
//    status = NetXDuo_DHCP_Wait();
//
//    if (status != NX_SUCCESS)
//    {
//        printf("DHCP error: 0x%02X\r\n", status);
//        return;
//    }
//
//    status = NetXDuo_TCP_Server_Start(TCP_PORT);
//
//    if (status != NX_SUCCESS)
//    {
//        printf("TCP server error: 0x%02X\r\n", status);
//        return;
//    }
//
//    while (1)
//    {
//        printf("Waiting TCP client...\r\n");
//
//        status = NetXDuo_TCP_Accept();
//
//        if (status != NX_SUCCESS)
//            continue;
//
//        total_received = 0;
//
//        while (1)
//        {
//            status = NetXDuo_TCP_Receive_Packet(&packet);
//
//            if (status != NX_SUCCESS)
//                break;
//
//            total_received += packet->nx_packet_length;
//
//            nx_packet_release(packet);
//        }
//
//        printf("Total RX: %lu bytes\r\n", total_received);
//
//        NetXDuo_TCP_Disconnect();
//    }
//}
