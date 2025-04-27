#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgamma_kernel(hiprandState *state, int state_len, float *vals, int n, float a, float scale)
{
    // Precomputed constants
    const float sqrt32 = 5.656854;
    const float exp_m1 = 0.36787944117144232159;
    const float q_coef[] = {0.04166669, 0.02083148, 0.00801191, 0.00144121, -7.388e-5, 2.4511e-4, 2.424e-4};
    const float a_coef[] = {0.3333333, -0.250003, 0.2000062, -0.1662921, 0.1423657, -0.1367177, 0.1233795};

    // Computing thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 
              (blockIdx.y * gridDim.x) * blockDim.x * gridDim.x + 
              threadIdx.y * blockDim.x * blockDim.y + threadIdx.z * blockDim.x * blockDim.y * blockDim.z;

    if (idx >= state_len) return;

    // Calculate the number of extra and regular threads
    int n_extra = n % state_len;
    int n_lo = n / state_len;
    int n_hi = n_lo + 1;
    int out_idx_start = (idx < n_extra) ? n_hi * idx : n_hi * n_extra + n_lo * (idx - n_extra);
    int n_per_thread = (idx < n_extra) ? n_hi : n_lo;

    float aa = 0.0, aaa = 0.0, s, s2, d, q0, b, si, c;
    float e, p, q, r, t, u, v, x, ret_val;

    // Generate RNG's for each thread
    for (int gen_num = 0; gen_num < n_per_thread; gen_num++)
    {
        if (a < 1.0) { // GS algorithm for a < 1
            if (a == 0) {
                vals[out_idx_start + gen_num] = 0.0;
                continue;
            }
            e = 1.0 + exp_m1 * a;
            do {
                p = e * hiprand_normal(&state[idx]);
                if (p >= 1.0) {
                    x = -logf((e - p) / a);
                    if (logf(hiprand_uniform(&state[idx])) <= (1.0 - a) * logf(x)) {
                        break;
                    }
                } else {
                    x = expf(logf(p) / a);
                    if (logf(hiprand_uniform(&state[idx])) <= x) {
                        break;
                    }
                }
            } while (true);
            vals[out_idx_start + gen_num] = scale * x;
            continue;
        }

        if (a != aa) {
            aa = a;
            s2 = a - 0.5;
            s = sqrtf(s2);
            d = sqrt32 - s * 12.0;
        }

        t = hiprand_normal(&state[idx]);
        x = s + 0.5 * t;
        ret_val = x * x;

        if (t >= 0.0) {
            vals[out_idx_start + gen_num] = scale * ret_val;
            continue;
        }

        u = hiprand_uniform(&state[idx]);
        if ((d * u) <= (t * t * t)) {
            vals[out_idx_start + gen_num] = scale * ret_val;
            continue;
        }

        if (a != aaa) {
            aaa = a;
            r = 1.0 / a;
            q0 = ((((((q_coef[6] * r + q_coef[5]) * r + q_coef[4]) * r + q_coef[3]) * r + q_coef[2]) * r + q_coef[1]) * r + q_coef[0]) * r;
            
            if (a <= 3.686) {
                b = 0.463 + s + 0.178 * s2;
                si = 1.235;
                c = 0.195 / s - 0.079 + 0.16 * s;
            } else if (a <= 13.022) {
                b = 1.654 + 0.0076 * s2;
                si = 1.68 / s + 0.275;
                c = 0.062 / s + 0.024;
            } else {
                b = 1.77;
                si = 0.75;
                c = 0.1515 / s;
            }
        }

        if (x > 0.0) {
            v = t / (s + s);
            q = (fabs(v) <= 0.25) ? q0 + 0.5 * t * t * ((((a_coef[6] * v + a_coef[5]) * v + a_coef[4]) * v + a_coef[3]) * v + a_coef[2]) * v + a_coef[1] * v + a_coef[0] * v : q0 - s * t + 0.25 * t * t + (s2 + s2) * log(1.0 + v);

            if (logf(1.0 - u) <= q) {
                vals[out_idx_start + gen_num] = scale * ret_val;
                continue;
            }
        }

        while (true) {
            e = -logf(hiprand_uniform(&state[idx]));
            u = hiprand_uniform(&state[idx]) * 2.0 - 1.0;
            t = (u < 0.0) ? b - si * e : b + si * e;

            if (t >= -0.71874483771719) {
                v = t / (s + s);
                q = (fabs(v) <= 0.25) ? q0 + 0.5 * t * t * ((((a_coef[6] * v + a_coef[5]) * v + a_coef[4]) * v + a_coef[3]) * v + a_coef[2]) * v + a_coef[1] * v + a_coef[0] * v : q0 - s * t + 0.25 * t * t + (s2 + s2) * log(1.0 + v);

                if (q > 0.0) {
                    float w = expm1f(q);
                    if (c * fabs(u) <= w * expf(e - 0.5 * t * t)) {
                        break;
                    }
                }
            }
        }
        x = s + 0.5 * t;
        vals[out_idx_start + gen_num] = scale * x * x;
    }
}