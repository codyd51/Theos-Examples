ARCHS = armv7s
include theos/makefiles/common.mk

TWEAK_NAME = UnlockChanger
UnlockChanger_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += unlockchanger
include $(THEOS_MAKE_PATH)/aggregate.mk
