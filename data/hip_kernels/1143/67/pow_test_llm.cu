#include "hip/hip_runtime.h"
#include "includes.h"

// __device__ function to calculate power of complex number using polar coordinates
__device__ double2 pow(double2 a, int b) {
    double r = sqrt(a.x*a.x + a.y*a.y);  // Compute magnitude
    double theta = atan2(a.y, a.x);      // Compute angle using atan2 for improved accuracy
    double powered_r = pow(r, b);        // Calculate r raised to power b
    double b_theta = b * theta;          // Calculate b times theta
    return {powered_r * cos(b_theta), powered_r * sin(b_theta)};
}

// Optimized __global__ kernel function
__global__ void pow_test(double2 *a, int b, double2 *c) {
    // Use threadIdx.x and blockIdx to support parallel execution
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    c[index] = pow(a[index], b);         // Assign result using parallel indexing
}