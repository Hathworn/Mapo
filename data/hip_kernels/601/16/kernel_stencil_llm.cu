#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_stencil(float *new_data, float *data, float *param_a, float *param_b, float *param_c, float *param_wrk, float *param_bnd) {

    int _tid_ = threadIdx.x + blockIdx.x * blockDim.x;

    // Early exit if index out of bounds
    if (_tid_ >= 129 * 65 * 65) return;

    int idx_0 = _tid_ / (65 * 65);
    int idx_1 = (_tid_ / 65) % 65;
    int idx_2 = _tid_ % 65;

    // Use bounds check to prevent redundant conditions
    if (idx_0 <= 0 || idx_0 >= 128 || idx_1 <= 0 || idx_1 >= 64 || idx_2 <= 0 || idx_2 >= 64) {
        new_data[_tid_] = 0.0; 
        return; 
    }

    int base_idx = idx_0 * 65 * 65 + idx_1 * 65 + idx_2; // Precompute base index

    // Fetch data values
    float v000 = data[base_idx];
    float v100 = data[base_idx + 65 * 65];
    float v010 = data[base_idx + 65];
    float v001 = data[base_idx + 1];
    float v110 = data[base_idx + 65 * 65 + 65];
    float v120 = data[base_idx + 65 * 65 - 65];
    float v210 = data[base_idx - 65 * 65 + 65];
    float v220 = data[base_idx - 65 * 65 - 65];
    float v011 = data[base_idx + 65 + 1];
    float v021 = data[base_idx - 65 + 1];
    float v012 = data[base_idx + 65 - 1];
    float v022 = data[base_idx - 65 - 1];
    float v101 = data[base_idx + 65 * 65 + 1];
    float v201 = data[base_idx - 65 * 65 + 1];
    float v102 = data[base_idx + 65 * 65 - 1];
    float v202 = data[base_idx - 65 * 65 - 1];
    float v200 = data[base_idx - 65 * 65];
    float v020 = data[base_idx - 65];
    float v002 = data[base_idx - 1];

    // Load parameters
    int param_a_idx = 65 * 65 * 4 * idx_0 + 65 * 4 * idx_1 + 4 * idx_2;
    int param_b_idx = 65 * 65 * 3 * idx_0 + 65 * 3 * idx_1 + 3 * idx_2;
    int param_c_idx = 65 * 65 * 3 * idx_0 + 65 * 3 * idx_1 + 3 * idx_2;
    int param_wrk_idx = 65 * 65 * idx_0 + 65 * idx_1 + idx_2;
    int param_bnd_idx = 65 * 65 * idx_0 + 65 * idx_1 + idx_2;

    // Compute new data value
    new_data[_tid_] =
        v000 + 0.8f * (((
        param_a[param_a_idx + 0] * v100 +
        param_a[param_a_idx + 1] * v010 +
        param_a[param_a_idx + 2] * v001 +
        param_b[param_b_idx + 0] * (v110 - v120 - v210 + v220) +
        param_b[param_b_idx + 1] * (v011 - v021 - v012 + v022) +
        param_b[param_b_idx + 2] * (v101 - v201 - v102 + v202) +
        param_c[param_c_idx + 0] * v200 +
        param_c[param_c_idx + 1] * v020 +
        param_c[param_c_idx + 2] * v002 +
        param_wrk[param_wrk_idx]) *
        param_a[param_a_idx + 3] - v000) * param_bnd[param_bnd_idx]);
}