#include "hip/hip_runtime.h"
#include "includes.h"

// includes, project

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void AutoRegPinkK(double* X0, double* X1, double* Y, double* C0, double* D0, double* LastF, int numElts, int Nc)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElts) {
        double sum = 0.0; // Use a local variable to accumulate the sum for reduced memory access
        for (int j = 0; j < Nc; j++) {
            int idx = j * numElts + i;
            double temp = (X0[i] + X1[i]) * D0[j] - C0[j] * LastF[idx];
            LastF[idx] = temp; // Store the computed value back
            sum += temp; // Accumulate the total sum
        }
        Y[i] = sum; // Assign the accumulated sum to Y[i]
    }
}