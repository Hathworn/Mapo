#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bestFilter(const double *Params, const bool *iMatch, const int *Wh, const float *cmax, const float *mus, int *id, float *x) {

    int tid, tind, my_chan, Nspikes, Nfilters, Nthreads, Nchan, Nblocks;
    float max_running = 0.0f;

    Nspikes = static_cast<int>(Params[0]);
    Nfilters = static_cast<int>(Params[2]);
    Nchan = static_cast<int>(Params[7]);
    Nthreads = blockDim.x;
    Nblocks = gridDim.x;

    tid = threadIdx.x;
    int bid = blockIdx.x;

    tind = tid + bid * Nthreads;

    while (tind < Nspikes) {
        // Use mus[tind] squared value for comparison directly
        max_running = mus[tind] * mus[tind];
        id[tind] = 0;
        my_chan = Wh[tind];
        for (int ind = 0; ind < Nfilters; ++ind) {
            if (iMatch[my_chan + ind * Nchan]) {
                int cmax_index = tind + ind * Nspikes;
                if (cmax[cmax_index] < max_running) {
                    id[tind] = ind;
                    max_running = cmax[cmax_index];
                }
            }
        }
        x[tind] = max_running;
        tind += Nblocks * Nthreads;
    }
}