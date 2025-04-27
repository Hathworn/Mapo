#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max1D(const double *Params, const float *data, float *conv_sig) {
    // Use dynamic shared memory for better flexibility
    extern __shared__ float sdata[];

    float y, spkTh;
    int tid, tid0, bid, NT, nt0;

    NT = (int) Params[0];
    nt0 = (int) Params[3];
    spkTh = (float) Params[5];
    tid = threadIdx.x;
    bid = blockIdx.x;

    tid0 = 0;
    while (tid0 < NT - Nthreads - nt0 + 1) {
        if (tid < nt0) {
            // Coalesced memory access for better performance
            sdata[tid] = data[tid0 + tid + NT * bid];
        }
        sdata[tid + nt0] = data[nt0 + tid0 + tid + NT * bid];

        __syncthreads();

        y = 0.0f;
        // Loop unrolling for improved throughput
        #pragma unroll 4
        for (i = 0; i < nt0; i++) {
            // Use FMA for potential further optimization
            y = max(y, sdata[tid + i]);
        }

        if (y > spkTh) {
            // Coalesced global memory write
            conv_sig[tid0 + tid + NT * bid] = y;
        }

        tid0 += Nthreads;
        __syncthreads();
    }
}