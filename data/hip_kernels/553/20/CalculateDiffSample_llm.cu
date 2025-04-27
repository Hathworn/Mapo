#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalculateDiffSample( float *cur, float *pre, const int wts, const int hts ){
    // Calculate global thread index
    const int yts = blockIdx.y * blockDim.y + threadIdx.y;
    const int xts = blockIdx.x * blockDim.x + threadIdx.x;
    const int curst = wts * yts + xts;

    // Use if condition to ensure threads within bounds execute
    if (yts < hts && xts < wts) {
        // Use registers to reduce redundant memory access
        float pre_val_0 = pre[curst*3+0];
        float pre_val_1 = pre[curst*3+1];
        float pre_val_2 = pre[curst*3+2];

        cur[curst*3+0] -= pre_val_0;
        cur[curst*3+1] -= pre_val_1;
        cur[curst*3+2] -= pre_val_2;

        // Zero out 'pre' values directly
        pre[curst*3+0] = 0.0f;
        pre[curst*3+1] = 0.0f;
        pre[curst*3+2] = 0.0f;
    }
}