#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Reduce redundant recalculations of common expressions
    int part_size = BLOCK * size;
    int filter_size = filter + n * batch;

    for(int b = 0; b < batch; ++b){
        for(int i = p; i < size; i += BLOCK){
            int index = i + size * filter_size + size * b;
            // Ensure that only valid indices are accessed
            if (i < size) {
                sum += delta[index] * x_norm[index];
            }
        }
    }
    
    part[p] = sum;
    __syncthreads();

    // Use parallel reduction for better performance
    if (p < BLOCK / 2) {
        for(int offset = BLOCK / 2; offset > 0; offset /= 2) {
            if (p < offset) {
                part[p] += part[p + offset];
            }
            __syncthreads();
        }
    }
    
    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);
    }
}