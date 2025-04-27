#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleClone( const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox )
{
    // Calculate target indices
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within target boundaries and mask criteria
    if (yt < ht && xt < wt) {
        const int curt = wt * yt + xt;
        if (mask[curt] > 127.0f) {
            // Calculate background indices and ensure within boundaries
            const int yb = oy + yt, xb = ox + xt;
            if (yb < hb && xb < wb) {
                const int curb = wb * yb + xb;
                // Efficient memory operations using shared memory
                output[curb * 3 + 0] = __ldg(&target[curt * 3 + 0]);
                output[curb * 3 + 1] = __ldg(&target[curt * 3 + 1]);
                output[curb * 3 + 2] = __ldg(&target[curt * 3 + 2]);
            }
        }
    }
}