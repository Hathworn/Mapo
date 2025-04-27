#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;
    if (eidx < numElements) {
        // Unroll loop by 4 for coalesced memory access
        for (uint end = eidx + gridDim.x * DP_BLOCKSIZE * 4; eidx < min(numElements, end); eidx += gridDim.x * DP_BLOCKSIZE * 4) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
            if (eidx + gridDim.x * DP_BLOCKSIZE < numElements) shmem[threadIdx.x] += a[eidx + gridDim.x * DP_BLOCKSIZE] * b[eidx + gridDim.x * DP_BLOCKSIZE];
            if (eidx + 2 * gridDim.x * DP_BLOCKSIZE < numElements) shmem[threadIdx.x] += a[eidx + 2 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 2 * gridDim.x * DP_BLOCKSIZE];
            if (eidx + 3 * gridDim.x * DP_BLOCKSIZE < numElements) shmem[threadIdx.x] += a[eidx + 3 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 3 * gridDim.x * DP_BLOCKSIZE];
        }
    }
    __syncthreads();

    // Use loop unrolling for reduction
    for (uint stride = DP_BLOCKSIZE / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        *mysh += mysh[32];
        *mysh += mysh[16];
        *mysh += mysh[8];
        *mysh += mysh[4];
        *mysh += mysh[2];
        *mysh += mysh[1];
    }

    // Only first thread writes to target
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}