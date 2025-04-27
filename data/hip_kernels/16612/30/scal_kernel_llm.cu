#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate thread's unique global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through all elements using stride
    while (i < N) {
        X[i * INCX] *= ALPHA;
        i += blockDim.x * gridDim.x;  // Move to the next element within thread's range
    }
}