```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_THREADS 512

__global__ void opt_cond_itr(int num_train_cases, double *opt_cond, double alpha_high, double alpha_high_prev, int high_label, int high_indx, double alpha_low, double alpha_low_prev, int low_label, int low_indx, double *kernel_val_mat) {
    int global_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Precompute constant terms outside the if-statement for efficiency
    double delta_alpha_high = (alpha_high - alpha_high_prev) * high_label;
    double delta_alpha_low = (alpha_low - alpha_low_prev) * low_label;

    if(global_id < num_train_cases) {
        double high_value = kernel_val_mat[high_indx * num_train_cases + global_id];
        double low_value = kernel_val_mat[low_indx * num_train_cases + global_id];
        
        // Simplified update formula using precomputed values
        opt_cond[global_id] += delta_alpha_high * high_value + delta_alpha_low * low_value;
    }
}