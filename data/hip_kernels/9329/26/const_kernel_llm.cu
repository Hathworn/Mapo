#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flatten blockIdx
    int stride = gridDim.x * blockDim.x;           // Compute stride for loop

    for (; i < N; i += stride) {                   // Loop over elements with stride
        X[i * INCX] = ALPHA;                        // Assign ALPHA
    }
}