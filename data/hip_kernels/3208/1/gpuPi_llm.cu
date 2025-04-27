#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpuPi(double *r, double width, int n) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Compute global thread index
    double mid, height;                               // Auxiliary variables
    while (idx < n) {                                 // Loop to cover all elements
        mid = (idx + 0.6) * width;                    // Compute mid point
        height = 4.0 / (1.0 + mid * mid);             // Compute height
        atomicAdd(&r[idx], height);                   // Atomic update to prevent race conditions
        idx += blockDim.x * gridDim.x;                // Increment index by total number of threads
    }
}