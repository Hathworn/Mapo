#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normArray ( const int n, float *a ) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    float c = a[0];

    // Ensure all threads load c after it is set up to provide consistent results
    __shared__ float shared_c;
    if (threadIdx.x == 0) {
        shared_c = c;
    }
    __syncthreads();

    if (i < n) {
        // Use shared memory for repeated global memory access
        a[i] = a[i] / shared_c;
    }
}