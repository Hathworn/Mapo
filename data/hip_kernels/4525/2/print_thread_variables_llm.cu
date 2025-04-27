#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_thread_variables()
{
    // Use a local buffer to reduce printf frequency and minimize potential bottleneck
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Thread{%d,%d,%d}, Block{%d,%d,%d}, BlockDim{%d,%d,%d}, GridDim{%d,%d,%d}\n",
             threadIdx.x, threadIdx.y, threadIdx.z,
             blockIdx.x, blockIdx.y, blockIdx.z,
             blockDim.x, blockDim.y, blockDim.z,
             gridDim.x, gridDim.y, gridDim.z);

    // Output the formatted string
    printf("%s", buffer);
}