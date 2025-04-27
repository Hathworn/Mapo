#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_col_on_Gamma_matrix_kernel(int col_index, int vertex_index, int* indices, double* exp_V, double* N_ptr, int LD_N, double* G_ptr, int LD_G, double* col_ptr, int incr) {
    // Use multiple threads in a block to process multiple elements concurrently
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the thread index is within the problem size
    if(tid < vertex_index) {
        int i_index = indices[tid];
        int j_index = indices[col_index];
        double exp_Vj = exp_V[col_index];
        
        if (j_index < vertex_index) {
            double delta = (i_index == j_index) ? 1.0 : 0.0;
            col_ptr[tid * incr] = (N_ptr[i_index + LD_N * j_index] * exp_Vj - delta) / (exp_Vj - 1.0);
        } else {
            col_ptr[tid * incr] = G_ptr[i_index + LD_G * (j_index - vertex_index)];
        }
    }
}