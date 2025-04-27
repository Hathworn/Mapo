#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void init(double* A, double* V, double* VN, int size, int n) {
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
   
    // Check bounds
    if (i >= size) return;
    
    // Use a register for accumulation for better performance
    double s = 0.0;
    
    // Iterate through 'n' and accumulate in 's'
    for (int j = 0; j < n; j++) {
        s += A[i * n + j] * V[j];
    }
    
    // Write the result back
    VN[i] = s;
}