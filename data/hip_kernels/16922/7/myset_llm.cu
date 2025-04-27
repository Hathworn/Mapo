#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void myset(unsigned long long *p, unsigned long long v, long long n) {
    // Calculate global thread ID
    const long long tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop to increase efficiency
    if (tid < n) {
        p[tid] = v;
        if (tid + blockDim.x < n) p[tid + blockDim.x] = v;
        if (tid + 2 * blockDim.x < n) p[tid + 2 * blockDim.x] = v;
        if (tid + 3 * blockDim.x < n) p[tid + 3 * blockDim.x] = v;
    }
}