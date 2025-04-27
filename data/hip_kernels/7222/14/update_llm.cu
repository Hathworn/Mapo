#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(double *weights_in_d, double *weights_h_d, double *weights_out_d, double *weights_in_delta_d, double *weights_h_delta_d, double *weights_out_delta_d, double *error_d) {
    int tix = threadIdx.x;
    int tid = blockIdx.x * blockDim.x + tix; // Calculate global thread index

    // Use shared memory to reduce global memory accesses
    __shared__ double shared_error;

    if (tix == 0) {
        shared_error = error_d[0];
    }

    __syncthreads(); // Synchronize to ensure shared_error is updated

    if (tid < INPUTS * H_HEIGHT) {
        weights_in_d[tid] -= (alpha_d * weights_in_delta_d[tid] / 55);
        weights_in_delta_d[tid] = 0.0;
    }

    if (tid < H_HEIGHT * (INPUTS + OUTPUTS)) {
        weights_h_d[tid] -= (alpha_d * weights_h_delta_d[tid] / 55);
        weights_h_delta_d[tid] = 0.0;
    }

    if (tid < OUTPUTS * H_HEIGHT) {
        weights_out_d[tid] -= (alpha_d * weights_out_delta_d[tid] / 55);
        weights_out_delta_d[tid] = 0.0;
    }

    if (tix == 0) {
        double local_error = shared_error * 100.0 / 55;
        printf("\nGPU Error: %f\n", local_error);
        error_d[0] = 0;
    }
}