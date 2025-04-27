#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void myset(unsigned long long *p, unsigned long long v, long long n) {
    // Calculate global thread ID
    const long long tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread ID is within range and assign value
    if (tid < n) {
        p[tid] = v;
    }
}