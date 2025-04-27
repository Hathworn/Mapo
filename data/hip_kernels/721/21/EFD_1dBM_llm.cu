#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void EFD_1dBM(int size, float *d_val_n, float *d_val_npo, float Pu, float Pm, float Pd) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < size) {
        float new_val_i;
        if (i > 0 && i < size - 1) {
            new_val_i = Pu * d_val_n[i + 1] + Pm * d_val_n[i] + Pd * d_val_n[i - 1];
        } else {
            new_val_i = Pm * d_val_n[i];  // Boundary element calculation
        }

        if (i == 0) {
            d_val_npo[i] = d_val_npo[1];
        } else if (i == size - 1) {
            d_val_npo[i] = d_val_npo[i - 1];
        } else {
            d_val_npo[i] = new_val_i;  // Store calculated value
        }
    }
}