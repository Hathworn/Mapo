#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Combine blockIdx calculations into one variable
    int stride = blockDim.x * gridDim.x;               // Calculate full stride across the grid
    for(int i = index; i < N; i += stride) {           // Use loop to process multiple elements per thread
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i*INCX])); // Apply the constraint
    }
}