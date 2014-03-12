ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk

TWEAK_NAME = UnlockChanger
UnlockChanger_FILES = Tweak.xm
UnlockChanger_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += unlockchanger
include $(THEOS_MAKE_PATH)/aggregate.mk
