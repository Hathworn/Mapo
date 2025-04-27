#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TestpermuteWalkers ( const int dim, const int nwl, const int *kr, const float *xxC, float *xxCP ) {
    // Calculate global thread index in one dimension
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for loop

    // Use a loop to iterate over elements, reducing grid size needed
    for (int t = idx; t < dim * nwl; t += stride) {
        int i = t % dim;  // Calculate 2D indices from 1D index
        int j = t / dim;
        if (i < dim && j < nwl) {
            xxCP[t] = xxC[t];  // Directly map input to output
        }
    }
}