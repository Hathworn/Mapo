#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate thread's global index
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop
    for (int i = idx; i < N; i += stride) // Use grid-stride loop for better load balancing
    {
        X[i * INCX] = ALPHA; // Set value with stride
    }
}