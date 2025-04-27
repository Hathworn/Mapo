```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSScaleSign_kernel(unsigned int size, float* input, float* sign, const float scale, const float beta, float* result)
{
    // Use shared memory to reduce redundant access to global memory
    extern __shared__ float shared_sign[];

    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    const unsigned int tid = threadIdx.x;

    // Load data into shared memory
    for (unsigned int i = tid; i < size; i += blockDim.x) {
        shared_sign[i] = sign[i];
    }
    __syncthreads();

    if (beta != 0.0f) {
        for (unsigned int i = index; i < size; i += stride) {
            const float sgn = (shared_sign[i] >= 0) ? 1.0f : -1.0f;
            result[i] = input[i] * sgn * scale + beta * result[i];
        }
    }
    else {
        for (unsigned int i = index; i < size; i += stride) {
            const float sgn = (shared_sign[i] >= 0) ? 1.0f : -1.0f;
            result[i] = input[i] * sgn * scale;
        }
    }
}