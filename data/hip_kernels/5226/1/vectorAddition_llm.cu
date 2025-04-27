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
    int gridIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory for faster access
    __shared__ double cache[tileSize];
    
    // Unrolling loop to improve performance
    for (int i = gridIndex; i < numElements; i += stride * 2)
    {
        double temp = A[i] + B[i];
        C[i] = temp;

        int i2 = i + stride;
        if (i2 < numElements)
        {
            double temp2 = A[i2] + B[i2];
            C[i2] = temp2;
        }
    }
}
```
