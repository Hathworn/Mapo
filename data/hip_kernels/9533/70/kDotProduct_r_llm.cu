#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;
    
    // Loop unrolling for better memory coalescing and reducing loop overhead
    if (eidx < gridDim.x * DP_BLOCKSIZE) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE * 8) {
            sum += (eidx < numElements) ? a[eidx] * b[eidx] : 0.0f;
            if (eidx + gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + gridDim.x * DP_BLOCKSIZE] * b[eidx + gridDim.x * DP_BLOCKSIZE];
            if (eidx + 2 * gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + 2 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 2 * gridDim.x * DP_BLOCKSIZE];
            if (eidx + 3 * gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + 3 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 3 * gridDim.x * DP_BLOCKSIZE];
            if (eidx + 4 * gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + 4 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 4 * gridDim.x * DP_BLOCKSIZE];
            if (eidx + 5 * gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + 5 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 5 * gridDim.x * DP_BLOCKSIZE];
            if (eidx + 6 * gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + 6 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 6 * gridDim.x * DP_BLOCKSIZE];
            if (eidx + 7 * gridDim.x * DP_BLOCKSIZE < numElements) sum += a[eidx + 7 * gridDim.x * DP_BLOCKSIZE] * b[eidx + 7 * gridDim.x * DP_BLOCKSIZE];
        }
    }
    
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Tree-based reduction
    if (threadIdx.x < 256) { shmem[threadIdx.x] += shmem[threadIdx.x + 256]; __syncthreads(); }
    if (threadIdx.x < 128) { shmem[threadIdx.x] += shmem[threadIdx.x + 128]; __syncthreads(); }
    if (threadIdx.x < 64)  { shmem[threadIdx.x] += shmem[threadIdx.x + 64];  __syncthreads(); }
    
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Write final result of this block's contribution
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}