#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the linear thread index to efficiently access elements
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;
    
    // Efficiently loop through elements in steps of grid stride
    for (; i < N; i += gridStride) 
    {
        X[i * INCX] = ALPHA;
    }
}