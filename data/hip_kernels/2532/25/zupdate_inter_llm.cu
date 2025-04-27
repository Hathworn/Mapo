#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zupdate_inter(float *z, float tau, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure thread is within bounds before any calculations
    if (px >= nx || py >= ny) return;

    int idx = px + py * nx;
    float a = 0.0f, b = 0.0f, t;

    // Compute gradients
    if (px < nx - 1) a = z[3 * (idx + 1) + 2] - z[3 * idx + 2];
    if (py < ny - 1) b = z[3 * (idx + nx) + 2] - z[3 * idx + 2];

    // Pre-compute common expressions
    float magnitude = sqrtf(a * a + b * b);
    t = 1.0f / (1.0f + tau * magnitude);

    // Update z with computed values
    z[3 * idx + 0] = (z[3 * idx + 0] + tau * a) * t;
    z[3 * idx + 1] = (z[3 * idx + 1] + tau * b) * t;
}