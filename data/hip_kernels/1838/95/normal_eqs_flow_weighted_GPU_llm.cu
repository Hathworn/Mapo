#include "hip/hip_runtime.h"
#include "includes.h"

__device__ static float flow_absolute_residual(float x, float y, float ux, float uy, float d, float fx, float fy, float T0, float T1, float T2, float R0, float R1, float R2) {
    float rx = -ux + fx * R1 - y * R2 + ((x * x) * R1) / fx + d * fx * T0 -
               d * x * T2 - (x * y * R0) / fx;
    float ry = -uy - fy * R0 + x * R2 - d * y * T2 - ((y * y) * R0) / fy +
               d * fy * T1 + (x * y * R1) / fy;

    return sqrtf(rx * rx + ry * ry);
}

__global__ void normal_eqs_flow_weighted_GPU(float *d_CO, const float2 *d_flow_compact, const float *d_Zbuffer_flow_compact, const int *d_ind_flow_Zbuffer, float fx, float fy, float ox, float oy, int n_rows, int n_cols, const int *d_n_values_flow, const int *d_start_ind_flow, const float *d_abs_res_scales, float w_flow, float w_ar_flow, const float *d_dTR) {

    int n_val_accum = gridDim.x * blockDim.x; // _MAX_N_VAL_ACCUM may not be multiple of blocksize

    int n_flow = d_n_values_flow[blockIdx.y];
    int n_accum = (int)ceilf((float)n_flow / (float)n_val_accum);
    int start_ind = d_start_ind_flow[blockIdx.y];

    // initialize accumulators
    float A[23] = {0.0f};

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x; in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {

        if (in_ind < n_flow) { // is this a valid sample?

            // fetch flow and Zbuffer from global memory
            float2 u = d_flow_compact[in_ind + start_ind];
            float disp = __fdividef(1.0f, d_Zbuffer_flow_compact[in_ind + start_ind]);

            // compute coordinates
            int pixel_ind = d_ind_flow_Zbuffer[in_ind + start_ind];
            bool is_ar_flow = (pixel_ind >= (n_rows * n_cols));
            pixel_ind -= (int)is_ar_flow * n_rows * n_cols;

            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;

            x = x - ox;
            y = y - oy;

            // determine M-estimation weight
            float w_rel = is_ar_flow ? w_ar_flow : w_flow;
            int s6 = blockIdx.y * 6;
            float w = w_rel * flow_absolute_residual(x, y, u.x, u.y, disp, fx, fy, d_dTR[s6], d_dTR[s6 + 1], d_dTR[s6 + 2], d_dTR[s6 + 3], d_dTR[s6 + 4], d_dTR[s6 + 5]);
            w /= d_abs_res_scales[blockIdx.y];
            w = (w > 1) ? 0 : (1.0f - 2.0f * w * w + w * w * w * w);

            /************************/
            /* evaluate constraints */
            /************************/

            A[0] += w * (disp * disp * fx * fx);
            A[1] += w * (-disp * disp * x * fx);
            A[2] += w * (-disp * x * y);
            A[3] += w * (disp * fx * fx + disp * x * x);
            A[4] += w * (-disp * y * fx);
            A[5] += w * (-disp * disp * y * fy);
            A[6] += w * (-disp * fy * fy - disp * y * y);
            A[7] += w * (disp * x * fy);
            A[8] += w * (disp * disp * x * x + disp * disp * y * y);
            A[9] += w * (disp * x * x * y / fx + disp * y * fy + disp * y * y * y / fy);
            A[10] += w * (-disp * x * fx - disp * x * x * x / fx - disp * x * y * y / fy);
            A[11] += w * (x * x * y * y / (fx * fx) + fy * fy + 2.0f * y * y + y * y * y * y / (fy * fy));
            A[12] += w * (-2.0f * x * y - x * x * x * y / (fx * fx) - x * y * y * y / (fy * fy));
            A[13] += w * (x * y * y / fx - x * fy - x * y * y / fy);
            A[14] += w * (fx * fx + 2.0f * x * x + x * x * x * x / (fx * fx) + x * x * y * y / (fy * fy));
            A[15] += w * (-y * fx - x * x * y / fx + x * x * y / fy);
            A[16] += w * (x * x + y * y);

            // B-vector
            A[17] += w * (disp * u.x * fx);
            A[18] += w * (disp * u.y * fy);
            A[19] += w * (-disp * x * u.x - disp * y * u.y);
            A[20] += w * (-x * y * u.x / fx - u.y * fy - u.y * y * y / fy);
            A[21] += w * (u.x * fx + x * x * u.x / fx + x * y * u.y / fy);
            A[22] += w * (-y * u.x + x * u.y);
        }
    }

    /**************************/
    /* write out accumulators */
    /**************************/

    int out_ind = 23 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;

    #pragma unroll
    for (int i = 0; i < 23; ++i) {
        d_CO[out_ind + i * n_val_accum] = A[i];
    }
}