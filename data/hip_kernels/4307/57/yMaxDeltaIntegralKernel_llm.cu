#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yMaxDeltaIntegralKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMax) {

    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread id calculation
    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int &windowIdx = id;

    if (windowIdx < nWindows && x <= h && y <= w) {

        tmpArray += windowIdx * h * w;

        const int xMinInt = (int)ceil(xMin[windowIdx]-1);
        const int xMaxInt = (int)floor(xMax[windowIdx]);
        const int yMaxInt = (int)floor(yMax[windowIdx]);

        float delta = 0;

        // Precompute common index part and re-use
        int hStride = h + 1;
        int wPlus1 = w + 1;
        int xMaxLim = max(0, min(x+xMaxInt, h)) * wPlus1;
        int xMinLim = max(0, min(x+xMinInt, h)) * wPlus1;

        int yStride1 = max(1, min(y+yMaxInt+1, w));
        int yStride0 = max(0, min(y+yMaxInt, w));

        delta += intData[xMaxLim + yStride1];
        delta -= intData[xMaxLim + yStride0];
        delta -= intData[xMinLim + yStride1];
        delta += intData[xMinLim + yStride0];

        delta *= (y+yMaxInt >= 1 && y+yMaxInt < w);
        tmpArray[(x-1)*w + (y-1)] = delta;
    }
}