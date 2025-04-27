#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Preload loop into registers for reduction
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Unrolled loop to reduce within shared memory using warp shuffle
    if (threadIdx.x < WARP_SIZE) {
        volatile float* mysh = &shmem[threadIdx.x];
        mysh[0] += mysh[32];
        mysh[0] += mysh[16];
        mysh[0] += mysh[8];
        mysh[0] += mysh[4];
        mysh[0] += mysh[2];
        mysh[0] += mysh[1];
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}