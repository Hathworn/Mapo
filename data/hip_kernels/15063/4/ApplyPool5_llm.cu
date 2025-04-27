#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyPool5(float* input, float* output){
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop unrolling to reduce loop overhead
    for (int i = 0; i < 148; i += 2){
        // Using local variables to reduce redundant memory access
        float input1 = input[i * 2 + id * 2 * 296];
        float input2 = input[i * 2 + id * 2 * 296 + 1];
        float input3 = input[i * 2 + id * 2 * 296 + 296];
        float input4 = input[i * 2 + id * 2 * 296 + 296 + 1];
        
        float input5 = input[(i + 1) * 2 + id * 2 * 296];
        float input6 = input[(i + 1) * 2 + id * 2 * 296 + 1];
        float input7 = input[(i + 1) * 2 + id * 2 * 296 + 296];
        float input8 = input[(i + 1) * 2 + id * 2 * 296 + 296 + 1];

        // Compute total using max operation
        float total1 = max(max(input1, input2), max(input3, input4));
        float total2 = max(max(input5, input6), max(input7, input8));

        // Add activation function
        total1 = 1 / (1 + exp(-(total1 * 2 - 1)));
        total2 = 1 / (1 + exp(-(total2 * 2 - 1)));

        // Store the result
        output[i + id * 148] = total1;
        output[i + 1 + id * 148] = total2;
    }
}