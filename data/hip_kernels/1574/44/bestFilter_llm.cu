#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bestFilter(const double *Params, const bool *match, const int *iC, const int *call, const float *cmax, int *id, float *cx) {
    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];
    int Nchan = (int) Params[7];

    int tid = threadIdx.x;
    int bid = blockIdx.x;

    int tind = tid + bid * blockDim.x * gridDim.x;  // Optimize thread index calculation for coalesced access

    while (tind < Nspikes) {
        float max_running = -1.0f;  // Initialize to -1.0 for valid max checks
        int my_chan = call[tind];  // Cache call for current spike
        id[tind] = 0;  // Assigning default best filter id

        for (int ind = 0; ind < Nfilters; ind++) {
            int match_idx = my_chan + ind * Nchan;
            if (match[match_idx]) {
                int cmax_idx = tind + ind * Nspikes;
                float current_cmax = cmax[cmax_idx];  // Cache current cmax value
                if (current_cmax > max_running) {  // Compare with cached max value
                    id[tind] = ind;  // Update best filter id
                    max_running = current_cmax;  // Update running max
                }
            }
        }

        cx[tind] = max_running;  // Store the max cmax value for the current spike

        tind += blockDim.x * gridDim.x;  // Increment to next element step size
    }
}