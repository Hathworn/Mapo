#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initGuessBuffers(const uchar4* srcImg, float3* guess1, float3* guess2, const uint nRows, const uint nCols) {
    const uint nSamps = nRows * nCols;
    
    const uint samp = threadIdx.x + blockDim.x * blockIdx.x;
    if (samp < nSamps) {
        uchar4 pixel = srcImg[samp]; // Load once to avoid redundant global memory reads

        guess1[samp] = make_float3(pixel.x, pixel.y, pixel.z); // Reduced code duplication
        guess2[samp] = make_float3(pixel.x, pixel.y, pixel.z);
    }
}