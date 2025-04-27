#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void resizeBatchKernel(const uint8_t *p_Src, int nSrcPitch, int nSrcHeight, uint8_t *p_dst, int nDstWidth, int nDstHeight) {
    // Compute thread's row and column in output image
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds
    if (tid < nDstWidth && tidd < nDstHeight) {
        // Calculate scale factors outside of loop
        int yScale = nSrcHeight / nDstHeight;
        int xScale = 3 * (nSrcPitch / nDstWidth);

        // Calculate source and destination indices
        int j = tidd * yScale * nSrcPitch;
        int k = tid * xScale;

        // Read RGB values from source image
        uchar3 rgb;
        rgb.x = p_Src[j + k + 0];
        rgb.y = p_Src[j + k + 1];
        rgb.z = p_Src[j + k + 2];

        // Write RGB values to destination image
        int dstIdx = (tidd * nDstWidth + tid) * 3;
        p_dst[dstIdx + 0] = rgb.x;
        p_dst[dstIdx + 1] = rgb.y;
        p_dst[dstIdx + 2] = rgb.z;
    }
}