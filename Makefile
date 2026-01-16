# Else exist specifically for clang
ifeq ($(CXX),g++)
    EXTRA_FLAGS = --no-gnu-unique
else
    EXTRA_FLAGS =
endif

CXXFLAGS ?= -O2
CXXFLAGS += -shared -fPIC -std=c++2b -Wno-narrowing

SRC=src/ExpoGesture.cpp src/main.cpp src/overview.cpp src/OverviewPassElement.cpp
LIBS=`pkg-config --cflags pixman-1 libdrm hyprland pangocairo libinput libudev wayland-server xkbcommon`

all:
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_FLAGS) ${SRC} -o hyprexpo2.so ${LIBS}
clean:
	rm ./hyprexpo2.so
