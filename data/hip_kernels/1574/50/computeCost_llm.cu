#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeCost(const double *Params, const float *Ws, const float *mus, const float *W, const float *mu, const bool *iMatch, const int *iC, const int *Wh, float *cmax) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;  // Unique global thread index
    int stride = blockDim.x * gridDim.x;  // Stride determined by total threads

    int Nspikes = (int) Params[0];  // Number of spikes/comparisons
    int NrankPC = (int) Params[1];
    int Nchan = (int) Params[7];
    int NchanNear = (int) Params[6];

    while (tid < Nspikes) {
        int my_chan = Wh[tid];
        if (iMatch[my_chan + blockIdx.x * Nchan]) {  // Check channel
            float xsum = 0.0f;
            for (int k = 0; k < NchanNear; k++) {
                int this_chan = iC[k + NchanNear * my_chan];
                for (int j = 0; j < NrankPC; j++) {
                    // Accumulate product sum
                    xsum += Ws[j + NrankPC * k + NrankPC * NchanNear * tid] * W[j + NrankPC * this_chan + NrankPC * Nchan * blockIdx.x];
                }
            }
            float Ci = mu[blockIdx.x] * mu[blockIdx.x] + mus[tid] * mus[tid] - 2 * mus[tid] * mu[blockIdx.x] * xsum;
            cmax[tid + blockIdx.x * Nspikes] = Ci;  // Update result
        }
        tid += stride;  // Advance by complete set of threads
    }
}