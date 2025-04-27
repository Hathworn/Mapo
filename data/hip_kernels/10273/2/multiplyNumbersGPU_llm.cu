#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyNumbersGPU(float *pDataA, float *pDataB, float *pResult)
{
    int tid = (blockIdx.y * gridDim.x * blockDim.x) + blockIdx.x * blockDim.x + threadIdx.x; // Generalize grid indexing
    float a = pDataA[tid]; // Load the memory once
    float b = pDataB[tid];
    float temp = a * b / 12.34567; // Simplify arithmetic operation
    pResult[tid] = sqrt(temp) * sin(a); // Reuse already loaded variable
}