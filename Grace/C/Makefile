NAME = Grace
OUT_FILE = Grace_kid.c

CC = gcc
FLAGS = -Wall -Wextra -Werror
RM = rm -rf
NORM = norminette

GREEN = "\033[1;32m"
RED = "\033[0;31m"
NO_COLOR = "\033[0m"

SRCS = Grace.c \

OBJS = ${SRCS:.c=.o}

all: $(NAME)

comp: $(NAME)
	@printf "%b" $(GREEN) "\nexecuting $(NAME)\n" $(NO_COLOR)
	./$(NAME);
# ifneq ("$(wildcard Grace_kid.c)","")
	@printf "%b" $(GREEN) "\ncompare $(OUT_FILE) and Grace.c:\n" $(NO_COLOR)
	diff $(OUT_FILE) Grace.c
# else
	
# endif

$(NAME): $(OBJS)
	@printf "%b" $(GREEN) "creating Grace...\n" $(NO_COLOR)
	@$(CC) $(FLAGS) $(OBJS) -o $(NAME)
	@printf "%b" $(GREEN) "done!\n" $(NO_COLOR)

re: fclean all

clean:
	@printf "%b" $(GREEN) "removing object files...\n" $(NO_COLOR)
	@$(RM) $(OBJS)
	@printf "%b" $(GREEN) "done!\n" $(NO_COLOR)

fclean: clean
	@printf "%b" $(GREEN) "removing executable...\n" $(NO_COLOR)
	@$(RM) $(NAME) $(OUT_FILE)
	@printf "%b" $(GREEN) "done!\n" $(NO_COLOR)

norm:
	@$(NORM) $(SRCS)
	@printf "%b" $(GREEN) "OK!\n" $(NO_COLOR)

.PHONY: all clean fclean re norm comp