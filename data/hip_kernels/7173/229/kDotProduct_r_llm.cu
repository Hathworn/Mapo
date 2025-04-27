#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for performance improvement
    for (uint i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
        sum += a[i] * b[i];
    }

    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduction using warp shuffles for further optimization
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        for (int offset = 16; offset > 0; offset /= 2) {
            mysh[threadIdx.x] += mysh[threadIdx.x + offset];
        }
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}