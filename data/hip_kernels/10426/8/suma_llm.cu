#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel function using shared memory
__global__ void suma(int a, int b, int *c) {
    extern __shared__ int temp[];
    int threadId = threadIdx.x;

    if (threadId == 0) {
        temp[0] = a;
        temp[1] = b;
    }
    __syncthreads();

    if (threadId == 0) {
        *c = temp[0] + temp[1];
    }
}