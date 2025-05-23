#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMaxDeltaIntegralReplicateFracKernel( const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMax, const float *inData, const int inDataStrideRow, const int strideH, const int strideW) {

// Calculate output dimensions
const int hOut = (h + strideH - 1) / strideH;
const int wOut = (w + strideW - 1) / strideW;

// Use threadIdx for better parallelization
int id = blockIdx.x * blockDim.x + threadIdx.x;
const int yOut = id % wOut; id /= wOut; // 0-indexed
const int xOut = id % hOut; id /= hOut; // 0-indexed
const int windowIdx = id;

if (windowIdx < nWindows && xOut < hOut && yOut < wOut) {

   const int x = xOut * strideH + 1;
   const int y = yOut * strideW + 1;

   tmpArray += windowIdx * hOut * wOut;

   // Precompute indices and fractions
   const int xMinInt = (int)ceil(xMin[windowIdx] - 1);
   const float xMinFrac = xMinInt - xMin[windowIdx] + 1;

   const int xMaxInt = (int)floor(xMax[windowIdx]);
   const float xMaxFrac = xMax[windowIdx] - xMaxInt;

   const int yMaxInt = (int)floor(yMax[windowIdx]);

   // Precompute corners
   const float trCorner = (y+yMaxInt >= w || x+xMinInt < 1) ? 0 : 
       inData[max(0, min(h-1, x+xMinInt-1)) * inDataStrideRow + max(0, min(w-1, y+yMaxInt))];
   const float brCorner = (y+yMaxInt >= w || x+xMaxInt >= h) ? 0 : 
       inData[max(0, min(h-1, x+xMaxInt)) * inDataStrideRow + max(0, min(w-1, y+yMaxInt))];

   float delta = 0;

   // Calculate delta with precomputed values
   delta += trCorner * (x+xMinInt >= h ? 1.0f : xMinFrac);
   delta += brCorner * (x+xMaxInt < 1 ? 1.0f : xMaxFrac);

   delta += intData[max(0, min(x+xMaxInt, h)) * (w+1) + max(0, min(y+yMaxInt+1, w))];
   delta -= intData[max(0, min(x+xMaxInt, h)) * (w+1) + max(0, min(y+yMaxInt, w))];
   delta -= intData[max(0, min(x+xMinInt, h)) * (w+1) + max(0, min(y+yMaxInt+1, w))];
   delta += intData[max(0, min(x+xMinInt, h)) * (w+1) + max(0, min(y+yMaxInt, w))];

   delta *= (y+yMaxInt >= 1 && y+yMaxInt < w);
   tmpArray[xOut * wOut + yOut] = delta;
}
}