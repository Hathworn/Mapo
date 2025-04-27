#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMinDeltaIntegralFracKernel(const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMin, const float *inData, const int inDataStrideRow, const int inDataStrideChannel) {

    int id = NUM_THREADS * blockIdx.x + threadIdx.x;
    tmpArray += id; // tmpArray now points to our output pixel

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int windowIdx = id % nWindows; id /= nWindows;

    intData += id * intDataStrideChannel;
    inData += id * inDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int & batchIdx = id;

    if (batchIdx < batchSize) {
        const int xMinInt = (int)ceil(xMin[globalWindowIdx] - 1);
        const float xMinFrac = xMinInt - xMin[globalWindowIdx] + 1;

        const int yMinInt = (int)ceil(yMin[globalWindowIdx] - 1);

        const int xMaxInt = (int)floor(xMax[globalWindowIdx]);
        const float xMaxFrac = xMax[globalWindowIdx] - xMaxInt;

        int valid;

        // Optimize bounds checking and indexing
        valid = not (y + yMinInt < 1) & not (x + xMinInt < 1) & not (x + xMinInt > h);
        const int tlIndexRow = max(0, min(h - 1, x + xMinInt - 1));
        const int tlIndexCol = max(0, min(w - 1, y + yMinInt - 1));
        const float tlCorner = valid * inData[tlIndexRow * inDataStrideRow + tlIndexCol];

        valid = not (y + yMinInt < 1) & not (x + xMaxInt < 0) & not (x + xMaxInt >= h);
        const int blIndexRow = max(0, min(h - 1, x + xMaxInt));
        const int blIndexCol = tlIndexCol; // Same col as tlCorner
        const float blCorner = valid * inData[blIndexRow * inDataStrideRow + blIndexCol];

        // Reduce redundant calculations
        const int intDataRow_xMax = max(0, min(x + xMaxInt, h)) * (w + 1);
        const int intDataRow_xMin = max(0, min(x + xMinInt, h)) * (w + 1);

        float delta = 0;
        delta += tlCorner * xMinFrac;
        delta += blCorner * xMaxFrac;

        delta += intData[intDataRow_xMax + max(0, min(y + yMinInt, w))];
        delta -= intData[intDataRow_xMax + max(0, min(y + yMinInt - 1, w))];
        delta -= intData[intDataRow_xMin + max(0, min(y + yMinInt, w))];
        delta += intData[intDataRow_xMin + max(0, min(y + yMinInt - 1, w))];

        delta *= (y + yMinInt >= 1) & (y + yMinInt <= w);
        *tmpArray = -delta;
    }
}