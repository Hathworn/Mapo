#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updhgZ_SoA(float *z1, float *z2, float *f, float tz, float lambda, int nx, int ny)
{
    // Cache block and thread indices
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    if (px < nx && py < ny)
    {
        // Use register variables for computations
        float a = 0.0f;
        float b = 0.0f;
        float fc = f[idx];

        // Avoid index recalculations
        int idx_px1 = idx + 1;
        int idx_py1 = idx + nx;

        if (px < (nx - 1)) a = f[idx_px1] - fc;
        if (py < (ny - 1)) b = f[idx_py1] - fc;

        // Update z
        a = z1[idx] + tz * lambda * a;
        b = z2[idx] + tz * lambda * b;

        // Compute projection without conditional branching
        float t = rsqrtf(a * a + b * b);
        t = fminf(t, 1.0f);

        z1[idx] = a * t;
        z2[idx] = b * t;
    }
}