#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample_ind_and_labels_GPU(int *d_ind_sub, const int *d_ind, unsigned int *d_label_sub, const unsigned int *d_label, int n_out, float inv_sub_factor) {

    // Cached value of global index for better readability and efficiency
    unsigned int ind_out = blockIdx.x * blockDim.x + threadIdx.x; 

    if (ind_out < n_out) {
        // Calculate the input index using multiplication directly 
        // and cast it as int. Avoid float arithmetic when possible.
        int ind_in = static_cast<int>(ind_out * inv_sub_factor);
        
        // Directly access and assign the subsampled indexes and labels
        d_ind_sub[ind_out] = d_ind[ind_in]; 
        d_label_sub[ind_out] = d_label[ind_in];
    }
}