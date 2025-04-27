#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread ID using 3D grid and block indexes for better flexibility
    int i = blockIdx.x * blockDim.x + threadIdx.x + 
            blockIdx.y * (blockDim.x * gridDim.x) + 
            blockIdx.z * (blockDim.x * gridDim.x * gridDim.y);

    // Ensure memory accesses are within bounds
    if (i < N) X[i * INCX] = ALPHA;
}