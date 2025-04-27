#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// Improved global kernel function
__global__ void addKernel(double *c, const double *a, const double *b) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < N) { // Ensure thread index is within array bounds
        c[i] = a[i] + b[i];
    }
}