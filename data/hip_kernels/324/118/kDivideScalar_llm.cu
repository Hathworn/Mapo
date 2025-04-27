#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideScalar(float* __restrict__ mat, float alpha, float* __restrict__ dest, unsigned int len) {
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling and using fewer threads for data access optimization
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        dest[idx] = mat[idx] / alpha;
    }
}