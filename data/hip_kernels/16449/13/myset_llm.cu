#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void myset(unsigned long long *p, unsigned long long v, long long n) {
    // Cache block and thread id computation
    const long long tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a loop to allow threads to handle multiple elements
    for (long long i = tid; i < n; i += blockDim.x * gridDim.x) {
        p[i] = v;
    }
}