#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normal_eqs_flow_multicam_GPU(float *d_CO, float2 *d_flow_compact, float *d_Zbuffer_flow_compact, int *d_ind_flow_Zbuffer, const float *d_focal_length, const float *d_nodal_point_x, const float *d_nodal_point_y, const int *d_n_rows, const int *d_n_cols, const int *d_n_values_flow, const int *d_start_ind_flow, const int *d_pixel_ind_offset) {
    extern __shared__ float shared_data[]; // Use shared memory for accumulators
    float *s_A = &shared_data[threadIdx.x * 23];

    // Initialize shared accumulators
    for (int i = 0; i < 23; ++i) {
        s_A[i] = 0.0f;
    }

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

            s_A[0] += (disp * disp * f * f);
            s_A[1] += (-disp * disp * x * f);
            s_A[2] += (-disp * x * y);
            s_A[3] += (disp * f * f + disp * x * x);
            s_A[4] += (-disp * y * f);
            s_A[5] += (-disp * disp * y * f);
            s_A[6] += (-disp * f * f - disp * y * y);
            s_A[7] += (disp * x * f);
            s_A[8] += (disp * disp * x * x + disp * disp * y * y);
            s_A[9] += (disp * x * x * y / f + disp * y * f + disp * y * y * y / f);
            s_A[10] += (-disp * x * f - disp * x * x * x / f - disp * x * y * y / f);
            s_A[11] += (x * x * y * y / (f * f) + f * f + 2.0f * y * y + y * y * y * y / (f * f));
            s_A[12] += (-2.0f * x * y - x * x * x * y / (f * f) - x * y * y * y / (f * f));
            s_A[13] += (-x * f);
            s_A[14] += (f * f + 2.0f * x * x + x * x * x * x / (f * f) + x * x * y * y / (f * f));
            s_A[15] += (-y * f);
            s_A[16] += (x * x + y * y);
            s_A[17] += (disp * u.x * f);
            s_A[18] += (disp * u.y * f);
            s_A[19] += (-disp * x * u.x - disp * y * u.y);
            s_A[20] += (-x * y * u.x / f - u.y * f - u.y * y * y / f);
            s_A[21] += (u.x * f + x * x * u.x / f + x * y * u.y / f);
            s_A[22] += (-y * u.x + x * u.y);
        }
    }

    __syncthreads(); // Synchronize threads before writing back

    // Aggregate the data across the block and write back to global memory
    if (threadIdx.x == 0) {
        for (int i = 0; i < 23; ++i) {
            float sum = 0.0f;
            for (int j = 0; j < blockDim.x; ++j) {
                sum += shared_data[j * 23 + i];
            }
            d_CO[23 * n_val_accum * blockIdx.y + i * n_val_accum + blockDim.x * blockIdx.x + threadIdx.x] = sum;
        }
    }
}