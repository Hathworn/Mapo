#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matchValidity_kernel(float *d_flow, float *d_disparity, int n_cols, int n_rows) {
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < n_cols && y < n_rows) { // Check image boundaries
        unsigned int ind = x + y * n_cols;
        bool valid = isfinite(d_flow[ind]) && isfinite(d_disparity[ind]);
        
        if (!valid) {
            float nan_value = nanf(""); // Avoid repeated nanf calls
            d_flow[ind] = nan_value;
            d_flow[ind + n_cols * n_rows] = nan_value;
            d_disparity[ind] = nan_value;
        }
    }
}