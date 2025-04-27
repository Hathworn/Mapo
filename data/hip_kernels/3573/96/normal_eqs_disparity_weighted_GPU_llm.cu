#include "hip/hip_runtime.h"
#include "includes.h"

__device__ static float disp_absolute_residual(float Xd, float Yd, float Zd, float Xm, float Ym, float Zm, float nx, float ny, float nz, float T0, float T1, float T2, float R0, float R1, float R2, float fx, float b) {
    float r = -Xd * nx + Xm * nx - Yd * ny + Ym * ny - Zd * nz + Zm * nz +
              nx * T0 + ny * T1 + nz * T2 + Xm * ny * R2 - Xm * nz * R1 -
              Ym * nx * R2 + Ym * nz * R0 + Zm * nx * R1 - Zm * ny * R0;

    // weight to convert distance units to pixels
    r *= fx * b / (Zm * Zm);

    return fabsf(r);
}

__global__ void normal_eqs_disparity_weighted_GPU(float *d_CD, const float *d_disparity_compact, const float4 *d_Zbuffer_normals_compact, const int *d_ind_disparity_Zbuffer, float fx, float fy, float ox, float oy, float b, int n_cols, const int *d_n_values_disparity, const int *d_start_ind_disparity, const float *d_abs_res_scales, float w_disp, const float *d_dTR) {
    // Utilize shared memory for accumulation
    extern __shared__ float shared_A[27];
    for (int i = 0; i < 27; ++i) shared_A[i] = 0.0f;

    int n_val_accum = gridDim.x * blockDim.x;
    int n_disparity = d_n_values_disparity[blockIdx.y];
    int n_accum = (int)ceilf((float)n_disparity / (float)n_val_accum);
    int start_ind = d_start_ind_disparity[blockIdx.y];

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x; in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {
        if (in_ind < n_disparity) {
            // fetch disparity, Zbuffer and normal from global memory
            float disp = d_disparity_compact[in_ind + start_ind];
            float4 tmp = d_Zbuffer_normals_compact[in_ind + start_ind];
            float Zbuffer = tmp.x;
            float nx = tmp.y;
            float ny = tmp.z;
            float nz = tmp.w;

            // compute coordinates
            int pixel_ind = d_ind_disparity_Zbuffer[in_ind + start_ind];
            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;
            x = __fdividef((x - ox), fx);
            y = __fdividef((y - oy), fy);

            // reconstruct 3D point from disparity
            float Zd = -(fx * b) / disp; // arbitrary use of fx
            float Xd = x * Zd;
            float Yd = y * Zd;

            // reconstruct 3D point from model
            float Zm = Zbuffer;
            float Xm = x * Zm;
            float Ym = y * Zm;

            // determine M-estimation weight
            // disparity residual weighed by rel. importance disp vs flow
            int s6 = blockIdx.y * 6;
            float w = w_disp * disp_absolute_residual(Xd, Yd, Zd, Xm, Ym, Zm, nx, ny, nz, d_dTR[s6], d_dTR[s6 + 1], d_dTR[s6 + 2], d_dTR[s6 + 3], d_dTR[s6 + 4], d_dTR[s6 + 5], fx, b);
            w /= d_abs_res_scales[blockIdx.y];
            w = (w > 1) ? 0 : (1.0f - 2.0f * w * w + w * w * w * w);

            // multiply m estimation weight with distance->pixel conversion weight (squared)
            w *= (fx * fx * b * b) / (Zm * Zm * Zm * Zm);

            /************************/
            /* evaluate constraints */
            /************************/

            // unique values A-matrix
            atomicAdd(&shared_A[0], w * (nx * nx));
            atomicAdd(&shared_A[1], w * (nx * ny));
            atomicAdd(&shared_A[2], w * (nx * nz));
            atomicAdd(&shared_A[3], w * (Ym * nx * nz - Zm * nx * ny));
            atomicAdd(&shared_A[4], w * (Zm * (nx * nx) - Xm * nx * nz));
            atomicAdd(&shared_A[5], w * (-Ym * (nx * nx) + Xm * nx * ny));

            atomicAdd(&shared_A[6], w * (ny * ny));
            atomicAdd(&shared_A[7], w * (ny * nz));
            atomicAdd(&shared_A[8], w * (-Zm * (ny * ny) + Ym * ny * nz));
            atomicAdd(&shared_A[9], w * (-Xm * ny * nz + Zm * nx * ny));
            atomicAdd(&shared_A[10], w * (Xm * (ny * ny) - Ym * nx * ny));

            atomicAdd(&shared_A[11], w * (nz * nz));
            atomicAdd(&shared_A[12], w * (Ym * (nz * nz) - Zm * ny * nz));
            atomicAdd(&shared_A[13], w * (-Xm * (nz * nz) + Zm * nx * nz));
            atomicAdd(&shared_A[14], w * (Xm * ny * nz - Ym * nx * nz));

            atomicAdd(&shared_A[15], w * ((Ym * Ym) * (nz * nz) + (Zm * Zm) * (ny * ny) - Ym * Zm * ny * nz * 2.0f));
            atomicAdd(&shared_A[16], w * (-Xm * Ym * (nz * nz) - (Zm * Zm) * nx * ny + Xm * Zm * ny * nz + Ym * Zm * nx * nz));
            atomicAdd(&shared_A[17], w * (-Xm * Zm * (ny * ny) - (Ym * Ym) * nx * nz + Xm * Ym * ny * nz + Ym * Zm * nx * ny));

            atomicAdd(&shared_A[18], w * ((Xm * Xm) * (nz * nz) + (Zm * Zm) * (nx * nx) - Xm * Zm * nx * nz * 2.0f));
            atomicAdd(&shared_A[19], w * (-Ym * Zm * (nx * nx) - (Xm * Xm) * ny * nz + Xm * Ym * nx * nz + Xm * Zm * nx * ny));

            atomicAdd(&shared_A[20], w * ((Xm * Xm) * (ny * ny) + (Ym * Ym) * (nx * nx) - Xm * Ym * nx * ny * 2.0f));

            // B-vector
            atomicAdd(&shared_A[21], w * (Xd * (nx * nx) - Xm * (nx * nx) + Yd * nx * ny - Ym * nx * ny + Zd * nx * nz - Zm * nx * nz));
            atomicAdd(&shared_A[22], w * (Yd * (ny * ny) - Ym * (ny * ny) + Xd * nx * ny - Xm * nx * ny + Zd * ny * nz - Zm * ny * nz));
            atomicAdd(&shared_A[23], w * (Zd * (nz * nz) - Zm * (nz * nz) + Xd * nx * nz - Xm * nx * nz + Yd * ny * nz - Ym * ny * nz));
            atomicAdd(&shared_A[24], w * (-Yd * Zm * (ny * ny) + Ym * Zd * (nz * nz) + Ym * Zm * (ny * ny) - Ym * Zm * (nz * nz) - (Ym * Ym) * ny * nz + (Zm * Zm) * ny * nz + Xd * Ym * nx * nz - Xm * Ym * nx * nz - Xd * Zm * nx * ny + Yd * Ym * ny * nz + Xm * Zm * nx * ny - Zd * Zm * ny * nz));
            atomicAdd(&shared_A[25], w * (Xd * Zm * (nx * nx) - Xm * Zd * (nz * nz) - Xm * Zm * (nx * nx) + Xm * Zm * (nz * nz) + (Xm * Xm) * nx * nz - (Zm * Zm) * nx * nz - Xd * Xm * nx * nz - Xm * Yd * ny * nz + Xm * Ym * ny * nz + Yd * Zm * nx * ny - Ym * Zm * nx * ny + Zd * Zm * nx * nz));
            atomicAdd(&shared_A[26], w * (-Xd * Ym * (nx * nx) + Xm * Yd * (ny * ny) + Xm * Ym * (nx * nx) - Xm * Ym * (ny * ny) - (Xm * Xm) * nx * ny + (Ym * Ym) * nx * ny + Xd * Xm * nx * ny - Yd * Ym * nx * ny + Xm * Zd * ny * nz - Xm * Zm * ny * nz - Ym * Zd * nx * nz + Ym * Zm * nx * nz));
        }
    }

    __syncthreads();

    if (threadIdx.x == 0) {
        int out_ind = 27 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x;
        w_disp *= w_disp; // weight relative to flow
        for (int i = 0; i < 27; ++i) {
            d_CD[out_ind + i * n_val_accum] = w_disp * shared_A[i];
        }
    }
}