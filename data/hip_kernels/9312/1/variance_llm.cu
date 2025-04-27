#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__global__ void variance(int* n, double* x, double* mean)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensuring index is within bounds
    if (i < *n) {
        double diff = x[i] - *mean;
        x[i] = diff * diff;
    }
}