#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subtract_kernal(float* data, float f, const int totaltc)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds for processing
    if(idx < totaltc){
        data[idx] -= f; // Perform subtraction operation
    }
}