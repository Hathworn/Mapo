#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void solution_dummy(float *f, float lambda, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = x + y * nx;

    // Ensure thread operates within bounds first
    if (x < nx && y < ny) {
        // Load from global memory to register for faster access
        float temp = f[idx];
        f[idx] = -temp * lambda;
    }
}