#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void myset(unsigned long long *p, unsigned long long v, long long n) {
    // Calculate global thread index
    long long tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (tid < n) {
        p[tid] = v;  // Set value
    }
}