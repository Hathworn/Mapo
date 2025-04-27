#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _adam64(int n, int t, double eps, double b1, double b2, double *fstm, double *scndm, double *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Precompute coefficients outside the loop for efficiency
    double b1_pow_t = pow(b1, (double)t);
    double b2_pow_t = pow(b2, (double)t);
    double one_minus_b1_pow_t = 1 - b1_pow_t;
    double one_minus_b2_pow_t = 1 - b2_pow_t;

    while (i < n) {
        double dw_i = dw[i];
        fstm[i] = b1 * fstm[i] + (1 - b1) * dw_i;
        scndm[i] = b2 * scndm[i] + (1 - b2) * (dw_i * dw_i);
        dw[i] = (fstm[i] / one_minus_b1_pow_t) / (sqrt(scndm[i] / one_minus_b2_pow_t) + eps);

        i += blockDim.x * gridDim.x;
    }
}