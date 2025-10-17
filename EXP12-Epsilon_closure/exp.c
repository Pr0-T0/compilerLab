#include <stdio.h>
#include <string.h>

char copy[10], result[20][20], states[20][20];

void add_state(char a[3], int i) {
    strcpy(result[i], a);
}

void display(int n) {
    int k = 0;
    printf("\nEpsilon Closure of %s = { ", copy);
    while (k < n) {
        printf("%s ", result[k]);
        k++;
    }
    printf("}\n");
}

int main() {
    FILE *INPUT;
    INPUT = fopen("input.txt", "r");
    if (INPUT == NULL) {
        printf("Error: Cannot open input.txt\n");
        return 1;
    }

    char state[4], state1[4], state2[4], input[4];
    int num_states;
    int end;

    printf("Enter number of states: ");
    scanf("%d", &num_states);

    printf("Enter states:\n");
    for (int k = 0; k < num_states; k++)
        scanf("%s", states[k]);

    for (int k = 0; k < num_states; k++) {
        int i = 0;
        strcpy(state, states[k]);
        strcpy(copy, state);
        add_state(state, i++);

        while (1) {
            end = fscanf(INPUT, "%s%s%s", state1, input, state2);
            if (end == EOF)
                break;

            // Check if current transition starts from our state
            if (strcmp(state, state1) == 0 && strcmp(input, "e") == 0) {
                add_state(state2, i++);
                strcpy(state, state2);
            }
        }

        display(i);
        rewind(INPUT);  // Reset file pointer for next state
    }

    fclose(INPUT);
    return 0;
}
