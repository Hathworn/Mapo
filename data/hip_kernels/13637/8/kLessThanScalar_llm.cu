#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLessThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global thread index
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Utilize coalesced memory access and avoid bank conflicts
    for (unsigned int i = index; i < len; i += stride) {
        target[i] = mat[i] < val ? 1.0f : 0.0f;
    }
}