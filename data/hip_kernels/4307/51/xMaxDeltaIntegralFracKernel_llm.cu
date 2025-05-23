#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMaxDeltaIntegralFracKernel( const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMax, const float *yMin, const float *yMax, const float *inData, const int inDataStrideRow) {

    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id >= nWindows * h * w) return; // Ensure thread only operates within bounds

    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int & windowIdx = id;

    if (windowIdx < nWindows && x <= h && y <= w) {

        tmpArray += windowIdx * h * w;

        const int rem = windowIdx % 4;

        if (rem == 1) {
            tmpArray[(x-1)*w + (y-1)] = 0;
        } else {

            const float xMaxStretched = rem == 1 ?  h :
            xMax[3*(windowIdx/4) + (rem > 1 ? (rem-1) : rem)];
            const float yMinStretched = rem == 2 ? -w :
            yMin[3*(windowIdx/4) + (rem > 2 ? (rem-1) : rem)];
            const float yMaxStretched = rem == 3 ?  w :
            yMax[3*(windowIdx/4) + (rem > 3 ? (rem-1) : rem)];

            const int yMinInt = (int)ceil(yMinStretched-1);
            const float yMinFrac = yMinInt-yMinStretched+1;

            const int xMaxInt = (int)floor(xMaxStretched);
            const int yMaxInt = (int)floor(yMaxStretched);
            const float yMaxFrac = yMaxStretched-yMaxInt;

            const float blCorner = (y+yMinInt < 1 || x+xMaxInt >= h) ? 0 :
            inData[max(0, min(h-1, x+xMaxInt)) * inDataStrideRow +
            max(0, min(w-1, y+yMinInt-1))];

            const float brCorner = (y+yMaxInt >= w || x+xMaxInt >= h) ? 0 :
            inData[max(0, min(h-1, x+xMaxInt)) * inDataStrideRow +
            max(0, min(w-1, y+yMaxInt))];

            float delta = 0;

            delta += brCorner * (y+yMaxInt < 1 ? 1.0f : yMaxFrac);
            delta += blCorner * (y+yMinInt >= w ? 1.0f : yMinFrac);

            delta +=
            intData[max(0, min(x+xMaxInt+1, h))*(w+1)
            + max(0, min(y+yMaxInt, w))];
            delta -=
            intData[max(0, min(x+xMaxInt, h))*(w+1)
            + max(0, min(y+yMaxInt, w))];
            delta -=
            intData[max(0, min(x+xMaxInt+1, h))*(w+1)
            + max(0, min(y+yMinInt, w))];
            delta +=
            intData[max(0, min(x+xMaxInt, h))*(w+1)
            + max(0, min(y+yMinInt, w))];

            delta *= (x+xMaxInt >= 1 && x+xMaxInt < h);
            tmpArray[(x-1)*w + (y-1)] = delta;
        }
    }
}