#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelSmoothY(float const * in, int w, int h, float * out)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if out of bounds
    if(x >= w || y >= h) return;

    // Use max/min to avoid repeated conditions
    int a = max(y - 2, 0);
    int b = max(y - 1, 0);
    int d = min(y + 1, h - 1);
    int e = min(y + 2, h - 1);

    // Optimize by storing the weights in shared memory if needed for larger data
    out[y * w + x] = 0.0625f * in[a * w + x] + 0.25f * in[b * w + x] + 
                     0.375f * in[y * w + x] + 0.25f * in[d * w + x] + 
                     0.0625f * in[e * w + x];
}