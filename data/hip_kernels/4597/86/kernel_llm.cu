#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, size_t N)
{
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    __shared__ float s[BS];
    float sum = 0.0f;
    
    int off = bid * blockDim.x + tid;
    if (off < N) {
        s[tid] = a[off];
    } else {
        s[tid] = 0.0f; // Avoid out-of-bound access
    }
    __syncthreads();
    
    // Optimize reduction to avoid bank conflicts
    for (int skip = blockDim.x / 2; skip > 0; skip >>= 1) {
        if (tid < skip && tid + skip < N) {
            s[tid] += s[tid + skip];
        }
        __syncthreads();
    }
    
    if (tid == 0) {
        atomicAdd(&a[0], s[0]); // Use atomic operation to accumulate result
    }
}