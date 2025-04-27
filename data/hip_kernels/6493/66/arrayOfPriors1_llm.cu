#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void arrayOfPriors1 (const int dim, const int nwl, const float *cn, const float *nhMd, const float *nhSg, const float *xx, float *pr) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nwl) {
        // Removing unnecessary computations and simplifying logic
        float sum = 0.0f; 
        bool condition = (cn[i] == dim);
        pr[i] = condition * sum + (!condition) * INF;
    }
}