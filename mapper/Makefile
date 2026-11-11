# Error out if LEGION_DIR isn't defined.
ifndef LEGION_DIR
$(error LEGION_DIR variable is not defined, aborting build)
endif
INCLUDE_PATH=-I$(LEGION_DIR)/runtime -I$(LEGION_DIR)/bindings/regent -I$(CUDA)/include
CXXFLAGS=-std=c++14 -O2 -fPIC -shared # -Wall -Werror

objects=libdsl_mapper.so

.PHONY: clean

all: libdsl_mapper.so

clean:
	-rm $(objects)

libdsl_mapper.so: dsl_mapper.cc  dsl_mapper.h
	$(CXX) $(CXXFLAGS) $(INCLUDE_PATH) -o $@ $^
