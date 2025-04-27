#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inverse_kernel(double* d_y, double* d_x) {
    // Use local variable to avoid global memory read latency 
    double x_local = d_x[0]; 
    // Prevent division by zero
    if (x_local != 0.0) {
        d_y[0] = 1.0 / x_local;
    } else {
        d_y[0] = 0.0; // Handle zero division safely
    }
}