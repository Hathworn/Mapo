#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_float(int n, int idx, float *dy, int incy, float raise, float *result) {
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate total stride
    
    for (; i < n; i += stride) { // Utilize stride loop to cover all elements
        if (i >= idx && i % incy == 0) // Ensure conditions are met before computation
            result[i] = powf(dy[i], raise); // Perform the powf operation
    }
}