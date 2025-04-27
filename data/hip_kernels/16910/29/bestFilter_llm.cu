#include "hip/hip_runtime.h"
#include "includes.h"

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
__global__ void bestFilter(const double *Params, const bool *match, const int *iC, const int *call, const float *cmax, int *id, float *cx) {
    // Define shared memory to cache match and cmax values for better memory access
    extern __shared__ bool shared_match[];
    float max_running = 0.0f;

    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];
    int Nchan = (int) Params[7];
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int Nthreads = blockDim.x;
    int Nblocks = gridDim.x;

    int tind = tid + bid * Nthreads;
    
    // Calculate number of match entries each thread should handle
    int match_offset = tid * Nchan;
    if (match_offset < Nfilters * Nchan) {
        for (int k = 0; k < Nchan; k++) {
             shared_match[match_offset + k] = match[match_offset + k];
        }
    }
    __syncthreads(); // Make sure all threads have cached their data

    while (tind < Nspikes) {
        max_running = 0.0f;
        id[tind] = 0;
        int my_chan = call[tind];

        // Iterate over filters
        for (int ind = 0; ind < Nfilters; ind++) {
            if (shared_match[my_chan + ind * Nchan]) {
                float cmax_val = cmax[tind + ind * Nspikes];
                if (cmax_val > max_running) { // Update max_running if a new maximum is found
                    id[tind] = ind;
                    max_running = cmax_val;
                }
            }
        }

        cx[tind] = max_running;
        tind += Nblocks * Nthreads; // Move to the next spike index in CUDA grid
    }
}