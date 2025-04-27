#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMaxDeltaIntegralKernel(const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMax, const float *yMin, const float *yMax) {

    int id = NUM_THREADS * blockIdx.x + threadIdx.x;
    tmpArray += id; // tmpArray now points to our output pixel

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int windowIdx = id % nWindows; id /= nWindows;
    intData += id * intDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int &batchIdx = id;

    if (batchIdx < batchSize) {
        const int yMinInt = (int)ceil(yMin[globalWindowIdx]-1);
        const int xMaxInt = (int)floor(xMax[globalWindowIdx]);
        const int yMaxInt = (int)floor(yMax[globalWindowIdx]);

        float delta = 0;
        int wx1 = max(0, min(x+xMaxInt+1, h)) * (w+1);
        int wx0 = max(0, min(x+xMaxInt, h)) * (w+1);
        int wyMax = max(0, min(y+yMaxInt, w));
        int wyMin = max(0, min(y+yMinInt, w));

        // Simplified indexing and calculation for delta
        delta += intData[wx1 + wyMax];
        delta -= intData[wx0 + wyMax];
        delta -= intData[wx1 + wyMin];
        delta += intData[wx0 + wyMin];

        delta *= (x+xMaxInt >= 1 && x+xMaxInt < h);
        *tmpArray = delta;
    }
}