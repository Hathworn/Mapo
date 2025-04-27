#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void floatArray2doubleArray(const float *floatArray, double *doubleArray, const int size) {
    // Calculate the global thread ID
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread index does not exceed the array size
    if (i < size) {
        // Use more efficient type conversion
        doubleArray[i] = __double2loint(floatArray[i]);
    }
}