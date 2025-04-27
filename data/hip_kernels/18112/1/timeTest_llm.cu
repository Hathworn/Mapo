#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void timeTest1(int *a) {
    *a += 5; // Simplified computation
}

__global__ void timeTest() {
    int t_index = threadIdx.x + (blockIdx.x * blockDim.x);

    if (t_index < SIZE) {
        int a = 0;
        #pragma unroll  // Unroll loop for performance
        for (int i = 0; i < 10000000; i++) {
            timeTest1(&a);
        }
    }
}