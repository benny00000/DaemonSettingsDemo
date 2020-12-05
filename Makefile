TARGET := iphone:clang:latest:7.0
THEOS_DEVICE_IP = 192.168.0.101
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TOOL_NAME = mylogd

mylogd_FILES = main.m
mylogd_CFLAGS = -fobjc-arc
mylogd_CODESIGN_FLAGS = -Sentitlements.plist
mylogd_INSTALL_PATH = /usr/bin

include $(THEOS_MAKE_PATH)/tool.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DaemonSettings$(ECHO_END)
	$(ECHO_NOTHING)cp -r $(wildcard DaemonSettings/*.plist) $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences $(ECHO_END)
	$(ECHO_NOTHING)cp -r $(wildcard DaemonSettings/*.ico) $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences $(ECHO_END)