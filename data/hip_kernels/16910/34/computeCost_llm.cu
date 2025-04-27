#include "hip/hip_runtime.h"
#include "includes.h"

//////////////////////////////////////////////////////////////////////////////////////////
__global__ void computeCost(const double *Params, const float *Ws, const float *mus, const float *W, const float *mu, const bool *iMatch, const int *iC, const int *Wh, float *cmax) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int Nspikes = (int) Params[0];
    int Nchan = (int) Params[7];
    int NrankPC = (int) Params[1];
    int NchanNear = (int) Params[6];
    int Nthreads = blockDim.x;

    while (tid < Nspikes) {
        int my_chan = Wh[tid];
        if (iMatch[my_chan + bid * Nchan]) {
            float xsum = 0.0f;

            // Use registers for frequently accessed variables.
            int base_idx_Ws = NrankPC * NchanNear * tid;
            int base_idx_W = NrankPC * Nchan * bid;

            for (int k = 0; k < NchanNear; ++k) {
                int this_chan = iC[k + NchanNear * my_chan];

                for (int j = 0; j < NrankPC; ++j) {
                    // Minimize repeated index calculations inside the loop.
                    int idx_Ws = j + NrankPC * k + base_idx_Ws;
                    int idx_W = j + NrankPC * this_chan + base_idx_W;
                    xsum += Ws[idx_Ws] * W[idx_W];
                }
            }

            float Ci = mu[bid] * mu[bid] + mus[tid] * mus[tid] - 2 * mus[tid] * mu[bid] * xsum;
            cmax[tid + bid * Nspikes] = Ci;
        }
        tid += Nthreads;
    }
}