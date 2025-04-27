#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define IDX2C(i, j, ld) ((j)*(ld)+(i))
#define SQR(x)      ((x)*(x))                        // x^2

__global__ void assemble_tensors(double const* tensor_input, double* tensors, int tensor_input_elements) {
    int tensor_matrix_offset = blockIdx.x * TENSOR_DIMENSIONS * TENSOR_DIMENSIONS;
    int input_matrix_offset = blockIdx.x * tensor_input_elements;

    // Use shared memory for input values to reduce global memory access
    __shared__ double input_vals[6];
    input_vals[0] = tensor_input[input_matrix_offset + 0];
    input_vals[1] = tensor_input[input_matrix_offset + 1];
    input_vals[2] = tensor_input[input_matrix_offset + 2];
    input_vals[3] = tensor_input[input_matrix_offset + 3];
    input_vals[4] = tensor_input[input_matrix_offset + 4];
    input_vals[5] = tensor_input[input_matrix_offset + 5];
    __syncthreads();

    // Writing results using shared memory values
    tensors[tensor_matrix_offset + 0] = input_vals[0];
    tensors[tensor_matrix_offset + 1] = input_vals[1];
    tensors[tensor_matrix_offset + 2] = input_vals[3];
    tensors[tensor_matrix_offset + 3] = input_vals[1];
    tensors[tensor_matrix_offset + 4] = input_vals[2];
    tensors[tensor_matrix_offset + 5] = input_vals[4];
    tensors[tensor_matrix_offset + 6] = input_vals[3];
    tensors[tensor_matrix_offset + 7] = input_vals[4];
    tensors[tensor_matrix_offset + 8] = input_vals[5];
}