#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int* s) {
    // Load value into shared memory
    s[threadIdx.x] = p;

    // Ensure all values are written
    __syncthreads();

    // Perform reduction using warp shuffle
    unsigned int sum = p;
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        sum += __shfl_down_sync(0xFFFFFFFF, sum, offset);
    }

    // Store the result in shared memory for the first thread
    if (threadIdx.x % warpSize == 0)
        s[threadIdx.x] = sum;

    // Sync threads and return reduction result for first thread in warp
    __syncthreads();
    return s[0];
}

__global__ void reduce(unsigned int* d_out_shared, const unsigned int* d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}