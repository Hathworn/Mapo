#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Calculate the linear index directly for improved memory access
    unsigned int idx = blockIdx.y * blockDim.y * nx + blockIdx.x * blockDim.x + threadIdx.y * nx + threadIdx.x;

    if (threadIdx.x + blockIdx.x * blockDim.x < nx && threadIdx.y + blockIdx.y * blockDim.y < ny)
    {
        out[idx] = in[idx];
    }
}