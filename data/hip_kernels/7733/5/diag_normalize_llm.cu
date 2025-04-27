#include "hip/hip_runtime.h"
#include "includes.h"
//Library Definition

//Constant Definition
#define PI 3.141592654
#define blocksize 32
#define Repetitions 8192

//Print matrix into standard output
void print(double * M,int cols,int rows);
void dot(double * a,double * b, double & c, int cols);
void Create_New_Matrix(double * M,double * New,int * vec, int p0, int pp,int nn);

/*
DEVICE FUNCTIONS
*/

//Matrix transposition (Rows and Cols of M)

__global__ void diag_normalize(double *A, double *I, int nn, int i)
{
    // Calculate global thread id
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Simplify condition and avoid redundancy
    if (x == y && x == i && x < nn) 
    {
        double factor = A[i*nn + i]; // Cache the value to reduce memory access
        I[x*nn + y] /= factor;
        A[x*nn + y] /= factor;
    }
}