#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Calculate unique thread index within the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform vector addition in parallel, avoid race condition
    if (idx == 0) {
        *c = *a + *b;
    }
}