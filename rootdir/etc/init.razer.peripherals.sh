#!/system/bin/sh
# Copyright (c) 2014, Razer USA Inc
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

LOG_TAG="razer-init"
LOG_NAME="${0}:"

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

logi "sww: determine usb mode"
if [ -f /proc/usb ] && [ -f /proc/usb_device ]; then
    val=`cat /proc/usb`
    state=`getprop persist.sys.rzr.device_mode`
    if [ "a$val" == "adev" ] || [ "a$val" == "aDEV" ]; then
        echo 0 > /proc/usb_device
        setprop persist.sys.rzr.device_mode 0
        logi "override usb should be in device mode"
    elif [ "a$val" == "ahst" ] || [ "a$val" == "aHST" ]; then
        echo 1 > /proc/usb_device
        setprop persist.sys.rzr.device_mode 1
        logi "override usb should be in host mode"
    else
        logi "usb should be in default mode"
        if [ "$state" == "0" ]; then
            echo 0 > /proc/usb_device
        elif [ "$state" == "1" ]; then
            echo 1 > /proc/usb_device
        else
            echo 1 > /proc/usb_device
            setprop persist.sys.rzr.device_mode 1
        fi
    fi
fi
