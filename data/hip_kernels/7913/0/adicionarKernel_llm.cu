#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adicionarKernel(double* resultado, const double* n) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;  // Optimize to handle multiple blocks
    double a = 1, b = 0;
    double temp = -4 * a * n[i];  // Simplify delta calculation
    resultado[i] = sqrt(temp) / 2;  // Store the result directly
}