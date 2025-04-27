#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDot_m1T_m2(const int nThreads, const float *m1, const float *m2, float *output, const int m1_rows, const int m1_columns, const int m2_columns ){
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nThreads) {
        // Determine row and column for output
        int r = i / m2_columns;
        int c = i % m2_columns;
        int id_T;
        float t_output = 0.0;

        // Compute dot product for transposed m1 and m2
        for (int k = 0; k < m1_rows; ++k) {
            id_T = k * m1_columns + r;
            t_output += m1[id_T] * m2[k * m2_columns + c];
        }

        // Update output matrix
        output[i] += t_output;
    }
}