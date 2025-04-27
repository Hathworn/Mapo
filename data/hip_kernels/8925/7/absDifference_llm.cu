#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absDifference(double *dDifference, double *dSup, double *dLow, int dSize) {
    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use stride-based loop; stride is the total number of threads
    int stride = blockDim.x * gridDim.x;
    
    for (int i = tid; i < dSize; i += stride) {
        double a = dSup[i];
        double b = dLow[i];
        dDifference[i] = fabs(a - b); // Use built-in function for absolute value
    }
}