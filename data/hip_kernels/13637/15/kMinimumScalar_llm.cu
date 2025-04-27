#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kMinimumScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll loop for better performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = fminf(mat[i], val);
    }
}