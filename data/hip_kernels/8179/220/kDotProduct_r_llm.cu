#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f; // Initialize local sum

    // Loop unrolling for enhanced performance
    if (eidx + 3 * DP_BLOCKSIZE < numElements) {
        sum += a[eidx] * b[eidx];
        sum += a[eidx + DP_BLOCKSIZE] * b[eidx + DP_BLOCKSIZE];
        sum += a[eidx + 2 * DP_BLOCKSIZE] * b[eidx + 2 * DP_BLOCKSIZE];
        sum += a[eidx + 3 * DP_BLOCKSIZE] * b[eidx + 3 * DP_BLOCKSIZE];
    }

    // Write local sum to shared memory
    shmem[threadIdx.x] = sum;
    __syncthreads();
    
    // Reduce partial results in shared memory
    for (unsigned int s = DP_BLOCKSIZE / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shmem[threadIdx.x] += shmem[threadIdx.x + s];
        }
        __syncthreads();
    }
    
    // Write final result to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}