#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void add(int a, int b, int *c) {
    // Use thread 0 of block 0 to perform the addition to optimize for minimal launch overhead 
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *c = a + b;
    }
}