#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xMinDeltaIntegralReplicateKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *yMin, const float *yMax, const int strideH, const int strideW) {
    // Calculate hOut and wOut
    const int hOut = (h + strideH - 1) / strideH;
    const int wOut = (w + strideW - 1) / strideW;

    // Calculate unique thread index
    const int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate yOut, xOut, and windowIdx
    const int yOut = id % wOut;
    const int xOut = (id / wOut) % hOut;
    const int windowIdx = id / (wOut * hOut);

    if (windowIdx < nWindows && xOut < hOut && yOut < wOut) {
        const int x = xOut * strideH + 1;
        const int y = yOut * strideW + 1;

        // Move tmpArray pointer for the current window
        tmpArray += windowIdx * hOut * wOut;

        // Calculate integer boundaries
        const int xMinInt = (int)ceil(xMin[windowIdx] - 1);
        const int yMinInt = (int)ceil(yMin[windowIdx] - 1);
        const int yMaxInt = (int)floor(yMax[windowIdx]);

        // Initialize delta
        float delta = 0.0f;

        // Accumulate delta based on integral image
        delta += intData[max(0, min(x + xMinInt, h - 1)) * (w + 1) + max(0, min(y + yMaxInt, w))];
        delta -= intData[max(0, min(x + xMinInt - 1, h)) * (w + 1) + max(0, min(y + yMaxInt, w))];
        delta -= intData[max(0, min(x + xMinInt, h - 1)) * (w + 1) + max(0, min(y + yMinInt, w))];
        delta += intData[max(0, min(x + xMinInt - 1, h)) * (w + 1) + max(0, min(y + yMinInt, w))];

        // Conditional multiplication with delta
        if (x + xMinInt >= 1 && x + xMinInt < h) {
            tmpArray[xOut * wOut + yOut] *= -delta;
        }
    }
}