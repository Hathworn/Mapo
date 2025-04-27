#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMinDeltaIntegralReplicateFracKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMin, const float *inData, const int inDataStrideRow, const int strideH, const int strideW) {

    // Calculate hOut and wOut once
    const int hOut = (h + strideH - 1) / strideH;
    const int wOut = (w + strideW - 1) / strideW;

    // Use blockDim and gridDim for id calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalThreads = gridDim.x * blockDim.x; // Total number of threads

    // Iterate over all elements with stride equal to totalThreads
    for (; id < nWindows * hOut * wOut; id += totalThreads) {
        const int yOut = id % wOut; id /= wOut; // 0-indexed
        const int xOut = id % hOut; id /= hOut; // 0-indexed
        const int & windowIdx = id;

        if (windowIdx < nWindows) {

            const int x = xOut * strideH + 1;
            const int y = yOut * strideW + 1;

            float *currentTmpArray = tmpArray + windowIdx * hOut * wOut;

            const int xMinInt = static_cast<int>(ceil(xMin[windowIdx] - 1));
            const float xMinFrac = xMinInt - xMin[windowIdx] + 1;

            const int yMinInt = static_cast<int>(ceil(yMin[windowIdx] - 1));

            const int xMaxInt = static_cast<int>(floor(xMax[windowIdx]));
            const float xMaxFrac = xMax[windowIdx] - xMaxInt;

            const float tlCorner = y + yMinInt <  1 || x + xMinInt <  1 ? 
                0 : inData[max(0, min(h-1, x + xMinInt - 1)) * inDataStrideRow + max(0, min(w-1, y + yMinInt - 1))];
            const float blCorner = y + yMinInt <  1 || x + xMaxInt >= h ? 
                0 : inData[max(0, min(h-1, x + xMaxInt)) * inDataStrideRow + max(0, min(w-1, y + yMinInt - 1))];

            float delta = 0;

            delta += tlCorner * (x + xMinInt >= h ? 1.0f : xMinFrac);
            delta += blCorner * (x + xMaxInt <  1 ? 1.0f : xMaxFrac);

            delta += intData[max(0, min(x + xMaxInt, h)) * (w+1) + max(0, min(y + yMinInt, w))];
            delta -= intData[max(0, min(x + xMaxInt, h)) * (w+1) + max(0, min(y + yMinInt - 1, w))];
            delta -= intData[max(0, min(x + xMinInt, h)) * (w+1) + max(0, min(y + yMinInt, w))];
            delta += intData[max(0, min(x + xMinInt, h)) * (w+1) + max(0, min(y + yMinInt - 1, w))];

            delta *= (y + yMinInt >= 1 && y + yMinInt < w);
            currentTmpArray[xOut * wOut + yOut] *= -delta;
        }
    }
}