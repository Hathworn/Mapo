#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_addToCurrentTransform(float* d_currentTransform, float* d_invViewMatrix) {
    // Use shared memory for faster access
    __shared__ float invViewMatrix_shared[12];
    __shared__ float currentTransform_shared[12];

    int tid = threadIdx.x;
    if(tid < 12) {
        invViewMatrix_shared[tid] = d_invViewMatrix[tid];
        currentTransform_shared[tid] = d_currentTransform[tid];
    }
    __syncthreads();

    float result[12] = {0.f};
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 4; ++j) {
            for (int k = 0; k < 4; ++k) {
                result[i * 4 + j] += invViewMatrix_shared[i * 4 + k] * currentTransform_shared[k * 4 + j];
            }
        }
    }
    
    if(tid < 12) {
        d_currentTransform[tid] = result[tid];
    }
}