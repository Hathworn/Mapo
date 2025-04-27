#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 24 // set TILE_WIDTH 16 for the evaluation!
#define MAXPOOL_INPUT_FILENAME "input.txt"
#define A_FILENAME "a.txt"
#define B_FILENAME "b.txt"
#define C_FILENAME "c.txt"

using namespace std;

__global__ void maxpool(float *input, float *output, const int input_size, const int filter_size) {
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int row = blockDim.y * blockIdx.y + threadIdx.y;

    // Boundary check
    if (col >= input_size / filter_size || row >= input_size / filter_size) return;

    float Max = -FLT_MAX; // Use float max negative value for max comparison

    // Iterate over filter size
    for (int i = 0; i < filter_size; i++) {
        for (int j = 0; j < filter_size; j++) {
            int inputRow = filter_size * row + i;
            int inputCol = filter_size * col + j;
            if (inputRow < input_size && inputCol < input_size) {
                float value = input[inputRow * input_size + inputCol]; // Calculate index for vectorized matrix
                Max = max(Max, value); // Use built-in max function
            }
        }
    }

    output[(input_size / filter_size) * row + col] = Max; // Assign calculated max to the output
}