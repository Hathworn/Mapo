#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Use global thread index to handle larger data sets
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Compute stride for grid-stride loop

    // Grid-stride loop for efficient memory access and better parallelization
    for (int i = idx; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}