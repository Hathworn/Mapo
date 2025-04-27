```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateGradInputVarScaleKernel(float *gradOutputIntData, float *gradInputData, int h, int w, int nWindows, float *xMin, float *xMax, float *yMin, float *yMax) {

    // Compute flattened thread identifier for better coalescing    
    const int tid = blockIdx.y * blockDim.y * w + blockIdx.x * blockDim.x + threadIdx.y * w + threadIdx.x;
    const int x = tid / w;
    const int y = tid % w;

    if (x < h && y < w) {
        double outValue = 0;
        
        for (int windowIdx = 0; windowIdx < nWindows; ++windowIdx) {
            int xMinCurr = (int)ceil(-xMax[windowIdx]);
            int yMinCurr = (int)ceil(-yMax[windowIdx]);
            int xMaxCurr = (int)floor(-xMin[windowIdx]) + 1;
            int yMaxCurr = (int)floor(-yMin[windowIdx]) + 1;

            // Simplified conditional checks using ternary operators
            xMinCurr = (x == 0 && xMaxCurr >= 0) ? 0 : xMinCurr;
            xMaxCurr = (x == h - 1 && xMinCurr <= 0) ? h + 66 : xMaxCurr;
            yMinCurr = (y == 0 && yMaxCurr >= 0) ? 0 : yMinCurr;
            yMaxCurr = (y == w - 1 && yMinCurr <= 0) ? w + 66 : yMaxCurr;

            const int t = max(0, min(x + xMinCurr, h));
            const int b = max(0, min(x + xMaxCurr, h));
            const int l = max(0, min(y + yMinCurr, w));
            const int r = max(0, min(y + yMaxCurr, w));

            outValue += gradOutputIntData[b * (w + 1) + r];
            outValue -= gradOutputIntData[t * (w + 1) + r];
            outValue -= gradOutputIntData[b * (w + 1) + l];
            outValue += gradOutputIntData[t * (w + 1) + l];

            // Move to the next channel
            gradOutputIntData += (h + 1) * (w + 1);
        }

        gradInputData[x * w + y] = outValue;
    }
}