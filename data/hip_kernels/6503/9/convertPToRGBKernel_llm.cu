#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ static void convertPToRGBKernel(const uint16_t * __restrict__ dpSrc, uint8_t * __restrict__ tt1, int nSrcWidth, int nDstWidth, int nDstHeight, int * __restrict__ lookupTable) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    if (tid < nSrcWidth / 2 && tidd < nDstHeight) { // Compute tid limits
        int kSrc = tid * 2;
        int jSrc = tidd * nSrcWidth;

        uint32_t y0 = static_cast<uint32_t>(dpSrc[jSrc + kSrc + 0]) * 1000;
        uint32_t y1 = static_cast<uint32_t>(dpSrc[jSrc + kSrc + 1]) * 1000;
        
        int kUV = tid;
        int jUSrc = tidd * nSrcWidth / 2 + nDstHeight * nSrcWidth;
        uint32_t u0 = static_cast<uint32_t>(dpSrc[jUSrc + kUV]);
        
        int jVSrc = tidd * nSrcWidth / 2 + nDstHeight * nSrcWidth * 3 / 2;
        uint32_t v0 = static_cast<uint32_t>(dpSrc[jVSrc + kUV]);
        
        int kDst = tid * 6;
        int jDst = tidd * nDstWidth * 3;

        int r = 1407 * v0 - 720384;
        int g = 716 * v0 + 345 * u0 - 543232;
        int b = 1779 * u0 - 910848;

        uint16_t tt[6];
        tt[0] = (y0 + r) / 1000;
        tt[1] = (y0 - g) / 1000;
        tt[2] = (y0 + b) / 1000;
        tt[3] = (y1 + r) / 1000;
        tt[4] = (y1 - g) / 1000;
        tt[5] = (y1 + b) / 1000;

        tt1[jDst + kDst + 0] = lookupTable[tt[0]];
        tt1[jDst + kDst + 1] = lookupTable[tt[1]];
        tt1[jDst + kDst + 2] = lookupTable[tt[2]];
        tt1[jDst + kDst + 3] = lookupTable[tt[3]];
        tt1[jDst + kDst + 4] = lookupTable[tt[4]];
        tt1[jDst + kDst + 5] = lookupTable[tt[5]];
    }
}