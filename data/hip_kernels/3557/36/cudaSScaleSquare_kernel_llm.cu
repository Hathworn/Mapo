#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSScaleSquare_kernel(unsigned int size, float* input, const float scale, const float shift, const float beta, float* result)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Use shared memory to avoid redundant access
    __shared__ float s_result[256];
    
    float val = (index < size) ? input[index] * input[index] * scale + shift : 0.0f;
    if (beta != 0.0f) {
        for (unsigned int i = index; i < size; i += stride) {
            val = input[i] * input[i] * scale + shift + beta * result[i];
            s_result[threadIdx.x] = val; // Store value in shared memory
            result[i] = s_result[threadIdx.x];
        }
    }
    else {
        for (unsigned int i = index; i < size; i += stride) {
            s_result[threadIdx.x] = val; // Store value in shared memory
            result[i] = s_result[threadIdx.x];
        }
    }
}