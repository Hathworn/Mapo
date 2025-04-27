#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c)
{
    // Compute only when threadIdx.x is 0 to avoid redundant writes
    if (threadIdx.x == 0) {
        *c = a + b;
    }
}