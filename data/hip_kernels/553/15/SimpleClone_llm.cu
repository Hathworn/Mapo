#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone(const float *background, const float *target, const int *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    // Calculate thread position
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if out of bounds
    if (yt >= ht || xt >= wt) return;

    const int curt = wt * yt + xt;

    // Proceed if the mask is non-zero
    if (mask[curt]) {
        const int yb = oy + yt, xb = ox + xt;
        const int curb = wb * yb + xb;

        // Only proceed with memory operations if indices are in bounds
        if (yb >= 0 && yb < hb && xb >= 0 && xb < wb) {
            // Vectorize the output assignments
            float3 temp = *((float3*)&target[curt * 3]);
            *((float3*)&output[curb * 3]) = temp;
        }
    }
}