#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_dWU(const double *Params, const float *bigArray, float *WU) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    
    int Nfeatures = (int) Params[1];
    int NfeatW = (int) Params[4];
    int Nfilters = (int) Params[2];
    int Nthreads = blockDim.x;
    int Nblocks = gridDim.x;

    int nWU = NfeatW * Nfilters;
    int nElem = Nfeatures * NfeatW;

    int tind = tid + bid * Nthreads;

    while (tind < nWU) {
        int currFilt = tind / NfeatW; // More efficient integer division
        int currFW = tind % NfeatW;   // More efficient modulo operation

        float sum = 0.0f;

        // Using a strided loop for better performance
        for (int ind = 0; ind < Nfeatures; ++ind) {
            int currIndex = currFilt * nElem + ind * NfeatW + currFW;
            sum += bigArray[currIndex];
        }

        WU[tind] += sum;
        tind += Nblocks * Nthreads;
    }
}