#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateGradInputPlanewiseKernel( float *gradOutputIntData, float *gradInputData, int h, int w, int nWindows, float *xMin, float *xMax, float *yMin, float *yMax) {

    const int x = BLOCK_SIZE * blockIdx.x + threadIdx.x;
    const int y = BLOCK_SIZE * blockIdx.y + threadIdx.y;

    if (x < h && y < w) {
        double outValue = 0;

        for (int windowIdx = 0; windowIdx < nWindows; ++windowIdx) {

            int xMinCurr = (int)ceil(-xMax[windowIdx]);
            int yMinCurr = (int)ceil(-yMax[windowIdx]);
            int xMaxCurr = (int)floor(-xMin[windowIdx]) + 1;
            int yMaxCurr = (int)floor(-yMin[windowIdx]) + 1;

            // Simplified boundary conditions using ternary operators
            xMinCurr = (x == 0 && xMaxCurr >= 0) ? 0 : xMinCurr;
            xMaxCurr = (x == h-1 && xMinCurr <= 0) ? h+66 : xMaxCurr;
            yMinCurr = (y == 0 && yMaxCurr >= 0) ? 0 : yMinCurr;
            yMaxCurr = (y == w-1 && yMinCurr <= 0) ? w+66 : yMaxCurr;

            const int t = max(0, min(x + xMinCurr, h));
            const int b = max(0, min(x + xMaxCurr, h));
            const int l = max(0, min(y + yMinCurr, w));
            const int r = max(0, min(y + yMaxCurr, w));

            // Unroll calculations for better performance
            outValue += gradOutputIntData[b * (w + 1) + r] - gradOutputIntData[t * (w + 1) + r]
                        - gradOutputIntData[b * (w + 1) + l] + gradOutputIntData[t * (w + 1) + l];

            // Move to the next channel
            gradOutputIntData += (h + 1) * (w + 1);
        }

        gradInputData[x * w + y] = outValue;
    }
}