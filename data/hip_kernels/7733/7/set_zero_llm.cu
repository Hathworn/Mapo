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

// Optimized global kernel to set zero
__global__ void set_zero(double *A, double *I, int nn, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Only check and modify relevant elements
    if (x < nn && y == i && x != i)
    {
        // Direct setting to zero for necessary elements
        A[x * nn + y] = 0;
    }
}