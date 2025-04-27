#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xMinDeltaIntegralKernel(const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMin, const float *yMin, const float *yMax) {

    // Calculate global thread ID
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Precompute offsets for input data
    tmpArray += id;
    const int y = id % w + 1; id /= w;
    const int x = id % h + 1; id /= h;
    const int windowIdx = id % nWindows; id /= nWindows;
    intData += id * intDataStrideChannel;

    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int batchIdx = id;

    // Check if batch index is within bounds
    if (batchIdx < batchSize) {

        // Precompute coordinates rounded
        const int xMinInt = (int)ceil(xMin[globalWindowIdx] - 1);
        const int yMinInt = (int)ceil(yMin[globalWindowIdx] - 1);
        const int yMaxInt = (int)floor(yMax[globalWindowIdx]);

        // Initialize delta to zero
        float delta = 0;

        // Simplify access with direct index calculation
        int xOffset = max(0, min(x + xMinInt, h)) * (w + 1);

        delta += intData[xOffset + max(0, min(y + yMaxInt, w))];
        delta -= intData[xOffset + max(0, min(y + yMinInt, w))];
        
        xOffset = max(0, min(x + xMinInt - 1, h)) * (w + 1);
        
        delta -= intData[xOffset + max(0, min(y + yMaxInt, w))];
        delta += intData[xOffset + max(0, min(y + yMinInt, w))];

        // Apply boundary condition check
        delta *= (x + xMinInt >= 1 && x + xMinInt < h);

        // Store result in output array
        *tmpArray = -delta;
    }
}