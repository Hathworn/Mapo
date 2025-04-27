#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the loop increments by the grid size
    for( int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        X[idx * INCX] = ALPHA; // Assign value ALPHA to each relevant index
    }
}