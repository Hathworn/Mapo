#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void extract_snips2(const double *Params, const float *err, const int *st, const int *id, const int *counter, const int *kk, const int *iC, const float *W, float *WU){

    int nt0, tidx, tidy, bid, ind, icl, Nchan, Nmax, Nsum, NchanNear;

    nt0       = (int) Params[4];
    Nchan     = (int) Params[9];
    Nsum      = (int) Params[13];
    NchanNear = (int) Params[10];

    tidx = threadIdx.x;
    bid  = blockIdx.x;

    Nmax = min(maxFR, counter[1]);

    for(ind = 0; ind < Nmax; ind++) {
        if (id[ind] == bid) {
            tidy = threadIdx.y;
            icl = kk[st[ind]];
            int icl_mod_Nsum = icl % Nsum;  // Compute once and reuse
            float scale_factor = sqrt(err[st[ind]] / (1.0f + icl_mod_Nsum));  // Compute scale factor once
            while (tidy < (1 + icl_mod_Nsum)) {
                // Optimizing memory indices and calculations
                int offset = tidy + bid * NchanNear;
                WU[tidx + iC[offset] * nt0 + nt0 * Nchan * ind] = 
                    scale_factor * W[tidx + nt0 * (icl / Nsum)];
                tidy += blockDim.y;
            }
        }
    }
}