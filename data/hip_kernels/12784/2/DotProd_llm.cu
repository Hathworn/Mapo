#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DotProd(int *a, int *b, int *c) {
    __shared__ int temp[THREADS_PER_BLOCK];

    int x = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Calculate directly without printing debug information
    temp[threadIdx.x] = a[x] * b[x];

    __syncthreads();

    if (threadIdx.x == 0) {
        int sum = 0;
        // Use a loop unrolling technique for performance improvement
        #pragma unroll
        for (int i = 0; i < THREADS_PER_BLOCK; i++) {
            sum += temp[i];
        }

        atomicAdd(c, sum);
    }
}