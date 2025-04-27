#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sub0(float *div0, float *div, float *g, float lambda, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < nx && y < ny)
    {
        int idx = x + y * nx; // Calculate index only for valid threads
        div[idx] = div0[idx] - g[idx] / lambda; // Perform the calculation
    }
}