#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floor_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use if statement outside of for loop for better readability and optimization
    if (i < n && i >= idx && i % incy == 0) {
        result[i] = floor(dy[i]);
    }
}