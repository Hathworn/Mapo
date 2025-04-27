#include "hip/hip_runtime.h"
#include "includes.h"
//Library Definition

//Constant Definition
#define PI 3.141592654
#define blocksize 32
#define Repetitions 8192

//Print matrix into standard output
void print(double * M, int cols, int rows);
void dot(double * a, double * b, double & c, int cols);
void Create_New_Matrix(double * M, double * New, int * vec, int p0, int pp, int nn);

/*
DEVICE FUNCTIONS
*/

//Matrix transposition (Rows and Cols of M)
__global__ void nodiag_normalize(double *A, double *I, int nn, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure threads are within matrix dimensions and x is not equal to y
    if (x < nn && y < nn && x == i && x != y)
    {
        double diagValue = A[i * nn + i];
        
        // Perform normalization for the current element
        I[x * nn + y] /= diagValue;
        A[x * nn + y] /= diagValue;
    }
}