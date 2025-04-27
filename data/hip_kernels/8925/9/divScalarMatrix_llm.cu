#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void divScalarMatrix(double *dMatrix, double *dScalar, int dSize) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    double scalar = dScalar[0]; // Cache scalar value in a register for faster access
    int totalThreads = blockDim.x * gridDim.x;

    for (int i = tid; i < dSize; i += totalThreads) { // Use a for loop for better readability
        dMatrix[i] /= scalar; // Use compound assignment for slight optimization
    }
}