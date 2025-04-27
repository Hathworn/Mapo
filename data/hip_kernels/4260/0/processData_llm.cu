#include "hip/hip_runtime.h"
#include "includes.h"

unsigned char *pdata; // pointer to data content

__global__ void processData(unsigned char *Da, int* filter)
{
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int bn = blockDim.x;
    int gid = bx * bn + tx;

    __shared__ int sfilter[3][3];
    __shared__ int sR[3][512];
    __shared__ int sG[3][512];
    __shared__ int sB[3][512];
    __shared__ int sRsum[512];
    __shared__ int sGsum[512];
    __shared__ int sBsum[512];

    // Load filter into shared memory using a single transaction
    if (tx < 9) {
        sfilter[tx / 3][tx % 3] = filter[tx];
    }
    __syncthreads();

    // Direct assignment for edge pixels
    if (bx == 0 || bx == 511 || tx == 0 || tx == bn - 1) {
        sRsum[tx] = Da[gid * 3];
        sGsum[tx] = Da[gid * 3 + 1];
        sBsum[tx] = Da[gid * 3 + 2];
    } else {
        // Load relevant rows into shared memory (except edge cases)
        sR[0][tx] = Da[(gid - bn) * 3];
        sR[1][tx] = Da[gid * 3];
        sR[2][tx] = Da[(gid + bn) * 3];

        sG[0][tx] = Da[(gid - bn) * 3 + 1];
        sG[1][tx] = Da[gid * 3 + 1];
        sG[2][tx] = Da[(gid + bn) * 3 + 1];

        sB[0][tx] = Da[(gid - bn) * 3 + 2];
        sB[1][tx] = Da[gid * 3 + 2];
        sB[2][tx] = Da[(gid + bn) * 3 + 2];
        __syncthreads();

        // Compute convolution for non-edge pixels
        if (tx != 0 && tx != bn - 1) {
            int rSum = 0, gSum = 0, bSum = 0;
            #pragma unroll
            for (int i = 0; i < 3; i++) {
                for (int j = -1; j <= 1; j++) {
                    rSum += sR[i][tx + j] * sfilter[i][j + 1];
                    gSum += sG[i][tx + j] * sfilter[i][j + 1];
                    bSum += sB[i][tx + j] * sfilter[i][j + 1];
                }
            }

            // Normalize and clamp values
            sRsum[tx] = min(max(rSum / filter[9], 0), 255);
            sGsum[tx] = min(max(gSum / filter[9], 0), 255);
            sBsum[tx] = min(max(bSum / filter[9], 0), 255);
        }
    }

    __syncthreads();

    // Combine results back into global memory
    Da[gid * 3] = sRsum[tx];
    Da[gid * 3 + 1] = sGsum[tx];
    Da[gid * 3 + 2] = sBsum[tx];
}