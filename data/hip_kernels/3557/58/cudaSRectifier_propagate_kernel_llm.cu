#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSRectifier_propagate_kernel(float* x, float* y, unsigned int size, float leakSlope, float clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimization: loop unrolling for better performance
    #pragma unroll 4
    for (unsigned int i = index; i < size; i += stride) {
        float value = x[i];

        // Utilize conditional operator for more concise code and potential speed improvements
        y[i] = (value > 0.0f) ? ((clipping > 0.0f) ? min(value, clipping) : value) : leakSlope * value;
    }
}