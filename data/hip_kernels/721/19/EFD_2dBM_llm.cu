#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void EFD_2dBM(int width, int height, int pitch_n, int pitch_npo, float* d_val_n, float* d_val_npo, float alpha, float beta) {
    int idx = blockIdx.x; // row
    int idy = threadIdx.x; // column

    if ((idx < height) && (idy < width)) {
        // Pre-compute common indices
        int idx_pitch_n = idx * (pitch_n / sizeof(float));
        int idx_pitch_npo = idx * (pitch_npo / sizeof(float));

        // Load neighboring values
        float north = (idx > 0) ? d_val_n[(idx - 1) * (pitch_n / sizeof(float)) + idy] : d_val_n[1 * (pitch_n / sizeof(float)) + idy];
        float south = (idx < height - 1) ? d_val_n[(idx + 1) * (pitch_n / sizeof(float)) + idy] : d_val_n[(height - 2) * (pitch_n / sizeof(float)) + idy];
        float west = (idy > 0) ? d_val_n[idx_pitch_n + idy - 1] : d_val_n[idx_pitch_n + 1];
        float east = (idy < width - 1) ? d_val_n[idx_pitch_n + idy + 1] : d_val_n[idx_pitch_n + width - 2];

        // Perform stencil operation
        d_val_npo[idx_pitch_npo + idy] = alpha * (north + south) + beta * (west + east) + (1.0f - 2.0f * alpha - 2.0f * beta) * d_val_n[idx_pitch_n + idy];
    }
}