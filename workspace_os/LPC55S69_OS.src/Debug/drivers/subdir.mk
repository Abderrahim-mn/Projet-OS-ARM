################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_flexcomm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_i2c.c \
../drivers/fsl_inputmux.c \
../drivers/fsl_pint.c \
../drivers/fsl_reset.c \
../drivers/fsl_usart.c 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_flexcomm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_i2c.d \
./drivers/fsl_inputmux.d \
./drivers/fsl_pint.d \
./drivers/fsl_reset.d \
./drivers/fsl_usart.d 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_flexcomm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_i2c.o \
./drivers/fsl_inputmux.o \
./drivers/fsl_pint.o \
./drivers/fsl_reset.o \
./drivers/fsl_usart.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\LPC55S69\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\utilities" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\uart" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\serial_manager" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\lists" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\CMSIS" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\device" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\board" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\source" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\LPC55S69\drivers" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\utilities" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\uart" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\serial_manager" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\component\lists" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\startup" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\CMSIS" -I"C:\Users\mouno\Documents\MCUXpressoIDE_11.10.0_3148\workspace_os\LPC55S69_OS.src\device" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers

clean-drivers:
	-$(RM) ./drivers/fsl_clock.d ./drivers/fsl_clock.o ./drivers/fsl_common.d ./drivers/fsl_common.o ./drivers/fsl_flexcomm.d ./drivers/fsl_flexcomm.o ./drivers/fsl_gpio.d ./drivers/fsl_gpio.o ./drivers/fsl_i2c.d ./drivers/fsl_i2c.o ./drivers/fsl_inputmux.d ./drivers/fsl_inputmux.o ./drivers/fsl_pint.d ./drivers/fsl_pint.o ./drivers/fsl_reset.d ./drivers/fsl_reset.o ./drivers/fsl_usart.d ./drivers/fsl_usart.o

.PHONY: clean-drivers

