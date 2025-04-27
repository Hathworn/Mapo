#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void extrapolate(float* xbar, float* xcur, float* xn, float theta, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;
    int z, i;

    // Check boundary conditions for x and y
    if (x < w && y < h) {
        // Loop unrolling optimization for better performance
        for (z = 0; z < nc; z++) {
            i = x + w * (y + h * z);
            float xn_val = xn[i];  // Cache xn value to reduce memory access
            float diff = xn_val - xcur[i];  // Compute the difference once
            xbar[i] = xn_val + theta * diff;  // Use cached values
            xcur[i] = xn_val;
        }
    }
}