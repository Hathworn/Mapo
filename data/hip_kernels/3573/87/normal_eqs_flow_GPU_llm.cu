#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normal_eqs_flow_GPU(float *d_CO, const float2 *d_flow_compact, const float *d_Zbuffer_flow_compact, const int *d_ind_flow_Zbuffer, float fx, float fy, float ox, float oy, int n_rows, int n_cols, const int *d_n_values_flow, const int *d_start_ind_flow) {

    int n_val_accum = gridDim.x * blockDim.x; 
    int n_flow = d_n_values_flow[blockIdx.y];
    int n_accum = (int)ceilf((float)n_flow / (float)n_val_accum);
    int start_ind = d_start_ind_flow[blockIdx.y];

    // initialize accumulators
    float A[23] = {0.0f};

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x;
         in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {

        if (in_ind < n_flow) {
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

            /************************/
            /* evaluate constraints */
            /************************/

            // unique values A-matrix
            A[0] += (disp * disp * fx * fx);
            A[1] += (-disp * disp * x * fx);
            A[2] += (-disp * x * y);
            A[3] += (disp * fx * fx + disp * x * x);
            A[4] += (-disp * y * fx);
            A[5] += (-disp * disp * y * fy);
            A[6] += (-disp * fy * fy - disp * y * y);
            A[7] += (disp * x * fy);
            A[8] += (disp * disp * x * x + disp * disp * y * y);
            A[9] += (disp * x * x * y / fx + disp * y * fy + disp * y * y * y / fy);
            A[10] += (-disp * x * fx - disp * x * x * x / fx - disp * x * y * y / fy);
            A[11] += (x * x * y * y / (fx * fx) + fy * fy + 2.0f * y * y +
                      y * y * y * y / (fy * fy));
            A[12] += (-2.0f * x * y - x * x * x * y / (fx * fx) -
                      x * y * y * y / (fy * fy));
            A[13] += (x * y * y / fx - x * fy - x * y * y / fy);
            A[14] += (fx * fx + 2.0f * x * x + x * x * x * x / (fx * fx) +
                      x * x * y * y / (fy * fy));
            A[15] += (-y * fx - x * x * y / fx + x * x * y / fy);
            A[16] += (x * x + y * y);

            // B-vector
            A[17] += (disp * u.x * fx);
            A[18] += (disp * u.y * fy);
            A[19] += (-disp * x * u.x - disp * y * u.y);
            A[20] += (-x * y * u.x / fx - u.y * fy - u.y * y * y / fy);
            A[21] += (u.x * fx + x * x * u.x / fx + x * y * u.y / fy);
            A[22] += (-y * u.x + x * u.y);
        }
    }

    /**************************/
    /* write out accumulators */
    /**************************/

    int out_ind = 23 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;

    #pragma unroll
    for (int i = 0; i < 23; i++) {
        d_CO[out_ind + i * n_val_accum] = A[i];
    }
}