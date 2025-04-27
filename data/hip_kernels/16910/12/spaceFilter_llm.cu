#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void spaceFilter(const double *Params, const float *data, const float *U, const int *iC, const int *iW, float *dprod){
    extern __shared__ float sU[]; // Use dynamic shared memory
    __shared__ int iU[32];
    float x;
    int tid, bid, i, k, Nrank, Nchan, NT, Nfilt, NchanU;

    tid = threadIdx.x;
    bid = blockIdx.x;
    NT = (int) Params[0];
    Nfilt = (int) Params[1];
    Nrank = (int) Params[6];
    NchanU = (int) Params[10];
    Nchan = (int) Params[9];

    if (tid < NchanU)
        iU[tid] = iC[tid + NchanU * iW[bid]];
    __syncthreads();

    if(tid < NchanU * Nrank)
        sU[tid] = U[iU[tid % NchanU] + Nchan * bid + Nchan * Nfilt * (tid / NchanU)];
    __syncthreads();

    for (int t = tid; t < NT; t += blockDim.x) { // Unroll the loop for better memory access
        for (k = 0; k < Nrank; k++) {
            x = 0.0f;
            for (i = 0; i < NchanU; i++)
                x += sU[i + NchanU * k] * data[t + NT * iU[i]];
            dprod[t + NT * bid + k * NT * Nfilt] = x;
        }
    }
}