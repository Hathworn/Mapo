#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Compute global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure each thread only processes its intended elements
    int stride = blockDim.x * gridDim.x;

    // Optimize loop for strided access
    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}