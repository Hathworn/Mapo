#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplySigmoid(float* mat, float* target, unsigned int len) {
    // Calculate global index for current thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for better parallelism
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = 1.0f / (1.0f + __expf(-mat[i]));  // Use float literals for precision
    }
}