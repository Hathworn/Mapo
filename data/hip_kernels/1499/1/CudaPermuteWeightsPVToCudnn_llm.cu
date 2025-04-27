#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaPermuteWeightsPVToCudnn(float *dest, float *src, int numArbors, int outFeatures, int ny, int nx, int inFeatures) {
    // Calculate the global thread index
    int kSrc = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the thread is within bounds
    if (kSrc < outFeatures * ny * nx * inFeatures) {
        int kA = kSrc / (outFeatures * ny * nx * inFeatures);
        int remaining = kSrc % (outFeatures * ny * nx * inFeatures);

        int kOF = remaining / (ny * nx * inFeatures);
        remaining = remaining % (ny * nx * inFeatures);

        int kY = remaining / (nx * inFeatures);
        int kX = (remaining % (nx * inFeatures)) / inFeatures;
        int kIF = remaining % inFeatures;

        // Calculate destination index
        int kDest = kA * outFeatures * inFeatures * ny * nx
            + kOF * inFeatures * ny * nx
            + kIF * ny * nx
            + (ny - kY - 1) * nx
            + (nx - kX - 1);
        
        dest[kDest] = src[kSrc]; // Assign the permuted value to destination
    }
}