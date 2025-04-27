#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSEuclideanSumBackward_kernel(unsigned int size, float* diffInput, float* input, float* output, const float scale, const float beta, float* result)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use a single loop with conditional operator for beta to avoid code duplication
    for (unsigned int i = index; i < size; i += stride) {
        if (output[i] != 0.0f) {
            result[i] = diffInput[i] * scale * (input[i] / output[i]) + beta * result[i];
        } else {
            result[i] *= beta;
        }
    }
}