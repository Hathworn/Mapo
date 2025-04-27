#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use device memory to avoid bank conflicts and improve memory throughput
    __shared__ int temp;
    temp = a + b;
    // Ensure all threads have finished computing
    __syncthreads();
    if (threadIdx.x == 0) {
        *c = temp;
    }
}