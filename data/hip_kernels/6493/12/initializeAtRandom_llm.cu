#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeAtRandom(const int dim, const int nwl, const float dlt, const float *x0, const float *stn, float *xx) {
    // Calculate 1D global thread index
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (t < dim * nwl) {
        // Calculate linear indices for x0 and stn
        int i = t % dim;
        xx[t] = x0[i] + dlt * stn[t];
    }
}