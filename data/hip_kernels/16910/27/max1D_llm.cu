#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 10000, NrankMax = 3, nt0max=81, NchanMax = 17;

__global__ void max1D(const double *Params, const float *data, float *conv_sig) {

    extern __shared__ float sdata[];
    float y, spkTh;
    int tid, tid0, bid, i, NT, nt0;

    NT      = (int) Params[0];
    nt0     = (int) Params[3];
    spkTh   = (float) Params[5];
    tid     = threadIdx.x;
    bid     = blockIdx.x;

    tid0 = bid * Nthreads; // Adjust threads to cover multiple blocks
    while (tid0 < NT - nt0 + 1) {
        // Load data into shared memory efficiently
        if (tid < nt0)
            sdata[tid] = data[tid0 + tid];
        if (tid + nt0 < Nthreads + nt0)
            sdata[tid + nt0] = data[tid0 + tid + nt0];
        __syncthreads();

        y = 0.0f;
        #pragma unroll 4
        for (i = 0; i < nt0; i++)
            y = max(y, sdata[tid + i]);

        // Only write back if condition is met
        if (y > spkTh && tid0 + tid < NT)
            conv_sig[tid0 + tid] = y;

        tid0 += Nthreads * gridDim.x; // Move to next block of data
        __syncthreads();
    }
}