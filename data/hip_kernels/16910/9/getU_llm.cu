#include "hip/hip_runtime.h"
#include "includes.h"

const int Nthreads = 1024, NrankMax = 3, nt0max = 71, NchanMax = 1024;

__global__ void getU(const double *Params, const double *dWU, double *W, double *U) {

    int Nfilt, nt0, tidx, tidy, bid, Nchan, k;
    double x;

    nt0 = (int) Params[4];
    Nchan = (int) Params[9];
    Nfilt = (int) Params[1];
    tidx = threadIdx.x;
    tidy = threadIdx.y + blockIdx.y * blockDim.y;  // Use 2D grid for more threads
    bid = blockIdx.x;

    if (tidy < Nchan) {  // Avoid out-of-bounds access
        x = 0.0f;
        for (k = 0; k < nt0; k++) {
            x += W[k + nt0 * bid + nt0 * Nfilt * tidx] *
                 dWU[k + tidy * nt0 + bid * Nchan * nt0];
        }
        U[tidy + Nchan * bid + Nchan * Nfilt * tidx] = x;
    }
}