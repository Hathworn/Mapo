#include "hip/hip_runtime.h"

#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    extern __shared__ float shmem[]; // Use dynamic shared memory

    uint eidx = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for efficiency
    for (uint idx = eidx; idx < numElements; idx += numCols) {
        sum += a[idx] * b[idx];
    }

    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Efficient reduction loop
    for (uint s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shmem[threadIdx.x] += shmem[threadIdx.x + s];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}