NAME = Grace
FILE = Grace.c

OBJFILE = ${FILE:.c=.o}

CC = gcc
FLAGS = -Wall -Wextra -Werror
RM = rm -rf

all: $(NAME)

$(NAME): $(FILE)
	$(CC) $(FLAGS) $< -o $@

clean:
	$(RM) $(OBJFILE)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re