# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fhuang <fhuang@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/17 10:16:48 by fhuang            #+#    #+#              #
#    Updated: 2017/12/06 11:33:31 by fhuang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ===== Editable =====
NAME1	:=	Colleen
NAME2	:=	Grace
NAME3	:=	Sully
NAMES = $(NAME1) $(NAME2) $(NAME3)
# ====================

# ===== Standard =====
CC		:=	clang -pipe
CFLAGS	:=	-Wall -Wextra -Werror -g3
SRCDIR	:=	src/
OBJDIR	:=	obj/
SRC1		:=	colleen.c
SRC2		:=	grace.c
SRC3		:=	sully.c

OBJ1		:=	$(SRC1:%.c=$(OBJDIR)%.o)
OBJ2		:=	$(SRC2:%.c=$(OBJDIR)%.o)
OBJ3		:=	$(SRC3:%.c=$(OBJDIR)%.o)
CACHEF	:=	.cache_exists
# ====================

# ====== Colors ======
CLEAR		= "\033[2K"
UP			= "\033[A"
EOC			= "\033[0;0m"
BLACK		= "\033[0;30m"
RED			= "\033[0;31m"
GREEN		= "\033[0;32m"
YELLOW		= "\033[0;33m"
BLUE		= "\033[0;34m"
PURPLE		= "\033[0;35m"
CYAN		= "\033[0;36m"
WHITE		= "\033[0;37m"
# ====================

.PHONY: all libft norme clean fclean re check colleen grace sully clean_sully check_colleen check_grace check_sully

.SILENT:

all: $(NAMES)

$(NAME1): $(OBJ1)
	$(CC) $(CFLAGS) $(OBJ1) -o $@
	printf $(BLUE)" $@ compiled!\n"$(EOC)
$(NAME2): $(OBJ2)
	$(CC) $(CFLAGS) $(OBJ2) -o $@
	printf $(BLUE)" $@ compiled!\n"$(EOC)
$(NAME3): $(OBJ3)
	$(CC) $(CFLAGS) $(OBJ3) -o $@
	printf $(BLUE)" $@ compiled!\n"$(EOC)

$(OBJDIR)%.o: $(SRCDIR)%.c $(CACHEF)
	$(CC) $(CFLAGS) -c $< -o $@
	printf $(BLUE)"|"$(EOC)

$(CACHEF):
	test -d $(OBJDIR) || mkdir $(OBJDIR)
	test -d $(CACHEF) || touch $(CACHEF)

%.c:
	printf $(RED)"Missing file : $@\n"$(EOC)

clean: clean_sully
	rm -rf $(OBJDIR) $(CACHEF)
	printf $(YELLOW)"All objects cleaned\n"$(EOC)

fclean: clean
	rm -f $(NAMES)
	printf $(RED)"$(NAMES) cleaned\n"$(EOC)

re: fclean all

# ===== DR_QUINE RULES =====

COLLEEN_OUTPUT	= "tmp_Colleen"
GRACE_OUTPUT	= "Grace_kid.c"
SULLY_OUTPUT	= Sully_0.c Sully_1.c Sully_2.c Sully_3.c Sully_4.c Sully_5.c
SULLY_OBJ		= Sully_0 Sully_1 Sully_2 Sully_3 Sully_4 Sully_5

colleen: $(NAME1)
grace: $(NAME2)
sully: $(NAME3)

check: check_colleen check_grace check_sully

check_colleen:
	echo $(PURPLE) $(NAME1) $(EOC)
	./$(NAME1) > $(COLLEEN_OUTPUT) && diff $(SRC1) $(COLLEEN_OUTPUT) && rm -r $(COLLEEN_OUTPUT)

check_grace:
	echo $(PURPLE) $(NAME2) $(EOC)
	./$(NAME2) && diff $(SRC2) $(GRACE_OUTPUT) && rm -r $(GRACE_OUTPUT)

check_sully:
	echo $(PURPLE) $(NAME3)  $(EOC)
	./$(NAME3)
	ls -al | grep "Sully" | wc -l
	$(foreach var, $(SULLY_OUTPUT), echo $(YELLOW)- Diff $(SRC3) and $(var) $(EOC); diff $(SRC3) $(var);)
	rm -rf $(SULLY_OUTPUT) $(SULLY_OBJ)

clean_sully:
	rm -rf $(SULLY_OUTPUT) $(SULLY_OBJ)
# =========================
