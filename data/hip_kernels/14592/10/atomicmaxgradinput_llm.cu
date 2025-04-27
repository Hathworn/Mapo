#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomicmaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Computing the output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on block and thread ID
    int o = blockIdx.x;
    int idX = threadIdx.x + blockIdx.x * blockDim.x;
    int idY = threadIdx.y + blockIdx.y * blockDim.y;

    // Guard clauses to prevent out-of-bounds access
    if (idX >= output_w || idY >= output_h) return;

    // Select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + o * input_w * input_h;
    indices_x = indices_x + o * output_w * output_h;
    indices_y = indices_y + o * output_w * output_h;

    // Compute pointer positions for gradOutput and indices
    float *ptr_gradOutput = gradOutput + idY * output_w + idX;
    float *ptr_ind_x = indices_x + idY * output_w + idX;
    float *ptr_ind_y = indices_y + idY * output_w + idX;

    // Read values and compute the target gradInput position
    float z = *ptr_gradOutput;
    int argmax_x = (*ptr_ind_x) - 1;
    int argmax_y = (*ptr_ind_y) - 1;
    
    // Guard clause for valid indices
    if (argmax_x >= 0 && argmax_y >= 0 && argmax_x < input_w && argmax_y < input_h) {
        // Atomic add since different threads could update the same variable
        atomicAdd(&(gradInput[argmax_x + argmax_y * input_w]), z);
    }
}