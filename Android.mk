#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := TrichromeLibrary
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MULTILIB := both

LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/TrichromeLibrary.apk

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := TrichromeWebView
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MULTILIB := both
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support \
        TrichromeLibrary
LOCAL_OVERRIDES_PACKAGES := webview

LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/TrichromeWebView.apk

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := TrichromeChrome
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MULTILIB := both
LOCAL_REQUIRED_MODULES := \
        TrichromeLibrary
LOCAL_OVERRIDES_PACKAGES := Jelly

LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/TrichromeChrome.apk

include $(BUILD_PREBUILT)
