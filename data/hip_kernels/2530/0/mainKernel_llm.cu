#include "hip/hip_runtime.h"
#include "includes.h"
#define N 1
#define TPB 256

__global__ void mainKernel()
{
    // Use early return for threads not participating in the work
    if (threadIdx.x >= N) return;

    // Directly use block and thread index for efficient computation
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! My threadId is %d\n", threadId);
}