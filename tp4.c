#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

struct stack_node
{
	int data;
	struct stack_node *next;
};

struct stack
{
	struct stack_node *first;
};

void stack_create(struct stack *self)
{
	self->first = NULL;
}

bool stack_is_empty(const struct stack *self)
{
	return self->first == NULL;
}

void stack_push(struct stack *self, int data)
{
	assert(self);

	struct stack_node *node = malloc(sizeof(struct stack_node));
	node->data = data;
	node->next = self->first;
	self->first = node;
}

int stack_top(const struct stack *self)
{
	return self->first->data;
}

void stack_pop(struct stack *self)
{
	struct stack_node *supp = self->first;
	self->first = self->first->next;
	free(supp);
}

int main(int argc, char const *argv[])
{
	struct stack *self = malloc(sizeof(struct stack_node));
	stack_create(self);
	stack_push(self, 1);
	stack_push(self, 2);
	stack_push(self, 3);
	printf("%d\n" ,stack_top(self));
	stack_pop(self);
	printf("%d\n" ,stack_top(self));
	free(self);

	return 0;
}

