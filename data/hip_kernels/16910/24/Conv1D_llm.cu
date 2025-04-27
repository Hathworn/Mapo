#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 10000, NrankMax = 3, nt0max=81, NchanMax = 17;

__global__ void Conv1D(const double *Params, const float *data, const float *W, float *conv_sig) {
    extern __shared__ float sW_sdata[];
    volatile float* sW = sW_sdata;
    volatile float* sdata = sW + 81 * NrankMax;

    float x, y;
    int tid, tid0, bid, i, nid, Nrank, NT, nt0;

    tid = threadIdx.x;
    bid = blockIdx.x;

    NT = (int) Params[0];
    nt0 = (int) Params[3];
    Nrank = (int) Params[6];

    // Preload weights into shared memory
    if (tid < nt0 * Nrank) {
        sW[tid] = W[tid];
    }
    __syncthreads();

    tid0 = 0;
    while (tid0 < NT - Nthreads - nt0 + 1) {
        // Load data into shared memory
        if (tid < nt0) {
            sdata[tid] = data[tid0 + tid + NT * bid];
        }
        sdata[tid + nt0] = data[tid0 + tid + nt0 + NT * bid];
        __syncthreads();

        // Initialize accumulator
        x = 0.0f;
        for (nid = 0; nid < Nrank; nid++) {
            y = 0.0f;
            #pragma unroll 4
            for (i = 0; i < nt0; i++) {
                y += sW[i + nid * nt0] * sdata[i + tid];
            }
            x += y * y;
        }

        // Write result to global memory
        conv_sig[tid0 + tid + NT * bid] = sqrtf(x);

        tid0 += Nthreads;
        __syncthreads();
    }
}