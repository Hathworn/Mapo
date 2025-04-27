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

__global__ void vectorSubtraction(const double *A, const double *B, double *C, int numElements)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index < numElements) { // Ensure index is within bounds
        C[index] = A[index] - B[index];
    }
}