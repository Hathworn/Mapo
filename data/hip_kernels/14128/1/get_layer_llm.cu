#include "hip/hip_runtime.h"
#include "includes.h"

#define PIXELS 3073
#define HIDDEN_LAYER_1 2000
#define HIDDEN_LAYER_2 450
#define OUTPUT_LAYER 10
#define LEARNING_RATE 0.01
#define ELEMENTS 1000
#define BLOCKS 32

__global__ void get_layer(double *input, double *matrix, double *result, int input_size, int hidden_size) {
    // Compute unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (idx < hidden_size) {
        double sum = 0.0;  // Initialize sum for reduction

        // Perform dot product for each hidden layer output element
        for (int j = 0; j < input_size; ++j) {
            sum += input[j] * matrix[j * hidden_size + idx];
        }

        // Store the result
        result[idx] = sum;
    }
}