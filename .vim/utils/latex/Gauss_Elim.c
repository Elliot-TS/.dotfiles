#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool determinants = false;
double det_scalar = 1.0;

void print_matrix(int width, int height, double matrix[height][width]);
void print_matrix_latex(FILE * fileptr, int width, int height, double matrix[height][width]);
void swap_rows(int r1, int r2, int width, int height, double matrix[height][width]);
void sum_rows(int r1, int r2, double c, int width, int height, double matrix[height][width]);
void scale_row(int r, double c, int width, int height, double matrix[height][width]);
void scan_int(int *i, char *message);
void scan_double(double *d, char *message);
void clear_buff()
{
    char buff;
    while ((buff = getchar()) != '\n' && buff != EOF);
}

int main(void)
{
    int width, height;

    system("clear || cls");
    int det_int;
    do
    {
        scan_int(&det_int, "Runs standard mode (1) or Determinant mode (2)\n");
        if (det_int != 1 && det_int != 2)
            printf("Error: Invalid Input: Please enter either 1 or 2. Try again.\n\n");
    } while (det_int != 1 && det_int != 2);

    if (det_int == 2) determinants = true;

    system("clear || cls");
    scan_int(&width, "Enter the number of columns: ");
    scan_int(&height, "Enter the number of rows: ");

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
    clear_buff();

    FILE * fileptr;
    fileptr = fopen("Gauss_Elim_Clipboard", "w");
    fprintf(fileptr, "\\begin{align*}\n\t");

    print_matrix_latex(fileptr, width, height, matrix);

    int round = 0;
    while(1)
    {
        char newline[5] = ""; 
        round++;
        if (round % 3 == 0)
        {
            newline[0] = '\\';
            newline[1] = '\\';
            newline[2] = '\\';
            newline[3] = '\\';
        }

        system("clear || cls");
        printf("Current Matrix:\n");
        print_matrix(width, height, matrix);
        printf("\n\n");

        int option;
        scan_int(&option, "Select a row operation:\n1=SWAP\t2=SUM\t3=SCALE\t4=QUIT\n");

        if (option == 1)
        {
            int r1, r2;
            char message[100];
            sprintf(message, "Select the first row you want to swap (1-%d): ", height);
            scan_int(&r1, message);

            sprintf(message, "Select the second row you want to swap (1-%d): ", height);
            scan_int(&r2, message);

            swap_rows(r1-1, r2-1, width, height, matrix);
            fprintf(fileptr, "\n\t%s \\xrightarrow{ R%d \\leftrightarrow R%d } ", newline, r1, r2);
            print_matrix_latex(fileptr, width, height, matrix);
            /*fprintf(fileptr, "&& \\left( R%d \\leftrightarrow R%d \\right)", r1, r2);*/
        }
        else if (option == 2)
        {
            int r1, r2;
            double c;
            char message[100];
            sprintf(message, "Select the FIRST ROW you want to sum (1-%d): ", height);
            scan_int(&r1, message);

            sprintf(message, "Select the COEFFICIENT of the SECOND row: ");
            scan_double(&c, message);

            sprintf(message, "Select the SECOND ROW you want to sum (1-%d): ", height);
            scan_int(&r2, message);

            sum_rows(r1-1, r2-1, c, width, height, matrix);
            fprintf(fileptr, "\n\t%s \\xrightarrow{ R%d + (%.4g)R%d \\rightarrow R%d } ", newline, r1, c, r2, r1);
            print_matrix_latex(fileptr, width, height, matrix);
            /*fprintf(fileptr, "&& \\left( R%d + (%.4g)R%d \\rightarrow R%d \\right)", r1, c, r2, r1);*/
        }
        else if (option == 3) {
            int r;
            double c;
            char message[100];
            sprintf(message, "Select the row you want to scale (1-%d): ", height);
            scan_int(&r, message);

            sprintf(message, "Select coefficient by which you want to scale it: ");
            scan_double(&c, message);

            scale_row(r-1, c, width, height, matrix);
            fprintf(fileptr, "\n\t%s \\xrightarrow{ %.4gR%d \\rightarrow R%d} ", newline, c, r, r );
            print_matrix_latex(fileptr, width, height, matrix);
            /*fprintf(fileptr, " && \\left( %.4gR%d \\rightarrow R%d \\right)", r, c, r); */
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
    if (determinants && det_scalar == 1.0) fprintf(fileptr, "\\vmat{\n");
    else if (determinants) fprintf(fileptr, "%.4g\\vmat{\n", det_scalar);
    else fprintf(fileptr, "\\pmat{\n");

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
        if (row == (int)(height/2) && determinants && det_scalar != 1) 
            printf("(%.4g)\t", det_scalar);
        else if (determinants)
            printf("\t");

        for (int column = 0; column < width; column++) {
            if (column == 0) printf("%.4g", matrix[row][column]);
            else printf("\t%.4g", matrix[row][column]);

            if (column == width - 1) printf("\n");
        }
    }
}

void swap_rows(int r1, int r2, int width, int height, double matrix[height][width])
{
    det_scalar *= -1;
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
    det_scalar /= c;
    for (int i = 0; i < width; i ++)
    {
        matrix[r][i] = matrix[r][i] * c;
    }
}

void scan_int(int *i, char *message)
{
    int success;
    do
    {
        printf("%s", message);
        success = scanf("%d", i);
        clear_buff();
        if (success != 1)
            printf("Error: Invalid Input.  Try again.\n\n");
    } while (success != 1);
}
void scan_double(double *d, char *message)
{
    int success;
    do
    {
        printf("%s", message);
        success = scanf("%lf", d);
        clear_buff();
        if (success != 1)
            printf("Error: Invalid Input.  Try again.\n\n");
    } while (success != 1);
}
