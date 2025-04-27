#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024,  NrankMax = 3, nt0max = 71, NchanMax = 1024;

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
__global__ void getwtw(const double *Params, const double *dWU, double *wtw) {
    int nt0, tidx, tidy, bid, Nchan, k;
    double x;

    nt0   = __double2int_rd(Params[4]);  // Convert to int using a more optimal method
    Nchan = __double2int_rd(Params[9]);

    tidx = threadIdx.x;
    tidy = threadIdx.y;

    bid = blockIdx.x;

    int offset = bid * Nchan * nt0;
    int stride = blockDim.y;

    while (tidy < nt0) {
        x = 0.0;
        for (k = 0; k < Nchan; k++) {
            int index = k * nt0 + offset;
            x += dWU[tidx + index] * dWU[tidy + index];
        }
        wtw[tidx + tidy * nt0 + bid * nt0 * nt0] = x;
        tidy += stride;  // Increment by blockDim.y for better utilization
    }
}