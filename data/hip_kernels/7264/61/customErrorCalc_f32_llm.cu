#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void customErrorCalc_f32(float* vector, float* ideal_vector, float threshold, float scaleFoff, float scaleFon, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access
    __shared__ float shared_vector[256];
    
    if (idx < len) {
        shared_vector[threadIdx.x] = vector[idx];
        __syncthreads();

        float vectorValue = shared_vector[threadIdx.x];
        if (ideal_vector[idx] > threshold) {
            output[idx] = 1.0f - vectorValue;
            if (vectorValue < threshold) {
                output[idx] *= scaleFoff;
            }
        } else {
            output[idx] = vectorValue * vectorValue;
            if (vectorValue > threshold) {
                output[idx] *= scaleFon;
            }
        }
    }
}