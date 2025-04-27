#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mykernel(void) {
    // Combine printf statements for efficiency
    int global_id = threadIdx.x + blockIdx.x * blockDim.x; // Precompute global id
    printf("Block id: %d, Thread id: %d, Global id: %d\n", blockIdx.x, threadIdx.x, global_id);
}