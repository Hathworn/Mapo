#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_kernel(const float *dz, const float *z, const float *var, const float *weight, const float *bias, const float *edz, const float *eydz, float *dx, float *dweight, float *dbias, float eps, int N, int C, int S) {
    int plane = blockIdx.x;
    float _edz = edz[plane];
    float _eydz = eydz[plane];

    float gamma = weight ? abs(weight[plane]) + eps : 1.f;
    float beta = bias ? bias[plane] : 0.f;

    if (dx) {
        float _var = var[plane];
        float invStd = (_var != 0.f || eps != 0.f) ? 1 / sqrt(_var + eps) : 0.f;
        float mul = gamma * invStd;

        int batchOffset = C * plane * S;
        for (int batch = 0; batch < N; ++batch) {
            int baseIdx = batch * batchOffset;
            for (int n = threadIdx.x; n < S; n += blockDim.x) {
                float _dz = dz[baseIdx + n];
                float _y = (z[baseIdx + n] - beta) / gamma;
                dx[baseIdx + n] = (_dz - _edz - _y * _eydz) * mul;
            }
        }
    }

    if (dweight || dbias) {
        float norm = N * S;

        if (dweight && threadIdx.x == 0) {
            float modifier = (weight[plane] > 0) ? _eydz * norm : (weight[plane] < 0) ? -_eydz * norm : 0;
            dweight[plane] += modifier;
        }

        if (dbias && threadIdx.x == 0) {
            dbias[plane] += _edz * norm;
        }
    }
}