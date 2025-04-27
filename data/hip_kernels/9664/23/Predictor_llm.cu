#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Predictor (const double TIME, double4 *p_pred, float4  *v_pred, float4  *a_pred, double4 *p_corr, double4 *v_corr, double  *loc_time, double4 *acc, double4 *acc1, double4 *acc2, double4 *acc3, int istart, int* nvec, int ppgpus, unsigned int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x + istart;
    int cost = ppgpus + istart;

    if (i >= cost) {
        i = nvec[i - cost];
        if (i >= istart && i < cost)
            i = -1;
    }
    if (i < 0)
        return;

    double timestep = TIME - loc_time[i];
    double t2 = timestep * timestep * 0.5;
    double t3 = t2 * timestep / 3.0;
    double t4 = t3 * timestep / 4.0;
    double t5 = t4 * timestep / 5.0;

    // Load data from global memory once
    double4 mypcorr = p_corr[i];
    double4 myvcorr = v_corr[i];
    double4 myacc = acc[i];
    double4 myacc1 = acc1[i];
    double4 myacc2 = acc2[i];
    double4 myacc3 = acc3[i];

    // Calculate position prediction
    p_pred[i] = make_double4(
        mypcorr.x + timestep * myvcorr.x + t2 * myacc.x + t3 * myacc1.x + t4 * myacc2.x + t5 * myacc3.x,
        mypcorr.y + timestep * myvcorr.y + t2 * myacc.y + t3 * myacc1.y + t4 * myacc2.y + t5 * myacc3.y,
        mypcorr.z + timestep * myvcorr.z + t2 * myacc.z + t3 * myacc1.z + t4 * myacc2.z + t5 * myacc3.z,
        0.0 // Assuming the w component is not used
    );

    // Calculate velocity prediction
    v_pred[i] = make_float4(
        myvcorr.x + timestep * myacc.x + t2 * myacc1.x + t3 * myacc2.x + t4 * myacc3.x,
        myvcorr.y + timestep * myacc.y + t2 * myacc1.y + t3 * myacc2.y + t4 * myacc3.y,
        myvcorr.z + timestep * myacc.z + t2 * myacc1.z + t3 * myacc2.z + t4 * myacc3.z,
        0.0f // Assuming the w component is not used
    );

    // Calculate acceleration prediction
    a_pred[i] = make_float4(
        myacc.x + timestep * myacc1.x + t2 * myacc2.x + t3 * myacc3.x,
        myacc.y + timestep * myacc1.y + t2 * myacc2.y + t3 * myacc3.y,
        myacc.z + timestep * myacc1.z + t2 * myacc2.z + t3 * myacc3.z,
        0.0f // Assuming the w component is not used
    );
}