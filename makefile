config = debug
system = linux
target = application

all: build/$(system)/rules.ninja
	@cmake --build build/$(system) --config $(config)

run: build/$(system)/rules.ninja
	@cmake --build build/$(system) --config $(config)
	@cmake -E chdir build/$(system) $(config)/$(target)

clean:
	@cmake -E remove_directory build/$(system)

build/windows/rules.ninja: CMakeLists.txt
	@cmake -G "Ninja Multi-Config" \
	  -DCMAKE_CONFIGURATION_TYPES="Debug;Release" \
	  -DCMAKE_INSTALL_PREFIX="$(MAKEDIR)\build\install" \
	  -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE="release" \
	  -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG="debug" \
	  -B build/windows

build/linux/rules.ninja: CMakeLists.txt
	@cmake -G "Ninja Multi-Config" \
	  -DCMAKE_CONFIGURATION_TYPES="Debug;Release" \
	  -DCMAKE_INSTALL_PREFIX="$(CURDIR)/build/install" \
	  -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE="release" \
	  -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG="debug" \
	  -B build/linux
