```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSclamp_kernel(float* x, unsigned int size, float minVal, float maxVal)
{
    // Calculate global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop using stride based on grid and block dimensions
    for (unsigned int i = index; i < size; i += blockDim.x * gridDim.x) {
        // Apply clamp operation
        float val = x[i];
        x[i] = min(max(val, minVal), maxVal);
    }
}