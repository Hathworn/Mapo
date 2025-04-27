#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideScalar(float* mat, float alpha, float* dest, unsigned int len) {
    // Use a single ID calculation to reduce redundancy
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride looping to improve memory coalescing
    unsigned int stride = gridDim.x * blockDim.x;
    while (i < len) {
        dest[i] = mat[i] / alpha;
        i += stride;
    }
}