#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void error_reduc(double *error_d, int bit) {
    __shared__ double error_ds[55];
    int tix = threadIdx.x;

    // Load shared memory in parallel
    if (tix < 55) {
        error_ds[tix] = error_d[tix];
    }
    __syncthreads();

    // Use parallel reduction with a stride
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tix < s) {
            error_ds[tix] += error_ds[tix + s];
        }
        __syncthreads();
    }

    // Normalize and output result from the first thread
    if (tix == 0) {
        error_ds[0] /= 55.0;
        printf("GPU Error: %f\n", error_ds[0] * 100.0);
    }

    // Reset the error array
    if (tix < 55) {
        error_d[tix] = 0.0;
    }
}