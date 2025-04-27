#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void breadth_first_search_csr_gpu(unsigned int* cum_row_indexes, unsigned int* column_indexes, int* matrix_data, unsigned int* in_infections, unsigned int* out_infections, unsigned int rows) {
    unsigned int row = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure row index is within bounds
    if (row < rows && in_infections[row] == 1) {
        // Mark this row as infected
        out_infections[row] = 1;

        unsigned int row_start = cum_row_indexes[row];
        unsigned int row_end = cum_row_indexes[row + 1];

        // Loop through the row's non-zero elements
        for (int i = row_start; i < row_end; i++) {
            int timesteps_to_transmission = matrix_data[i];
            // Check if the element can transmit infection
            if (timesteps_to_transmission > 0) {
                // Update infection status and decrement transmission step count
                if (timesteps_to_transmission == 1) {
                    out_infections[column_indexes[i]] = 1;
                }
                matrix_data[i] -= 1;
            }
        }
    }
}