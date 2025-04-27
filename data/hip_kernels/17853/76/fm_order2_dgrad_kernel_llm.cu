#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fm_order2_dgrad_kernel(const float* in, const float* top_grad, float* dgrad, int batch_size, int slot_num, int emb_vec_size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Global index for parallelization

    if (tid < batch_size * emb_vec_size) { // Single condition for valid range
        int bid = tid / emb_vec_size; // Calculate batch index
        int vec_offset = tid % emb_vec_size; // Calculate vector offset
        float emb_sum = 0.0f;
        int offset = bid * slot_num * emb_vec_size + vec_offset;

        for (int i = 0; i < slot_num; i++) {
            int index = offset + i * emb_vec_size;
            emb_sum += in[index];
        }

        float tgrad = top_grad[bid * emb_vec_size + vec_offset];
        for (int i = 0; i < slot_num; i++) {
            int index = offset + i * emb_vec_size;
            dgrad[index] = tgrad * (emb_sum - in[index]);
        }
    }
}