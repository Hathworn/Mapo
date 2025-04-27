#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invalidateFlow_kernel(float *modFlowX, float *modFlowY, const float *constFlowX, const float *constFlowY, int width, int height, float cons_thres) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int ind = y * width + x;  // Simplified index calculation
        float mFX = modFlowX[ind];
        float mFY = modFlowY[ind];
        float cFX = constFlowX[ind];
        float cFY = constFlowY[ind];

        // Direct computation without intermediate err variable
        float err = hypotf((mFX - cFX), (mFY - cFY));  // Use hypotf for efficient calculation

        if (err > cons_thres) {
            mFX = nanf("");
            mFY = nanf("");
        }

        modFlowX[ind] = mFX;
        modFlowY[ind] = mFY;
    }
}