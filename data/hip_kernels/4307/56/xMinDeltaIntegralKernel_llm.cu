#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMinDeltaIntegralKernel( const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *yMin, const float *yMax) {

    int id = BLOCK_SIZE * BLOCK_SIZE * blockIdx.x + threadIdx.x;
    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int & windowIdx = id;

    if (windowIdx < nWindows && x <= h && y <= w) {

        tmpArray += windowIdx * h * w;

        const int xMinInt = (int)ceil(xMin[windowIdx] - 1);
        const int yMinInt = (int)ceil(yMin[windowIdx] - 1);
        const int yMaxInt = (int)floor(yMax[windowIdx]);

        float delta = 0;

        // Optimize memory access by reducing duplicated calculations
        const int xIndexPos = max(0, min(x + xMinInt, h - 1)) * (w + 1);
        const int xIndexNeg = max(0, min(x + xMinInt - 1, h)) * (w + 1);
        const int yIndexMax = max(0, min(y + yMaxInt, w));
        const int yIndexMin = max(0, min(y + yMinInt, w));

        delta += intData[xIndexPos + yIndexMax];
        delta -= intData[xIndexNeg + yIndexMax];
        delta -= intData[xIndexPos + yIndexMin];
        delta += intData[xIndexNeg + yIndexMin];

        if(x + xMinInt >= 1 && x + xMinInt < h) {
            tmpArray[(x-1) * w + (y-1)] *= -delta;  // Combine condition check with array update
        }
    }
}