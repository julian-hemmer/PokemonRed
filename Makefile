##
## EPITECH PROJECT, 2025
## wolf3d
## File description:
## Makefile
##

TARGET := pokemon

# Libs
LIBS := -lsfml-graphics -lsfml-window -lsfml-system -lm

# Include
INCLUDE := $(shell find . -type f -name '*.hpp'\
					-printf '%h\n' |\
					sort -u |\
					awk '{print "-iquote",$$0}')

# Compilation Flags
CXX = g++
CXXFLAGS += -std=c++17 -Werror -Wall -Wextra	\
	-Wnull-dereference -Wduplicated-cond -Wlogical-op	\
	-Wshadow -Wfloat-equal -Wcast-align -Wunreachable-code	\
	-Wjump-misses-init -Wmissing-declarations -Wmissing-prototypes	\
	-Wundef

# Flags Criterion
CRITERION += --coverage -lgcov -g -lcriterion

SRC	= \
	src/main.cpp	\


OBJ		:= $(patsubst src/%.c, build/obj/%.o, $(SRC))
DIRS	:= $(sort $(dir $(OBJ)))

BUILT_OBJ =

# Makefile Rules:

all: $(TARGET)
	@printf "\e[38;5;029m✅ Everything is up to date !\e[0m\n"

# Compile source files to object files
build/obj/%.o: src/%.c | $(DIRS)
	@printf "\
	\e[38;5;008m[-Werror -Wall -Wextra ... -iquote ...]\e[0m \
	\e[38;5;117m$(notdir $<)\e[0m\
	\e[38;5;183m -> \e[0m\
	\e[38;5;220m$@\e[0m\n"
	@$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@
	$(eval BUILT_OBJ += $@)

# Create necessary directories
$(DIRS):
	@mkdir -p $@

$(TARGET): $(OBJ)
	@printf "\e[38;5;029m✅ Successfully compiled target object !\e[0m\n"
	@printf "\e[38;5;029m🔄 Compiling target !\e[0m\n"
	@printf "\e[38;5;029m📜 Name: \e[38;5;220m$(TARGET)\e[0m\n"
	@printf "\e[38;5;029m✅ Successfully compiled target !\e[0m\n"
	@mkdir -p build/bin/
	@$(CXX) -o build/bin/$(TARGET) $(OBJ) $(LIBS)
	@cp build/bin/$(TARGET) .

# Clean up generated objects
clean:
	@printf "\e[38;5;124m🔥 Remove build/obj directory !\e[0m\n"
	@rm -rf build/obj

# Clean up generated objects and binary
fclean:
	@printf "\e[38;5;124m🔥 Remove build directory !\e[0m\n"
	@rm -rf build
	@printf "\e[38;5;124m🔥 Remove binary and criterion file !\e[0m\n"
	@rm -rf $(TARGET) $(TEST_TARGET) $(TESTING_TARGET) *.gcda *.gcno

# ReCompile all file
re: fclean all

debug_message:
	@printf "\e[38;5;220m🔥 Debug mode !\e[0m\n"

debug: debug_message
debug: CFLAGS += -g
debug: all

redebug: debug_message
redebug: CFLAGS += -g
redebug: re

.PHONY: all re fclean clean debug redebug
