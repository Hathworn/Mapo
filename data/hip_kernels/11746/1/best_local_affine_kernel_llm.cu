#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 1e-4

__device__ bool InverseMat4x4(double m_in[4][4], double inv_out[4][4]) {
    double m[16], inv[16];
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            m[i * 4 + j] = m_in[i][j];
        }
    }

    inv[0] = m[5] * m[10] * m[15] - m[5] * m[11] * m[14] - m[9] * m[6] * m[15] + m[9] * m[7] * m[14] + m[13] * m[6] * m[11] - m[13] * m[7] * m[10];
    inv[4] = -m[4] * m[10] * m[15] + m[4] * m[11] * m[14] + m[8] * m[6] * m[15] - m[8] * m[7] * m[14] - m[12] * m[6] * m[11] + m[12] * m[7] * m[10];
    inv[8] = m[4] * m[9] * m[15] - m[4] * m[11] * m[13] - m[8] * m[5] * m[15] + m[8] * m[7] * m[13] + m[12] * m[5] * m[11] - m[12] * m[7] * m[9];
    inv[12] = -m[4] * m[9] * m[14] + m[4] * m[10] * m[13] + m[8] * m[5] * m[14] - m[8] * m[6] * m[13] - m[12] * m[5] * m[10] + m[12] * m[6] * m[9];
    inv[1] = -m[1] * m[10] * m[15] + m[1] * m[11] * m[14] + m[9] * m[2] * m[15] - m[9] * m[3] * m[14] - m[13] * m[2] * m[11] + m[13] * m[3] * m[10];
    inv[5] = m[0] * m[10] * m[15] - m[0] * m[11] * m[14] - m[8] * m[2] * m[15] + m[8] * m[3] * m[14] + m[12] * m[2] * m[11] - m[12] * m[3] * m[10];
    inv[9] = -m[0] * m[9] * m[15] + m[0] * m[11] * m[13] + m[8] * m[1] * m[15] - m[8] * m[3] * m[13] - m[12] * m[1] * m[11] + m[12] * m[3] * m[9];
    inv[13] = m[0] * m[9] * m[14] - m[0] * m[10] * m[13] - m[8] * m[1] * m[14] + m[8] * m[2] * m[13] + m[12] * m[1] * m[10] - m[12] * m[2] * m[9];
    inv[2] = m[1] * m[6] * m[15] - m[1] * m[7] * m[14] - m[5] * m[2] * m[15] + m[5] * m[3] * m[14] + m[13] * m[2] * m[7] - m[13] * m[3] * m[6];
    inv[6] = -m[0] * m[6] * m[15] + m[0] * m[7] * m[14] + m[4] * m[2] * m[15] - m[4] * m[3] * m[14] - m[12] * m[2] * m[7] + m[12] * m[3] * m[6];
    inv[10] = m[0] * m[5] * m[15] - m[0] * m[7] * m[13] - m[4] * m[1] * m[15] + m[4] * m[3] * m[13] + m[12] * m[1] * m[7] - m[12] * m[3] * m[5];
    inv[14] = -m[0] * m[5] * m[14] + m[0] * m[6] * m[13] + m[4] * m[1] * m[14] - m[4] * m[2] * m[13] - m[12] * m[1] * m[6] + m[12] * m[2] * m[5];
    inv[3] = -m[1] * m[6] * m[11] + m[1] * m[7] * m[10] + m[5] * m[2] * m[11] - m[5] * m[3] * m[10] - m[9] * m[2] * m[7] + m[9] * m[3] * m[6];
    inv[7] = m[0] * m[6] * m[11] - m[0] * m[7] * m[10] - m[4] * m[2] * m[11] + m[4] * m[3] * m[10] + m[8] * m[2] * m[7] - m[8] * m[3] * m[6];
    inv[11] = -m[0] * m[5] * m[11] + m[0] * m[7] * m[9] + m[4] * m[1] * m[11] - m[4] * m[3] * m[9] - m[8] * m[1] * m[7] + m[8] * m[3] * m[5];
    inv[15] = m[0] * m[5] * m[10] - m[0] * m[6] * m[9] - m[4] * m[1] * m[10] + m[4] * m[2] * m[9] + m[8] * m[1] * m[6] - m[8] * m[2] * m[5];

    double det = m[0] * inv[0] + m[1] * inv[4] + m[2] * inv[8] + m[3] * inv[12];

    if (abs(det) < 1e-9) {
        return false;
    }

    det = 1.0 / det;

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            inv_out[i][j] = inv[i * 4 + j] * det;
        }
    }

    return true;
}

__global__ void best_local_affine_kernel(float *output, float *input, float *affine_model, int h, int w, float epsilon, int kernel_radius) {
    int size = h * w;
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < size) {
        int x = id % w, y = id / w;

        double Mt_M[4][4] = {}; // 4x4
        double invMt_M[4][4] = {};
        double Mt_S[3][4] = {}; // RGB -> 1x4
        double A[3][4] = {};

        // Initialize matrices with identity and zeros where applicable
        for (int i = 0; i < 3; i++) {
            Mt_M[i][i] = 1e-3;
        }

        for (int dy = -kernel_radius; dy <= kernel_radius; dy++) {
            for (int dx = -kernel_radius; dx <= kernel_radius; dx++) {
                int xx = x + dx, yy = y + dy;
                int id2 = yy * w + xx;

                if (0 <= xx && xx < w && 0 <= yy && yy < h) {
                    // Input indices
                    int idx0 = id2;
                    int idx1 = id2 + size;
                    int idx2 = id2 + 2 * size;

                    // Update matrix Mt_M
                    Mt_M[0][0] += input[idx2] * input[idx2];
                    Mt_M[0][1] += input[idx2] * input[idx1];
                    Mt_M[0][2] += input[idx2] * input[idx0];
                    Mt_M[0][3] += input[idx2];

                    Mt_M[1][0] += input[idx1] * input[idx2];
                    Mt_M[1][1] += input[idx1] * input[idx1];
                    Mt_M[1][2] += input[idx1] * input[idx0];
                    Mt_M[1][3] += input[idx1];

                    Mt_M[2][0] += input[idx0] * input[idx2];
                    Mt_M[2][1] += input[idx0] * input[idx1];
                    Mt_M[2][2] += input[idx0] * input[idx0];
                    Mt_M[2][3] += input[idx0];

                    Mt_M[3][0] += input[idx2];
                    Mt_M[3][1] += input[idx1];
                    Mt_M[3][2] += input[idx0];
                    Mt_M[3][3] += 1;

                    // Update matrix Mt_S
                    Mt_S[0][0] += input[idx2] * output[idx2];
                    Mt_S[0][1] += input[idx1] * output[idx2];
                    Mt_S[0][2] += input[idx0] * output[idx2];
                    Mt_S[0][3] += output[idx2];

                    Mt_S[1][0] += input[idx2] * output[idx1];
                    Mt_S[1][1] += input[idx1] * output[idx1];
                    Mt_S[1][2] += input[idx0] * output[idx1];
                    Mt_S[1][3] += output[idx1];

                    Mt_S[2][0] += input[idx2] * output[idx0];
                    Mt_S[2][1] += input[idx1] * output[idx0];
                    Mt_S[2][2] += input[idx0] * output[idx0];
                    Mt_S[2][3] += output[idx0];
                }
            }
        }

        bool success = InverseMat4x4(Mt_M, invMt_M);

        // Matrix multiplication invMt_M * Mt_S = A
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                double sum = 0.0;
                for (int k = 0; k < 4; k++) {
                    sum += invMt_M[j][k] * Mt_S[i][k];
                }
                A[i][j] = sum;
            }
        }

        // Assign calculated affine model values
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                int affine_id = i * 4 + j;
                affine_model[12 * id + affine_id] = A[i][j];
            }
        }
    }
    return;
}