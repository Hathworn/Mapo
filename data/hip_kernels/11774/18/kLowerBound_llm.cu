#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLowerBound(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to efficiently utilize GPU resources
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        // Use max function for clarity and potential performance gain
        target[i] = fmaxf(mat1[i], mat2[i]);
    }
}