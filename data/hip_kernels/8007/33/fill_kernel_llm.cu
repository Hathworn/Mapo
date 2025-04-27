#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify calculation of index

    if(i < N) { // Ensure thread doesn't exceed array boundaries
        X[i * INCX] = ALPHA; // Assign ALPHA to each element of the array
    }
}