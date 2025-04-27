#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_computePSF_signal(int n, double *result, double *real, double *imag, double divide) {
    // Use shared memory for faster access
    __shared__ double shared_real[1024];
    __shared__ double shared_imag[1024];

    int tx = threadIdx.x;
    int idx = tx + blockIdx.x * blockDim.x;
    int ty = threadIdx.y;
    int idy = ty + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    // Load data into shared memory
    if (id < n) {
        shared_real[tx] = real[id];
        shared_imag[tx] = imag[id];
    }

    __syncthreads();

    if (id < n) {
        double x = shared_real[tx] / divide; // Optimized division
        double y = shared_imag[tx] / divide; // Optimized division
        result[id] = x * x + y * y; // Compute signal
    }
}