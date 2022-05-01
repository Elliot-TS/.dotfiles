#include <stdio.h>
#include <stdlib.h>

void print_matrix(int width, int height, double matrix[height][width]);
void print_matrix_latex(FILE * fileptr, int width, int height, double matrix[height][width]);
void swap_rows(int r1, int r2, int width, int height, double matrix[height][width]);
void sum_rows(int r1, int r2, double c, int width, int height, double matrix[height][width]);
void scale_row(int r, double c, int width, int height, double matrix[height][width]);

int main(void)
{
    int width, height;

    system("clear || cls");
    printf("Enter number of columns: ");
    scanf("%d", &width);
    while (getchar() != '\n') continue;

    printf("Enter number of rows: ");
    scanf("%d", &height);
    while (getchar() != '\n') continue;

    double matrix[height][width];

    system("clear || cls");
    printf("Enter the values for the matrix separated by tabs:\n");
    for (int row = 0; row < height; row ++)
    {
        for (int column = 0; column < width; column ++)
        {
            scanf("%lf", &matrix[row][column]);
        }
    }

    FILE * fileptr;
    fileptr = fopen("Gauss_Elim_Clipboard", "w");
    fprintf(fileptr, "\\begin{align*}\n\t");

    print_matrix_latex(fileptr, width, height, matrix);

    while(1)
    {
        system("clear || cls");
        printf("Current Matrix:\n");
        print_matrix(width, height, matrix);
        printf("\n\n");

        int option;
        printf("Select a row opperation:\n1=SWAP\t2=SUM\t3=SCALE\t4=QUIT\n");
        scanf("%d", &option);
        while (getchar() != '\n') continue;

        if (option == 1)
        {
            int r1, r2;
            printf("Select the first row you want to swap (1-%d): ", height);
            scanf("%d", &r1);
            while (getchar() != '\n') continue;

            printf("Select the second row you want to swap (1-%d): ", height);
            scanf("%d", &r2);
            while (getchar() != '\n') continue;

            swap_rows(r1-1, r2-1, width, height, matrix);
            fprintf(fileptr, "\n\t\\\\ \\rightarrow ");
            print_matrix_latex(fileptr, width, height, matrix);
            fprintf(fileptr, "&& \\left( R%d \\leftrightarrow R%d \\right)", r1, r2);
        }
        else if (option == 2)
        {
            int r1, r2;
            double c;
            printf("Select the first row you want to sum (1-%d): ", height);
            scanf("%d", &r1);
            while (getchar() != '\n') continue;

            printf("Select the second row you want to sum (1-%d): ", height);
            scanf("%d", &r2);
            while (getchar() != '\n') continue;

            printf("Select the coefficient of the second row: ");
            scanf("%lf", &c);
            while (getchar() != '\n') continue;

            sum_rows(r1-1, r2-1, c, width, height, matrix);
            fprintf(fileptr, "\n\t\\\\ \\rightarrow ");
            print_matrix_latex(fileptr, width, height, matrix);
            fprintf(fileptr, "&& \\left( R%d + (%.4g)R%d \\rightarrow R%d \\right)", r1, c, r2, r1);
        }
        else if (option == 3) {
            int r;
            double c;
            printf("Select the row you want to scale (1-%d): ", height);
            scanf("%d", &r);
            while (getchar() != '\n') continue;

            printf("Select coefficient by which you want to scale it: ");
            scanf("%lf", &c);
            while (getchar() != '\n') continue;

            scale_row(r-1, c, width, height, matrix);
            fprintf(fileptr, "\n\t\\\\ \\rightarrow ");
            print_matrix_latex(fileptr, width, height, matrix);
            fprintf(fileptr, " && \\left( %.4gR%d \\rightarrow R%d \\right)", r, c, r); 
        }
        else break;
    }

    fprintf(fileptr, "\n\\end{align*}");

    fclose(fileptr);

    system("xclip Gauss_Elim_Clipboard -selection clipboard; rm Gauss_Elim_Clipboard");

    return 0;
}


void print_matrix_latex(FILE * fileptr, int width, int height, double matrix[height][width])
{
    fprintf(fileptr, "\\pmat{\n");
    for (int row = 0; row < height; row++) {
        for (int column = 0; column < width; column++) {
            if (column == 0) fprintf(fileptr, "\t\t%.4g", matrix[row][column]);
            else fprintf(fileptr, "&%.4g", matrix[row][column]);

            if (column == width - 1) fprintf(fileptr, "\\\\\n");
        }
    }
    fprintf(fileptr, "\t}");
}
void print_matrix(int width, int height, double matrix[height][width])
{
    for (int row = 0; row < height; row++) {
        for (int column = 0; column < width; column++) {
            if (column == 0) printf("%.4g", matrix[row][column]);
            else printf("\t%.4g", matrix[row][column]);

            if (column == width - 1) printf("\n");
        }
    }
}

void swap_rows(int r1, int r2, int width, int height, double matrix[height][width])
{
    for (int i = 0; i < width; ++i) {
        int temp = matrix[r1][i];
        matrix[r1][i] = matrix[r2][i];
        matrix[r2][i] = temp;
    }
}
void sum_rows(int r1, int r2, double c, int width, int height, double matrix[height][width])
{
    for (int i = 0; i < width; i ++)
    {
        matrix[r1][i] = matrix[r1][i] + c*matrix[r2][i];
    }
}

void scale_row(int r, double c, int width, int height, double matrix[height][width])
{
    for (int i = 0; i < width; i ++)
    {
        matrix[r][i] = matrix[r][i] * c;
    }
}
