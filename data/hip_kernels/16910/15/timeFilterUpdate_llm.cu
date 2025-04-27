#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void timeFilterUpdate(const double *Params, const float *data, const float *W, const bool *UtU, float *conv_sig, const int *st, const int *id, const int *counter){

    volatile __shared__ float  sW[81*NrankMax];
    float x;
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NT = (int)Params[0];
    int Nfilt = (int)Params[1];
    int Nrank = (int)Params[6];
    int nt0 = (int)Params[4];

    // Load W into shared memory
    if (tid < nt0) {
        for (int k = 0; k < Nrank; k++) {
            sW[tid + k * nt0] = W[tid + nt0 * bid + nt0 * Nfilt * k];
        }
    }
    __syncthreads();

    // Optimized loop with shared memory prefetching
    for (int ind = counter[1]; ind < counter[0]; ind++) {
        if (UtU[id[ind] + Nfilt * bid]) {
            int tid0 = st[ind] - nt0 + tid;

            if (tid0 >= 0 && tid0 < NT - nt0) {
                x = 0.0f;

                for (int k = 0; k < Nrank; k++) {
                    #pragma unroll // Unroll loop for better performance
                    for (int t = 0; t < nt0; t++) {
                        x += sW[t + k * nt0] * data[t + tid0 + NT * bid + NT * Nfilt * k];
                    }
                }

                conv_sig[tid0 + NT * bid] = x;
            }
        }
    }
}