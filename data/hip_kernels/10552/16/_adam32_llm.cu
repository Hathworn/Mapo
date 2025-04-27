#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _adam32(int n, int t, double eps, double b1, double b2, float *fstm, float *scndm, float *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    double b1t_inv = 1.0 / (1 - pow(b1, (double)t)); // Precompute 1 - b1^t
    double b2t_inv = 1.0 / (1 - pow(b2, (double)t)); // Precompute 1 - b2^t
    while (i < n) {
        float fstm_val = fstm[i];
        float dw_val = dw[i];
        // Update the first moment estimate
        fstm_val = b1 * fstm_val + (1 - b1) * dw_val;
        // Update the second moment estimate
        float scndm_val = scndm[i];
        scndm_val = b2 * scndm_val + (1 - b2) * (dw_val * dw_val);
        // Compute the bias-corrected estimates and update the weights
        dw[i] = (fstm_val * b1t_inv) / (sqrt(scndm_val * b2t_inv) + eps);

        // Write updates back to global memory
        fstm[i] = fstm_val;
        scndm[i] = scndm_val;

        i += blockDim.x * gridDim.x;
    }
}