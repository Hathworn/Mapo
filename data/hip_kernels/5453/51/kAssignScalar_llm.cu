#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAssignScalar(float* dest, float alpha, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Unroll loop for better performance
    for (unsigned int i = idx; i < len; i += stride * 4) {
        dest[i] = alpha;
        if (i + stride < len) dest[i + stride] = alpha;
        if (i + 2 * stride < len) dest[i + 2 * stride] = alpha;
        if (i + 3 * stride < len) dest[i + 3 * stride] = alpha;
    }
}