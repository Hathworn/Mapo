#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void self_dots(int n, int d, double* data, double* dots) {
    // Use shared memory for partial sums
    extern __shared__ double shared_data[];
    double accumulator = 0;
    int global_id = blockDim.x * blockIdx.x + threadIdx.x;

    if (global_id < n) {
        for (int i = threadIdx.x; i < d; i += blockDim.x) {
            double value = data[i + global_id * d];
            accumulator += value * value;
        }
        // Store the result in shared memory
        shared_data[threadIdx.x] = accumulator;

        // Synchronize to ensure all additions are complete
        __syncthreads();

        // Perform reduction in shared memory
        for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if (threadIdx.x < offset) {
                shared_data[threadIdx.x] += shared_data[threadIdx.x + offset];
            }
            __syncthreads();
        }
        // Write the result to the global memory
        if (threadIdx.x == 0) {
            dots[blockIdx.x] = shared_data[0];
        }
    }
}