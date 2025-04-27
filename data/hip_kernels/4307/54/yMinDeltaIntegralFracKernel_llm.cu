#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yMinDeltaIntegralFracKernel(const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMin, const float *inData, const int inDataStrideRow) {

    int id = BLOCK_SIZE * BLOCK_SIZE * blockIdx.x + threadIdx.x;
    const int y = id % w + 1; id /= w; // 1-indexed
    const int x = id % h + 1; id /= h; // 1-indexed
    const int & windowIdx = id;

    if (windowIdx < nWindows and x <= h and y <= w) {

        tmpArray += windowIdx * h * w;

        const int rem = windowIdx % 4;

        if (rem == 2) {
            tmpArray[(x-1)*w + (y-1)] = 0;
        } else {

            const float xMinStretched = rem == 0 ? -h :
                                        xMin[3*(windowIdx/4) + (rem > 0 ? (rem-1) : rem)];
            const float xMaxStretched = rem == 1 ?  h :
                                        xMax[3*(windowIdx/4) + (rem > 1 ? (rem-1) : rem)];
            const float yMinStretched = rem == 2 ? -w :
                                        yMin[3*(windowIdx/4) + (rem > 2 ? (rem-1) : rem)];

            // Use registers for frequently accessed variables
            const int xMinInt = (int)ceil(xMinStretched-1);
            const float xMinFrac = xMinInt-xMinStretched+1;

            const int yMinInt = (int)ceil(yMinStretched-1);

            const int xMaxInt = (int)floor(xMaxStretched);
            const float xMaxFrac = xMaxStretched-xMaxInt;

            // Simplify boundary access calculations
            const int xMinIndex = max(0, min(h-1, x+xMinInt-1)) * inDataStrideRow;
            const int xMaxIndex = max(0, min(h-1, x+xMaxInt  )) * inDataStrideRow;
            const int yMinIndex = max(0, min(w-1, y+yMinInt-1));

            const float tlCorner = (y+yMinInt < 1 || x+xMinInt < 1) ? 
                                    0 : inData[xMinIndex + yMinIndex];
            const float blCorner = (y+yMinInt < 1 || x+xMaxInt >= h) ? 
                                    0 : inData[xMaxIndex + yMinIndex];

            float delta = 0;

            delta += tlCorner * (x+xMinInt >= h ? 1.0f : xMinFrac);
            delta += blCorner * (x+xMaxInt <  1 ? 1.0f : xMaxFrac);

            // Reduce repeated computation
            const int xMax1 = max(0, min(x+xMaxInt, h));
            const int xMin1 = max(0, min(x+xMinInt, h));
            const int yMin1 = max(0, min(y+yMinInt, w));
            const int yMin0 = max(0, min(y+yMinInt-1, w));

            delta += intData[xMax1*(w+1) + yMin1];
            delta -= intData[xMax1*(w+1) + yMin0];
            delta -= intData[xMin1*(w+1) + yMin1];
            delta += intData[xMin1*(w+1) + yMin0];

            delta *= (y+yMinInt >= 1 and y+yMinInt < w);
            tmpArray[(x-1)*w + (y-1)] *= -delta;
        }
    }
}