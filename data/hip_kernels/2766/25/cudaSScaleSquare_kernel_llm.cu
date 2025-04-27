#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSScaleSquare_kernel(unsigned int size, float* input, const float scale, const float shift, const float beta, float* result)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimize by reducing branching
    float betaFactor = (beta != 0.0f) ? beta : 0.0f;

    for (unsigned int i = index; i < size; i += stride) {
        float val = input[i] * input[i] * scale + shift;
        result[i] = (beta != 0.0f) ? (val + beta * result[i]) : val;
    }
}