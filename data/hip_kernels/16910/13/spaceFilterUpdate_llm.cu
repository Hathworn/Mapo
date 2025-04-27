#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void spaceFilterUpdate(const double *Params, const float *data, const float *U, const bool *UtU, const int *iC, const int *iW, float *dprod, const int *st, const int *id, const int *counter) {
    extern __shared__ float sU[];
    __shared__ int iU[NchanMax];
    float x;
    int tid, bid, ind, t, k, Nrank, NT, Nfilt, NchanU, Nchan;

    tid = threadIdx.x;
    bid = blockIdx.x;
    NT = static_cast<int>(Params[0]);
    Nfilt = static_cast<int>(Params[1]);
    Nrank = static_cast<int>(Params[6]);
    NchanU = static_cast<int>(Params[10]);
    int nt0 = static_cast<int>(Params[4]);
    Nchan = static_cast<int>(Params[9]);

    // Preload iC and U for current batch
    if (tid < NchanU) {
        iU[tid] = iC[tid + NchanU * iW[bid]];
        for (k = 0; k < Nrank; k++) {
            sU[tid + k * NchanU] = U[iU[tid] + Nchan * bid + Nchan * Nfilt * k];
        }
    }
    __syncthreads();

    for (ind = counter[1]; ind < counter[0]; ind++) {
        if (UtU[id[ind] + Nfilt * bid]) {
            t = st[ind] + tid - nt0;
            // Directly checking boundary within the loop
            if (t >= 0 && t < NT) {
                for (k = 0; k < Nrank; k++) {
                    x = 0.0f;
                    for (int i = 0; i < NchanU; i++) {
                        x += sU[i + NchanU * k] * data[t + NT * iU[i]];
                    }
                    dprod[t + NT * bid + k * NT * Nfilt] = x;
                }
            }
        }
    }
}