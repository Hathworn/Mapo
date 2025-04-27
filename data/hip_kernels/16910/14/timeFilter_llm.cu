#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void	timeFilter(const double *Params, const float *data, const float *W, float *conv_sig) {
    extern __shared__ float shared_mem[];
    float *sW = shared_mem;
    float *sdata = &sW[81 * NrankMax];
    float x;
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NT = (int) Params[0];
    int Nfilt = (int) Params[1];
    int Nrank = (int) Params[6];
    int nt0 = (int) Params[4];
    int tid0;

    // Load weights into shared memory
    if (tid < nt0 * Nrank) {
        sW[tid] = W[tid % nt0 + (bid + Nfilt * (tid / nt0)) * nt0];
    }

    __syncthreads();

    for (tid0 = 0; tid0 < NT - Nthreads - nt0 + 1; tid0 += Nthreads) {
        // Load data into shared memory
        if (tid < nt0 * NrankMax) {
            sdata[tid % nt0 + (tid / nt0) * (Nthreads + nt0)] = data[tid0 + tid % nt0 + NT * (bid + Nfilt * (tid / nt0))];
        }
        #pragma unroll 3
        for (int nid = 0; nid < Nrank; nid++) {
            sdata[tid + nt0 + nid * (Nthreads + nt0)] = data[nt0 + tid0 + tid + NT * (bid + nid * Nfilt)];
        }
        __syncthreads();

        x = 0.0f;
        #pragma unroll 4
        for (int nid = 0; nid < Nrank; nid++) {
            #pragma unroll 4
            for (int i = 0; i < nt0; i++) {
                x += sW[i + nid * nt0] * sdata[i + tid + nid * (Nthreads + nt0)];
            }
        }

        conv_sig[tid0 + tid + NT * bid] = x;
        __syncthreads();
    }
}