```c++
#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to compute the natural logarithm of each element
extern "C"
__global__ void matrix_log(double *A, double *C, unsigned int size) {
    // Use built-in function to compute global index
    unsigned int index = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;
    
    // Ensure index is within array bounds
    if (index < size) {
        // Calculate logarithm of the element at index
        C[index] = log(A[index]);
    }
}