```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeCost(const double *Params, const float *uproj, const float *mu, const float *W, const bool *match, const int *iC, const int *call, float *cmax){

    int NrankPC, j, NchanNear, tid, bid, Nspikes, Nthreads, k, my_chan, this_chan, Nchan;
    float xsum, Ci, lam;

    Nspikes    = (int) Params[0];
    NrankPC    = (int) Params[1];
    Nthreads   = blockDim.x;
    lam        = (float) Params[5];
    NchanNear  = (int) Params[6];
    Nchan      = (int) Params[7];

    tid        = threadIdx.x + blockIdx.x * blockDim.x; // Use unique thread index for 1D grid
    bid        = blockIdx.x;

    // Iterate over spikes with stride equal to the total number of threads
    while (tid < Nspikes) {
        my_chan = call[tid];
        if (match[my_chan + bid * Nchan]) {
            xsum = 0.0f;
            // Optimize nested loop by unrolling if possible
            for (k = 0; k < NchanNear; k++) {
                for (j = 0; j < NrankPC; j++) {
                    this_chan = iC[k + my_chan * NchanNear];
                    xsum += uproj[j + NrankPC * k + NrankPC * NchanNear * tid] *
                            W[j + NrankPC * this_chan + NrankPC * Nchan * bid];
                }
            }
            Ci = fmaxf(0.0f, xsum) + lam / mu[bid];

            // Directly compute the final result
            float mu_bid_squared = mu[bid] * mu[bid];
            cmax[tid + bid * Nspikes] = (Ci * Ci / (1.0f + lam / mu_bid_squared)) - lam;
        }
        tid += blockDim.x * gridDim.x; // Ensure all spikes are covered by block and grid
    }
}