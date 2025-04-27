#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void average_snips(const double *Params, const int *ioff, const int *id, const float *uproj, const float *cmax, const int *iList, float *cf, float *WU) {

    int tid = threadIdx.x;
    int bid = blockIdx.x;

    float pm = (float)Params[3];
    int Nspikes = (int)Params[0];
    int Nfeatures = (int)Params[1];
    int NfeatW = (int)Params[4];
    int Nnearest = (int)Params[6];

    int ind, t;

    // Loop through spikes only relevant to current block
    for (ind = tid; ind < Nspikes; ind += blockDim.x) {
        if (id[ind] == bid) {
            float xsum = uproj[tid + Nfeatures * ind];
            int wu_index = tid + ioff[ind] + NfeatW * bid;
            
            // Update WU with weighted sum
            WU[wu_index] = pm * WU[wu_index] + (1 - pm) * xsum;

            // Update cf for top nearest matches
            for (t = 0; t < Nnearest; t++) {
                cf[ind + t * Nspikes] = cmax[ind + Nspikes * iList[t + Nnearest * bid]];
            }
        }
    }
}