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

__global__ void gaussjordan(double *A, double *I, int nn, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Using shared memory optimization and removing redundant boundary checks
    __shared__ double sharedA[blocksize][blocksize];
    __shared__ double sharedI[blocksize][blocksize];

    if (x < nn && y < nn)
    {
        sharedA[threadIdx.x][threadIdx.y] = A[x*nn + y];
        sharedI[threadIdx.x][threadIdx.y] = I[x*nn + y];
    }

    __syncthreads();

    if (x < nn && y < nn && x != i)
    {
        double factor = sharedA[threadIdx.x][i];
        if (y == i)
        {
            sharedI[threadIdx.x][threadIdx.y] -= sharedI[i][threadIdx.y] * factor;
        }
        else
        {
            sharedA[threadIdx.x][threadIdx.y] -= sharedA[i][threadIdx.y] * factor;
            sharedI[threadIdx.x][threadIdx.y] -= sharedI[i][threadIdx.y] * factor;
        }

        // Write updated results back to global memory
        A[x*nn + y] = sharedA[threadIdx.x][threadIdx.y];
        I[x*nn + y] = sharedI[threadIdx.x][threadIdx.y];
    }
}