#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalizeLab_kernel(uint width, uint height, float* devL, float* devA, float* devB) {
    // Compute global thread indices
    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if within image bounds
    if ((x0 < width) && (y0 < height)) {
        int index = y0 * width + x0;

        const float ab_min = -73;
        const float ab_max = 95;
        const float ab_range = ab_max - ab_min;

        // Normalize Lab image
        float l_val = fminf(fmaxf(devL[index] / 100.0f, 0.0f), 1.0f);
        float a_val = fminf(fmaxf((devA[index] - ab_min) / ab_range, 0.0f), 1.0f);
        float b_val = fminf(fmaxf((devB[index] - ab_min) / ab_range, 0.0f), 1.0f);

        devL[index] = l_val;
        devA[index] = a_val;
        devB[index] = b_val;
    }
}