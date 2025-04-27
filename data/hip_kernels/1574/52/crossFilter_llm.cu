#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void crossFilter(const double *Params, const float *W1, const float *W2, const float *UtU, float *WtW) {
    // Utilize shared memory effectively and manage thread indices
    __shared__ float shW1[nblock * 81], shW2[nblock * 81];

    float x;
    int nt0, tidx, tidy, bidx, bidy, Nfilt, t, tid1, tid2;

    tidx = threadIdx.x;
    tidy = threadIdx.y;
    bidx = blockIdx.x;
    bidy = blockIdx.y;

    Nfilt = (int)Params[1];
    nt0 = (int)Params[9];

    tid1 = tidx + bidx * nblock;
    tid2 = tidy + bidy * nblock;

    // Load W1 into shared memory using coalesced access
    if (tid2 < Nfilt) {
        #pragma unroll
        for (int i = tidx; i < nt0; i += nblock) {
            shW1[i + tidy * nt0] = W1[i + tid2 * nt0];
        }
    }

    // Reset tidx for loading W2
    tidx = threadIdx.x;
    tid2 = tidy + bidy * nblock;

    // Load W2 into shared memory using coalesced access
    if (tid2 < Nfilt) {
        #pragma unroll
        for (int i = tidx; i < nt0; i += nblock) {
            shW2[i + tidy * nt0] = W2[i + tid2 * nt0];
        }
    }

    __syncthreads();

    // Compute cross filter results with shared memory and using loops effectively
    if (tid2 < Nfilt && tid1 < Nfilt) {
        for (i = 0; i < 2 * nt0 - 1; i++) {
            x = 0.0f;

            // Optimize computation using two separate loops
            if (i < nt0) {
                #pragma unroll
                for (t = 0; t <= i; t++) {
                    x += shW1[t + nt0 * tidx] * shW2[t + (nt0 - i - 1) + nt0 * tidy];
                }
            } else {
                #pragma unroll
                for (t = i - nt0 + 1; t < nt0; t++) {
                    x += shW1[t + nt0 * tidx] * shW2[t + (nt0 - i - 1) + nt0 * tidy];
                }
            }

            WtW[tid1 + tid2 * Nfilt + i * Nfilt * Nfilt] = x * UtU[tid1 + tid2 * Nfilt];
        }
    }
}