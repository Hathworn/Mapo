#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;  // Use register for partial sum

    if (eidx < numElements) {
        for (uint i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
            sum += a[i] * b[i];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }
    
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];  // Reduce only once at the end
    }
}