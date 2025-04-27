#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *x, float *y) {
    
    // Calculate the global index of each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index does not exceed the array size
    if (i < n) {
        // Add the elements from array x and array y and store in y
        y[i] = x[i] + y[i];
    }
}