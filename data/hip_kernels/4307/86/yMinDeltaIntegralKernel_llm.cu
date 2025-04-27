#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yMinDeltaIntegralKernel(const float *intData, const int intDataStrideChannel, float *tmpArray, const int batchSize, const int nInputPlane, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMin) {

    int id = NUM_THREADS * blockIdx.x + threadIdx.x;
    tmpArray += id; // Adjust output location
  
    const int y = id % w + 1; id /= w; // Calculate y-coordinate (1-indexed)
    const int x = id % h + 1; id /= h; // Calculate x-coordinate (1-indexed)
    const int windowIdx = id % nWindows; id /= nWindows; // Determine window index
  
    intData += id * intDataStrideChannel; // Move pointer to relevant input data
  
    const int globalWindowIdx = (id % nInputPlane) * nWindows + windowIdx; id /= nInputPlane;
    const int & batchIdx = id;
  
    if (batchIdx < batchSize) {
        const int xMinInt = (int)ceil(xMin[globalWindowIdx] - 1);
        const int yMinInt = (int)ceil(yMin[globalWindowIdx] - 1);
        const int xMaxInt = (int)floor(xMax[globalWindowIdx]);
    
        float delta = 0;
    
        // Compute integral values with bounds checking
        int xMaxBound = max(0, min(x + xMaxInt, h));
        int xMinBound = max(0, min(x + xMinInt, h));
        int yMinBound = max(0, min(y + yMinInt, w));
        if (y + yMinInt >= 1 && y + yMinInt < w) { // Check for valid y-coordinate
            delta += intData[xMaxBound * (w+1) + yMinBound];
            delta -= intData[xMaxBound * (w+1) + max(0, yMinBound - 1)];
            delta -= intData[xMinBound * (w+1) + yMinBound];
            delta += intData[xMinBound * (w+1) + max(0, yMinBound - 1)];
        }
        *tmpArray = -delta; // Store the calculated delta
    }
}