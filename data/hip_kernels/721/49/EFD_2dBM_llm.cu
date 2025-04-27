#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void EFD_2dBM(int width, int height, int pitch_n, int pitch_npo, float *d_val_n, float *d_val_npo, float alpha, float beta) {
    int idx = blockIdx.x;   // row
    int idy = threadIdx.x;  // column

    // Precompute commonly used terms to reduce redundant calculations
    int pitch_n_float = pitch_n / sizeof(float);
    int pitch_npo_float = pitch_npo / sizeof(float);

    if ((idx < height) && (idy < width)) {
        // Use shared memory for boundary handling (ghost cells)
        __shared__ float top, bottom, left, right, center;
        
        // Load values into shared variables
        center = d_val_n[idx * pitch_n_float + idy];
        top = (idx > 0) ? d_val_n[(idx - 1) * pitch_n_float + idy] : center;
        bottom = (idx < height - 1) ? d_val_n[(idx + 1) * pitch_n_float + idy] : center;
        left = (idy > 0) ? d_val_n[idx * pitch_n_float + idy - 1] : center;
        right = (idy < width - 1) ? d_val_n[idx * pitch_n_float + idy + 1] : center;

        // Compute the new value
        d_val_npo[idx * pitch_npo_float + idy] = alpha * (bottom + top)
                                                  + beta * (right + left)
                                                  + (1.0 - 2.0 * alpha - 2.0 * beta) * center;

        // Boundary conditions update
        if (idx == 0) {
            d_val_npo[idx * pitch_npo_float + idy] = d_val_npo[(idx + 1) * pitch_npo_float + idy];
        }
        if (idx == height - 1) {
            d_val_npo[idx * pitch_npo_float + idy] = d_val_npo[(idx - 1) * pitch_npo_float + idy];
        }
        if (idy == 0) {
            d_val_npo[idx * pitch_npo_float + idy] = d_val_npo[idx * pitch_npo_float + idy + 1];
        }
        if (idy == width - 1) {
            d_val_npo[idx * pitch_npo_float + idy] = d_val_npo[idx * pitch_npo_float + idy - 1];
        }
    }
}