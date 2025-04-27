#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to cover the entire array
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = mat[i] > val; // Direct computation without branching
    }
}