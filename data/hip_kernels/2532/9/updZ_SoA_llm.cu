```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updZ_SoA(float *z1, float *z2, float *f, float tz, float beta, int nx, int ny)
{
    // Calculate pixel index
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    // Ensure within valid range
    if (px < nx && py < ny)
    {
        // Pre-load f[idx] to reduce data access
        float fc = f[idx];

        // Compute the gradient conditionally
        float a = (px < nx - 1) ? f[idx + 1] - fc : 0;
        float b = (py < ny - 1) ? f[idx + nx] - fc : 0;

        // Efficiently update z
        a = z1[idx] + tz * a;
        b = z2[idx] + tz * b;

        float t = sqrtf(beta + a * a + b * b);
        t = fminf(1.0f, 1.0f / t);

        // Update z1 and z2
        z1[idx] = a * t;
        z2[idx] = b * t;
    }
}