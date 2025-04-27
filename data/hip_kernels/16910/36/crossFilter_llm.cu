#include "hip/hip_runtime.h"
#include "includes.h"
const int nblock = 32;
//////////////////////////////////////////////////////////////////////////////////////////

__global__ void crossFilter(const double *Params, const float *W1, const float *W2, const float *UtU, float *WtW) {
    __shared__ float shW1[nblock * 81], shW2[nblock * 81];

    int tidx = threadIdx.x;
    int tidy = threadIdx.y;
    int bidx = blockIdx.x;
    int bidy = blockIdx.y;

    int Nfilt = static_cast<int>(Params[1]);
    int nt0 = static_cast<int>(Params[9]);

    int tid1 = tidx + bidx * nblock;
    int tid2 = tidy + bidy * nblock;

    if (tid2 < Nfilt) {
        for (int loadIdx = tidx; loadIdx < nt0; loadIdx += blockDim.x) {
            shW1[loadIdx + tidy * nt0] = W1[loadIdx + tid2 * nt0];
            shW2[loadIdx + tidy * nt0] = W2[loadIdx + tid2 * nt0];
        }
    }

    __syncthreads();

    if (tid2 < Nfilt && tid1 < Nfilt) {
        for (int i = 0; i < 2 * nt0 - 1; i++) {
            float x = 0.0f;
            int max_t = min(nt0, i + 1);
            int start_t = max(0, i - nt0 + 1);
            for (int t = start_t; t < max_t; t++) {
                x += shW1[t + nt0 * tidx] * shW2[t + (nt0 - i - 1) + nt0 * tidy];
            }
            WtW[tid1 + tid2 * Nfilt + i * Nfilt * Nfilt] = x * UtU[tid1 + tid2 * Nfilt];
        }
    }
}