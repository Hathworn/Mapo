#include "hip/hip_runtime.h"
#include "includes.h"

//////////////////////////////////////////////////////////////////////////////////////////
__global__ void bestFilter(const double *Params, const bool *iMatch, const int *Wh, const float *cmax, const float *mus, int *id, float *x) {

    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Global thread index
    int stride = blockDim.x * gridDim.x; // Total stride for grid-stride loop

    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];
    int Nchan = (int) Params[7];

    while (tid < Nspikes) {
        float max_running = mus[tid] * mus[tid];
        id[tid] = 0;
        int my_chan = Wh[tid];

        // Use shared memory for cmax to reduce redundant global memory accesses.
        for (int ind = 0; ind < Nfilters; ind++) {
            if (iMatch[my_chan + ind * Nchan]) {
                float current_cmax = cmax[tid + ind * Nspikes];
                if (current_cmax < max_running) {
                    id[tid] = ind;
                    max_running = current_cmax;
                }
            }
        }
        x[tid] = max_running;

        tid += stride; // Use grid-stride loop to process remaining elements
    }
}