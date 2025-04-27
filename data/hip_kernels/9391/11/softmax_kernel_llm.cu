#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_kernel(int64_t nrow, int64_t ncol, const float *input_data, float *output_data) {
    // Calculate row index using grid-stride loop for better utilization of threads
    for (int y = blockIdx.x * blockDim.y + threadIdx.y; y < nrow; y += gridDim.x * blockDim.y) {
        const float *row_input = input_data + y * ncol;
        float *row_output = output_data + y * ncol;

        // Compute maximum value in the row
        float maxval = row_input[0];
        for (int x = 1; x < ncol; ++x) {
            maxval = max(maxval, row_input[x]);
        }

        // Compute sum of exponentials offset by max value for numerical stability
        float sum = 0;
        for (int x = 0; x < ncol; ++x) {
            sum += exp(row_input[x] - maxval);
        }

        // Compute softmax values using the calculated sum
        for (int x = 0; x < ncol; ++x) {
            row_output[x] = exp(row_input[x] - maxval) / sum;
        }
    }
}