```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use shared memory to reduce global memory writes
    __shared__ int result;
    result = a + b;
    __syncthreads();
    if (threadIdx.x == 0) {
        *c = result;
    }
}