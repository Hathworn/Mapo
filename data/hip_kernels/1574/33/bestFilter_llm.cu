#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bestFilter(const double *Params, const bool *iW, const float *cmax, int *id) {

    int tind = threadIdx.x + blockIdx.x * blockDim.x; // Direct calculation of tind
    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];
    float Th = (float) Params[7];

    while (tind < Nspikes) {
        float max_running = 0.0f;
        id[tind] = 0;

        for (int ind = 0; ind < Nfilters; ind++) {
            int idx = tind + ind * Nspikes; // Precompute index to avoid recalculation
            if (iW[idx] && cmax[idx] > max_running) { 
                id[tind] = ind;
                max_running = cmax[idx];
            }
        }

        if (max_running < Th * Th) {
            id[tind] = -1; // Assign -1 if below threshold
        }

        tind += gridDim.x * blockDim.x; // Increment by total number of threads
    }
}