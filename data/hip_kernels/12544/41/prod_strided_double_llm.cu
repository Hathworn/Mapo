#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void prod_strided_double(int n, int xOffset, double *dx, int incx, double result) {
    // Local result for each thread to avoid collisions
    double local_result = 1.0;
    
    // Use a grid stride loop for better performance
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if(i >= xOffset && (i - xOffset) % incx == 0)  // Corrected stride condition
            local_result *= dx[i];
    }

    // Atomic operation to reduce results from all threads
    atomicMul(&result, local_result);
}

__device__ void atomicMul(double* address, double val) {
    unsigned long long int* address_as_ull = (unsigned long long int*) address;
    unsigned long long int old = *address_as_ull, assumed;
    do {
        assumed = old;
        old = atomicCAS(address_as_ull, assumed, __double_as_longlong(val * __longlong_as_double(assumed)));
    } while (assumed != old);
}