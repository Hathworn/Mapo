#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeCost(const double *Params, const float *uproj, const float *mu, const float *W, const int *ioff, const bool *iW, float *cmax) {
    // Precompute constant values outside the loop
    int Nspikes = (int) Params[0];
    int Nfeatures = (int) Params[1];
    int NfeatW = (int) Params[4];
    float lam = (float) Params[5];

    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int threadTotal = gridDim.x * blockDim.x;

    while (tid < Nspikes) {
        if (iW[tid + blockIdx.x * Nspikes]) {
            float xsum = 0.0f;
            int tidOffset = Nfeatures * tid;
            int bidOffset = NfeatW * blockIdx.x;
            int wOffset = ioff[tid] + bidOffset;
            for (int k = 0; k < Nfeatures; k++) {
                xsum += uproj[k + tidOffset] * W[k + wOffset];
            }

            // Precompute reusable values and simplify expression
            float Ci = max(0.0f, xsum) + lam / mu[blockIdx.x];
            float mu2 = mu[blockIdx.x] * mu[blockIdx.x];
            cmax[tid + blockIdx.x * Nspikes] = Ci * Ci / (1.0f + lam / mu2) - lam;
        }
        // Step through threads more efficiently
        tid += threadTotal;
    }
}