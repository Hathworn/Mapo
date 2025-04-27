#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Compute only for a single thread to avoid race conditions
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *c = a + b;
    }
}