#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init(float* xbar, float* xcur, float* xn, float* y1, float* y2, float* img, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        int baseIndex = x + w * y;  // Precompute base index
        for (int z = 0; z < nc; ++z) {
            int i = baseIndex + w * h * z;  // Use base index for each channel
            float val = img[i];
            // Coalesced writes to global memory
            xbar[i] = val;
            xn[i] = val;
            xcur[i] = val;
            y1[i] = 0.f;
            y2[i] = 0.f;
        }
    }
}