#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThanEqScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate over elements with a stride equal to total number of threads
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = mat[i] <= val; // Perform comparison and store result
    }
}