#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void primal(float *y1, float *y2, float *xbar, float sigma, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        // Unrolling the loop for improved performance
        int i;
        float x1, x2, val, norm;

        i = x + w * y;

        #pragma unroll
        for (int z = 0; z < nc; z++) {
            val = xbar[i];
            x1 = (x + 1 < w) ? (xbar[i + 1] - val) : 0.f;
            x2 = (y + 1 < h) ? (xbar[i + w] - val) : 0.f;

            x1 = y1[i] + sigma * x1;
            x2 = y2[i] + sigma * x2;

            norm = rsqrtf(fmaxf(1.f, x1 * x1 + x2 * x2)); // Use rsqrtf for reciprocal of square root

            y1[i] = x1 * norm;
            y2[i] = x2 * norm;

            i += w * h; // Increment i for next color channel
        }
    }
}