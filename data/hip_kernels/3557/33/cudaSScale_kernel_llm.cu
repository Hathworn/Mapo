#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSScale_kernel(unsigned int size, float* input, const float scale, const float shift, const float beta, float* result)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory if applicable and unroll loop if needed (max 8)
    if (beta != 0.0f) {
        #pragma unroll
        for (unsigned int i = index; i < size; i += stride) {
            result[i] = input[i] * scale + shift + beta * result[i];
        }
    }
    else {
        #pragma unroll
        for (unsigned int i = index; i < size; i += stride) {
            result[i] = input[i] * scale + shift;
        }
    }
}