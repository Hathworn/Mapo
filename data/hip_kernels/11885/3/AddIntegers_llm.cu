#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddIntegers(int *a, int *b)
{
    // Use thread index to allow for potential parallel execution
    int idx = threadIdx.x;
    if(idx == 0) {
        a[0] += b[0];
    }
}