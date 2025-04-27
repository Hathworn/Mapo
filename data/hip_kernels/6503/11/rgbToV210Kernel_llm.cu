#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void rgbToV210Kernel(uint16_t *pSrc, uint16_t *pDst, int nSrcWidth, int nHeight) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint3 rgb;
    uint4 pF;
    int nDstW = nSrcWidth / 18;
    int nDstH = nHeight;

    if (tid < nDstW && tidd < nDstH) {
        int k = tid * 18;
        int j = tidd * nSrcWidth;

        // Precompute offsets
        int indices[6] = {0, 3, 6, 9, 12, 15};

        // Shared memory for RGB values
        __shared__ uint16_t sharedRGB[18];
        if (threadIdx.x < 18) {
            sharedRGB[threadIdx.x] = pSrc[j + k + threadIdx.x];
        }
        __syncthreads();

        uint32_t yuv[6];
        uint32_t v[3], u[3], y[6];

        #pragma unroll
        for (int i = 0; i < 6; i++) {
            int baseIdx = indices[i];
            rgb.x = sharedRGB[baseIdx];
            rgb.y = sharedRGB[baseIdx + 1];
            rgb.z = sharedRGB[baseIdx + 2];

            // Compute YUV values
            yuv[i] = (rgb.x * 299 + rgb.y * 587 + rgb.z * 114) / 1000;
            if (i < 3) {
                u[i] = (512000 - rgb.x * 169 - rgb.y * 332 + rgb.z * 500) / 1000;
                v[i] = (512000 + rgb.x * 500 - rgb.y * 419 - rgb.z * 81) / 1000;
            }
        }
        
        // Pack values
        pF.x = (v[0] << 20) | (yuv[0] << 10) | u[0];
        pF.y = (yuv[2] << 20) | (u[1] << 10) | yuv[1];
        pF.z = (u[2] << 20) | (yuv[3] << 10) | v[1];
        pF.w = (yuv[5] << 20) | (v[2] << 10) | yuv[4];

        // Write to destination
        k = tid * 8;
        j *= 4;
        j /= 9;
        
        pDst[j + k + 0] = static_cast<uint16_t>(pF.x & 0x0000FFFF);
        pDst[j + k + 1] = static_cast<uint16_t>(pF.x >> 16);
        pDst[j + k + 2] = static_cast<uint16_t>(pF.y & 0x0000FFFF);
        pDst[j + k + 3] = static_cast<uint16_t>(pF.y >> 16);
        pDst[j + k + 4] = static_cast<uint16_t>(pF.z & 0x0000FFFF);
        pDst[j + k + 5] = static_cast<uint16_t>(pF.z >> 16);
        pDst[j + k + 6] = static_cast<uint16_t>(pF.w & 0x0000FFFF);
        pDst[j + k + 7] = static_cast<uint16_t>(pF.w >> 16);
    }
}