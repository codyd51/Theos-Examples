include theos/makefiles/common.mk

BUNDLE_NAME = RespringNotifier
RespringNotifier_FILES = RespringNotifier.mm
RespringNotifier_INSTALL_PATH = /Library/PreferenceBundles
RespringNotifier_FRAMEWORKS = UIKit
RespringNotifier_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RespringNotifier.plist$(ECHO_END)
