import socket
import time
import numpy as np

STM32_IP = "10.42.0.158"
PORT = 5000

# 1000 Mb test data
CHUNK_SIZE = 64 * 1024
CHUNK_COUNT = 256

tx_data = np.random.randint(0, 256, CHUNK_SIZE, dtype = np.uint8).tobytes()

socket = socket.socket(socket.AF_INET, socket. SOCK_STREAM)

socket.connect((STM32_IP, PORT))

start_time = time.perf_counter()

print(f"{len(tx_data)} byte is sent")

for i in range(CHUNK_COUNT):

    socket.sendall(tx_data)

    rx_echo_data = bytearray()

    while len(rx_echo_data) < len(tx_data):
        chunk = socket.recv(len(tx_data) - len(rx_echo_data))

        if not chunk:
            break

        rx_echo_data.extend(chunk)

        print("RX:", len(rx_echo_data), "/", len(tx_data))

    if tx_data != rx_echo_data:
        print("Data error at chunk:", i)
        break

end_time = time.perf_counter()

socket.close()

total_time = end_time - start_time

total_tx_size = CHUNK_COUNT * CHUNK_SIZE
total_rx_size = total_tx_size
throughput_bytespersec = (total_rx_size + total_tx_size) / total_time 
throughput_megabytes = throughput_bytespersec / 1000000

print("Throuhgput: ", throughput_megabytes, "MB/sec")