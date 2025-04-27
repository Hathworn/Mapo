#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaPermuteCudnnToPV(float *dest, float *src, int outFeatures, int ny, int nx, int inFeatures, int manyScaleX, int manyScaleY) {
    int srcNx = nx / manyScaleX;
    int srcNy = ny / manyScaleY;
    int srcInFeatures = inFeatures * manyScaleX * manyScaleY;

    int kDest = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single fetch if the index is within bounds
    if (kDest >= outFeatures * ny * nx * inFeatures) return;

    int kOF = kDest / (ny * nx * inFeatures);
    int remaining = kDest % (ny * nx * inFeatures);
    int kY = remaining / (nx * inFeatures);
    remaining = remaining % (nx * inFeatures);
    int kX = remaining / inFeatures;
    int kIF = remaining % inFeatures;

    // Update indices based on manyScale values
    kIF += inFeatures * (kX % manyScaleX + (kY % manyScaleY) * manyScaleX);
    kX /= manyScaleX;
    kY /= manyScaleY;

    int sOF = srcInFeatures * srcNy * srcNx;
    int sIF = srcNy * srcNx;
    int sY = srcNx;

    int kSrc = kOF * sOF + kIF * sIF + kY * sY + kX;

    dest[kDest] = src[kSrc];
}