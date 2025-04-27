#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dual(float* xn, float* xcur, float* y1, float* y2, float* img, float tau, float lambda, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        float d1, d2, val, value;
        float factor = tau * lambda;

        for (int z = 0; z < nc; z++) {
            int i = x + w * y + w * h * z;

            // Compute d1 and d2 with boundary checks
            d1 = (x + 1 < w ? y1[i] : 0.f) - (x > 0 ? y1[(x - 1) + w * y + w * h * z] : 0.f);
            d2 = (y + 1 < h ? y2[i] : 0.f) - (y > 0 ? y2[x + w * (y - 1) + w * h * z] : 0.f);

            // Temporal variable to store the calculated val
            val = xcur[i] + tau * (d1 + d2);
            value = val - img[i];

            // Simplify the value decision checks
            if (fabs(value) > factor) {
                xn[i] = val - copysignf(factor, value);  // Use copysignf for concise factor correction
            } else {
                xn[i] = img[i];
            }
        }
    }
}