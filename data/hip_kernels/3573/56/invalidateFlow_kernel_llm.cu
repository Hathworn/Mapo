#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invalidateFlow_kernel(float *modFlowX, float *modFlowY, const float *constFlowX, const float *constFlowY, int width, int height, float cons_thres) {
    // Compute global thread index for the 2D grid
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds
    if (x < width && y < height) {
        int ind = y * width + x;  // Calculate 1D index

        // Load flow values
        float mFX = modFlowX[ind];
        float mFY = modFlowY[ind];
        float cFX = constFlowX[ind];
        float cFY = constFlowY[ind];

        // Calculate error
        float err = (mFX - cFX) * (mFX - cFX) + (mFY - cFY) * (mFY - cFY);
        err = sqrtf(err);

        // Invalidate flow if error is above threshold
        if (err > cons_thres) {
            modFlowX[ind] = nanf("");
            modFlowY[ind] = nanf("");
        } else {
            modFlowX[ind] = mFX;
            modFlowY[ind] = mFY;
        }
    }
}