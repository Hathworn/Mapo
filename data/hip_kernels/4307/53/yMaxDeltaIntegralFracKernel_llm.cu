#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMaxDeltaIntegralFracKernel( const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMax, const float *inData, const int inDataStrideRow) {
    
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation
    const int totalSize = h * w;
    
    while (id < nWindows * totalSize) {  // Process more elements per block
        const int windowIdx = id / totalSize;
        int tmpID = id % totalSize;
        const int y = (tmpID % w) + 1;  // 1-indexed
        const int x = (tmpID / w) + 1;  // 1-indexed

        if (x <= h && y <= w) {
            tmpArray += windowIdx * totalSize;

            const int rem = windowIdx % 4;

            if (rem == 3) {
                tmpArray[(x - 1) * w + (y - 1)] = 0;
            } else {
                const float xMinStretched = rem == 0 ? -h : xMin[3 * (windowIdx / 4) + (rem > 0 ? (rem - 1) : rem)];
                const float xMaxStretched = rem == 1 ? h : xMax[3 * (windowIdx / 4) + (rem > 1 ? (rem - 1) : rem)];
                const float yMaxStretched = rem == 3 ? w : yMax[3 * (windowIdx / 4) + (rem > 3 ? (rem - 1) : rem)];

                const int xMinInt = (int)ceil(xMinStretched - 1);
                const float xMinFrac = xMinInt - xMinStretched + 1;

                const int xMaxInt = (int)floor(xMaxStretched);
                const float xMaxFrac = xMaxStretched - xMaxInt;

                const int yMaxInt = (int)floor(yMaxStretched);

                const float trCorner = (y + yMaxInt >= w || x + xMinInt < 1) ? 0 : inData[max(0, min(h - 1, x + xMinInt - 1)) * inDataStrideRow + max(0, min(w - 1, y + yMaxInt))];
                const float brCorner = (y + yMaxInt >= w || x + xMaxInt >= h) ? 0 : inData[max(0, min(h - 1, x + xMaxInt)) * inDataStrideRow + max(0, min(w - 1, y + yMaxInt))];

                float delta = 0;

                delta += trCorner * (x + xMinInt >= h ? 1.0f : xMinFrac);
                delta += brCorner * (x + xMaxInt < 1 ? 1.0f : xMaxFrac);

                delta += intData[max(0, min(x + xMaxInt, h)) * (w + 1) + max(0, min(y + yMaxInt + 1, w))];
                delta -= intData[max(0, min(x + xMaxInt, h)) * (w + 1) + max(0, min(y + yMaxInt, w))];
                delta -= intData[max(0, min(x + xMinInt, h)) * (w + 1) + max(0, min(y + yMaxInt + 1, w))];
                delta += intData[max(0, min(x + xMinInt, h)) * (w + 1) + max(0, min(y + yMaxInt, w))];

                delta *= (y + yMaxInt >= 1 && y + yMaxInt < w);
                tmpArray[(x - 1) * w + (y - 1)] = delta;
            }
        }

        id += gridDim.x * blockDim.x;  // Ensure all threads are used efficiently
    }
}