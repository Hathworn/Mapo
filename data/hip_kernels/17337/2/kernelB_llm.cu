```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a strided loop for better performance on larger arrays
    for (int i = idx; i < size; i += blockDim.x * gridDim.x) {
        r[i] = x[i] * y[i] + z[i];
    }
}