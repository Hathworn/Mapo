#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zupdate(float *z, float *z0, float tau, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = x + y * nx;

    if (x < nx && y < ny)
    {
        // Unroll loop for better performance
        float a = z[2 * idx];
        float b = z[2 * idx + 1];
        float scale = 1.0f / (1.0f + tau * sqrtf(a * a + b * b));

        z[2 * idx] = (z0[2 * idx] + tau * a) * scale;
        z[2 * idx + 1] = (z0[2 * idx + 1] + tau * b) * scale;
    }
}