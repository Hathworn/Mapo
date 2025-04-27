#include "hip/hip_runtime.h"
#include "includes.h"
const int Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void Conv1D(const double *Params, const float *data, const float *W, float *conv_sig) {
    extern __shared__ float shared_mem[]; // Combined shared memory
    float* sW = shared_mem; // Shared memory for W
    float* sdata = sW + 81 * NrankMax; // Shared memory for data after W
    float y;
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NT = (int) Params[0];
    int Nrank = (int) Params[14];
    int nt0 = (int) Params[4];
    int Nchan = (int) Params[9];

    // Load W into shared memory in unrolled loops
    if (tid < nt0 * Nrank) {
        sW[tid] = W[tid];
    }
    __syncthreads();

    int tid0 = 0;
    while (tid0 < NT - Nthreads - nt0 + 1) {
        if (tid < nt0) {
            sdata[tid] = data[tid0 + tid + NT * bid];
        }
        sdata[tid + nt0] = data[nt0 + tid0 + tid + NT * bid];
        __syncthreads();

        for (int nid = 0; nid < Nrank; nid++) {
            y = 0.0f;
            #pragma unroll 4
            for (int i = 0; i < nt0; i++) {
                y += sW[i + nid * nt0] * sdata[i + tid];
            }
            // Write result back to global memory
            conv_sig[tid0 + tid + NT * bid + nid * NT * Nchan] = y;
        }
        tid0 += Nthreads;
        __syncthreads();
    }
}