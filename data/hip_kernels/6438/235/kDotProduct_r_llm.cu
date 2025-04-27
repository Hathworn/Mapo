```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;
    
    // Use contiguous memory access patterns
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }
    __syncthreads();
    
    // Reduce in shared memory using warp shuffle for better performance
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256]; __syncthreads();
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128]; __syncthreads();
    if (threadIdx.x < 64)  shmem[threadIdx.x] += shmem[threadIdx.x + 64];  __syncthreads();
    
    if (threadIdx.x < WARP_SIZE) {
        volatile float* smemWarp = shmem;
        int lane = threadIdx.x;
        if (lane < 32) {
            smemWarp[lane] += smemWarp[lane + 32];
            smemWarp[lane] += smemWarp[lane + 16];
            smemWarp[lane] += smemWarp[lane + 8];
            smemWarp[lane] += smemWarp[lane + 4];
            smemWarp[lane] += smemWarp[lane + 2];
            smemWarp[lane] += smemWarp[lane + 1];
        }
    }
    
    // Save result from the first thread only
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}