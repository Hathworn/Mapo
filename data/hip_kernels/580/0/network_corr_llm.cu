#include "hip/hip_runtime.h"
#include "includes.h"
/*
:copyright:
William B. Frank and Eric Beauce
:license:
GNU General Public License, Version 3
(https://www.gnu.org/licenses/gpl-3.0.en.html)
*/

// Optimized kernel for network correlation
__global__ void network_corr(float *templates, float *sum_square_template, int *moveout, float *data, float *weights, size_t step, size_t n_samples_template, size_t n_samples_data, size_t n_stations, size_t n_components, int chunk_offset, int chunk_size, float *cc_mat) {
    int idx = blockIdx.x / n_stations * blockDim.x + chunk_offset;
    int first_sample_block = idx * step;
    int s = blockIdx.x % n_stations;
    extern __shared__ float shared[];
    float *ss_template = &shared[0];
    float *templates_s = &shared[1];  // Adjust for single offset
    float *data_s = &shared[(n_samples_template / WARPSIZE + 1) * WARPSIZE + 1];

    for (int c = 0; c < n_components; c++) {
        if (weights[s * n_components + c] != 0.0f) {
            int cc_mat_offset = (first_sample_block / step + threadIdx.x - chunk_offset) * n_stations * n_components + s * n_components + c;
            int templates_offset = s * n_samples_template * n_components + c * n_samples_template;
            int sum_square_template_offset = s * n_components + c;
            int first_sample_trace = first_sample_block + moveout[s * n_components + c];
            int last_sample_trace = first_sample_trace + n_samples_template + threadIdx.x * step;
            int data_offset = s * n_samples_data * n_components + c * n_samples_data + first_sample_trace;
            float sum_square_data = 0.0f;
            float numerator = 0.0f;

            // Load template and data into shared memory
            int t_idx = threadIdx.x;
            if (t_idx == 0) {
                ss_template[0] = sum_square_template[sum_square_template_offset];
            }
            while (t_idx < n_samples_template) {
                templates_s[t_idx] = templates[templates_offset + t_idx];
                if ((first_sample_trace + t_idx) < n_samples_data) data_s[t_idx] = data[data_offset + t_idx];
                t_idx += blockDim.x;
            }
            while (t_idx < (blockDim.x * step + n_samples_template)) {
                if ((first_sample_trace + t_idx) < n_samples_data) data_s[t_idx] = data[data_offset + t_idx];
                t_idx += blockDim.x;
            }

            __syncthreads();  // Ensure shared memory is updated

            // Calculate correlation coefficient
            if (last_sample_trace < n_samples_data) {
                for (int i = 0; i < n_samples_template; i++) {
                    float data_sample = data_s[i + threadIdx.x * step];
                    numerator += data_sample * templates_s[i];
                    sum_square_data += data_sample * data_sample;
                }

                float denominator = sum_square_data * ss_template[0];
                if (cc_mat_offset < (chunk_size * n_stations * n_components)) {
                    // Prevent writing out of bounds
                    if (denominator > STABILITY_THRESHOLD) cc_mat[cc_mat_offset] = numerator * rsqrtf(denominator);
                }
            }
        }
    }
}