#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normal_eqs_flow_multicam_GPU(float *d_CO, float2 *d_flow_compact, float *d_Zbuffer_flow_compact, int *d_ind_flow_Zbuffer, const float *d_focal_length, const float *d_nodal_point_x, const float *d_nodal_point_y, const int *d_n_rows, const int *d_n_cols, const int *d_n_values_flow, const int *d_start_ind_flow, const int *d_pixel_ind_offset) {
    // Shared memory for partial accumulators
    __shared__ float shared_A[23 * BLOCK_SIZE];

    // Thread indexes
    int threadID = threadIdx.x;
    
    // Shared memory initialization
    if (threadID < 23) {
        shared_A[threadID * BLOCK_SIZE + threadID] = 0.0f;
    }
    __syncthreads();

    int n_val_accum = gridDim.x * blockDim.x;
    int n_flow = d_n_values_flow[blockIdx.y];
    int n_accum = (int)ceilf((float)n_flow / (float)n_val_accum);
    int start_ind = d_start_ind_flow[blockIdx.y];

    float f = d_focal_length[blockIdx.y];
    float ox = d_nodal_point_x[blockIdx.y];
    float oy = d_nodal_point_y[blockIdx.y];
    int n_rows = d_n_rows[blockIdx.y];
    int n_cols = d_n_cols[blockIdx.y];
    int pixel_ind_offset = d_pixel_ind_offset[blockIdx.y];

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x; in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {
        if (in_ind < n_flow) {
            float2 u = d_flow_compact[in_ind + start_ind];
            float disp = __fdividef(1.0f, d_Zbuffer_flow_compact[in_ind + start_ind]);
            int pixel_ind = d_ind_flow_Zbuffer[in_ind + start_ind] - pixel_ind_offset;
            bool is_ar_flow = (pixel_ind >= (n_rows * n_cols));
            pixel_ind -= (int)is_ar_flow * n_rows * n_cols;

            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;

            x = x - ox;
            y = y - oy;

            y = -y;
            u.y = -u.y;

            shared_A[threadID] += (disp * disp * f * f);
            shared_A[BLOCK_SIZE + threadID] += (-disp * disp * x * f);
            shared_A[2 * BLOCK_SIZE + threadID] += (-disp * x * y);
            shared_A[3 * BLOCK_SIZE + threadID] += (disp * f * f + disp * x * x);
            shared_A[4 * BLOCK_SIZE + threadID] += (-disp * y * f);
            shared_A[5 * BLOCK_SIZE + threadID] += (-disp * disp * y * f);
            shared_A[6 * BLOCK_SIZE + threadID] += (-disp * f * f - disp * y * y);
            shared_A[7 * BLOCK_SIZE + threadID] += (disp * x * f);
            shared_A[8 * BLOCK_SIZE + threadID] += (disp * disp * x * x + disp * disp * y * y);
            shared_A[9 * BLOCK_SIZE + threadID] += (disp * x * x * y / f + disp * y * f + disp * y * y * y / f);
            shared_A[10 * BLOCK_SIZE + threadID] += (-disp * x * f - disp * x * x * x / f - disp * x * y * y / f);
            shared_A[11 * BLOCK_SIZE + threadID] += (x * x * y * y / (f * f) + f * f + 2.0f * y * y + y * y * y * y / (f * f));
            shared_A[12 * BLOCK_SIZE + threadID] += (-2.0f * x * y - x * x * x * y / (f * f) - x * y * y * y / (f * f));
            shared_A[13 * BLOCK_SIZE + threadID] += (-x * f);
            shared_A[14 * BLOCK_SIZE + threadID] += (f * f + 2.0f * x * x + x * x * x * x / (f * f) + x * x * y * y / (f * f));
            shared_A[15 * BLOCK_SIZE + threadID] += (-y * f);
            shared_A[16 * BLOCK_SIZE + threadID] += (x * x + y * y);

            shared_A[17 * BLOCK_SIZE + threadID] += (disp * u.x * f);
            shared_A[18 * BLOCK_SIZE + threadID] += (disp * u.y * f);
            shared_A[19 * BLOCK_SIZE + threadID] += (-disp * x * u.x - disp * y * u.y);
            shared_A[20 * BLOCK_SIZE + threadID] += (-x * y * u.x / f - u.y * f - u.y * y * y / f);
            shared_A[21 * BLOCK_SIZE + threadID] += (u.x * f + x * x * u.x / f + x * y * u.y / f);
            shared_A[22 * BLOCK_SIZE + threadID] += (-y * u.x + x * u.y);
        }
    }

    __syncthreads();

    int out_ind = 23 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadID;

    if (threadID < 23) {
        d_CO[out_ind] = shared_A[threadID * BLOCK_SIZE];
        d_CO[out_ind + n_val_accum] = shared_A[threadID * BLOCK_SIZE + BLOCK_SIZE];
        d_CO[out_ind + 2 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 2 * BLOCK_SIZE];
        d_CO[out_ind + 3 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 3 * BLOCK_SIZE];
        d_CO[out_ind + 4 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 4 * BLOCK_SIZE];
        d_CO[out_ind + 5 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 5 * BLOCK_SIZE];
        d_CO[out_ind + 6 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 6 * BLOCK_SIZE];
        d_CO[out_ind + 7 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 7 * BLOCK_SIZE];
        d_CO[out_ind + 8 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 8 * BLOCK_SIZE];
        d_CO[out_ind + 9 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 9 * BLOCK_SIZE];
        d_CO[out_ind + 10 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 10 * BLOCK_SIZE];
        d_CO[out_ind + 11 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 11 * BLOCK_SIZE];
        d_CO[out_ind + 12 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 12 * BLOCK_SIZE];
        d_CO[out_ind + 13 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 13 * BLOCK_SIZE];
        d_CO[out_ind + 14 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 14 * BLOCK_SIZE];
        d_CO[out_ind + 15 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 15 * BLOCK_SIZE];
        d_CO[out_ind + 16 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 16 * BLOCK_SIZE];
        d_CO[out_ind + 17 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 17 * BLOCK_SIZE];
        d_CO[out_ind + 18 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 18 * BLOCK_SIZE];
        d_CO[out_ind + 19 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 19 * BLOCK_SIZE];
        d_CO[out_ind + 20 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 20 * BLOCK_SIZE];
        d_CO[out_ind + 21 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 21 * BLOCK_SIZE];
        d_CO[out_ind + 22 * n_val_accum] = shared_A[threadID * BLOCK_SIZE + 22 * BLOCK_SIZE];
    }
}
```
