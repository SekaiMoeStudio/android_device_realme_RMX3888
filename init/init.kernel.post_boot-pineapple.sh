#=============================================================================
# Copyright (c) 2023 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#=============================================================================

#because the next action to execute the init.kernel.post_boo-pineapple_xxxx.sh maybe failed,so we
#set the correct sleep mode here
echo s2idle > /sys/power/mem_sleep

# Run default post boot configuration
/vendor/bin/sh /vendor/bin/init.kernel.post_boot-pineapple_default_2_3_2_1.sh 
#config fg and top cpu shares
echo 5120 > /dev/cpuctl/top-app/cpu.shares
echo 4096 > /dev/cpuctl/foreground/cpu.shares

#config sstop and ssfg cpu shares
echo 5120 > /dev/cpuctl/sstop/cpu.shares
echo 4096 > /dev/cpuctl/ssfg/cpu.shares
#config general cpu shares
echo 2048 > /dev/cpuctl/general/cpu.shares
