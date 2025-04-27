#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone(const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    // Calculate thread's target coordinates
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds for target region
    if (yt < ht && xt < wt) {
        const int curt = wt * yt + xt;

        // Proceed only if mask condition is met
        if (mask[curt] > 127.0f) {
            const int yb = oy + yt, xb = ox + xt;

            // Check bounds for background region
            if (yb < hb && xb < wb && yb >= 0 && xb >= 0) {
                const int curb = wb * yb + xb;

                // Perform copy of RGB values
                output[curb * 3 + 0] = target[curt * 3 + 0];
                output[curb * 3 + 1] = target[curt * 3 + 1];
                output[curb * 3 + 2] = target[curt * 3 + 2];
            }
        }
    }
}