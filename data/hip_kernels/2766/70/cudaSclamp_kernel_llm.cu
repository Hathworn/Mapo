#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSclamp_kernel(float* x, unsigned int size, float minVal, float maxVal)
{
    // Calculate the index for the current thread
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Iterate with stride, process elements within bounds
    for (unsigned int i = index; i < size; i += stride) {
        float val = x[i];
        // Use fminf and fmaxf for potential performance gain
        x[i] = fmaxf(minVal, fminf(val, maxVal));
    }
}