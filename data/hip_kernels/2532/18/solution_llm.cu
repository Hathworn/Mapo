#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solution(float *f, float lambda, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before computation to avoid unnecessary index calculation
    if (x < nx && y < ny) {
        int idx = x + y * nx;
        f[idx] = -f[idx] * lambda;
    }
}