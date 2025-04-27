#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_round(int n, double *result, double *x) {
    // Optimize thread and block index calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Avoid redundant calculations of idy and idx
    if (id < n) {
        result[id] = round(x[id]);
    }
}