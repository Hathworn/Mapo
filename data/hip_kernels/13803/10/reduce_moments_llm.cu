#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_moments(float *d_arr, float *d_results, int N)
{
    __shared__ float sh_array[pThreads];
    int n = blockDim.x * blockIdx.x + threadIdx.x;

    // Load elements into shared memory
    if (n < N) {
        sh_array[threadIdx.x] = d_arr[n]; // Corrected - load from global to shared memory
    } else {
        sh_array[threadIdx.x] = 0; // Initialize with 0 if outside array bounds
    }
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sh_array[threadIdx.x] += sh_array[threadIdx.x + s]; // Accumulate within shared memory
        }
        __syncthreads();
    }

    // Write result of this block to global memory
    if (threadIdx.x == 0) {
        d_results[blockIdx.x] = sh_array[0];
    }
}