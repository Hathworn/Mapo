#include "hip/hip_runtime.h"
#include "includes.h"
const int Nthreads = 1024, maxFR = 10000, NrankMax = 3, nt0max = 81, NchanMax = 17;

__global__ void computeProjections(const double *Params, const float *dataraw, const int *iC, const int *st, const int *id, const float *W, float *feat) {
    float x;
    int tidx, tidy, my_chan, this_chan, tid, bid, nt0, NchanNear, j, NT, NrankPC;
    __shared__ float sW[nt0max * NrankMax];  // Allocate shared memory for W
    __shared__ float sD[nt0max * NchanMax];  // Allocate shared memory for data

    NT = (int) Params[0];
    NchanNear = (int) Params[2];
    nt0 = (int) Params[3];
    NrankPC = (int) Params[6];

    tidx = threadIdx.x;
    tidy = threadIdx.y;
    bid = blockIdx.x;

    // Move wPCA to shared memory
    if (tidx < nt0) {
        sW[tidx + tidy * nt0] = W[tidx + tidy * nt0];
    }
    __syncthreads();  // Synchronize threads after loading W

    tid = tidx + tidy * blockDim.x;

    // Move raw data to shared memory
    while (tid < nt0) {
        my_chan = id[bid];
        for (j = 0; j < NchanNear; j++) {
            this_chan = iC[j + NchanNear * my_chan];
            sD[tid + nt0 * j] = dataraw[tid + st[bid] + Params[4] - 1 + NT * this_chan];
        }
        tid += blockDim.x * blockDim.y;
    }
    __syncthreads();  // Synchronize threads after loading data

    x = 0.0f;
    for (int t = 0; t < nt0; t++) {
        x += sD[t + nt0 * tidx] * sW[t + nt0 * tidy];
    }

    // Store the results
    if (tidy < NrankPC && tidx < NchanNear) {
        feat[tidy + tidx * NrankPC + NrankPC * NchanNear * bid] = x;
    }
}