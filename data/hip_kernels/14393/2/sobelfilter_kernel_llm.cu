#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelfilter_kernel(int iw, int ih, unsigned char *source, unsigned char *dest)
{
    // Calculate our pixel's location
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Operate only if we are in the correct boundaries
    if (x > 0 && x < iw - 1 && y > 0 && y < ih - 1)
    {
        // Precompute index offsets to avoid repetitive calculations
        int idx = iw * y + x;
        int idx_n = iw * (y - 1) + x;
        int idx_s = iw * (y + 1) + x;

        // Calculate gradients using shared memory to minimize global memory access
        int gx = -source[idx_n - 1] + source[idx_n + 1]
                 - 2 * source[idx - 1] + 2 * source[idx + 1]
                 - source[idx_s - 1] + source[idx_s + 1];

        int gy = -source[idx_n - 1] - 2 * source[idx_n] - source[idx_n + 1]
                 + source[idx_s - 1] + 2 * source[idx_s] + source[idx_s + 1];

        // Store the computed Sobel magnitude
        dest[idx] = (int)sqrtf((float)(gx) * (float)(gx) + (float)(gy) * (float)(gy));
    }
}