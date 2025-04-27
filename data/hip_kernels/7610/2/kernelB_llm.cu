#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int stride = blockDim.x * gridDim.x;            // Calculate stride
    for (; i < size; i += stride) {                 // Use global index and stride
        r[i] = x[i] * y[i] + z[i];
    }
}