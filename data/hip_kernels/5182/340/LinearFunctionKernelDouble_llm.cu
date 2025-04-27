```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Calculate linear function on GPU
__global__ void LinearFunctionKernelDouble(double a1, double a0, double* input, double* output, int size)
{
    // Use 1D block and grid indices for a more direct calculation of the global thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure each thread processes only when within bounds
    if(id < size)
    {
        // Load input value
        double x = input[id];
        
        // Compute and store result
        output[id] = a1 * x + a0;
    }
}