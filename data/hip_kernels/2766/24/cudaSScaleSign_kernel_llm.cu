#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSScaleSign_kernel(unsigned int size, float* input, float* sign, const float scale, const float beta, float* result)
{
    // Determine global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce redundant computation
    __shared__ float shared_scale;
    __shared__ float shared_beta;
    if(threadIdx.x == 0) {
        shared_scale = scale;
        shared_beta = beta;
    }
    __syncthreads();

    // Kernel operation with conditional logic outside loop
    for (unsigned int i = index; i < size; i += stride) {
        const float sgn = (sign[i] >= 0) ? 1.0f : -1.0f;
        float scaled_input = input[i] * sgn * shared_scale; // Precompute scaled input
        
        // Simplify conditional within loop
        if (shared_beta != 0.0f) {
            result[i] = scaled_input + shared_beta * result[i];
        } else {
            result[i] = scaled_input;
        }
    }
}