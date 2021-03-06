LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := CMActions

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-v7-recyclerview \
    android-support-v13 \
    android-support-v17-leanback
    
LOCAL_RESOURCE_DIR := \
    $(TOP)/frameworks/support/v17/leanback/res \
    $(LOCAL_PATH)/res    
    
LOCAL_AAPT_FLAGS := --auto-add-overlay --extra-packages android.support.v17.leanback    

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_PRIVILEGED_MODULE := true

LOCAL_CERTIFICATE := platform

include $(BUILD_PACKAGE)

