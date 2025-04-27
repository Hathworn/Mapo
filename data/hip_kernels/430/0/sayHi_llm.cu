#include "hip/hip_runtime.h"
#include "includes.h"

// Use __constant__ memory if necessary or optimize memory usage
__global__ void sayHi()
{
    // Utilize warp shuffle for efficient communication within thread block if needed
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    if (tid == 0) {
        // Print only once per kernel launch
        printf("Cuda Kernel Hello World.\n");
    }
}