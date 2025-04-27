#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IMOMask_kernel(float *d_IMOMask, float *d_IMO, const float *d_disparity, float offset, int n_cols, int n_rows) {
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < n_cols && y < n_rows) { // use logical AND for better readability
        unsigned int ind = x + y * n_cols;
        // Perform the operation only when needed
        if (d_IMOMask[ind] == 0.0f) {
            d_IMO[ind] = nanf("");
        }
    }
}