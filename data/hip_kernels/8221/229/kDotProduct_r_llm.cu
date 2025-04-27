#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;  // Use register for partial sum

    // Unroll loop to improve memory access
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduce phases
    for (uint stride = DP_BLOCKSIZE / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        mysh[0] += mysh[32];
        mysh[0] += mysh[16];
        mysh[0] += mysh[8];
        mysh[0] += mysh[4];
        mysh[0] += mysh[2];
        mysh[0] += mysh[1];
    }
    
    // Write result back to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}