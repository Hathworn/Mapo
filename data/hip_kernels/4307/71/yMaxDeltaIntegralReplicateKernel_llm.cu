#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void yMaxDeltaIntegralReplicateKernel( const float *intData, float *tmpArray, const int nWindows, const int h, const int w, const float *xMin, const float *xMax, const float *yMax, const int strideH, const int strideW) {

// Use block and thread indices for better parallelism
const int hOut = (h + strideH - 1) / strideH;
const int wOut = (w + strideW - 1) / strideW;

const int windowIdx = blockIdx.x;
const int xOut = blockIdx.y * blockDim.y + threadIdx.y;
const int yOut = blockIdx.z * blockDim.z + threadIdx.z;

if (windowIdx < nWindows and xOut < hOut and yOut < wOut) {

const int x = xOut * strideH + 1;
const int y = yOut * strideW + 1;

tmpArray += windowIdx * hOut * wOut;

const int xMinInt = (int)ceil(xMin[windowIdx]-1);
const int xMaxInt = (int)floor(xMax[windowIdx]);
const int yMaxInt = (int)floor(yMax[windowIdx]);

float delta = 0;

// Simplify indexing using pre-computed constants
int max_h = max(0, min(h, x + xMaxInt));
int min_h = max(0, min(h, x + xMinInt));

delta += intData[max_h * (w + 1) + max(1, min(w, y + yMaxInt + 1))];
delta -= intData[max_h * (w + 1) + max(0, min(w, y + yMaxInt))];
delta -= intData[min_h * (w + 1) + max(1, min(w, y + yMaxInt + 1))];
delta += intData[min_h * (w + 1) + max(0, min(w, y + yMaxInt))];

delta *= (y + yMaxInt >= 1 and y + yMaxInt < w);
tmpArray[xOut * wOut + yOut] = delta;
}
}