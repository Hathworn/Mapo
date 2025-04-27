#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global index for current thread
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Use global index to iterate over the data with block-wide stride
    for (int i = index; i < size; i += blockDim.x * gridDim.x) {
        r[i] = x[i] * y[i] + z[i];
    }
}