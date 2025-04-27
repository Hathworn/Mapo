#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone(const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    // Calculate current thread position within target
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    if (yt >= ht || xt >= wt) return; // Early exit for threads outside target

    const int curt = wt * yt + xt;

    if (mask[curt] <= 127.0f) return; // Early exit if mask is not significant

    // Calculate position in the background
    const int yb = oy + yt, xb = ox + xt;
    if (yb < 0 || yb >= hb || xb < 0 || xb >= wb) return; // Early exit if outside background

    // Calculate absolute position in output
    const int curb = wb * yb + xb;

    // Copy RGB values from target to output
    #pragma unroll // Unroll loop for better performance
    for (int i = 0; i < 3; ++i) {
        output[curb * 3 + i] = target[curt * 3 + i];
    }
}