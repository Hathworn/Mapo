#include "hip/hip_runtime.h"
#include "includes.h"

__device__ static float flow_absolute_residual(float x, float y, float ux, float uy, float d, float fx, float fy, float T0, float T1, float T2, float R0, float R1, float R2) {
    float rx = -ux + fx * R1 - y * R2 + ((x * x) * R1) / fx + d * fx * T0 - d * x * T2 - (x * y * R0) / fx;
    float ry = -uy - fy * R0 + x * R2 - d * y * T2 - ((y * y) * R0) / fy + d * fy * T1 + (x * y * R1) / fy;
    return sqrtf(rx * rx + ry * ry);
}

__global__ void normal_eqs_flow_weighted_GPU(float *d_CO, const float2 *d_flow_compact, const float *d_Zbuffer_flow_compact, const int *d_ind_flow_Zbuffer, float fx, float fy, float ox, float oy, int n_rows, int n_cols, const int *d_n_values_flow, const int *d_start_ind_flow, const float *d_abs_res_scales, float w_flow, float w_ar_flow, const float *d_dTR) {

    int n_val_accum = gridDim.x * blockDim.x;
    int n_flow = d_n_values_flow[blockIdx.y];
    int n_accum = (int)ceilf((float)n_flow / (float)n_val_accum);
    int start_ind = d_start_ind_flow[blockIdx.y];

    // Use shared memory for accumulation to reduce global memory transactions
    __shared__ float shared_A[23];
    for(int i = threadIdx.x; i < 23; i += blockDim.x) {
        shared_A[i] = 0.0f;
    }
    __syncthreads();

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x; in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {
        if (in_ind < n_flow) {
            // Fetch flow and Zbuffer from global memory
            float2 u = d_flow_compact[in_ind + start_ind];
            float disp = __fdividef(1.0f, d_Zbuffer_flow_compact[in_ind + start_ind]);

            // Compute coordinates
            int pixel_ind = d_ind_flow_Zbuffer[in_ind + start_ind];
            bool is_ar_flow = (pixel_ind >= (n_rows * n_cols));
            pixel_ind -= (int)is_ar_flow * n_rows * n_cols;

            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;

            x = x - ox;
            y = y - oy;

            // Determine M-estimation weight
            float w_rel = is_ar_flow ? w_ar_flow : w_flow;
            int s6 = blockIdx.y * 6;
            float w = w_rel * flow_absolute_residual(x, y, u.x, u.y, disp, fx, fy, d_dTR[s6], d_dTR[s6 + 1], d_dTR[s6 + 2], d_dTR[s6 + 3], d_dTR[s6 + 4], d_dTR[s6 + 5]);
            w /= d_abs_res_scales[blockIdx.y];
            w = (w > 1) ? 0 : (1.0f - 2.0f * w * w + w * w * w * w);

            // Evaluate constraints and update shared memory
            atomicAdd(&shared_A[0], w * (disp * disp * fx * fx));
            atomicAdd(&shared_A[1], w * (-disp * disp * x * fx));
            atomicAdd(&shared_A[2], w * (-disp * x * y));
            atomicAdd(&shared_A[3], w * (disp * fx * fx + disp * x * x));
            atomicAdd(&shared_A[4], w * (-disp * y * fx));
            atomicAdd(&shared_A[5], w * (-disp * disp * y * fy));
            atomicAdd(&shared_A[6], w * (-disp * fy * fy - disp * y * y));
            atomicAdd(&shared_A[7], w * (disp * x * fy));
            atomicAdd(&shared_A[8], w * (disp * disp * x * x + disp * disp * y * y));
            atomicAdd(&shared_A[9], w * (disp * x * x * y / fx + disp * y * fy + disp * y * y * y / fy));
            atomicAdd(&shared_A[10], w * (-disp * x * fx - disp * x * x * x / fx - disp * x * y * y / fy));
            atomicAdd(&shared_A[11], w * (x * x * y * y / (fx * fx) + fy * fy + 2.0f * y * y + y * y * y * y / (fy * fy)));
            atomicAdd(&shared_A[12], w * (-2.0f * x * y - x * x * x * y / (fx * fx) - x * y * y * y / (fy * fy)));
            atomicAdd(&shared_A[13], w * (x * y * y / fx - x * fy - x * y * y / fy));
            atomicAdd(&shared_A[14], w * (fx * fx + 2.0f * x * x + x * x * x * x / (fx * fx) + x * x * y * y / (fy * fy)));
            atomicAdd(&shared_A[15], w * (-y * fx - x * x * y / fx + x * x * y / fy));
            atomicAdd(&shared_A[16], w * (x * x + y * y));

            // B-vector
            atomicAdd(&shared_A[17], w * (disp * u.x * fx));
            atomicAdd(&shared_A[18], w * (disp * u.y * fy));
            atomicAdd(&shared_A[19], w * (-disp * x * u.x - disp * y * u.y));
            atomicAdd(&shared_A[20], w * (-x * y * u.x / fx - u.y * fy - u.y * y * y / fy));
            atomicAdd(&shared_A[21], w * (u.x * fx + x * x * u.x / fx + x * y * u.y / fy));
            atomicAdd(&shared_A[22], w * (-y * u.x + x * u.y));
        }
    }

    __syncthreads();

    // Write out accumulators from shared to global memory
    int out_ind = 23 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;
    for(int i = threadIdx.x; i < 23; i += blockDim.x) {
        d_CO[out_ind + i * n_val_accum] = shared_A[i];
    }
}