#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xMinDeltaIntegralFracKernel( const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *yMin, const float *yMax, const float *inData, const int inDataStrideRow) {

    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim directly for better readability
    const int totalPixels = h * w;
    const int pixelIdx = id % totalPixels;  // Determine the pixel index
    id /= totalPixels;
    const int &windowIdx = id;

    if (windowIdx < nWindows) {  // Simplified boundary check

        const int x = pixelIdx / w + 1;  // Calculate x and y
        const int y = pixelIdx % w + 1;

        if (x <= h && y <= w) {

            tmpArray += windowIdx * totalPixels;
            float delta = 0.0f;

            const int rem = windowIdx % 4;
            const int idxBase = 3 * (windowIdx / 4);
            float xMinStretched = (rem == 0) ? -h : xMin[idxBase + rem - 1];
            float yMinStretched = (rem == 2) ? -w : yMin[idxBase + rem - 2];
            float yMaxStretched = (rem == 3) ? w : yMax[idxBase + rem - 3];

            const int xMinInt = (int)ceil(xMinStretched - 1);
            const int yMinInt = (int)ceil(yMinStretched - 1);
            const float yMinFrac = yMinInt - yMinStretched + 1;
            const int yMaxInt = (int)floor(yMaxStretched);
            const float yMaxFrac = yMaxStretched - yMaxInt;

            // Optimize access and calculations by avoiding redundant conditions
            if (rem != 0) {  // Calculations only needed when rem is not 0
                const float tlCorner = (y + yMinInt <  1 || x + xMinInt <  1) ? 0 :
                    inData[max(0, min(h - 1, x + xMinInt - 1)) * inDataStrideRow + max(0, min(w - 1, y + yMinInt - 1))];
                const float trCorner = (y + yMaxInt >= w || x + xMinInt <  1) ? 0 :
                    inData[max(0, min(h - 1, x + xMinInt - 1)) * inDataStrideRow + max(0, min(w - 1, y + yMaxInt))];

                delta += trCorner * ((y + yMaxInt <  1) ? 1.0f : yMaxFrac);
                delta += tlCorner * ((y + yMinInt >= w) ? 1.0f : yMinFrac);
                
                // Reduce redundant intData access by organizing logic
                int xOffset = max(0, min(x + xMinInt - 1, h));
                int yOffsetMax = max(0, min(y + yMaxInt, w));
                int yOffsetMin = max(0, min(y + yMinInt, w));

                delta += intData[max(0, min(x + xMinInt, h)) * (w + 1) + yOffsetMax];
                delta -= intData[xOffset * (w + 1) + yOffsetMax];
                delta -= intData[max(0, min(x + xMinInt, h)) * (w + 1) + yOffsetMin];
                delta += intData[xOffset * (w + 1) + yOffsetMin];

                delta *= (x + xMinInt >= 1 && x + xMinInt < h);
            }
            tmpArray[(x - 1) * w + (y - 1)] *= -delta;
        }
    }
}