#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone(const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    // Calculate target indices
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    if (yt >= ht || xt >= wt) return;  // Exit early if out of bounds

    const int curt = wt * yt + xt;

    // Early exit if mask condition is not met
    if (mask[curt] <= 127.0f) return;

    // Calculate background indices
    const int yb = oy + yt, xb = ox + xt;
    if (yb < 0 || yb >= hb || xb < 0 || xb >= wb) return;  // Exit early if out of bounds

    const int curb = wb * yb + xb;

    // Directly copy target values to output
    output[curb * 3 + 0] = target[curt * 3 + 0];
    output[curb * 3 + 1] = target[curt * 3 + 1];
    output[curb * 3 + 2] = target[curt * 3 + 2];
}