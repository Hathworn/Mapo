#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xMinDeltaIntegralFracKernel(const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMin, const float *yMin, const float *yMax, const float *inData, const int inDataStrideRow, const int inDataStrideChannel) {
    int id = NUM_THREADS * blockIdx.x + threadIdx.x;
    tmpArray += id; // tmpArray now points to our output pixel

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int windowIdx = id % nWindows; id /= nWindows;

    // `id` is now the current global input plane number
    intData  += id * intDataStrideChannel;
    inData += id * inDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int & batchIdx = id;

    if (batchIdx < batchSize) {
        const int xMinInt = (int)ceil(xMin[globalWindowIdx]-1);

        const int yMinInt = (int)ceil(yMin[globalWindowIdx]-1);
        const float yMinFrac = yMinInt-yMin[globalWindowIdx]+1;

        const int yMaxInt = (int)floor(yMax[globalWindowIdx]);
        const float yMaxFrac = yMax[globalWindowIdx]-yMaxInt;

        bool valid = (y+yMinInt >= 1) & (y+yMinInt <= w) & (x+xMinInt >= 1);
        
        // Optimize memory access by avoiding repeated calculations
        int validYMin = max(0,min(h-1,x+xMinInt-1)) * inDataStrideRow + max(0,min(w-1,y+yMinInt-1));
        int validYMax = max(0,min(h-1,x+xMinInt-1)) * inDataStrideRow + max(0,min(w-1,y+yMaxInt));

        const float tlCorner = valid * inData[validYMin];
        const float trCorner = valid & (y+yMaxInt >= 0) & (y+yMaxInt < w) ? inData[validYMax] : 0;
        
        float delta = 0;

        delta += trCorner * yMaxFrac;
        delta += tlCorner * yMinFrac;
        
        // Reduce redundant calculations by storing indices
        int idx1 = max(0,min(x+xMinInt  , h))*(w+1) + max(0,min(y+yMaxInt  , w));
        int idx2 = max(0,min(x+xMinInt-1, h))*(w+1) + max(0,min(y+yMaxInt  , w));
        int idx3 = max(0,min(x+xMinInt  , h))*(w+1) + max(0,min(y+yMinInt  , w));
        int idx4 = max(0,min(x+xMinInt-1, h))*(w+1) + max(0,min(y+yMinInt  , w));

        delta += intData[idx1];
        delta -= intData[idx2];
        delta -= intData[idx3];
        delta += intData[idx4];

        delta *= (x+xMinInt >= 1) & (x+xMinInt <= h);
        *tmpArray = -delta;
    }
}