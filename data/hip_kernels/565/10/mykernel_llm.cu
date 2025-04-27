#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel() {
    // Use thread and block indices to ensure unique output per thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world from device! Thread id: %d\n", idx);
} /* end kernel */