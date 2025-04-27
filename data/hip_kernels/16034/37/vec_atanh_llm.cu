#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_atanh (int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D indexing for simplicity
    if (id < n) {
        result[id] = atanh(x[id]); // Parallel computation using efficient memory access
    }
}