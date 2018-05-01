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

$(call inherit-product, device/razer/pearlyn/full_pearlyn.mk)

# Inherit common CM TV device.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

PRODUCT_DEVICE := pearlyn
PRODUCT_NAME := lineage_pearlyn
PRODUCT_MODEL := Forge
TARGET_VENDOR := razer

# SH LANGUAGE SET
PRODUCT_DEFAULT_LANGUAGE := en
PRODUCT_DEFAULT_REGION := US

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=pearlyn \
    BUILD_FINGERPRINT=razer/pearlyn/pearlyn:6.0.1/M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM/144:user/release-keys \
    PRIVATE_BUILD_DESC="pearlyn-user 6.0.1 M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM 144 release-keys"

PRODUCT_LOCALES := en_US ko_KR en_GB en_CA en_AU en_NZ en_SG zh_CN zh_TW ja_JP fr_FR fr_BE fr_CA fr_CH it_IT it_CH es_ES es_US de_DE de_AT de_CH de_LI nl_NL nl_BE cs_CZ pl_PL ru_RU pt_PT # vi_VN
