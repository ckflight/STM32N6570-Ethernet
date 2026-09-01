# STM32N6570-DK ThreadX NetX Duo Ethernet

TCP Ethernet test project for the **STM32N6570-DK** using **Azure RTOS ThreadX** and **NetX Duo**.

## Features

* ThreadX RTOS
* NetX Duo TCP/IP stack
* Ethernet over RGMII
* DHCP client
* TCP server on port `5000`
* TCP TX/RX throughput testing
* Zero-copy TCP transmission
* Packet-based TCP reception
* Separate memory pools for ThreadX, NetX Duo and FileX
* UART debug output at `115200 baud`

## Architecture

```text
PC
 │
 │ TCP/IP
 ▼
Ethernet PHY
 │ RGMII
 ▼
STM32N6570
 │
 ├── NetX Duo
 │    ├── DHCP
 │    └── TCP Server :5000
 │
 └── ThreadX
      └── Ethernet Test Thread
```

## Test Modes

**TX Test**

```text
STM32 → TCP → PC
```

Uses `NetXDuo_TCP_Send_ZeroCopy()` with up to **1460-byte TCP payloads**.

**RX Test**

```text
PC → TCP → STM32
```

Uses NetX Duo packet reception and releases each packet back to the packet pool after processing.

## Clock Configuration

```text
CPU    : 800 MHz
SYSCLK : 400 MHz
HCLK   : 200 MHz
PCLK   : 200 MHz
```

The project provides a minimal base for testing **STM32N6570 Ethernet, NetX Duo TCP communication and network throughput**.
