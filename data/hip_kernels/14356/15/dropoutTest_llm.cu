#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"
__global__ void dropoutTest( const float* arguments, float* results, const float dropoutFraction, const long size ) {
    // Calculate the global thread index more accurately using blockDim
    const int index = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * gridDim.x * blockDim.x);

    // Check if index is within array bounds
    if(index < size) {
        // Apply dropout
        results[index] = arguments[index] * (1.f - dropoutFraction);
    }
}