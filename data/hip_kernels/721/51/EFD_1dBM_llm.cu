#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void EFD_1dBM(int size, float *d_val_n, float *d_val_npo, float Pu, float Pm, float Pd) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < size) {
        // Improved memory coalescing
        float val_npo = 0.0f;
        if (i > 0) {
            val_npo += Pd * d_val_n[i - 1];
        }
        val_npo += Pm * d_val_n[i];
        if (i < size - 1) {
            val_npo += Pu * d_val_n[i + 1];
        }

        d_val_npo[i] = val_npo;

        // Simplified boundary handling with conditional avoidance
        if (i == 0) {
            d_val_npo[i] = d_val_npo[1];
        } else if (i == size - 1) {
            d_val_npo[i] = d_val_npo[i - 1];
        }
    }
}