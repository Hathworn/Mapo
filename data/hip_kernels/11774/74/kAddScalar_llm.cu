#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddScalar(float* a, float alpha, float* dest, unsigned int numEls) {
    // Use a single thread stride loop for improved warp efficiency
    for (unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = a[i] + alpha;
    }
}