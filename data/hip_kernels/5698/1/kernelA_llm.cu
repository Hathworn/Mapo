#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Calculate the global index for the current thread.
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single loop with index stride by total grid size.
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}