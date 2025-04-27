```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calcDenseBarckwardNabraBGPU( float *dz_in, float *dB, int batch_size, int out_size_x ){
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < out_size_x) {
        float sum = 0.0f; // Use a local variable to accumulate
        for (int b = 0; b < batch_size; ++b) {
            sum += dz_in[b * out_size_x + id];
        }
        dB[id] = sum; // Write final sum back to global memory once
    }
}