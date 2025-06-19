COL = Colleen/Colleen
GRC = Grace/Grace
SUL = Sully/Sully

COL_FILE = $(COL:=.s)
GRC_FILE = $(GRC:=.s)
SUL_FILE = $(SUL:=.s)

COL_OBJ = $(COL_FILE:.s=.o)
GRC_OBJ = $(GRC_FILE:.s=.o)
SUL_OBJ = $(SUL_FILE:.s=.o)

NAMES = $(COL) $(GRC) $(SUL)
OBJS = $(COL_OBJ) $(GRC_OBJ) $(SUL_OBJ)

ASM = nasm -f macho64
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
	$(ASM) $< -o $(COL_OBJ)
	$(GCC) $(COL_OBJ) -o $@
	@printf "%b" $(GREEN) "Done!\n\n" $(NO_COLOR)

$(GRC): $(GRC_FILE)
	@printf "%b" $(GREEN) "Grace:\n" $(NO_COLOR)
	$(ASM) $< -o $(GRC_OBJ)
	$(GCC) $(GRC_OBJ) -o $@
	@printf "%b" $(GREEN) "Done!\n\n" $(NO_COLOR)

$(SUL): $(SUL_FILE)
	@printf "%b" $(GREEN) "Sully:\n" $(NO_COLOR)
	$(ASM) $< -o $(SUL_OBJ)
	$(GCC) $(SUL_OBJ) -o $@
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