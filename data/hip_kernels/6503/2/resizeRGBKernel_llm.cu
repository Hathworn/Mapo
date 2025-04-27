#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void resizeRGBKernel(const uint16_t *p_Src, int nSrcPitch, int nSrcHeight, uint8_t *p_dst, int nDstWidth, int nDstHeight, int *lookupTable_cuda) {
    // Calculate pixel coordinates in the destination image
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds for destination image
    if (tid < nDstWidth && tidd < nDstHeight) {
        // Compute scales
        int yScale = nSrcHeight / nDstHeight;
        int xScale = nSrcPitch / nDstWidth;

        // Compute source image index
        int srcIndex = tidd * yScale * nSrcPitch * 3 + tid * xScale * 3;
        
        // Load RGB values
        ushort3 rgb;
        rgb.x = p_Src[srcIndex + 0];
        rgb.y = p_Src[srcIndex + 1];
        rgb.z = p_Src[srcIndex + 2];
        
        // Compute destination image index
        int dstIndex = tidd * nDstWidth * 3 + tid * 3;
        
        // Apply lookup table and store result
        p_dst[dstIndex + 0] = lookupTable_cuda[rgb.x];
        p_dst[dstIndex + 1] = lookupTable_cuda[rgb.y];
        p_dst[dstIndex + 2] = lookupTable_cuda[rgb.z];
    }
}