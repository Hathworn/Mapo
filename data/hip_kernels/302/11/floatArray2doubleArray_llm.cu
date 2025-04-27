#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floatArray2doubleArray(const float * floatArray, double* doubleArray, const int size) {
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Only convert elements if within bounds
    if (i < size) {
        doubleArray[i] = static_cast<double>(floatArray[i]);
    }
}