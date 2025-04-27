#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void count_spikes(const double *Params, const int *id, int *nsp, const float *x, float *V) {
    int tid = threadIdx.x; // Thread index
    int bid = blockIdx.x;  // Block index
    int NthreadsMe = blockDim.x; // Threads per block
    int Nblocks = gridDim.x; // Total blocks

    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];

    int tind = tid + NthreadsMe * bid;

    // Loop stride by total number of threads
    while (tind < Nfilters) {
        nsp[tind] = 0; // Initialize spike count
        V[tind] = 0.0f; // Initialize voltage sum
        for (int ind = 0; ind < Nspikes; ind++) {
            if (id[ind] == tind) {
                nsp[tind]++;
                V[tind] += x[ind]; // Accumulate voltage for spikes relating to this filter
            }
        }
        V[tind] = V[tind] / (.001f + (float) nsp[tind]); // Compute average voltage
        tind += NthreadsMe * Nblocks;
    }
}