#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computePSF_signalsqrt(int n, double *result, double *real, double *imag, double divide) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index
    if (id < n) { // Ensure within bounds
        double x = real[id] / divide;
        double y = imag[id] / divide;
        result[id] = sqrt(x * x + y * y); // Optimize computation
    }
}