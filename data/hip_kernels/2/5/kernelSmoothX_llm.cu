#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelSmoothX(float *in, int w, int h, float *out)
{
    // Calculate global thread indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the thread is within bounds
    if (x >= w || y >= h) return;

    // Precompute row index
    int idx = y * w;

    // Calculate neighboring indices and clamp them
    int a = max(0, x - 2);
    int b = max(0, x - 1);
    int d = min(w - 1, x + 1);
    int e = min(w - 1, x + 2);

    // Perform the weighted sum to smooth
    out[idx + x] = 0.0625f * in[idx + a] + 0.25f * in[idx + b] + 0.375f * in[idx + x] + 0.25f * in[idx + d] + 0.0625f * in[idx + e];
}