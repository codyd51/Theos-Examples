ARCHS = armv7s
include theos/makefiles/common.mk

BUNDLE_NAME = CallNow
CallNow_FILES = CallNow.mm
CallNow_INSTALL_PATH = /Library/PreferenceBundles
CallNow_FRAMEWORKS = UIKit
CallNow_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CallNow.plist$(ECHO_END)
