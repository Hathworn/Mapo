```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Iterate over elements using thread-stride loop
    for (int i = idx; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}