ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk
TWEAK_NAME = CallNow
CallNow_FILES = Listener.xm
CallNow_LDFLAGS = -lactivator
CallNow_FRAMEWORKS = UIKit
CallNow_PRIVATE_FRAMEWORKS = Preferences
after-install::
	install.exec "killall -9 SpringBoard"
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += callnow
include $(THEOS_MAKE_PATH)/aggregate.mk
