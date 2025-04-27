#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _rmsprop64(int n, double eps, double rho, double *dw2, double *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Precompute stride to minimize repeated calculations
    if (i < n) { // Ensure index is within bounds
        double local_eps = eps; // Use register for frequently accessed variables
        double local_rho = rho;
        for (int idx = i; idx < n; idx += stride) { // Use for-loop to replace while-loop for readability
            double dw_val = dw[idx];
            dw2[idx] = dw2[idx] * local_rho + (1.0 - local_rho) * dw_val * dw_val;
            dw[idx] /= sqrt(dw2[idx] + local_eps);
        }
    }
}