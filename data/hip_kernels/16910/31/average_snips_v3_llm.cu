#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void average_snips_v3(const double *Params, const int *ioff, const int *id, const float *uproj, const float *cmax, float *bigArray) {
    // Get thread and block indices for feature and filter
    int tid = threadIdx.x; // Feature index
    int bid = blockIdx.x;  // Filter index

    // Load parameters
    int Nspikes = static_cast<int>(Params[0]);
    int Nfeatures = static_cast<int>(Params[1]);
    int NfeatW = static_cast<int>(Params[4]);

    // Pointer to the section of bigArray for a specific filter and feature
    float* bigArrayPointer = bigArray + tid * (NfeatW + 1) + Nfeatures * NfeatW * bid;

    // Loop over spikes and compute projection sum
    for (int ind = 0; ind < Nspikes; ind++) {
        if (id[ind] == bid) {
            float xsum = uproj[tid + Nfeatures * ind];
            atomicAdd(&bigArrayPointer[ioff[ind]], xsum); // Use atomic add for thread safety
        }
    }
}