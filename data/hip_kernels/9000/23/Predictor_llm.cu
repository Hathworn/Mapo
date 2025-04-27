#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Predictor (const double TIME, double4 *p_pred, float4 *v_pred, float4 *a_pred, double4 *p_corr, double4 *v_corr, double *loc_time, double4 *acc, double4 *acc1, double4 *acc2, double4 *acc3, int istart, int* nvec, int ppgpus, unsigned int N) {
    // Calculate global index
    int i = blockIdx.x*blockDim.x + threadIdx.x + istart;
    int cost = ppgpus + istart;

    // Validate index and adjust
    if (i >= cost) {
        i = nvec[i - cost];
        if (i >= istart && i < cost)
            i = -1;
    }
    if (i < 0)
        return;

    // Precompute powers of timestep and their multipliers
    double timestep = TIME - loc_time[i];
    double t2 = 0.5 * timestep * timestep;
    double t3 = timestep * t2 * 0.3333333333333333;
    double t4 = t2 * t2 * 0.0833333333333333;
    double t5 = t4 * timestep * 0.2;

    // Load vectors into registers
    double4 mypcorr = p_corr[i];
    double4 myvcorr = v_corr[i];
    double4 myacc = acc[i];
    double4 myacc1 = acc1[i];
    double4 myacc2 = acc2[i];
    double4 myacc3 = acc3[i];

    // Compute predicted position
    double4 myppred;
    myppred.x = mypcorr.x + timestep * myvcorr.x + t2 * myacc.x + t3 * myacc1.x + t4 * myacc2.x + t5 * myacc3.x;
    myppred.y = mypcorr.y + timestep * myvcorr.y + t2 * myacc.y + t3 * myacc1.y + t4 * myacc2.y + t5 * myacc3.y;
    myppred.z = mypcorr.z + timestep * myvcorr.z + t2 * myacc.z + t3 * myacc1.z + t4 * myacc2.z + t5 * myacc3.z;

    // Save predicted position
    p_pred[i].x = myppred.x;
    p_pred[i].y = myppred.y;
    p_pred[i].z = myppred.z;

    // Compute predicted velocity
    float4 mypred;
    mypred.x = myvcorr.x + timestep * myacc.x + t2 * myacc1.x + t3 * myacc2.x + t4 * myacc3.x;
    mypred.y = myvcorr.y + timestep * myacc.y + t2 * myacc1.y + t3 * myacc2.y + t4 * myacc3.y;
    mypred.z = myvcorr.z + timestep * myacc.z + t2 * myacc1.z + t3 * myacc2.z + t4 * myacc3.z;

    // Save predicted velocity
    v_pred[i].x = mypred.x;
    v_pred[i].y = mypred.y;
    v_pred[i].z = mypred.z;

    // Compute predicted acceleration
    mypred.x = myacc.x + timestep * myacc1.x + t2 * myacc2.x + t3 * myacc3.x;
    mypred.y = myacc.y + timestep * myacc1.y + t2 * myacc2.y + t3 * myacc3.y;
    mypred.z = myacc.z + timestep * myacc1.z + t2 * myacc2.z + t3 * myacc3.z;

    // Save predicted acceleration
    a_pred[i].x = mypred.x;
    a_pred[i].y = mypred.y;
    a_pred[i].z = mypred.z;
}