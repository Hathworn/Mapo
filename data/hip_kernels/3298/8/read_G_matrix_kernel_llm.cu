#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void read_G_matrix_kernel(int S, int vertex_index, int* i_index, int* j_index, bool* is_Bennett, double* exp_Vj, double* N_ptr, int LD_N, double* G_ptr, int LD_G, double* result_ptr, int incr) {
    int l = threadIdx.x;
    
    // Pre-fetch reused values and pre-compute conditions
    int j_idx = j_index[l];
    int i_idx = i_index[l];
    double exp_val = exp_Vj[l];
    bool bennett_cond = is_Bennett[l];
    
    double result, delta;
    
    if (j_idx < vertex_index) {
        delta = (i_idx == j_idx) ? 1.0 : 0.0;
        // Simplified calculation
        result = (N_ptr[i_idx + LD_N * j_idx] * exp_val - delta) / (exp_val - 1.0);
    } else {
        result = G_ptr[i_idx + LD_G * (j_idx - vertex_index)];
    }
    
    // Simplified conditional assignment
    result_ptr[l * incr] = bennett_cond ? 0.0 : result;
}