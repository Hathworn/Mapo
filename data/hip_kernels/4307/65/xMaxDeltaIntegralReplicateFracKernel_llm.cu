#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xMaxDeltaIntegralReplicateFracKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMax, const float *yMin, const float *yMax, const float *inData, const int inDataStrideRow, const int strideH, const int strideW) {
    // Define hOut and wOut using blockDim.x for better thread utilization
    const int hOut = (h + strideH - 1) / strideH;
    const int wOut = (w + strideW - 1) / strideW;

    int id = blockDim.x * blockDim.y * blockIdx.x + threadIdx.x;
    const int yOut = id % wOut; id /= wOut; // 0-indexed
    const int xOut = id % hOut; id /= hOut; // 0-indexed
    const int &windowIdx = id;

    if (windowIdx < nWindows && xOut < hOut && yOut < wOut) {
        const int x = xOut * strideH + 1;
        const int y = yOut * strideW + 1;

        tmpArray += windowIdx * hOut * wOut;

        const int yMinInt = (int)ceilf(yMin[windowIdx] - 1);
        const float yMinFrac = yMinInt - yMin[windowIdx] + 1;

        const int xMaxInt = (int)floorf(xMax[windowIdx]);

        const int yMaxInt = (int)floorf(yMax[windowIdx]);
        const float yMaxFrac = yMax[windowIdx] - yMaxInt;

        const float blCorner = (y + yMinInt < 1 || x + xMaxInt >= h) ? 0 : inData[max(0, min(h - 1, x + xMaxInt)) * inDataStrideRow + max(0, min(w - 1, y + yMinInt - 1))];
        const float brCorner = (y + yMaxInt >= w || x + xMaxInt >= h) ? 0 : inData[max(0, min(h - 1, x + xMaxInt)) * inDataStrideRow + max(0, min(w - 1, y + yMaxInt))];

        float delta = 0;

        delta += brCorner * ((y + yMaxInt < 1) ? 1.0f : yMaxFrac);
        delta += blCorner * ((y + yMinInt >= w) ? 1.0f : yMinFrac);

        delta += intData[max(0, min(x + xMaxInt + 1, h)) * (w + 1) + max(0, min(y + yMaxInt, w))];
        delta -= intData[max(0, min(x + xMaxInt, h)) * (w + 1) + max(0, min(y + yMaxInt, w))];
        delta -= intData[max(0, min(x + xMaxInt + 1, h)) * (w + 1) + max(0, min(y + yMinInt, w))];
        delta += intData[max(0, min(x + xMaxInt, h)) * (w + 1) + max(0, min(y + yMinInt, w))];

        delta *= (x + xMaxInt >= 1 && x + xMaxInt < h);
        tmpArray[xOut * wOut + yOut] = delta;
    }
}