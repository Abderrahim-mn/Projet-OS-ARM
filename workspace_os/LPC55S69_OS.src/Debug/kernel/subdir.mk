################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/kernel.c \
../kernel/list.c 

C_DEPS += \
./kernel/kernel.d \
./kernel/list.d 

OBJS += \
./kernel/kernel.o \
./kernel/list.o 


# Each subdirectory must supply rules for building sources it contributes
kernel/%.o: ../kernel/%.c kernel/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\LPC55S69\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\utilities" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\uart" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\serial_manager" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\lists" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\CMSIS" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\device" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\board" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\source" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\LPC55S69\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\utilities" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\uart" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\serial_manager" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\lists" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\startup" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\CMSIS" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\device" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-kernel

clean-kernel:
	-$(RM) ./kernel/kernel.d ./kernel/kernel.o ./kernel/list.d ./kernel/list.o

.PHONY: clean-kernel

