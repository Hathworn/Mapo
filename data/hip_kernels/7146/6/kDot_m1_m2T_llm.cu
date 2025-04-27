#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDot_m1_m2T(const int nThreads, const float *m1, const float *m2, float *output, const int m1_columns, const int m2_rows){
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < nThreads) {  // Ensure not to exceed nThreads
        int r = i / m2_rows; // Calculate row
        int c = i % m2_rows; // Calculate column
        float t_output = 0.0;
        int id_T;

        // Use shared memory to load m2 rows for improved efficiency
        __shared__ float m2_shared[1024]; // Adjust size as required
        for (int k = 0; k < m1_columns; ++k) {
            if (threadIdx.x < m1_columns) {
                m2_shared[k] = m2[c * m1_columns + threadIdx.x];
            }
            __syncthreads(); // Synchronize threads within block

            t_output += m1[r * m1_columns + k] * m2_shared[k];

            __syncthreads(); // Ensures all reads are done before reload
        }

        output[i] = t_output; // Write result to output
    }
}