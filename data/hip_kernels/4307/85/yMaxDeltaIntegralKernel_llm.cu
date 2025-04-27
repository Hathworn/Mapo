#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMaxDeltaIntegralKernel( const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMax) {

    int id = NUM_THREADS * blockIdx.x + threadIdx.x;
    tmpArray += id; // tmpArray now points to our output pixel

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int windowIdx = id % nWindows; id /= nWindows;

    // `id` is now is now the current global input plane number
    intData  += id * intDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int & batchIdx = id;

    if (batchIdx < batchSize) {

        const int xMinInt = (int)ceil(xMin[globalWindowIdx]-1);
        const int xMaxInt = (int)floor(xMax[globalWindowIdx]);
        const int yMaxInt = (int)floor(yMax[globalWindowIdx]);

        // Precalculate indices for efficiency
        int idx1 = max(0, min(x + xMaxInt, h)) * (w + 1);
        int idx2 = max(0, min(x + xMinInt, h)) * (w + 1);
        int ym1 = max(0, min(y + yMaxInt, w));
        int ym2 = max(0, min(y + yMaxInt + 1, w));

        float delta = 0;
        
        // Simplified access to intData to improve performance
        delta += intData[idx1 + ym2];
        delta -= intData[idx1 + ym1];
        delta -= intData[idx2 + ym2];
        delta += intData[idx2 + ym1];

        delta *= (y + yMaxInt >= 1 && y + yMaxInt < w);
        *tmpArray = delta;
    }
}