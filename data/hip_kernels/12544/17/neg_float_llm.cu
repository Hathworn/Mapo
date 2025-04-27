#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void neg_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Total number of threads

    while (i < n) { // Iterate over elements with stride
        if (i >= idx && i % incy == 0) {
            result[i] = -dy[i]; // Assign negated value
        }
        i += stride; // Move to the next element handled by this thread
    }
}