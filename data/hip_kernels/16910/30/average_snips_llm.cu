```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void average_snips(const double *Params, const int *iC, const int *call, const int *id, const float *uproj, const float *cmax, float *WU){

    int Nspikes = (int) Params[0];
    int NrankPC = (int) Params[1];
    int NchanNear = (int) Params[6];
    int Nchan = (int) Params[7];

    int tidx = threadIdx.x;
    int tidy = threadIdx.y;
    int bid = blockIdx.x;

    float xsum = 0.0f;

    // Cache my_chan and this_chan for current block and thread y
    int my_chan = call[bid]; // Access call[bid] once
    int base_index = NchanNear * my_chan; // Precompute base index

    // Loop optimization: exit if id[ind] != bid early
    for (int ind = 0; ind < Nspikes; ++ind) {
        if (id[ind] == bid) {
            int this_chan = iC[tidy + base_index]; // Use cached base_index
            xsum = uproj[tidx + NrankPC * tidy + NrankPC * NchanNear * ind];
            int wu_index = tidx + NrankPC * this_chan + NrankPC * Nchan * bid;
            atomicAdd(&WU[wu_index], xsum); // Use atomic operation for concurrent access
        }
    }
}