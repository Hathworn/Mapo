#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv(float *t, float *tk, float *out, int t_rows, int t_columns, int n_channels, int k_rows, int k_columns, int n_kernels)
{
    const int i_out = blockDim.y * blockIdx.y + threadIdx.y;
    const int j_out = blockDim.x * blockIdx.x + threadIdx.x;

    int i0 = i_out - k_rows / 2;
    int j0 = j_out - k_columns / 2;

    if (i_out < t_rows && j_out < t_columns) {
        for (int k = 0; k < n_kernels; k++) {
            float convolution = 0.0f;

            // Optimize loops using shared memory (assuming it's properly sized)
            __shared__ float shared_t[/*appropriate size*/];
            __shared__ float shared_tk[/*appropriate size*/];

            // Load data into shared memory
            shared_t[threadIdx.y * blockDim.x + threadIdx.x] = t[(i_out * t_columns + j_out) * n_channels + threadIdx.y];
            shared_tk[threadIdx.y * blockDim.x + threadIdx.x] = tk[threadIdx.y * k_columns + threadIdx.x * n_kernels + k];

            __syncthreads(); // Synchronize threads

            for (int m = 0; m < k_rows; m++) {
                for (int n = 0; n < k_columns; n++) {
                    for (int c = 0; c < n_channels; c++) {
                        int i_index = i0 + m;
                        int j_index = j0 + n;

                        if (i_index >= 0 && i_index < t_rows && j_index >= 0 && j_index < t_columns) {
                            convolution += shared_t[(i_index * t_columns + j_index) * n_channels + c] * shared_tk[(m * k_columns + n) * n_kernels + k];
                        }
                    }
                }
            }

            out[(i_out * t_columns + j_out) * n_kernels + k] = convolution;
        }
    }
}