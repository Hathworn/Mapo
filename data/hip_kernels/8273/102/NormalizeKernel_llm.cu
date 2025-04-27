#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate 1D index from 2D grid structure for coalesced memory access
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;
   
    if (i < h && j < w) { // Use conditions that are more likely to be true
        // Access memory efficiently with row-major order
        const int pos = i * s + j;
        
        float scale = normalization_factor[pos];
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;
        
        image[pos] *= invScale;
    }
}