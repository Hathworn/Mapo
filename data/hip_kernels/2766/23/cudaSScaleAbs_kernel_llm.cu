#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSScaleAbs_kernel(unsigned int size, float* input, const float scale, const float beta, float* result)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned int i = index; i < size; i += stride) {
        float scaledValue = fabs(input[i]) * scale; // Common calculation factored out
        result[i] = (beta != 0.0f) ? (scaledValue + beta * result[i]) : scaledValue; // Use conditional to reduce code duplication
    }
}