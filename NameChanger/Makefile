ARCHS = armv7
include theos/makefiles/common.mk

TWEAK_NAME = nameChanger
nameChanger_FILES = Tweak.xm
nameChanger_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += passcodechecker
include $(THEOS_MAKE_PATH)/aggregate.mk
