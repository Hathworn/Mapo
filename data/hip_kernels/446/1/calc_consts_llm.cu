#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float machine_eps_flt() {
    typedef union {
        int i32;
        float f32;
    } flt_32;

    flt_32 s;
    s.f32 = 1.;
    s.i32++;
    return (s.f32 - 1.);
}

__device__ double machine_eps_dbl() {
    typedef union {
        long long i64;
        double d64;
    } dbl_64;

    dbl_64 s;
    s.d64 = 1.;
    s.i64++;
    return (s.d64 - 1.);
}

__global__ void calc_consts(float *fvals, double *dvals) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i == 0) {
        // Computing machine epsilon
        fvals[EPS] = machine_eps_flt();
        dvals[EPS] = machine_eps_dbl();

        float xf = 2.f, oldxf = 1.f;
        double xd = 2.0, oldxd = 1.0;

        // Calculating maximum representable value
        while (!isinf(xf)) {
            oldxf = xf;
            xf *= 2.f;
        }

        while (!isinf(xd)) {
            oldxd = xd;
            xd *= 2.0;
        }

        fvals[MAX] = oldxf;
        dvals[MAX] = oldxd;

        xf = 1.f, oldxf = 2.f;
        xd = 1.0, oldxd = 2.0;

        // Calculating minimum representable value
        while (xf != 0.f) {
            oldxf = xf;
            xf /= 2.f;
        }

        while (xd != 0.0) {
            oldxd = xd;
            xd /= 2.0;
        }

        fvals[MIN] = oldxf;
        dvals[MIN] = oldxd;
    }
}