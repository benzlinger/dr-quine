NAME = Colleen
FILE = Colleen.s

OBJFILE = $(FILE:.s=.o)
EXEFILE = $(FILE:.s=)

ASM = nasm
ASMFLAGS = -f macho64
LD = ld
LDFLAGS = -lSystem
RM = rm -f

all: $(NAME)

$(NAME): $(EXEFILE)

# ASSEMBLE
$(OBJFILE): $(FILE)
	$(ASM) $(ASMFLAGS) -o $(OBJFILE) $(FILE)

# LINK
$(EXEFILE): $(OBJFILE)
	$(LD) $(LDFLAGS) -o $(EXEFILE) $(OBJFILE)

re: fclean all

clean:
	$(RM) $(OBJFILE)

fclean: clean
	$(RM) $(EXEFILE)

.PHONY: all $(NAME) re clean fclean