#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void self_dots(int n, int d, double* data, double* dots) {

    // Determine the ID of the current thread
    int global_id = blockDim.x * blockIdx.x + threadIdx.x;

    if (global_id < n) {
        double accumulator = 0.0;

        // Unroll loop to use registers efficiently
        #pragma unroll
        for (int i = 0; i < d; i++) {
            double value = data[i + global_id * d];
            accumulator += value * value;
        }

        dots[global_id] = accumulator;
    }
}