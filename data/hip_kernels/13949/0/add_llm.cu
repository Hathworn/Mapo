#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c)
{
    // Use threadIdx.x to write to correct index in c
    int idx = threadIdx.x;
    if (idx == 0) {
        // Only thread 0 computes the result
        *c = a + b;
    }
}