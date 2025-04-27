#include "hip/hip_runtime.h"
#include "includes.h"
// Author: Adriel Kim
// 6-27-2020
// Updated 7-5-2020

#define R 4176
#define C 2048
#define N (R*C)
const int threadsPerBlock = 1024;
const int blocksPerGrid = 8352;

using namespace std;

// Optimized kernel function for matrix division
__global__ void matrixDivideKernel(double* c, const double* a, const double* b) {
    // Use the tid calculated using grid-stride loop to ensure efficient usage of threads
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Eliminating the division operation within the while loop
    if (tid < N) {
        c[tid] = __ddiv_rd(a[tid], b[tid]); // Utilize fast device division
    }
    // Utilize a grid-stride loop to cover all elements efficiently
    tid += blockDim.x * gridDim.x;
    while (tid < N) {
        c[tid] = __ddiv_rd(a[tid], b[tid]); // Apply fast division operation
        tid += blockDim.x * gridDim.x;
    }
}