NAME			:= array_list.a
SRC				:= ./src/init_array_list.c\
				./src/creat_addnode_back_array_list.c\
				./src/creat_addnode_front_array_list.c\
				./src/remove_node_front.c\
				./src/remove_node_back.c\
				./src/remove_specific_node.c\
				./src/remove_specific_content.c\
				./src/delete_list.c\
				./src/add_node_back.c\
				./src/add_node_front.c\

NUM_FILES		:= $(words $(SRC))
OBJS			:= ./objs
INCLUDES		:= -I ./include
O_FILE			:= $(SRC:%.c=$(OBJS)/%.o)
CC				:= cc
CFLAGS 			:= -Wall -Werror -Wextra
O_FLAGS 		:= -c
CMD_CLEAN		:= rm -Rf
CMD_FCLEAN		:= rm -rf

all: $(NAME)

$(NAME): $(O_FILE)
	@ar -rc $(NAME) $(O_FILE)

$(OBJS)/%.o: %.c
	@mkdir -p $(@D)
	@$(CC) $(INCLUDES) $(O_FLAGS) $(CFLAGS) $< -o $@
	@$(eval COUNT := $(shell echo $$(($(COUNT)+1))))
	@echo "[$(shell echo 	$$(($(COUNT) * 100 / $(NUM_FILES))))%] array_list Progress"

clean:
	$(CMD_CLEAN) $(OBJS)

fclean: clean
	$(CMD_FCLEAN) $(NAME)

re: fclean all

.PHONI: all clean fclean re