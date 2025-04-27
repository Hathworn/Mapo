#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ap_multiplication(float *values, int *indeces, float *r, float *p_sum, int size) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Check bounds before accessing shared memory
    if (index < size) {
        float sum = 0.0f; // Use local variable for accumulation
        for (int i = 0; i < 3; i++) {
            sum += values[3 * index + i] * r[indeces[3 * index + i]];
        }
        p_sum[index] = sum; // Write back to global memory
    }
}