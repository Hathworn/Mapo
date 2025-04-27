#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    extern __shared__ float shmem[];

    // Calculate global thread index
    uint eidx = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    // Unrolling loop for better memory transaction efficiency
    // Each thread computes partial dot product
    for (uint idx = eidx; idx < numElements; idx += blockDim.x * gridDim.x) {
        sum += a[idx] * b[idx];
    }
    shmem[threadIdx.x] = sum;

    __syncthreads();

    // Perform reduction in shared memory
    for (uint stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Unrolled last warp
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Write block's result to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}