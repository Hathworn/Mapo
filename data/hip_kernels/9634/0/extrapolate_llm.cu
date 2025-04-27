#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void extrapolate(float* xbar, float* xcur, float* xn, float theta, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        int baseIndex = x + w * y; // Precompute 2D index

        for (int z = 0; z < nc; z++) {
            int i = baseIndex + w * h * z; // Compute 3D index
            float currentXn = xn[i]; // Cache xn[i] value
            xbar[i] = currentXn + theta * (currentXn - xcur[i]); // Optimize calculation
            xcur[i] = currentXn;
        }
    }
}