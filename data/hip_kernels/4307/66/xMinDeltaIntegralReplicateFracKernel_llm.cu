#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMinDeltaIntegralReplicateFracKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *yMin, const float *yMax, const float *inData, const int inDataStrideRow, const int strideH, const int strideW) {
    const int hOut = (h + strideH - 1) / strideH;
    const int wOut = (w + strideW - 1) / strideW;

    // Compute a unique thread index in the grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    const int yOut = id % wOut; id /= wOut;
    const int xOut = id % hOut; id /= hOut;
    const int &windowIdx = id;

    if (windowIdx < nWindows && xOut < hOut && yOut < wOut) {
        const int x = xOut * strideH + 1;
        const int y = yOut * strideW + 1;

        tmpArray += windowIdx * hOut * wOut;

        const int xMinInt = (int)ceil(xMin[windowIdx] - 1);

        const int yMinInt = (int)ceil(yMin[windowIdx] - 1);
        const float yMinFrac = yMinInt - yMin[windowIdx] + 1;

        const int yMaxInt = (int)floor(yMax[windowIdx]);
        const float yMaxFrac = yMax[windowIdx] - yMaxInt;

        // Retrieve integral values
        const float tlCorner = (y + yMinInt < 1 || x + xMinInt < 1) ? 0 :
            inData[max(0, min(h - 1, x + xMinInt - 1)) * inDataStrideRow +
                   max(0, min(w - 1, y + yMinInt - 1))];
        const float trCorner = (y + yMaxInt >= w || x + xMinInt < 1) ? 0 :
            inData[max(0, min(h - 1, x + xMinInt - 1)) * inDataStrideRow +
                   max(0, min(w - 1, y + yMaxInt))];

        float delta = 0;
        delta += trCorner * ((y + yMaxInt < 1) ? 1.0f : yMaxFrac);
        delta += tlCorner * ((y + yMinInt >= w) ? 1.0f : yMinFrac);

        delta += intData[max(0, min(x + xMinInt, h)) * (w + 1)
                         + max(0, min(y + yMaxInt, w))];
        delta -= intData[max(0, min(x + xMinInt - 1, h)) * (w + 1)
                         + max(0, min(y + yMaxInt, w))];
        delta -= intData[max(0, min(x + xMinInt, h)) * (w + 1)
                         + max(0, min(y + yMinInt, w))];
        delta += intData[max(0, min(x + xMinInt - 1, h)) * (w + 1)
                         + max(0, min(y + yMinInt, w))];

        delta *= (x + xMinInt >= 1 && x + xMinInt < h);
        tmpArray[xOut * wOut + yOut] *= -delta;
    }
}