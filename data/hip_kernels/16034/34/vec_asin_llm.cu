#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_asin(int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified global ID calculation
    if (id < n) {
        result[id] = asin(x[id]);
    }
}