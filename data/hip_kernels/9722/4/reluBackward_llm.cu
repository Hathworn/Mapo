#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Use 1D blocks as we only need one index calculation

extern "C"
__global__ void reluBackward(double* X, double* dout, double* ret, int rlen, int clen) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;

    for (int i = index; i < rlen * clen; i += totalThreads) {
        ret[i] = X[i] > 0 ? dout[i] : 0;
    }
}