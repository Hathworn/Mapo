#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMinDeltaIntegralReplicateKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMin, const int strideH, const int strideW) {

    // Calculate hOut and wOut using efficient integer division
    const int hOut = (h + strideH - 1) / strideH;
    const int wOut = (w + strideW - 1) / strideW;

    // Use advanced indexing with blockIdx and threadIdx
    int id = blockIdx.x * blockDim.x + threadIdx.x; 
    const int yOut = id % wOut; id /= wOut; 
    const int xOut = id % hOut; id /= hOut; 
    const int windowIdx = id;

    if (windowIdx < nWindows && xOut < hOut && yOut < wOut) {

        const int x = xOut * strideH + 1;
        const int y = yOut * strideW + 1;

        tmpArray += windowIdx * hOut * wOut;

        const int xMinInt = (int)ceil(xMin[windowIdx] - 1);
        const int yMinInt = (int)ceil(yMin[windowIdx] - 1);
        const int xMaxInt = (int)floor(xMax[windowIdx]);

        // Eliminate redundant branching with ternary operator and max/min clamping
        float delta = 0;

        delta += intData[max(0, min(x + xMaxInt, h)) * (w + 1) + max(0, min(y + yMinInt, w))];
        delta -= intData[max(0, min(x + xMaxInt, h)) * (w + 1) + max(0, min(y + yMinInt - 1, w - 1))];
        delta -= intData[max(0, min(x + xMinInt, h)) * (w + 1) + max(0, min(y + yMinInt, w))];
        delta += intData[max(0, min(x + xMinInt, h)) * (w + 1) + max(0, min(y + yMinInt - 1, w - 1))];

        // Use boolean multiplication for conditional operations
        delta *= (y + yMinInt >= 1 && y + yMinInt < w);
        tmpArray[xOut * wOut + yOut] *= -delta;
    }
}