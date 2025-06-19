COL = Colleen/Colleen
GRC = Grace/Grace
SUL = Sully/Sully

COL_FILE = $(COL:=.c)
GRC_FILE = $(GRC:=.c)
SUL_FILE = $(SUL:=.c)

NAMES = $(COL) $(GRC) $(SUL)
OBJS = $(NAMES:=.o)

GCC = gcc -Wall -Wextra -Werror
RM = rm -rf

GREEN = "\033[1;32m"
CYAN = "\033[1;36m"
NO_COLOR = "\033[0m"

all: $(NAMES)

Colleen: $(COL)

Grace: $(GRC)

Sully: $(SUL)

$(COL): $(COL_FILE)
	@printf "%b" $(GREEN) "Colleen:\n" $(NO_COLOR)
	$(GCC) $< -o $@
	@printf "%b" $(GREEN) "Done!\n\n" $(NO_COLOR)

$(GRC): $(GRC_FILE)
	@printf "%b" $(GREEN) "Grace:\n" $(NO_COLOR)
	$(GCC) $< -o $@
	@printf "%b" $(GREEN) "Done!\n\n" $(NO_COLOR)

$(SUL): $(SUL_FILE)
	@printf "%b" $(GREEN) "Sully:\n" $(NO_COLOR)
	$(GCC) $< -o $@
	@printf "%b" $(GREEN) "Done!\n\n" $(NO_COLOR)

re: fclean all

clean:
	@printf "%b" $(CYAN) "Cleaning object files:\n" $(NO_COLOR)
	$(RM) $(OBJS)
	@printf "\n"

fclean: clean
	@printf "%b" $(CYAN) "Cleaning executables:\n" $(NO_COLOR)
	$(RM) $(NAMES)
	@printf "\n"