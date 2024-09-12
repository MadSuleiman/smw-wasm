TARGET_EXEC:=smw.html

SRCS:=$(wildcard smb1/*.c smbll/*.c src/*.c src/snes/*.c) third_party/gl_core/gl_core_3_1.c
OBJS:=$(SRCS:%.c=%.o)

PYTHON:=/usr/bin/env python3
CFLAGS:=$(if $(CFLAGS),$(CFLAGS),-O2 -fno-strict-aliasing -Werror )
CFLAGS:=${CFLAGS} -DSYSTEM_VOLUME_MIXER_AVAILABLE=0 -I. -sUSE_SDL=2

ifeq (${OS},Windows_NT)
    WINDRES:=windres
#    RES:=sm.res
    SDLFLAGS:=-Wl,-Bstatic $(shell sdl2-config --static-libs)
else
    SDLFLAGS:=$(shell sdl2-config --libs) -lm
endif

.PHONY: all clean clean_obj

all: smw_assets.dat $(TARGET_EXEC)
$(TARGET_EXEC): $(OBJS) $(RES)
	$(CC) $^ -o $@ $(LDFLAGS) $(SDLFLAGS) -sALLOW_MEMORY_GROWTH=1 -sWASM=1 -sINVOKE_RUN=0 -sENVIRONMENT=web -sEXPORTED_RUNTIME_METHODS="['FS','ccall','cwrap']" -sFILESYSTEM=1 -sFORCE_FILESYSTEM=1 -lidbfs.js --embed-file smw.ini --embed-file smw_assets.dat --shell-file shell.html

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

#$(RES): src/platform/win32/smw.rc
#	@echo "Generating Windows resources"
#	@$(WINDRES) $< -O coff -o $@

smw_assets.dat:
	@echo "Extracting game resources"
	$(PYTHON) assets/restool.py

clean: clean_obj clean_gen
clean_obj:
	@$(RM) $(OBJS) $(TARGET_EXEC)
clean_gen:
	@$(RM) $(RES) smw_assets.dat
	@rm -rf assets/__pycache__
