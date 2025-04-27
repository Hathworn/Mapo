#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeCost(const double *Params, const float *uproj, const float *mu, const float *W, const bool *match, const int *iC, const int *call, float *cmax){

    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Flatten indexing
    int stride = gridDim.x * blockDim.x; // Stride for grid-stride loop

    int Nspikes = (int) Params[0];
    int NrankPC = (int) Params[1];
    float lam = (float) Params[5];
    int NchanNear = (int) Params[6];
    int Nchan = (int) Params[7];

    while(tid < Nspikes) {
        int my_chan = call[tid];
        if (match[my_chan + blockIdx.x * Nchan]) {
            float xsum = 0.0f;
            for (int k = 0; k < NchanNear; k++) {
                int this_chan = iC[k + my_chan * NchanNear];
                for (int j = 0; j < NrankPC; j++) {
                    xsum += uproj[j + NrankPC * k + NrankPC * NchanNear * tid] *
                            W[j + NrankPC * this_chan + NrankPC * Nchan * blockIdx.x];
                }
            }
            float Ci = max(0.0f, xsum) + lam / mu[blockIdx.x];
            cmax[tid + blockIdx.x * Nspikes] = Ci * Ci / (1.0f + lam/(mu[blockIdx.x] * mu[blockIdx.x])) - lam;
        }
        tid += stride;
    }
}