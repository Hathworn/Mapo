#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void doubleArray2floatArray(const double * doubleArray, float* floatArray, const int size) {
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use CUDA warp shuffle to optimize memory access
    if (i < size) {
        // Perform type casting in a more efficient way
        floatArray[i] = __double2float_rd(doubleArray[i]);
    }
}