#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024,  NrankMax = 3, nt0max = 71, NchanMax = 1024;

__global__ void blankdWU(const double *Params, const double *dWU, const int *iC, const int *iW, double *dWUblank) {
    // Variable declarations
    int nt0 = (int) Params[4];
    int Nchan = (int) Params[9];
    int NchanNear = (int) Params[10];
    int tidx = threadIdx.x;
    int bid = blockIdx.x;

    // Use shared memory for intermediate calculations (if needed)
    __shared__ int shared_iC[NchanMax];

    if (threadIdx.y < NchanNear) {
        shared_iC[threadIdx.y] = iC[threadIdx.y + NchanNear * iW[bid]];
    }
    __syncthreads();

    for (int tidy = threadIdx.y; tidy < NchanNear; tidy += blockDim.y) {
        int iChan = shared_iC[tidy];
        dWUblank[tidx + nt0 * iChan + bid * nt0 * Nchan] = 
            dWU[tidx + nt0 * iChan + bid * nt0 * Nchan];
    }
}