#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void SimpleClone(const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox)
{
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary and mask check combined to reduce conditional checks
    if (yt < ht && xt < wt) {
        const int curt = wt * yt + xt;
        if (mask[curt] > 127.0f) {
            const int yb = oy + yt, xb = ox + xt;
            if (yb < hb && xb < wb) {
                const int curb = wb * yb + xb;
                // Unrolling loop to improve instruction-level parallelism
                #pragma unroll
                for (int i = 0; i < 3; ++i) {
                    output[curb * 3 + i] = target[curt * 3 + i];
                }
            }
        }
    }
}