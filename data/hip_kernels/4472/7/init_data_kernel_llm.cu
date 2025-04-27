#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_data_kernel(int n, double* x) {
    // Use static shared memory and loop unrolling for better memory access
    int total_threads = gridDim.x * blockDim.x;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += total_threads) {
        x[i] = n - i;
    }
}