#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__device__ void solveLinearSystem(int dims, float *A, float *B, float *C) {
    // First generate upper triangular matrix for the augmented matrix
    float *swapRow;
    swapRow = (float*)malloc((dims+1)*sizeof(float));

    for (int ii = 0; ii < dims; ii++) {
        C[ii] = B[ii];
    }

    for (int ii = 0; ii < dims; ii++) {
        // Search for maximum in this column
        float maxElem = fabsf(A[ii*dims+ii]);
        int maxRow = ii;
    
        for (int jj = (ii+1); jj < dims; jj++) {
            if (fabsf(A[ii*dims+jj] > maxElem)) {
                maxElem = fabsf(A[ii*dims+jj]);
                maxRow = jj;
            }
        }
        
        // Swap maximum row with current row if needed
        if (maxRow != ii) {
            for (int jj = ii; jj < dims; jj++) {
                swapRow[jj] = A[jj*dims+ii];
                A[jj*dims+ii] = A[jj*dims+maxRow];
                A[jj*dims+maxRow] = swapRow[jj];
            }
            
            swapRow[dims] = C[ii];
            C[ii] = C[maxRow];
            C[maxRow] = swapRow[dims];
        }
        
        // Make all rows below this one 0 in current column
        for (int jj = (ii+1); jj < dims; jj++) {
            float factor = -A[ii*dims+jj]/A[ii*dims+ii];
            
            // Work across columns
            for (int kk = ii; kk < dims; kk++) {
                A[kk*dims+jj] += factor*A[kk*dims+ii];
            }
            
            // Results vector
            C[jj] += factor*C[ii];
        }
    }
    free(swapRow);
    
    // Solve equation for an upper triangular matrix
    for (int ii = dims-1; ii >= 0; ii--) {
        C[ii] = C[ii]/A[ii*dims+ii];
        
        for (int jj = ii-1; jj >= 0; jj--) {
            C[jj] -= C[ii]*A[ii*dims+jj];
        }
    }
}

// Optimized kernel function
__global__ void multiLocLinReg(int noPoints, int noDims, int dimRes, int nYears, int noControls, int year, int control, int k, int* dataPoints, float *xvals, float *yvals, float *regression, float* xmins, float* xmaxes, float *dist, int *ind) {
    
    // Global thread index
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    
    if (idx < noPoints) {
        if (dataPoints[control] < 3) {
            // Write zero if not enough data points for control
            regression[year*noControls*(dimRes*noDims + (int)pow(dimRes,noDims)*2) + control*(dimRes*noDims + (int)pow(dimRes,noDims)*2) + dimRes*noDims + idx] = 0.0;
        } else {
            // Use thread-local arrays instead of malloc
            int dimIdx[10]; // Assuming noDims <= 10
            float xQ[10];
            float A[121]; // Assuming (noDims + 1) <= 11, hence max (noDims+1)^2 is 121
            float B[11];  // Assuming (noDims + 1) <= 11
            float X[11];  // Assuming (noDims + 1) <= 11
        
            int rem = idx;
            for (int ii = 0; ii < noDims; ii++) {
                int div = rem / pow(dimRes, noDims-ii-1);
                dimIdx[ii] = div;
                rem -= div * pow(dimRes, noDims-ii-1);
            }
            
            for (int ii = 0; ii < noDims; ii++) {
                xQ[ii] = (float)dimIdx[ii]*(xmaxes[ii] - xmins[ii])/(float)(dimRes - 1) + xmins[ii];
            }
            
            // Bandwidth for kernel
            float h = dist[noPoints*(k-1) + idx];
        
            for (int ii = 0; ii <= noDims; ii++) {
                B[ii] = 0.0;
                for (int kk = 0; kk < k; kk++) {
                    float d = dist[noPoints*kk + idx];
                    // Epanechnikov kernel
                    float z = 0.75*(1-pow(d/h,2));

                    if (ii == 0) {
                        B[ii] += yvals[ind[noPoints*kk + idx] - 1]*z;
                    } else {
                        B[ii] += yvals[ind[noPoints*kk + idx] - 1]*(xvals[(ind[noPoints*kk + idx] - 1)*noDims + ii - 1] - xQ[ii-1])*z;
                    }
                }
                
                for (int jj = 0; jj <= noDims; jj++) {
                    A[jj*(noDims+1)+ii] = 0.0;
                    for (int kk = 0; kk < k; kk++) {
                        float d = dist[noPoints*kk + idx];
                        float z = 0.75*(1-pow(d/h,2));

                        if ((ii == 0) && (jj == 0)) {
                            A[jj*(noDims+1)+ii] += 1.0*z;
                        } else if (ii == 0) {
                            A[jj*(noDims+1)+ii] += (xvals[(ind[noPoints*kk + idx] - 1)*noDims + jj - 1] - xQ[jj - 1])*z;
                        } else if (jj == 0) {
                            A[jj*(noDims+1)+ii] += (xvals[(ind[noPoints*kk + idx] - 1)*noDims + ii - 1] - xQ[ii - 1])*z;
                        } else {
                            A[jj*(noDims+1)+ii] += (xvals[(ind[noPoints*kk + idx] - 1)*noDims + jj - 1] - xQ[jj-1])*(xvals[(ind[noPoints*kk + idx] - 1)*noDims + ii - 1] - xQ[ii - 1])*z;
                        }
                    }
                }
            }

            // Solve the linear system using LU decomposition.
            solveLinearSystem(noDims+1, A, B, X);

            // Save the regression result
            regression[year*noControls*(dimRes*noDims + (int)pow(dimRes,noDims)*2) + control*(dimRes*noDims + (int)pow(dimRes,noDims)*2) + dimRes*noDims + idx] = X[0];
        }
    }
}