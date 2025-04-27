#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void update_e(int objs, double* e, double* kval, double b_old, double b_new, int i, int j, int yi, int yj, double ai_old, double ai_new, double aj_old, double aj_new) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < objs) {
        // Pre-calculate deltas for efficiency
        double delta_b = b_new - b_old;
        double delta_ai = ai_new - ai_old;
        double delta_aj = aj_new - aj_old;

        // Pre-fetch repetitive kval indices
        double kval_i = kval[i * objs + id];
        double kval_j = kval[j * objs + id];

        // Update computation using pre-calculated values
        double val = e[id];
        val += delta_b;
        val += yi * kval_i * delta_ai;
        val += yj * kval_j * delta_aj;
        e[id] = val;
    }
}