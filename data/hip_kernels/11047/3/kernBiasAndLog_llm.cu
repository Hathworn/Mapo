#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernBiasAndLog(double* sumexp, double* bias) {
    // Load data from global memory to register for faster access
    double local_sumexp = *sumexp;
    double local_bias = *bias;
    
    // Perform bias addition and logarithm operation
    local_sumexp = local_bias + log(local_sumexp);
    
    // Store the result back to global memory
    *sumexp = local_sumexp;
}