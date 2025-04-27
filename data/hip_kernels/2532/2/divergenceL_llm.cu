#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divergenceL(float *v, float *d, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate index only once
    int idx = px + py * nx;

    // Optimize by adding boundary checks before performing operations
    if (px < nx && py < ny)
    {
        float AX = 0;

        // Utilize conditional operator to reduce branching
        AX += (px < (nx - 1)) ? v[2 * idx + 0] : 0;
        AX -= (px > 0) ? v[2 * (idx - 1) + 0] : 0;

        AX += (py < (ny - 1)) ? v[2 * idx + 1] : 0;
        AX -= (py > 0) ? v[2 * (idx - nx) + 1] : 0;

        d[idx] = AX; // Direct assignment without unnecessary check
    }
}