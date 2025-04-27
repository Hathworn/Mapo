#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findID(double *a, int n) {
    int tPosX = blockIdx.x * blockDim.x + threadIdx.x;
    // Use less divergence by shifting out of the condition
    if (tPosX >= n) return; // Handle boundary condition at the start
    a[tPosX] = tPosX; // Compute global ID and assign to array
}