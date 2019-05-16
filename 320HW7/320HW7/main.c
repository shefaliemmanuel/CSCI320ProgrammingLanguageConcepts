//  main.c
//  320HW7
//  Created by Shefali Emmanuel on 11/11/18.
//  Copyright © 2018 Shefali Emmanuel. All rights reserved.

// A simple C program for traversal of a linked list
#include<stdio.h>
#include<stdlib.h>

//createing a data and next node
struct Node
{
    int data;
    struct Node *next;
};

// This function prints contents of linked list starting from the given node
void printStack(struct Node *n)
{
    if(n == NULL){
        printf("The stack is empty");
    }
    while(n != NULL)
    {
        printf(" %d ", n->data);
        n = n->next;
    }
    
}

void push(struct Node **n, int element){
    printf("\nPush Method Begins:");
    
    if(*n == NULL){
        // allocate space
        struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));
        newNode->data = element;
        // put value in node
        newNode->next = NULL;
        //link next pointer
        *n = newNode;
    }else{
        // allocate space
        struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));
        newNode->data = element;
        // put value in node
        newNode->next = *n;
        //link next pointer
        *n = newNode;
    }
}

int pop(struct Node **n){
    printf("\nPop Method Begins: ");
    //make special condition for empty stack while (head->next != NULL) {}
    if(*n == NULL){
        printf("The stack is empty!\n");
        return -1;
    }
    //AnyType temp = top.data;
    int temp = (*n)->data;
    //create a temp pointer
    struct Node *tempPointer = *n;
    //top = top.next;
    (*n) = (*n)->next;
    //manually delocate space since there is no garbage collection
    free(tempPointer);
    //return temp;
    return temp;
}

int main()
{
    struct Node* head = NULL;
    
    printf("\nOriginal Stack:    ");
    printStack(head);
    
    push(&head, 3);
    printStack(head);
    
    push(&head, 4);
    printStack(head);
    
    push(&head, 5);
    printStack(head);
    
    push(&head, 6);
    printStack(head);
    
    pop(&head);
    printStack(head);
    
    pop(&head);
    printStack(head);
    
    pop(&head);
    printStack(head);
    
    pop(&head);
    printStack(head);

    printf("\n");
    printf("\n");
    return 0;
}
