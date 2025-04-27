```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Combine thread indexing
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid stride loop
    for (int i = tid; i < N; i += stride) {  // Use grid stride loop for better parallelism
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i*INCX])); // Constrain value
    }
}