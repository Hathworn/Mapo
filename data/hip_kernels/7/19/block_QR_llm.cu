#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void block_QR(float* z, float* z1, float* vector, float* vector1, float* Q, float* NewQ, float* R, float* PrevM, float* NewM, int* converged, float* eigenvector, const int *WidthOfMatrix, const int *ind, const int *vind)
{
    // Shared memory for intermediate computations
    extern __shared__ float sharedMem[];

    int n = WidthOfMatrix[blockIdx.x];
    int index = ind[blockIdx.x];
    int vectindex = vind[blockIdx.x];
    int numofelements = n*n;

    // Initialize convergence flag
    if(threadIdx.x == 0) {
        converged[blockIdx.x] = 0;
    }
    
    // Initialize matrices and eigenvectors
    for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
        int iplusindex = i + index;
        eigenvector[iplusindex] = (i / n == i % n) ? 1.0f : 0.0f;
        z1[iplusindex] = z[iplusindex];
        Q[iplusindex] = z[iplusindex];
        PrevM[iplusindex] = z[iplusindex];
    }
    __syncthreads();

    // Main QR decomposition loop
    do {
        for(int k = 0; k < n - 1; k++) {
            float NormCheck = z[k*n+k+index];

            // Step 1: Set minor matrix
            for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                int row = i / n, col = i % n;
                z[i+index] = (row == col && row < k) ? 1.0f : (row >= k && col >= k) ? z[i+index] : 0.0f;
            }
            __syncthreads();

            // Step 2: Extract k-th column
            for(int i = threadIdx.x; i < n; i += blockDim.x) {
                vector[i+vectindex] = z[i*n+k+index];
            }
            __syncthreads();

            // Step 3: Compute norm
            float NormOfKcol = 0.0f;
            for(int i = threadIdx.x; i < n; i += blockDim.x) {
                NormOfKcol += vector[i+vectindex] * vector[i+vectindex];
            }
            NormOfKcol = sqrt(NormOfKcol);
            if(NormCheck > 0) NormOfKcol = -NormOfKcol;
            if(k == threadIdx.x) vector[k+vectindex] += NormOfKcol;
            __syncthreads();

            // Step 8: Normalize vector
            for(int i = threadIdx.x; i < n; i += blockDim.x) {
                vector[i+vectindex] /= NormOfKcol;
            }
            __syncthreads();

            // Step 9: Compute Vmul
            for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                R[i+index] = -2 * vector[i/n+vectindex] * vector[i%n+vectindex];
                if(i/n == i%n) R[i+index] += 1.0f;
            }
            __syncthreads();

            // Step 10: Multiply Vmul by z1
            for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                float sum = 0.0f;
                for(int j = 0; j < n; j++) {
                    sum += R[i/n*n+j+index] * z1[j*n+i%n+index];
                }
                z[i+index] = sum;
            }
            __syncthreads();

            // Step 11 & 12: Update Q
            if(k != 0) {
                for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                    float sum = 0.0f;
                    for(int j = 0; j < n; j++) {
                        sum += R[i/n*n+j+index] * Q[j*n+i%n+index];
                    }
                    NewQ[i+index] = sum;
                }
                __syncthreads();
                for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                    Q[i+index] = NewQ[i+index];
                }
            } else {
                for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                    Q[i+index] = R[i+index];
                }
            }
            __syncthreads();
            
            for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                z1[i+index] = z[i+index];
            }
            __syncthreads();
        }

        // Step 13: Compute R
        for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
            R[i+index] = 0.0f;
            for(int j = 0; j < n; j++) {
                R[i+index] += Q[i/n*n+j+index] * PrevM[j*n+i%n+index];
            }
        }
        __syncthreads();

        // Step 14: Transpose Q
        for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
            z[i%n*n + i/n + index] = Q[i+index];
        }
        __syncthreads();

        // Step 14.5: Update eigenvectors
        for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
            float sum = 0.0f;
            for(int j = 0; j < n; j++) {
                sum += eigenvector[i/n*n + j + index] * z[j*n + i%n + index];
            }
            NewM[i+index] = sum;
        }
        __syncthreads();
        for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
            eigenvector[i+index] = NewM[i+index];
        }
        __syncthreads();

        // Step 15: Multiply R and TransposeOfQ
        for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
            float sum = 0.0f;
            for(int j = 0; j < n; j++) {
                sum += R[i/n*n+j+index] * z[j*n+i%n+index];
            }
            NewM[i+index] = sum;
        }
        __syncthreads();

        // Step 16: Check convergence
        if(threadIdx.x == 0) {
            converged[blockIdx.x] = 1;
        }
        __syncthreads();
        
        for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
            if(i/n == i%n && (PrevM[i+index]/NewM[i+index] > 1.000001f || PrevM[i+index]/NewM[i+index] < 0.999999f)) {
                converged[blockIdx.x] = 0;
            }
        }
        __syncthreads();

        // Step 17: Prepare for next iteration if not converged
        if(converged[blockIdx.x] == 0) {
            for(int i = threadIdx.x; i < numofelements; i += blockDim.x) {
                int iplusindex = i + index;
                z[iplusindex] = NewM[iplusindex];
                z1[iplusindex] = NewM[iplusindex];
                Q[iplusindex] = NewM[iplusindex];
                PrevM[iplusindex] = NewM[iplusindex];
            }
        }
        __syncthreads();
    } while(converged[blockIdx.x] == 0);

    // Store eigenvalues
    if(threadIdx.x < n) {
        vector[threadIdx.x+vectindex] = NewM[threadIdx.x+threadIdx.x*n+index];
    }
    __syncthreads();

    // Sort eigenvalues and corresponding eigenvectors
    if(threadIdx.x == 0) {
        for(int i1 = vectindex; i1 < n - 1 + vectindex; i1++) {
            for(int i2 = i1 + 1; i2 < n + vectindex; i2++) {
                if(vector[i1] > vector[i2]) {
                    float tmpVal = vector[i1];
                    vector[i1] = vector[i2];
                    vector[i2] = tmpVal;
                    
                    for(int i3 = 0; i3 < n; i3++) {
                        float tmpVec = eigenvector[i3*n + (i1-vectindex)%n + index];
                        eigenvector[i3*n + (i1-vectindex)%n + index] = eigenvector[i3*n + (i2-vectindex)%n + index];
                        eigenvector[i3*n + (i2-vectindex)%n + index] = tmpVec;
                    }
                }
            }
        }
    }
}