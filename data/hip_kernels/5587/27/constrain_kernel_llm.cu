#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride of total threads across the grid for memory access pattern improvement
    int stride = blockDim.x * gridDim.x; 
    
    // Loop over the array with appropriate stride
    for(; i < N; i += stride) {
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX]));
    }
}