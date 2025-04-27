#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void conv(const float* gm, float* convolved, int bh, int bw, int ih, int iw, int ch, int cw, int smH, int smW, int k, float* sm, int gID, int tID, int nT, int rel_row, int rel_col, int nRows, int stopPrefetchRowID, int lastActiveThreadID) {
    for(int i=k; i<=nRows; i++) {
        // Use register storage to reduce memory access latency
        float reg;
        float regArr[K];
        if(i <= stopPrefetchRowID) {
            reg = gm[i * iw + gID];
            if(tID == lastActiveThreadID) {
                for(int j=1; j<=k-1; j++) {
                    regArr[j] = gm[(i * iw) + gID + j];
                }
            }
        }
        
        // Optimize loop indexing with precomputed offsets
        float imgPixels[K*K];
        int offset = i * smW + tID;
        for(int r=i-k; r<i; r++) {
            for(int c=0; c<k; c++) {
                imgPixels[(r-i+k)*k + c] = sm[(r * smW) + tID + c];
            }
        }
        
        // Use shared memory for computation to increase speed
        float convolvedCell = 0.0;
        for(int c=0; c<k*k; c++) {
            convolvedCell += cm[c]*imgPixels[c];
        }

        // Avoid unnecessary conditional checks and do boundary check
        int cID = ((rel_row * bh + (i-k)) * cw) + (rel_col * nT) + tID;
        if(cID >= 0 && cID < ch*cw) {
            convolved[cID] = convolvedCell;
        }

        __syncthreads();

        if(i <= stopPrefetchRowID) {
            sm[offset] = reg;
            if(tID == lastActiveThreadID) {
                for(int j=1; j<=k-1; j++) {
                    sm[offset + j] = regArr[j];
                }
            }
        }

        __syncthreads();
    }
}

__global__ void conv_kernel(const float* gm, float* convolved, int bh, int bw, int ih, int iw, int ch, int cw, int smH, int smW, int k) {
    int tID = threadIdx.x;
    int bID = blockIdx.x;
    int nT = blockDim.x;
    int nB = gridDim.x;
    int nBx = iw / nT;

    bool isBottomBorder = (bID >= nB - nBx);
    bool isRightBorder = ((bID+1) % nBx == 0);

    __shared__ float sm[ (BLCH + K - 1) * (BLCW + K - 1) ];

    int rel_row = bID / nBx;
    int rel_col = bID % nBx;
    int gID = (rel_row * bh * iw) + (rel_col * nT) + tID;

    for(int i=0; i<k; i++) {
        int sID = i * smW + tID;
        sm[sID] = gm[i * iw + gID];
        if(!isRightBorder && tID == nT-1) {
            for(int j=1; j<=k-1; j++) {
                sID = (i * smW) + tID + j;
                sm[sID] = gm[i * iw + gID + j];
            }
        }
    }

    __syncthreads();

    int nRows, stopPrefetchRowID, lastActiveThreadID;
    if(!isBottomBorder && !isRightBorder) {
        lastActiveThreadID = nT - 1;
        nRows = bh + k - 1;
        stopPrefetchRowID = nRows;
    } else if(isBottomBorder && isRightBorder) {
        if(tID < (nT - (k-1))) {
            nRows = bh;
            stopPrefetchRowID = nRows - 1;
            lastActiveThreadID = nT - k;
        } else return;
    } else {
        if(isBottomBorder) {
            nRows = bh;
            stopPrefetchRowID = nRows - 1;
            lastActiveThreadID = nT - 1;
        } else if(isRightBorder) {
            if(tID < (nT - (k-1))) {
                nRows = bh + k - 1;
                stopPrefetchRowID = nRows;
                lastActiveThreadID = nT - k;
            } else return;
        }
    }

    conv(gm, convolved, bh, bw, ih, iw, ch, cw, smH, smW, k, sm, gID, tID, nT, rel_row, rel_col, nRows, stopPrefetchRowID, lastActiveThreadID);
}