#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for better performance
    if (eidx < numCols) {
        for (; eidx < numElements; eidx += numCols) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduce using sequential addressing, avoiding shared memory bank conflicts
    for (uint stride = DP_BLOCKSIZE / 2; stride >= WARP_SIZE; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Warp-level reduction without __syncthreads() for better performance
    if (threadIdx.x < WARP_SIZE) {
        volatile float* mysh = shmem;
        #pragma unroll
        for (int offset = WARP_SIZE / 2; offset > 0; offset >>= 1) {
            mysh[threadIdx.x] += mysh[threadIdx.x + offset];
        }
        // Writing final result to target
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}