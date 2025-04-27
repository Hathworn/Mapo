#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _l1reg(int n, float l1, float *w, float *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride once instead of during each loop iteration
    while (i < n) {
        // Use ternary operator to simplify condition checks and updates
        dw[i] += (w[i] > 0) ? l1 : ((w[i] < 0) ? -l1 : 0);
        i += stride;
    }
}