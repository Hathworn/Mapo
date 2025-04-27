#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void non_max_supp_kernel(unsigned char *data, unsigned char *out, unsigned char *theta, int rows, int cols) {
    extern __shared__ int l_mem[];
    int* l_data = l_mem;

    const int L_SIZE = blockDim.x;
    const int g_row = blockIdx.y * blockDim.y + threadIdx.y + 1;
    const int g_col = blockIdx.x * blockDim.x + threadIdx.x + 1;
    const int l_row = threadIdx.y + 1;
    const int l_col = threadIdx.x + 1;
    const int pos = g_row * cols + g_col;

    // Load data to shared memory
    l_data[l_row * (L_SIZE + 2) + l_col] = data[pos];
    if (l_row == 1) {
        l_data[0 * (L_SIZE + 2) + l_col] = data[pos - cols];
        if (l_col == 1) l_data[0 * (L_SIZE + 2) + 0] = data[pos - cols - 1];
        else if (l_col == L_SIZE) l_data[0 * (L_SIZE + 2) + (L_SIZE + 1)] = data[pos - cols + 1];
    } else if (l_row == L_SIZE) {
        l_data[(L_SIZE + 1) * (L_SIZE + 2) + l_col] = data[pos + cols];
        if (l_col == 1) l_data[(L_SIZE + 1) * (L_SIZE + 2) + 0] = data[pos + cols - 1];
        else if (l_col == L_SIZE) l_data[(L_SIZE + 1) * (L_SIZE + 2) + (L_SIZE + 1)] = data[pos + cols + 1];
    }
    if (l_col == 1) l_data[l_row * (L_SIZE + 2) + 0] = data[pos - 1];
    else if (l_col == L_SIZE) l_data[l_row * (L_SIZE + 2) + (L_SIZE + 1)] = data[pos + 1];

    __syncthreads();

    unsigned char my_magnitude = l_data[l_row * (L_SIZE + 2) + l_col];
    
    // Improved switch-case structure
    switch (theta[pos]) {
        case 0: // Check neighbors to the East and West
            out[pos] = (my_magnitude <= l_data[l_row * (L_SIZE + 2) + l_col + 1] || 
                        my_magnitude <= l_data[l_row * (L_SIZE + 2) + l_col - 1]) ? 0 : my_magnitude;
            break;
        case 45: // Check neighbors to the NE and SW
            out[pos] = (my_magnitude <= l_data[(l_row - 1) * (L_SIZE + 2) + l_col + 1] || 
                        my_magnitude <= l_data[(l_row + 1) * (L_SIZE + 2) + l_col - 1]) ? 0 : my_magnitude;
            break;
        case 90: // Check neighbors to the North and South
            out[pos] = (my_magnitude <= l_data[(l_row - 1) * (L_SIZE + 2) + l_col] || 
                        my_magnitude <= l_data[(l_row + 1) * (L_SIZE + 2) + l_col]) ? 0 : my_magnitude;
            break;
        case 135: // Check neighbors to the NW and SE
            out[pos] = (my_magnitude <= l_data[(l_row - 1) * (L_SIZE + 2) + l_col - 1] || 
                        my_magnitude <= l_data[(l_row + 1) * (L_SIZE + 2) + l_col + 1]) ? 0 : my_magnitude;
            break;
        default: 
            out[pos] = my_magnitude; 
            break;
    }
}