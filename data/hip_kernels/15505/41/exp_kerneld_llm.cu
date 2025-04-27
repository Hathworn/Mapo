#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_kerneld(double *v, int n) {
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop to allow each thread to process multiple elements
    while (x < n) {
        v[x] = exp(v[x]);
        x += blockDim.x * gridDim.x; // Move to the next set of elements
    }
}