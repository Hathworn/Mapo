```c
#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void average_snips(const double *Params, const int *st, const int *id,  const float *x, const float *y,  const int *counter, const float *dataraw, const float *W, const float *U, double *WU, int *nsp, const float *mu, const float *z) {

    int nt0 = (int) Params[4];
    int Nchan = (int) Params[9];
    int Nrank = (int) Params[6];
    int Nfilt = (int) Params[1];
    int NT = (int) Params[0];
    int tidx = threadIdx.x;
    int bid = blockIdx.x;
    float Th = (float) Params[15];

    for (int currInd = 0; currInd < counter[0]; currInd++) {
        if (x[currInd] > Th && id[currInd] == bid) { // Combined conditions to reduce nesting
            if (tidx == 0 && threadIdx.y == 0) {
                atomicAdd(&nsp[bid], 1); // Use atomic to prevent race condition
            }

            for (int tidy = threadIdx.y; tidy < Nchan; tidy += blockDim.y) { // Use for-loop for channel iteration
                double X = 0.0;
                for (int k = 0; k < Nrank; k++) { // Loop over rank
                    X += W[tidx + bid * nt0 + nt0 * Nfilt * k] * U[tidy + bid * Nchan + Nchan * Nfilt * k];
                }

                double xsum = dataraw[st[currInd] + tidx + NT * tidy] + y[currInd] * X;
                atomicAdd(&WU[tidx + tidy * nt0 + nt0 * Nchan * bid], xsum); // Use atomic for WU update
            }
        }
    }
}