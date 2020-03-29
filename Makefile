
#MAKEFLAGS += --no-builtin-rules

CC := gcc
CFLAGS += -g -Wall -Wextra
#CFLAGS += $(shell pkg-config --cflags gstreamer-1.0 gstreamer-base-1.0)
#LDFLAGS += -v $(shell pkg-config --libs gstreamer-1.0)
CFLAGS += $(shell pkg-config --cflags gstreamer-1.0)
LDFLAGS += $(shell pkg-config --libs gstreamer-1.0)


basic-tutorial-1_TARGET := basic-tutorial-1
basic-tutorial-2_TARGET := basic-tutorial-2
basic-tutorial-3_TARGET := basic-tutorial-3
basic-tutorial-4_TARGET := basic-tutorial-4

basic-tutorial-1_OBJS := $(addsuffix .o, $(basic-tutorial-1_TARGET))
basic-tutorial-2_OBJS := $(addsuffix .o, $(basic-tutorial-2_TARGET))
basic-tutorial-3_OBJS := $(addsuffix .o, $(basic-tutorial-3_TARGET))
basic-tutorial-4_OBJS := $(addsuffix .o, $(basic-tutorial-4_TARGET))

ALL_TARGET  = $(basic-tutorial-1_TARGET)
ALL_TARGET += $(basic-tutorial-2_TARGET) 
ALL_TARGET += $(basic-tutorial-3_TARGET) 
ALL_TARGET += $(basic-tutorial-4_TARGET) 

define do-link
$(CC) -o $@ $^ $(LDFLAGS) 
endef

.PHONY : all clean

all : $(ALL_TARGET)

$(basic-tutorial-1_TARGET) : $(basic-tutorial-1_OBJS)
	$(call do-link, $@, $^)
$(basic-tutorial-2_TARGET) : $(basic-tutorial-2_OBJS)
	$(call do-link, $@, $^)
$(basic-tutorial-3_TARGET) : $(basic-tutorial-3_OBJS)
	$(call do-link, $@, $^)
$(basic-tutorial-4_TARGET) : $(basic-tutorial-4_OBJS)
	$(call do-link, $@, $^)

clean :
	rm -f *~ *.o  $(ALL_TARGET)
