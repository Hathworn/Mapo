#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SimpleClone(const float *background, const float *target, const float *mask, float *output, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox) 
{
    // Calculate thread location in grid
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid unnecessary computations
    if (yt >= ht || xt >= wt) return;
    
    const int curt = wt * yt + xt;
    if (mask[curt] > 127.0f) {
        const int yb = oy + yt, xb = ox + xt;
        
        // Check if inside valid boundary once
        if (yb >= 0 && yb < hb && xb >= 0 && xb < wb) {
            const int curb = wb * yb + xb;
            // Coalesce memory accesses for output
            for (int i = 0; i < 3; ++i) {
                output[curb * 3 + i] = target[curt * 3 + i];
            }
        }
    }
}