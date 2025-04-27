#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *array_a, float *array_b, float *array_c, int size) {
    // Optimize tid and step calculation using variables and ensure better memory access
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int step = gridDim.x * blockDim.x;
    
    // Use unrolling for better performance
    for (int i = tid; i < size; i += step) {
        array_c[i] = array_a[i] + array_b[i];
    }
}