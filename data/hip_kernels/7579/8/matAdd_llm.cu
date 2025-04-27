#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matAdd(int *a, int *b, int *c)
{
    // Calculate global thread index directly using grid and block dimensions
    int tID = blockIdx.z * blockDim.x * blockDim.y * gridDim.x * gridDim.y
            + blockIdx.y * blockDim.x * blockDim.y * gridDim.x
            + blockIdx.x * blockDim.x * blockDim.y
            + threadIdx.z * blockDim.x * blockDim.y
            + threadIdx.y * blockDim.x
            + threadIdx.x;

    c[tID] = a[tID] + b[tID];
}