#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void myset(unsigned long long *p, unsigned long long v, long long n) {
    const long long tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Handle multiple assignments per thread based on stride
    for (long long i = tid; i < n; i += gridDim.x * blockDim.x) {
        p[i] = v;
    }
}