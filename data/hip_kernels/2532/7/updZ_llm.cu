#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updZ(float *z, float *f, float tz, float beta, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    if (px < nx && py < ny)
    {
        float a = 0.0f, b = 0.0f;

        // Compute the gradient only if within bounds
        if (px < (nx - 1)) a = f[idx + 1] - f[idx];
        if (py < (ny - 1)) b = f[idx + nx] - f[idx];

        // Update z using the gradient and normalize
        a = z[2 * idx] + tz * a;
        b = z[2 * idx + 1] + tz * b;

        float t = sqrtf(beta + a * a + b * b);
        t = (t < 1.0f) ? 1.0f : 1.0f / t;

        z[2 * idx] = a * t;
        z[2 * idx + 1] = b * t;
    }
}