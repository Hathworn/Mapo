#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float compute(float val) {
    return sqrt(pow(3.14159, val)); // Pre-compute result in device function to reduce redundancy
}

__global__ void kernel(float *x, int n)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculating stride outside loop
    for (int i = tid; i < n; i += stride) {
        x[i] = compute(i); // Call the pre-computed device function
    }
}