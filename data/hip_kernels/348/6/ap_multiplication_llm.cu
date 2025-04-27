#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ap_multiplication(float * values, int * indices, float * r, float * p_sum, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (index < size) {
        float sum = 0.0f; // Use local variable to accumulate sum
        for (int i = 0; i < 3; i++) {
            sum += values[3 * index + i] * r[indices[3 * index + i]];
        }
        p_sum[index] = sum; // Store the result back
    }
}