#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized CUDA Kernel function to add the elements of two arrays on the GPU

__global__ void add(int n, float *x, float *y)
{
    // Calculate global index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use global index and stride to process full data range
    for (int i = index; i < n; i += stride)
    {
        y[i] = x[i] + y[i];
    }
}