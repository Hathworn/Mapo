#include "hip/hip_runtime.h"
#include "includes.h"

const int Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void subtract_spikes(const double *Params, const int *st, const int *id, const float *x, const int *counter, float *dataraw, const float *W, const float *U) {
    int nt0, tidx, tidy, k, NT, ind, Nchan, Nfilt, Nrank;
    float X;

    NT    = (int) Params[0];
    nt0   = (int) Params[4];
    Nchan = (int) Params[9];
    Nfilt = (int) Params[1];
    Nrank = (int) Params[6];

    tidx = threadIdx.x;
    ind  = counter[1] + blockIdx.x;

    // Optimize loop with stride approach for better parallel execution
    for (; ind < counter[0]; ind += gridDim.x) {
        for (tidy = threadIdx.y; tidy < Nchan; tidy += blockDim.y) {
            X = 0.0f;
            #pragma unroll // Unroll loop for better performance
            for (k = 0; k < Nrank; k++) {
                X += W[tidx + id[ind] * nt0 + nt0 * Nfilt * k] * U[tidy + id[ind] * Nchan + Nchan * Nfilt * k];
            }
            dataraw[tidx + st[ind] + NT * tidy] -= x[ind] * X;
        }
    }
}