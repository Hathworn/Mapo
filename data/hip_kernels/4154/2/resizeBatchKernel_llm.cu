#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void resizeBatchKernel(const uint8_t *p_Src, int nSrcPitch, int nSrcHeight, uint8_t *p_dst, int nDstWidth, int nDstHeight) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uchar3 rgb;
    // Pre-calculate scaling factors outside the condition to avoid redundant division
    float yScaleFactor = static_cast<float>(nSrcHeight) / nDstHeight;
    float xScaleFactor = static_cast<float>(nSrcPitch) / nDstWidth;
    
    if (tid < nDstWidth && tidd < nDstHeight) {
        // Scale source coordinates using pre-calculated factors
        int j = static_cast<int>(tidd * yScaleFactor) * nSrcPitch;
        int k = static_cast<int>(tid * xScaleFactor) * 3; // Adjust by 3 for RGB
        
        // Load pixel data
        rgb.x = p_Src[j + k + 0];
        rgb.y = p_Src[j + k + 1];
        rgb.z = p_Src[j + k + 2];
        
        // Calculate destination index
        int destIndex = (tidd * nDstWidth + tid) * 3;
        
        // Store pixel data
        p_dst[destIndex + 0] = rgb.x;
        p_dst[destIndex + 1] = rgb.y;
        p_dst[destIndex + 2] = rgb.z;
    }
}