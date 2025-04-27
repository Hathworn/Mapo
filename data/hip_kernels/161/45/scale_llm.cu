#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale(float knot_max, int nx, int nsamples, float* x, int pitch_x) {
    int col_idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Exit if column index is out of bounds
    if (col_idx >= nx) return;

    float min, max;
    float* col = x + col_idx * pitch_x;

    // Initialize min and max to the first element
    min = max = col[0];

    // Unroll the loop to find min and max
    for (int i = 1; i < nsamples; i++) {
        float val = col[i];
        if (val < min) min = val;
        if (val > max) max = val;
    }

    float delta = max - min;
    float inv_delta = knot_max / delta;  // Precompute inverse for efficiency

    // Scale the column
    for (int i = 0; i < nsamples; i++) {
        col[i] = (col[i] - min) * inv_delta;
    }
}