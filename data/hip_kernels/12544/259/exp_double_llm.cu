#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_double(int n, int idx, double *dy, int incy, double *result) {
    // Calculate global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to cover all elements
    int stride = blockDim.x * gridDim.x;

    while (i < n) {
        // Check conditions and perform computation
        if (i >= idx && i % incy == 0) {
            result[i] = exp(dy[i]);
        }
        i += stride; // Move to next element in the stride loop
    }
}