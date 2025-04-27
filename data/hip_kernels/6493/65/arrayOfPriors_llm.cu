#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayOfPriors ( const int dim, const int nwl, const float *cn, const float *xx, float *pr ) {
    // Calculate the global index once to avoid redundant computations
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < nwl) {
        // Directly assign the result instead of using multiplication and addition
        pr[i] = (cn[i] == dim) ? 0.0f : INF;
    }
}