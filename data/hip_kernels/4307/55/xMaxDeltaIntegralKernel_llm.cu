#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMaxDeltaIntegralKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMax, const float *yMin, const float *yMax) {

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int& windowIdx = id;

    if (windowIdx < nWindows) {
        tmpArray += windowIdx * h * w;

        const int yMinInt = (int)ceil(yMin[windowIdx] - 1);
        const int xMaxInt = (int)floor(xMax[windowIdx]);
        const int yMaxInt = (int)floor(yMax[windowIdx]);

        float delta = 0;

        // Use conditional operator to reduce branching
        int xOffsetMax = max(1, min(x + xMaxInt + 1, h));
        int xOffset = max(0, min(x + xMaxInt, h));
        int yOffsetMax = max(0, min(y + yMaxInt, w));
        int yOffsetMin = max(0, min(y + yMinInt, w));

        // Reduce redundant calls to intData
        delta += intData[xOffsetMax * (w + 1) + yOffsetMax];
        delta -= intData[xOffset * (w + 1) + yOffsetMax];
        delta -= intData[xOffsetMax * (w + 1) + yOffsetMin];
        delta += intData[xOffset * (w + 1) + yOffsetMin];

        delta *= (x + xMaxInt >= 1 && x + xMaxInt < h);
        tmpArray[(x - 1) * w + (y - 1)] = delta;
    }
}