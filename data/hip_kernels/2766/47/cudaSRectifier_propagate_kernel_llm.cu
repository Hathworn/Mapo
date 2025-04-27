#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSRectifier_propagate_kernel(float* x, float* y, unsigned int size, float leakSlope, int shifting, float clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use grid-stride loop for better parallelism
    for (unsigned int i = index; i < size; i += stride) {
        float value = x[i];

        // Use fast integer operations for shifting
        value = (shifting > 0) ? (value / (1 << shifting)) : ((shifting < 0) ? (value * (1 << (-shifting))) : value);

        // Combine conditional statements for efficiency
        y[i] = (value > 0.0f) ? ((clipping > 0.0f) ? min(value, clipping) : value) : (leakSlope * value);
    }
}