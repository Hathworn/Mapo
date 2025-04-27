#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solution_SoA(float *f, float lambda, int nx, int ny)
{
    // Cache calculations in registers
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < nx && y < ny) {
        int idx = x + y * nx; // Move index calculation inside the condition
        f[idx] = -f[idx] * lambda;
    }
}