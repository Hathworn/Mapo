#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yMaxDeltaIntegralFracKernel(const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMax, const float *inData, const int inDataStrideRow, const int inDataStrideChannel) {

    int id = NUM_THREADS * blockIdx.x + threadIdx.x; 
    tmpArray += id; // tmpArray now points to our output pixel

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int windowIdx = id % nWindows; id /= nWindows;

    intData  += id * intDataStrideChannel;
    inData   += id * inDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int & batchIdx = id;

    // Guard clause for batch index
    if (batchIdx >= batchSize) {
        return;
    }

    const int xMinInt = (int)ceil(xMin[globalWindowIdx] - 1);
    const float xMinFrac = xMinInt - xMin[globalWindowIdx] + 1;

    const int xMaxInt = (int)floor(xMax[globalWindowIdx]);
    const float xMaxFrac = xMax[globalWindowIdx] - xMaxInt;

    const int yMaxInt = (int)floor(yMax[globalWindowIdx]);

    int valid;
    float delta = 0.0f;

    // Precompute conditions to avoid redundant calculations
    const bool yMaxInBounds = (y + yMaxInt < w) && (y + yMaxInt >= 0);

    if (yMaxInBounds && (x + xMinInt >= 1) && (x + xMinInt <= h)) {
        const int xMinIndex = max(0, min(h - 1, x + xMinInt - 1));
        const int yMaxIndex = max(0, min(w - 1, y + yMaxInt));
        delta += inData[xMinIndex * inDataStrideRow + yMaxIndex] * xMinFrac;
    }

    if (yMaxInBounds && (x + xMaxInt >= 0) && (x + xMaxInt < h)) {
        const int xMaxIndex = max(0, min(h - 1, x + xMaxInt));
        const int yMaxIndex = max(0, min(w - 1, y + yMaxInt));
        delta += inData[xMaxIndex * inDataStrideRow + yMaxIndex] * xMaxFrac;
    }

    delta += intData[max(0, min(x + xMaxInt, h)) * (w + 1)
                + max(0, min(y + yMaxInt + 1, w))];
    delta -= intData[max(0, min(x + xMaxInt, h)) * (w + 1)
                + max(0, min(y + yMaxInt, w))];
    delta -= intData[max(0, min(x + xMinInt, h)) * (w + 1)
                + max(0, min(y + yMaxInt + 1, w))];
    delta += intData[max(0, min(x + xMinInt, h)) * (w + 1)
                + max(0, min(y + yMaxInt, w))];

    *tmpArray = delta * yMaxInBounds; // Apply yMaxInBounds condition
}