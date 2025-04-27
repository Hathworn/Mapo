#include "hip/hip_runtime.h"
#include "includes.h"
void vectorAdd(double* A, double* B, double* C,int n);

__global__ void vecAddKernel(double* A, double* B, double* C, int n) {
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check index bounds and perform vector addition
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}