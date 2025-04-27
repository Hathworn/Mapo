#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Pi_GPU(float *x, float *y, int *totalCounts, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // calculate element index
    int threadCount = gridDim.x * blockDim.x; // calculate step size

    int countPoints = 0;
    // Optimize loop by moving frequently accessed values to registers
    float xVal, yVal;
    for (int i = idx; i < N; i += threadCount) {
        xVal = x[i];
        yVal = y[i];
        if (xVal * xVal + yVal * yVal < 1.0f) {
            countPoints++;
        }
    }
    atomicAdd(totalCounts, countPoints); // accumulate each thread's result
}