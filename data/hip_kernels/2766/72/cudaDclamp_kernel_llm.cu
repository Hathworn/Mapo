#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDclamp_kernel(double* x, unsigned int size, double minVal, double maxVal)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = index; i < size; i += stride) {
        // Use fmax and fmin for clamping
        x[i] = fmax(fmin(x[i], maxVal), minVal);
    }
}