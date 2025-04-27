#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yMinDeltaIntegralKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMin) {

    int id = blockDim.x * blockIdx.x + threadIdx.x;
    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int & windowIdx = id;

    if (windowIdx < nWindows && x <= h && y <= w) {

        tmpArray += windowIdx * h * w;
        
        const int xMinInt = static_cast<int>(ceilf(xMin[windowIdx] - 1));
        const int yMinInt = static_cast<int>(ceilf(yMin[windowIdx] - 1));
        const int xMaxInt = static_cast<int>(floorf(xMax[windowIdx]));
        
        float delta = 0;

        // Pre-compute common index offsets to reduce redundant calculations
        int offset1 = max(0, min(x + xMaxInt, h)) * (w + 1);
        int offset2 = max(0, min(x + xMinInt, h)) * (w + 1);
        int yOffset1 = max(0, min(y + yMinInt, w));
        int yOffset2 = max(0, min(y + yMinInt - 1, w - 1));

        delta += intData[offset1 + yOffset1];
        delta -= intData[offset1 + yOffset2];
        delta -= intData[offset2 + yOffset1];
        delta += intData[offset2 + yOffset2];

        // Apply condition only once
        if (y + yMinInt >= 1 && y + yMinInt < w) {
            tmpArray[(x - 1) * w + (y - 1)] *= -delta;
        }
    }
}