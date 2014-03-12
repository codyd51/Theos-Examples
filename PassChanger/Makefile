ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk

TWEAK_NAME = passChanger
passChanger_FILES = Tweak.xm
passChanger_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
