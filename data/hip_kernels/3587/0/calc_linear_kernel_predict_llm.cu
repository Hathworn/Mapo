#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void calc_linear_kernel_predict(int objs, int coords, double* x, int objs_train, double* x_train, double* out) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int i = idx / objs;
    int j = idx % objs;
    if (i < objs_train) {
        double r = 1.0;
        int offset_i = coords * i; // Precompute offset for x_train
        int offset_j = coords * j; // Precompute offset for x

        // Unroll loop to increase performance
        for (int k = 0; k < coords; k += 2) {
            r += x_train[offset_i + k] * x[offset_j + k];
            if (k + 1 < coords) {  // Handle odd number of coords
                r += x_train[offset_i + k + 1] * x[offset_j + k + 1];
            }
        }
        out[idx] = r;
    }
}