#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

// THIS UPDATE DOES NOT UPDATE ELOSS?
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////






//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
__global__ void	computePCfeatures(const double *Params, const int *counter, const float *dataraw,  const int *st, const int *id, const float *x, const float *W, const float *U, const float *mu, const int *iW, const int *iC, const float *wPCA, float *featPC){

    // Using shared memory effectively
    __shared__ float sPCA[81 * NrankMax], sW[81 * NrankMax], sU[NchanMax * NrankMax];
    __shared__ int iU[NchanMax];

    int bid, nt0, t, tidx, tidy, k, NT, ind, Nchan, NchanU, Nfilt, Nrank;
    float X = 0.0f, Y = 0.0f;

    NT = (int)Params[0];
    nt0 = (int)Params[4];
    Nchan = (int)Params[9];
    Nfilt = (int)Params[1];
    Nrank = (int)Params[6];
    NchanU = (int)Params[10];

    tidx = threadIdx.x;
    tidy = threadIdx.y;
    bid = blockIdx.x;

    if (tidy == 0)
        iU[tidx] = iC[tidx + NchanU * iW[bid]];
    __syncthreads();

    int iUOffset = tidx + tidy * NchanU;
    sU[iUOffset] = U[iU[tidx] + Nchan * bid + Nchan * Nfilt * tidy];

    for (int i = tidx; i < nt0; i += blockDim.x) {
        int offset = i + tidy * nt0;
        sW[offset] = W[i + bid * nt0 + Nfilt * nt0 * tidy];
        sPCA[offset] = wPCA[i + nt0 * tidy];
    }

    __syncthreads();

    // Compute wPCA projections of the filter
    Y = 0.0f;
    for (k = 0; k < Nrank; k++) {
        X = 0.0f;
        for (t = 0; t < nt0; t++)
            X += sW[t + k * nt0] * sPCA[t + tidy * nt0];
        Y += X * sU[tidx + k * NchanU];
    }

    // Compute features for each matching spike
    for (ind = 0; ind < counter[0]; ind++) {
        if (id[ind] == bid) {
            X = Y * x[ind];
            for (t = 0; t < nt0; t++)
                X += dataraw[st[ind] + t + NT * iU[tidx]] * sPCA[t + nt0 * tidy];
            featPC[tidx + tidy * NchanU + ind * NchanU * Nrank] = X;
        }
    }
}