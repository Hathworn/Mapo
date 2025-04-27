#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int stride = blockDim.x * gridDim.x;            // Calculate stride for loop

    // Loop with stride over elements to eliminate unnecessary condition checks
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = sin(dy[i]);  // Assign sine computation to result array
        }
    }
}