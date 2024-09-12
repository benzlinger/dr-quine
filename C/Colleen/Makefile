NAME = Colleen
TMP_NAME = tmp_Colleen

CC = gcc
FLAGS = -Wall -Wextra -Werror
RM = rm -rf
NORM = norminette

GREEN = "\033[1;32m"
NO_COLOR = "\033[0m"

SRCS = Colleen.c \

OBJS = ${SRCS:.c=.o}

all: $(NAME)

comp: $(NAME)
	@printf "%b" $(GREEN) "\nexecuting $(NAME) into $(TMP_NAME)\n" $(NO_COLOR)
	./$(NAME) > $(TMP_NAME)
	@printf "%b" $(GREEN) "\ncompare $(TMP_NAME) and Colleen.c:\n" $(NO_COLOR)
	diff $(TMP_NAME) Colleen.c

$(NAME): $(OBJS)
	@printf "%b" $(GREEN) "creating Colleen...\n" $(NO_COLOR)
	@$(CC) $(FLAGS) $(OBJS) -o $(NAME)
	@printf "%b" $(GREEN) "done!\n" $(NO_COLOR)

re: fclean all

clean:
	@printf "%b" $(GREEN) "removing object files...\n" $(NO_COLOR)
	@$(RM) $(OBJS)
	@printf "%b" $(GREEN) "done!\n" $(NO_COLOR)

fclean: clean
	@printf "%b" $(GREEN) "removing executable...\n" $(NO_COLOR)
	@$(RM) $(NAME) $(TMP_NAME)
	@printf "%b" $(GREEN) "done!\n" $(NO_COLOR)

norm:
	@$(NORM) $(SRCS)
	@printf "%b" $(GREEN) "OK!\n" $(NO_COLOR)

.PHONY: all clean fclean re norm