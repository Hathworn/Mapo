#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMaxDeltaIntegralFracKernel( const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMax, const float *yMin, const float *yMax, const float *inData, const int inDataStrideRow, const int inDataStrideChannel) {

    int id = NUM_THREADS * blockIdx.x + threadIdx.x;
    tmpArray += id; // tmpArray now points to our output pixel

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int windowIdx = id % nWindows; id /= nWindows;

    // `id` is now is now the current global input plane number
    intData  += id * intDataStrideChannel;
    inData   += id *  inDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int & batchIdx = id;

    if (batchIdx < batchSize) {

        const int yMinInt = __float2int_rz(ceilf(yMin[globalWindowIdx]-1.0f));
        const float yMinFrac = yMinInt - yMin[globalWindowIdx] + 1.0f;

        const int xMaxInt = __float2int_rz(floorf(xMax[globalWindowIdx]));
        const int yMaxInt = __float2int_rz(floorf(yMax[globalWindowIdx]));
        const float yMaxFrac = yMax[globalWindowIdx] - yMaxInt;

        // Consolidate multiple condition checks into a single valid flag
        int xMaxValid = (x + xMaxInt >= 0) & (x + xMaxInt < h);

        int valid = (y + yMinInt >= 1) & (y + yMinInt <= w) & xMaxValid;
        const float blCorner = valid * inData[
            max(0, min(h-1, x+xMaxInt)) * inDataStrideRow +
            max(0, min(w-1, y+yMinInt-1))];

        valid = (y + yMaxInt >= 0) & (y + yMaxInt < w) & xMaxValid;
        const float brCorner = valid * inData[
            max(0, min(h-1, x+xMaxInt)) * inDataStrideRow +
            max(0, min(w-1, y+yMaxInt))];

        float delta = 0;

        delta += brCorner * yMaxFrac;
        delta += blCorner * yMinFrac;

        // Optimize boundary checks by pre-computing indices
        int upperX = max(0, min(x + xMaxInt + 1, h));
        int lowerX = max(0, min(x + xMaxInt, h));
        int upperY = max(0, min(y + yMaxInt, w));
        int lowerY = max(0, min(y + yMinInt, w));

        delta += intData[upperX * (w + 1) + upperY];
        delta -= intData[lowerX * (w + 1) + upperY];
        delta -= intData[upperX * (w + 1) + lowerY];
        delta += intData[lowerX * (w + 1) + lowerY];

        delta *= xMaxValid;
        *tmpArray = delta;
    }
}
```
