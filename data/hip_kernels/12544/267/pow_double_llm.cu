#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_double(int n, int idx, double *dy, int incy, double raise, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index
    int stride = blockDim.x * gridDim.x; // Calculate the stride

    while (i < n) { // Use a while loop for efficient iteration over data elements
        if (i >= idx && i % incy == 0) {
            result[i] = pow(dy[i], raise); // Only compute power if the condition is met
        }
        i += stride; // Increment by stride to cover all elements
    }
}