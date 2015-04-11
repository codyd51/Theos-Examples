ARCHS=armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = RespringNotifier
RespringNotifier_FILES = Tweak.xm
RespringNotifier_FRAMEWORKS = UIKit
RespringNotifier_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += respringnotifier
include $(THEOS_MAKE_PATH)/aggregate.mk
