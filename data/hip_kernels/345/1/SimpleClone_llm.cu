#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone(const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    // Compute global thread indices
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Guard check indices
    if (yt < ht && xt < wt) {
        const int curt = wt * yt + xt;
        if (mask[curt] > 127.0f) {
            const int yb = oy + yt;
            const int xb = ox + xt;
            
            // Bound check for indices
            if (yb >= 0 && yb < hb && xb >= 0 && xb < wb) {
                const int curb = wb * yb + xb;

                // Direct copy of target pixel to output
                for (int i = 0; i < 3; ++i) {
                    output[curb * 3 + i] = target[curt * 3 + i];
                }
            }
        }
    }
}