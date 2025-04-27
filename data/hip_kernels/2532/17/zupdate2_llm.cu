#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zupdate2(float *z, float *f, float tau, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    if (px < nx && py < ny)
    {
        float a = 0.0f, b = 0.0f, t, fc = f[idx];

        // Use conditional operator for cleaner gradient computation
        a = (px < nx - 1) ? f[idx + 1] - fc : 0.0f;
        b = (py < ny - 1) ? f[idx + nx] - fc : 0.0f;

        // Optimize division by pre-computing reciprocal
        float norm = sqrtf(a * a + b * b);
        float tau_norm_recip = 1.0f / (1.0f + tau * norm);

        // Update z
        z[2 * idx] = (z[2 * idx] + tau * a) * tau_norm_recip;
        z[2 * idx + 1] = (z[2 * idx + 1] + tau * b) * tau_norm_recip;
    }
}