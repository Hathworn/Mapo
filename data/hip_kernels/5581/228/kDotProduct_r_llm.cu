#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for efficiency
    if (eidx < numElements) {
        for (uint stride = gridDim.x * DP_BLOCKSIZE; eidx < numElements; eidx += stride) {
            sum += a[eidx] * b[eidx];
        }
    }
    
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimize reduction using loop unrolling
    for (uint stride = DP_BLOCKSIZE / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }
    
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}