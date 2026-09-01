################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/ck/Desktop/Workspace/STM32CubeIDE\ Workspace/STM32N6570-Ethernet/Middlewares/ST/netxduo/addons/web/nx_tcpserver.c \
/home/ck/Desktop/Workspace/STM32CubeIDE\ Workspace/STM32N6570-Ethernet/Middlewares/ST/netxduo/addons/web/nx_web_http_server.c 

OBJS += \
./Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.o \
./Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.o 

C_DEPS += \
./Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.d \
./Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.o: /home/ck/Desktop/Workspace/STM32CubeIDE\ Workspace/STM32N6570-Ethernet/Middlewares/ST/netxduo/addons/web/nx_tcpserver.c Middlewares/netxduo/Addons\ Web\ Server/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DRTL8211_INIT_TO=10000 -DETH_PHY_1000MBITS_SUPPORTED -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -DFX_INCLUDE_USER_DEFINE_FILE -DNX_INCLUDE_USER_DEFINE_FILE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -c -I../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../Drivers/BSP/Components/rtl8211 -I../../../Middlewares/ST/netxduo/tsn/inc -I../../../Middlewares/ST/netxduo/addons/dhcp -I../../../Middlewares/ST/netxduo/addons/web -I../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../Middlewares/ST/threadx/common/inc -I../../../Middlewares/ST/filex/common/inc -I../../../Middlewares/ST/filex/ports/generic/inc -I../../../Middlewares/ST/netxduo/common/inc -I../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../Drivers/CMSIS/Include -I../../../FSBL/FileX/App -I../../../FSBL/FileX/Target -I../../../FSBL/NetXDuo/App -I../../../FSBL/NetXDuo/Target -I../../../FSBL/Core/Inc -I../../../FSBL/AZURE_RTOS/App -O2 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"Middlewares/netxduo/Addons Web Server/nx_tcpserver.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.o: /home/ck/Desktop/Workspace/STM32CubeIDE\ Workspace/STM32N6570-Ethernet/Middlewares/ST/netxduo/addons/web/nx_web_http_server.c Middlewares/netxduo/Addons\ Web\ Server/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DRTL8211_INIT_TO=10000 -DETH_PHY_1000MBITS_SUPPORTED -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -DFX_INCLUDE_USER_DEFINE_FILE -DNX_INCLUDE_USER_DEFINE_FILE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -c -I../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../Drivers/BSP/Components/rtl8211 -I../../../Middlewares/ST/netxduo/tsn/inc -I../../../Middlewares/ST/netxduo/addons/dhcp -I../../../Middlewares/ST/netxduo/addons/web -I../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../Middlewares/ST/threadx/common/inc -I../../../Middlewares/ST/filex/common/inc -I../../../Middlewares/ST/filex/ports/generic/inc -I../../../Middlewares/ST/netxduo/common/inc -I../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../Drivers/CMSIS/Include -I../../../FSBL/FileX/App -I../../../FSBL/FileX/Target -I../../../FSBL/NetXDuo/App -I../../../FSBL/NetXDuo/Target -I../../../FSBL/Core/Inc -I../../../FSBL/AZURE_RTOS/App -O2 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"Middlewares/netxduo/Addons Web Server/nx_web_http_server.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-netxduo-2f-Addons-20-Web-20-Server

clean-Middlewares-2f-netxduo-2f-Addons-20-Web-20-Server:
	-$(RM) ./Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.cyclo ./Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.d ./Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.o ./Middlewares/netxduo/Addons\ Web\ Server/nx_tcpserver.su ./Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.cyclo ./Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.d ./Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.o ./Middlewares/netxduo/Addons\ Web\ Server/nx_web_http_server.su

.PHONY: clean-Middlewares-2f-netxduo-2f-Addons-20-Web-20-Server

