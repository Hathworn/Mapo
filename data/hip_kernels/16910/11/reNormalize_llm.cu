#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024,  NrankMax = 3, nt0max = 71, NchanMax = 1024;

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
__global__ void reNormalize(const double *Params, const double *A, const double *B, double *W, double *U, double *mu) {

    int Nfilt, nt0, tid, bid, Nchan, k, Nrank, imax, t, tmax;
    double x, xmax, xshift, sgnmax;
    volatile __shared__ double sW[NrankMax * nt0max], sU[NchanMax * NrankMax], sS[NrankMax + 1], sWup[nt0max * 10];

    nt0 = static_cast<int>(Params[4]);
    Nchan = static_cast<int>(Params[9]);
    Nfilt = static_cast<int>(Params[1]);
    Nrank = static_cast<int>(Params[6]);
    tmax = static_cast<int>(Params[11]);
    bid = blockIdx.x;
    tid = threadIdx.x;

    // Load shared memory
    for (k = 0; k < Nrank; k++)
        sW[tid + k * nt0] = W[tid + bid * nt0 + k * Nfilt * nt0];

    while (tid < Nchan * Nrank) {
        sU[tid] = U[tid % Nchan + bid * Nchan + (tid / Nchan) * Nchan * Nfilt];
        tid += blockDim.x;
    }

    __syncthreads();

    // Calculate normalization factor for U
    tid = threadIdx.x;
    if (tid < Nrank) {
        x = 0.0;
        for (k = 0; k < Nchan; k++)
            x += sU[k + tid * Nchan] * sU[k + tid * Nchan];
        sS[tid] = sqrt(x);
    }

    if (tid == 0) {
        x = 0.0000001;
        for (k = 0; k < Nrank; k++)
            x += sS[k] * sS[k];
        sS[Nrank] = sqrt(x);
        mu[bid] = sS[Nrank];
    }

    __syncthreads();

    // Re-normalize U
    tid = threadIdx.x;
    while (tid < Nchan * Nrank) {
        U[tid % Nchan + bid * Nchan + (tid / Nchan) * Nchan * Nfilt] = sU[tid] / sS[Nrank];
        tid += blockDim.x;
    }

    __syncthreads();

    // Find max element and align W
    xmax = 0.0;
    imax = 0;
    for (t = 0; t < nt0; t++)
        if (abs(sW[t]) > xmax) {
            xmax = abs(sW[t]);
            imax = t;
        }

    tid = threadIdx.x;
    for (k = 0; k < Nrank; k++) {
        int ishift = tid + (imax - tmax);
        ishift = (ishift % nt0 + nt0) % nt0;
        xshift = sW[ishift + k * nt0];
        W[tid + bid * nt0 + k * nt0 * Nfilt] = xshift;
    }

    __syncthreads();
    for (k = 0; k < Nrank; k++)
        sW[tid + k * nt0] = W[tid + bid * nt0 + k * nt0 * Nfilt];

    __syncthreads();

    // Compute subsample peak
    tid = threadIdx.x;
    if (tid < 10) {
        sWup[tid] = 0;
        for (t = 0; t < nt0; t++)
            sWup[tid] += A[tid + t * 10] * sW[t];
    }
    
    __syncthreads();

    xmax = 0.0;
    imax = 0;
    sgnmax = 1.0;
    for (t = 0; t < 10; t++)
        if (abs(sWup[t]) > xmax) {
            xmax = abs(sWup[t]);
            imax = t;
            sgnmax = copysign(1.0, sWup[t]);
        }

    // Interpolate by imax
    tid = threadIdx.x;
    for (k = 0; k < Nrank; k++) {
        xshift = 0.0;
        for (t = 0; t < nt0; t++)
            xshift += B[tid + t * nt0 + nt0 * nt0 * imax] * sW[t + k * nt0];
        if (k == 0)
            xshift = -xshift * sgnmax;
        W[tid + bid * nt0 + k * nt0 * Nfilt] = xshift;
    }
}