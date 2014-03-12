ARCHS = armv7s
include theos/makefiles/common.mk

BUNDLE_NAME = UnlockChanger
UnlockChanger_FILES = UnlockChanger.mm
UnlockChanger_INSTALL_PATH = /Library/PreferenceBundles
UnlockChanger_FRAMEWORKS = UIKit
UnlockChanger_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/UnlockChanger.plist$(ECHO_END)
