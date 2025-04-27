#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimizedKernel(int N, double *input, double *output) {
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    if(global_i < N) {
        double sum = 0.0;

        // Use a loop unrolling technique to enhance memory access and performance
        for (int i = 0; i < N; i += 4) {
            if (i < N) sum += input[i];
            if (i + 1 < N) sum += input[i + 1];
            if (i + 2 < N) sum += input[i + 2];
            if (i + 3 < N) sum += input[i + 3];
        }
        
        // Calculate the average
        output[global_i] = sum / N;
    }
    return;
}