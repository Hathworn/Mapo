#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to cache the 'floor' value across threads.
__global__ void floorByScalar(int n, float *a, float b, float *result) {
    extern __shared__ float shared[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load floor into shared memory once per block.
    if (threadIdx.x == 0) {
        shared[0] = b;
    }
    __syncthreads();

    // Perform floor operation using shared memory cache.
    if (i < n) {
        float floor = shared[0];
        result[i] = a[i] > floor ? a[i] : floor;
    }
}