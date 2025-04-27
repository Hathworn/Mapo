#include "hip/hip_runtime.h"
#include "includes.h"

// Use a kernel that does actual work for warmup
__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate global thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    // Simple dummy computation to keep GPU busy
    if (threadId % 2 == 0) {
        threadId *= threadId;
    } else {
        threadId += threadId;
    }
}