#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smoothing(float* input, float* output, double alpha, double beta, int length) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = i << 1;
    if (j < length) {
        // Reduce memory accesses by reusing computed values
        float input_j = input[j];
        float input_j1 = input[j+1];
        float output_j = output[j];
        float output_j1 = output[j+1];
        
        // Use constant expressions to minimize repeated calculations
        double alpha_term = 1.0 + alpha;
        double beta_term = 1.0 + beta;

        output[j] = (float) (input_j * alpha_term - output_j * alpha);
        output[j+1] = (float) (input_j1 * beta_term - output_j1 * beta);
    }
}