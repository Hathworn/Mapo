#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(float * in1, float * in2, float * out, int len) {
    // Use shared memory for data locality and reduced global memory access
    extern __shared__ float shared_data[]; 
    float *shared_in1 = shared_data;
    float *shared_in2 = shared_data + blockDim.x;
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < len) {
        // Load data into shared memory
        shared_in1[threadIdx.x] = in1[i];
        shared_in2[threadIdx.x] = in2[i];
        __syncthreads();
        
        // Perform the addition using shared memory
        out[i] = shared_in1[threadIdx.x] + shared_in2[threadIdx.x];
    }
}