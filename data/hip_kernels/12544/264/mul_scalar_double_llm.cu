#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_scalar_double(int n, int idx, double dx, double *dy, int incy, double *result) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a `while` loop to prevent repeated condition checking
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] * dx;
        }
        i += blockDim.x * gridDim.x; // Increment using grid-stride loop
    }
}