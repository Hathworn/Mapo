#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fm_order2_kernel(const float* in, float* out, int batch_size, int slot_num, int emb_vec_size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;  // Use entire grid for indexing
    int total_threads = batch_size * emb_vec_size;

    if (tid < total_threads) {
        int bid = tid / emb_vec_size;
        int local_tid = tid % emb_vec_size;

        float emb_sum = 0.0f;
        float emb_sum_square = 0.0f;
        float emb_square_sum = 0.0f;
        int offset = bid * slot_num * emb_vec_size + local_tid;

        for (int i = 0; i < slot_num; i++) {
            int index = offset + i * emb_vec_size;
            float temp = in[index];
            emb_sum += temp;
            emb_square_sum += temp * temp;
        }
        emb_sum_square = emb_sum * emb_sum;

        out[tid] = 0.5f * (emb_sum_square - emb_square_sum);
    }
}