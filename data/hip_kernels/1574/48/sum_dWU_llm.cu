#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum_dWU(const double *Params, const float *bigArray, float *WU) {

    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int Nfilters = (int) Params[2];
    int Nthreads = blockDim.x;
    int Nfeatures = (int) Params[1];
    int Nblocks = gridDim.x;
    int NfeatW = (int) Params[4];

    int nWU = NfeatW * Nfilters;
    int nElem = Nfeatures * NfeatW; // number of elements in each subArray of bigArray

    // Calculate which element we're addressing
    int tind = tid + bid * Nthreads;

    // Use loop unrolling strategy for better performance
    while (tind < nWU) {
        int currFilt = tind / NfeatW; // Use integer division for faster calculation
        int currFW = tind % NfeatW;   // Use modulo for faster calculation

        float sum = 0.0f;

#pragma unroll
        for (int ind = 0; ind < Nfeatures; ind++) {
            int currIndex = currFilt * nElem + ind * NfeatW + currFW; // Calculate index directly
            sum += bigArray[currIndex];
        }

        WU[tind] += sum;
        tind += Nblocks * Nthreads;
    }
}