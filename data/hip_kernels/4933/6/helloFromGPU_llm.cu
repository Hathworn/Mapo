#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    printf("Hello from GPU - global thread idx: %d\n", idx); // Use global index for efficient logging
}