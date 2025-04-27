#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computeGaussianLikelihood (int n, double *result, double *image, double *model) {
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;
    if (id < n) {
        // Optimization: Branch divergence reduction
        double mod = model[id];
        result[id] = (mod > 0) ? (mod - image[id]) * (mod - image[id]) : 10000000;
    }
}