#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addDiffuseKernel(float *data, int x, int y, float pressure)
{
    // Calculate global index to eliminate redundant memory access
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index == 0) {
        // Use pre-calculated index to update data
        data[NX * x + y] += pressure;
    }
}