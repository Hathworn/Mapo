#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Optimize thread index calculation using combined block and thread indexing.
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid stride loop to cover all elements.
    while (i < N) {
        X[i * INCX] = ALPHA;
        // Advance by total number of threads.
        i += blockDim.x * gridDim.x;
    }
}