#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void resizeBatchKernel(const uint16_t *p_Src, int nSrcPitch, int nSrcHeight, uint8_t *dpDst, int nDstWidth, int nDstHeight, int *lookupTable_cuda) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    uint4 pF;
    int scale = nSrcHeight / nDstHeight;

    // Using shared memory for reduced global memory access
    __shared__ uint16_t buffer[32];
    
    if (scale == 4) {
        uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
        int nDstH = nDstHeight;
        int nDstW = nDstWidth / 6;
        if (tid < nDstW && tidd < nDstH) {
            int j = tidd * nSrcPitch * scale;
            int k = tid * 32;

            // Load source data into shared memory
            buffer[threadIdx.x + 0] = p_Src[j + k + 0];
            buffer[threadIdx.x + 1] = p_Src[j + k + 1];
            buffer[threadIdx.x + 6] = p_Src[j + k + 6];
            buffer[threadIdx.x + 10] = p_Src[j + k + 10];
            buffer[threadIdx.x + 11] = p_Src[j + k + 11];
            buffer[threadIdx.x + 12] = p_Src[j + k + 12];
            buffer[threadIdx.x + 16] = p_Src[j + k + 16];
            buffer[threadIdx.x + 17] = p_Src[j + k + 17];
            buffer[threadIdx.x + 21] = p_Src[j + k + 21];
            buffer[threadIdx.x + 22] = p_Src[j + k + 22];
            buffer[threadIdx.x + 23] = p_Src[j + k + 23];
            buffer[threadIdx.x + 27] = p_Src[j + k + 27];

            __syncthreads();

            // Process data using local variables for improved register use
            pF.x = (uint32_t)buffer[0] + ((uint32_t)buffer[1] << 16);
            pF.w = (uint32_t)buffer[6];
            v0 = (uint32_t)((pF.x & 0x3FF00000) >> 20);
            y0 = (uint32_t)((pF.x & 0x000FFC00) >> 10);
            u0 = (uint32_t)(pF.x & 0x000003FF);
            y1 = (uint32_t)(pF.w & 0x000003FF);

            pF.y = (uint32_t)buffer[10] + ((uint32_t)buffer[11] << 16);
            pF.z = (uint32_t)buffer[12];
            y2 = (uint32_t)((pF.y & 0x3FF00000) >> 20);
            u1 = (uint32_t)((pF.y & 0x000FFC00) >> 10);
            v1 = (uint32_t)(pF.z & 0x000003FF);

            pF.x = (uint32_t)buffer[16] + ((uint32_t)buffer[17] << 16);
            pF.z = ((uint32_t)buffer[21] << 16);
            pF.w = (uint32_t)buffer[22] + ((uint32_t)buffer[23] << 16);
            y3 = (uint32_t)((pF.x & 0x000FFC00) >> 10);
            u2 = (uint32_t)((pF.z & 0x3FF00000) >> 20);
            v2 = (uint32_t)((pF.w & 0x000FFC00) >> 10);
            y4 = (uint32_t)(pF.w & 0x000003FF);

            pF.y = ((uint32_t)buffer[27] << 16);
            y5 = (uint32_t)((pF.y & 0x3FF00000) >> 20);

            // Compute destination indices
            k = tid * 6;
            j = tidd * nDstWidth;
            dpDst[j + k + 0] = lookupTable_cuda[y0];
            dpDst[j + k + 1] = lookupTable_cuda[y1];
            dpDst[j + k + 2] = lookupTable_cuda[y2];
            dpDst[j + k + 3] = lookupTable_cuda[y3];
            dpDst[j + k + 4] = lookupTable_cuda[y4];
            dpDst[j + k + 5] = lookupTable_cuda[y5];

            k = tid * 3;
            j = tidd * nDstWidth / 2;
            dpDst[j + k + 0] = lookupTable_cuda[u0];
            dpDst[j + k + 1] = lookupTable_cuda[u1];
            dpDst[j + k + 2] = lookupTable_cuda[u2];

            j = tidd * nDstWidth / 2 + nDstWidth * nDstHeight * 3 / 2;
            dpDst[j + k + 0] = lookupTable_cuda[v0];
            dpDst[j + k + 1] = lookupTable_cuda[v1];
            dpDst[j + k + 2] = lookupTable_cuda[v2];
        }
    }
    else if (scale == 6) {
        uint32_t v0, y0, u0, y1;
        int nDstH = nDstHeight;
        int nDstW = nDstWidth / 2;
        if (tid < nDstW && tidd < nDstH) {
            int j = tidd * nSrcPitch * scale;
            int k = tid * 16;
            
            // Load source data into shared memory
            buffer[threadIdx.x + 0] = p_Src[j + k + 0];
            buffer[threadIdx.x + 1] = p_Src[j + k + 1];
            buffer[threadIdx.x + 8] = p_Src[j + k + 8];
            buffer[threadIdx.x + 9] = p_Src[j + k + 9];
            
            __syncthreads();

            pF.x = (uint32_t)buffer[0] + ((uint32_t)buffer[1] << 16);
            v0 = (uint32_t)((pF.x & 0x3FF00000) >> 20);
            y0 = (uint32_t)((pF.x & 0x000FFC00) >> 10);
            u0 = (uint32_t)(pF.x & 0x000003FF);
            pF.x = (uint32_t)buffer[8] + ((uint32_t)buffer[9] << 16);
            y1 = (uint32_t)((pF.x & 0x000FFC00) >> 10);

            // Compute destination indices
            k = tid * 2;
            j = tidd * nDstWidth;
            dpDst[j + k + 0] = lookupTable_cuda[y0];
            dpDst[j + k + 1] = lookupTable_cuda[y1];

            k = tid;
            j = tidd * nDstWidth / 2;
            dpDst[j + k + 0] = lookupTable_cuda[u0];
            j = tidd * nDstWidth / 2 + nDstWidth * nDstHeight * 3 / 2;
            dpDst[j + k + 1] = lookupTable_cuda[v0];
        }
    }
    else if (scale == 2) {
        uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
        int nDstH = nDstHeight;
        int nDstW = nDstWidth / 6;
        if (tid < nDstW && tidd < nDstH) {
            int j = tidd * nSrcPitch * scale;
            int k = tid * 16;

            // Load source data into shared memory
            buffer[threadIdx.x + 0] = p_Src[j + k + 0];
            buffer[threadIdx.x + 1] = p_Src[j + k + 1];
            buffer[threadIdx.x + 3] = p_Src[j + k + 3];
            buffer[threadIdx.x + 5] = p_Src[j + k + 5];
            buffer[threadIdx.x + 6] = p_Src[j + k + 6];
            buffer[threadIdx.x + 7] = p_Src[j + k + 7];
            buffer[threadIdx.x + 8] = p_Src[j + k + 8];
            buffer[threadIdx.x + 9] = p_Src[j + k + 9];
            buffer[threadIdx.x + 10] = p_Src[j + k + 10];
            buffer[threadIdx.x + 11] = p_Src[j + k + 11];
            buffer[threadIdx.x + 12] = p_Src[j + k + 12];
            buffer[threadIdx.x + 14] = p_Src[j + k + 14];
            
            __syncthreads();

            pF.x = (uint32_t)buffer[0] + ((uint32_t)buffer[1] << 16);
            pF.y = ((uint32_t)buffer[3] << 16);
            pF.z = ((uint32_t)buffer[5] << 16);
            pF.w = (uint32_t)buffer[6] + ((uint32_t)buffer[7] << 16);
            v0 = (uint32_t)((pF.x & 0x3FF00000) >> 20);
            y0 = (uint32_t)((pF.x & 0x000FFC00) >> 10);
            u0 = (uint32_t)(pF.x & 0x000003FF);
            y1 = (uint32_t)((pF.y & 0x3FF00000) >> 20);
            u1 = (uint32_t)((pF.z & 0x3FF00000) >> 20);
            v1 = (uint32_t)((pF.w & 0x000FFC00) >> 10);
            y2 = (uint32_t)(pF.w & 0x000003FF);

            pF.x = (uint32_t)buffer[8] + ((uint32_t)buffer[9] << 16);
            pF.y = (uint32_t)buffer[10] + ((uint32_t)buffer[11] << 16);
            pF.z = (uint32_t)buffer[12];
            pF.w = (uint32_t)buffer[14];
            y3 = (uint32_t)((pF.x & 0x000FFC00) >> 10);
            y4 = (uint32_t)((pF.y & 0x3FF00000) >> 20);
            u2 = (uint32_t)((pF.y & 0x000FFC00) >> 10);
            v2 = (uint32_t)(pF.z & 0x000003FF);
            y5 = (uint32_t)(pF.w & 0x000003FF);

            // Compute destination indices
            k = tid * 6;
            j = tidd * nDstWidth;
            dpDst[j + k + 0] = lookupTable_cuda[y0];
            dpDst[j + k + 1] = lookupTable_cuda[y1];
            dpDst[j + k + 2] = lookupTable_cuda[y2];
            dpDst[j + k + 3] = lookupTable_cuda[y3];
            dpDst[j + k + 4] = lookupTable_cuda[y4];
            dpDst[j + k + 5] = lookupTable_cuda[y5];

            k = tid * 3;
            j = tidd * nDstWidth / 2;
            dpDst[j + k + 0] = lookupTable_cuda[u0];
            dpDst[j + k + 1] = lookupTable_cuda[u1];
            dpDst[j + k + 2] = lookupTable_cuda[u2];

            j = tidd * nDstWidth / 2 + nDstWidth * nDstHeight * 3 / 2;
            dpDst[j + k + 0] = lookupTable_cuda[v0];
            dpDst[j + k + 1] = lookupTable_cuda[v1];
            dpDst[j + k + 2] = lookupTable_cuda[v2];
        }
    }
}