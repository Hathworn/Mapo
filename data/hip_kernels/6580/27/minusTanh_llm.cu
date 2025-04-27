#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minusTanh(float* out, const float* __restrict__ in1, const float* __restrict__ in2, int size){
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure processing only valid elements and using memory coalescing
    if(id < size)
        out[id] = in1[id] - in2[id];
}