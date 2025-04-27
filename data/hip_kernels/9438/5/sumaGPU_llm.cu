#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumaGPU(int a, int b, int *sol) {
    // Use shared memory to reduce global memory access latency
    __shared__ int tempResult;
    int threadId = threadIdx.x;

    if (threadId == 0) {
        tempResult = a + b;
    }
    __syncthreads();

    if (threadId == 0) {
        *sol = tempResult;
    }
}