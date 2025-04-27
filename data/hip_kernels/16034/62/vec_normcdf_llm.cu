#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_normcdf(int n, double *result, double *y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D global thread index
    if (id < n) {
        result[id] = normcdf(y[id]); // Efficiently compute normcdf in parallel
    }
}