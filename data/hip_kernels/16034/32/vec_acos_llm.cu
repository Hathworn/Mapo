#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize thread index calculation for better performance
__global__ void vec_acos(int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n) {
        result[id] = acos(x[id]);
    }
}