#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void returnStatistic ( const int dim, const int nwl, const float *xx, float *s ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Improved bounds checking to avoid redundant threads
    if (i < dim && j < nwl) {
        int t = i + j * dim;
        s[t] = xx[t] * xx[t]; // Eliminating powf for potential performance gain
    }
}