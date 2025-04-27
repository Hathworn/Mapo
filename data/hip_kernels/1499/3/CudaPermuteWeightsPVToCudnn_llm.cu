#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaPermuteWeightsPVToCudnn(float *dest, float *src, int outFeatures, int ny, int nx, int inFeatures, int manyScaleX, int manyScaleY) {
    // Calculate global thread ID for flattened 3D grid
    int kSrc = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Stride for parallel computation
    int totalElements = outFeatures * manyScaleX * manyScaleY * ny * nx * inFeatures;
    
    // Ensure that the thread is within bounds
    for (int i = kSrc; i < totalElements; i += blockDim.x * gridDim.x) {
        int kOF = i / (ny * nx * inFeatures);
        int kY  = (i % (ny * nx * inFeatures)) / (nx * inFeatures);
        int kX  = (i % (nx * inFeatures)) / inFeatures;
        int kIF = (i % inFeatures);
        
        int sOF = inFeatures * ny * nx;
        int sIF = ny * nx;
        int sY  = nx;

        // Calculate destination index with transformed order
        int kDest = kOF * sOF + kIF * sIF + (ny - kY - 1) * sY + (nx - kX - 1);

        dest[kDest] = src[i];
    }
}