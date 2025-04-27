#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone(const float *background, const float *target, const int *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    if (yt < ht && xt < wt) {
        const int curt = wt * yt + xt;
        if (mask[curt]) {
            const int yb = oy + yt, xb = ox + xt;
            // Merge condition checks to reduce branching
            if (yb >= 0 && yb < hb && xb >= 0 && xb < wb) {
                const int curb = wb * yb + xb;
                const int targetIdx = curt * 3;
                const int outputIdx = curb * 3;
                // Coalesced memory access
                output[outputIdx + 0] = target[targetIdx + 0];
                output[outputIdx + 1] = target[targetIdx + 1];
                output[outputIdx + 2] = target[targetIdx + 2];
            }
        }
    }
}