#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Improved indexing calculation using blockIdx.x directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check index within bounds and update
    if(i < N) { 
        X[i * INCX] += ALPHA;
    }
}