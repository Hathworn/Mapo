#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initActiveSlices(int* buffer, int num)
{
    // Calculate the global thread index
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Use warp divergence to ensure efficient execution
    if (i < num)
    {
        // Optimize by reducing memory access overhead
        buffer[i] = threadIdx.x + blockIdx.x * blockDim.x;
    }
}