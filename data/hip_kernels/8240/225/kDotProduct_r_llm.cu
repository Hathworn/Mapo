#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Optimization: Use warp-synchronous mechanism for efficiency
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        shmem[threadIdx.x] += a[eidx] * b[eidx];
    }
    __syncthreads();

    if (threadIdx.x < 32) {
        // Unroll final accumulation to fit within a warp
        volatile float* mysh = &shmem[threadIdx.x];
        mysh[0] += mysh[32] + mysh[16] + mysh[8] + mysh[4] + mysh[2] + mysh[1];
        
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}