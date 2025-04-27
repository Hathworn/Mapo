#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void plusTanh(float* out, float* in1, float* in2, int size){
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds before proceeding with computation
    if(id < size) {
        float result = in1[id] + in2[id];
        out[id] = tanh(result); // Apply tanh directly to the result
    }
}