NAME = Sully
FILE = Sully.s

OBJFILE = $(FILE:.s=.o)
EXEFILE = $(FILE:.s=)
EXECDIR = exec/
OBJDIR = obj/

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
	$(LD) $(LDFLAGS) -o $(EXECDIR)$(EXEFILE) $(OBJFILE)

re: fclean all

clean:
	$(RM) $(OBJFILE)

fclean: clean
	$(RM) $(EXEFILE)

.PHONY: all re clean fclean