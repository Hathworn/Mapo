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

__global__ void vectorScaling(const double *A, double s, double *C, int numElements)
{
    // Calculate the global index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we do not exceed bounds of the array
    if (index < numElements)
    {
        C[index] = A[index] * s;  // Perform the scaling operation
    }
}