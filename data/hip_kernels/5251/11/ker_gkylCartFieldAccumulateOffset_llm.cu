#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ker_gkylCartFieldAccumulateOffset(unsigned sInp, unsigned sOut, unsigned nCells, unsigned compStart, unsigned nCompInp, unsigned nCompOut, double fact, const double *inp, double *out) {
    // Calculate the global thread index
    unsigned i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < nCells) { // Check boundary condition for thread index
        if (nCompInp < nCompOut) {
            for (unsigned c = 0; c < nCompInp; ++c) {
                // Directly calculate index to avoid repeated computation
                unsigned outIdx = sOut + i * nCompOut + compStart + c;
                unsigned inpIdx = sInp + i * nCompInp + c;
                out[outIdx] += fact * inp[inpIdx];
            }
        } else {
            for (unsigned c = 0; c < nCompOut; ++c) {
                // Directly calculate index to avoid repeated computation
                unsigned outIdx = sOut + i * nCompOut + c;
                unsigned inpIdx = sInp + i * nCompInp + compStart + c;
                out[outIdx] += fact * inp[inpIdx];
            }
        }
    }
}