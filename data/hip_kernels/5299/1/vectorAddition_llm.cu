#include "hip/hip_runtime.h"
#include "includes.h"

#define tileSize 32

//function for data initialization
void initialization( double *M,  double *N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the input data
void printInput( double *M,  double *N, int arow, int acol, int brow,  int bcol);
//(for Debugging) prints out the output data
void printOutput( double *P_C,  double *P_G, int arow, int bcol);

//GPU kernels

__global__ void vectorAddition(const double *A, const double *B, double *C, int numElements)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;

    // Ensure index is within bounds
    while (index < numElements)
    {
        C[index] = A[index] + B[index];
        index += totalThreads;  // Move index by total threads
    }
}