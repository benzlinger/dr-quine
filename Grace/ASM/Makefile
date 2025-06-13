NAME = Grace
FILE = Grace.s

OBJFILE = $(FILE:.s=.o)

ASM = nasm
ASMFLAGS = -f macho64
LD = ld
LDFLAGS = -lSystem
RM = rm -f

all: $(NAME)

# ASSEMBLE
$(OBJFILE): $(FILE)
	$(ASM) $(ASMFLAGS) $< -o $@

# LINK
$(NAME): $(OBJFILE)
	$(LD) $(LDFLAGS) $< -o $@

re: fclean all

clean:
	$(RM) $(OBJFILE)

fclean: clean
	$(RM) $(NAME)

.PHONY: all re clean fclean