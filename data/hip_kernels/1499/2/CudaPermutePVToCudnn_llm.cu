#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaPermutePVToCudnn( float * __restrict__ dest, float * __restrict__ src, int outFeatures, int ny, int nx, int inFeatures, int manyScaleX, int manyScaleY, int cropX, int cropY) {
    // compute destination parameters using constants to avoid repetitive operations
    const int destNx = (nx - 2 * cropX) / manyScaleX;
    const int destNy = (ny - 2 * cropY) / manyScaleY;
    const int destInFeatures = inFeatures * manyScaleX * manyScaleY;
    
    // calculate source index
    int kSrc = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (kSrc < outFeatures * ny * nx * inFeatures) {
        int kOF = kSrc / (ny * nx * inFeatures);
        int kY  = (kSrc % (ny * nx * inFeatures)) / (nx * inFeatures);
        int kX  = (kSrc % (nx * inFeatures)) / inFeatures;
        int kIF = kSrc % inFeatures;
        
        // check if indices are within bounds and adjust
        if (kX >= cropX && kX < nx - cropX && kY >= cropY && kY < ny - cropY) {
            kX -= cropX;
            kY -= cropY;
            
            // compute new feature index and scaled positions
            kIF += inFeatures * (kX % manyScaleX + (kY % manyScaleY) * manyScaleX);
            kX /= manyScaleX;
            kY /= manyScaleY;
            
            // calculate flattened destination index
            const int sOF = destInFeatures * destNy * destNx;
            const int sIF = destNy * destNx;
            const int sY  = destNx;
            int kDest = kOF * sOF + kIF * sIF + kY * sY + kX;
            
            // populate destination array
            dest[kDest] = src[kSrc];
        }
    }
}