#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelVector_suma_constante(float* __restrict__ array, int _size, int _constant){
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Process multiple elements per thread to improve memory coalescing
    for(int i = idx; i < _size; i += gridDim.x * blockDim.x) {
        array[i] += _constant;
    }
}