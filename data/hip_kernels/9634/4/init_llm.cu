#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(float* xbar, float* xcur, float* xn, float* y1, float* y2, float* img, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        int baseIdx = x + w * y;
        for (int z = 0; z < nc; z++) {
            int i = baseIdx + w * h * z;
            float val = img[i];
            xbar[i] = val; // Initialize xbar
            xn[i] = val;   // Initialize xn
            xcur[i] = val; // Initialize xcur
            y1[i] = 0.f;   // Initialize y1
            y2[i] = 0.f;   // Initialize y2
        }
    }
}