#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solution2(float *f, float lambda, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensuring index is valid before calculating idx
    if (x < nx && y < ny) {
        int idx = x + y * nx;
        f[idx] = -f[idx] * lambda;
    }
}