; ModuleID = '../data/hip_kernels/9354/1/main.cu'
source_filename = "../data/hip_kernels/9354/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16
@_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKernelPdS_S_iii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = sdiv i32 %4, 32
  %12 = icmp sgt i32 %4, -32
  br i1 %12, label %13, label %246

13:                                               ; preds = %6
  %14 = shl nsw i32 %7, 5
  %15 = add nsw i32 %14, %8
  %16 = mul nsw i32 %15, %4
  %17 = add nsw i32 %16, %10
  %18 = shl nsw i32 %9, 5
  %19 = add i32 %18, %10
  %20 = mul nsw i32 %4, %3
  %21 = shl nuw nsw i32 %8, 5
  %22 = add nuw nsw i32 %21, %10
  %23 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %22
  %24 = mul nsw i32 %5, %4
  %25 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %22
  %26 = icmp ult i32 %8, 32
  %27 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %21
  %28 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %10
  %29 = add nuw nsw i32 %21, 1
  %30 = icmp ugt i32 %8, 31
  %31 = icmp ugt i32 %10, 991
  %32 = add nuw nsw i32 %10, 32
  %33 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %29
  %34 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %32
  %35 = add nuw nsw i32 %21, 2
  %36 = icmp ugt i32 %8, 31
  %37 = icmp ugt i32 %10, 959
  %38 = add nuw nsw i32 %10, 64
  %39 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %35
  %40 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %38
  %41 = add nuw nsw i32 %21, 3
  %42 = icmp ugt i32 %8, 31
  %43 = icmp ugt i32 %10, 927
  %44 = add nuw nsw i32 %10, 96
  %45 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %41
  %46 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %44
  %47 = add nuw nsw i32 %21, 4
  %48 = icmp ugt i32 %8, 31
  %49 = icmp ugt i32 %10, 895
  %50 = add nuw nsw i32 %10, 128
  %51 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %47
  %52 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %50
  %53 = add nuw nsw i32 %21, 5
  %54 = icmp ugt i32 %8, 31
  %55 = icmp ugt i32 %10, 863
  %56 = add nuw nsw i32 %10, 160
  %57 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %53
  %58 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %56
  %59 = add nuw nsw i32 %21, 6
  %60 = icmp ugt i32 %8, 31
  %61 = icmp ugt i32 %10, 831
  %62 = add nuw nsw i32 %10, 192
  %63 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %59
  %64 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %62
  %65 = add nuw nsw i32 %21, 7
  %66 = icmp ugt i32 %8, 31
  %67 = icmp ugt i32 %10, 799
  %68 = add nuw nsw i32 %10, 224
  %69 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %65
  %70 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %68
  %71 = add nuw nsw i32 %21, 8
  %72 = icmp ugt i32 %8, 31
  %73 = icmp ugt i32 %10, 767
  %74 = add nuw nsw i32 %10, 256
  %75 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %71
  %76 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %74
  %77 = add nuw nsw i32 %21, 9
  %78 = icmp ugt i32 %8, 31
  %79 = icmp ugt i32 %10, 735
  %80 = add nuw nsw i32 %10, 288
  %81 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %77
  %82 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %80
  %83 = add nuw nsw i32 %21, 10
  %84 = icmp ugt i32 %8, 31
  %85 = icmp ugt i32 %10, 703
  %86 = add nuw nsw i32 %10, 320
  %87 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %83
  %88 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %86
  %89 = add nuw nsw i32 %21, 11
  %90 = icmp ugt i32 %8, 31
  %91 = icmp ugt i32 %10, 671
  %92 = add nuw nsw i32 %10, 352
  %93 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %89
  %94 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %92
  %95 = add nuw nsw i32 %21, 12
  %96 = icmp ugt i32 %8, 31
  %97 = icmp ugt i32 %10, 639
  %98 = add nuw nsw i32 %10, 384
  %99 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %95
  %100 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %98
  %101 = add nuw nsw i32 %21, 13
  %102 = icmp ugt i32 %8, 31
  %103 = icmp ugt i32 %10, 607
  %104 = add nuw nsw i32 %10, 416
  %105 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %101
  %106 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %104
  %107 = add nuw nsw i32 %21, 14
  %108 = icmp ugt i32 %8, 31
  %109 = icmp ugt i32 %10, 575
  %110 = add nuw nsw i32 %10, 448
  %111 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %107
  %112 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %110
  %113 = add nuw nsw i32 %21, 15
  %114 = icmp ugt i32 %8, 31
  %115 = icmp ugt i32 %10, 543
  %116 = add nuw nsw i32 %10, 480
  %117 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %113
  %118 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %116
  %119 = add nuw nsw i32 %21, 16
  %120 = icmp ugt i32 %8, 31
  %121 = icmp ugt i32 %10, 511
  %122 = add nuw nsw i32 %10, 512
  %123 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %119
  %124 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %122
  %125 = add nuw nsw i32 %21, 17
  %126 = icmp ugt i32 %8, 31
  %127 = icmp ugt i32 %10, 479
  %128 = add nuw nsw i32 %10, 544
  %129 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %125
  %130 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %128
  %131 = add nuw nsw i32 %21, 18
  %132 = icmp ugt i32 %8, 31
  %133 = icmp ugt i32 %10, 447
  %134 = add nuw nsw i32 %10, 576
  %135 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %131
  %136 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %134
  %137 = add nuw nsw i32 %21, 19
  %138 = icmp ugt i32 %8, 31
  %139 = icmp ugt i32 %10, 415
  %140 = add nuw nsw i32 %10, 608
  %141 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %137
  %142 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %140
  %143 = add nuw nsw i32 %21, 20
  %144 = icmp ugt i32 %8, 31
  %145 = icmp ugt i32 %10, 383
  %146 = add nuw nsw i32 %10, 640
  %147 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %143
  %148 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %146
  %149 = add nuw nsw i32 %21, 21
  %150 = icmp ugt i32 %8, 31
  %151 = icmp ugt i32 %10, 351
  %152 = add nuw nsw i32 %10, 672
  %153 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %149
  %154 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %152
  %155 = add nuw nsw i32 %21, 22
  %156 = icmp ugt i32 %8, 31
  %157 = icmp ugt i32 %10, 319
  %158 = add nuw nsw i32 %10, 704
  %159 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %155
  %160 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %158
  %161 = add nuw nsw i32 %21, 23
  %162 = icmp ugt i32 %8, 31
  %163 = icmp ugt i32 %10, 287
  %164 = add nuw nsw i32 %10, 736
  %165 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %161
  %166 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %164
  %167 = add nuw nsw i32 %21, 24
  %168 = icmp ugt i32 %8, 31
  %169 = icmp ugt i32 %10, 255
  %170 = add nuw nsw i32 %10, 768
  %171 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %167
  %172 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %170
  %173 = add nuw nsw i32 %21, 25
  %174 = icmp ugt i32 %8, 31
  %175 = icmp ugt i32 %10, 223
  %176 = add nuw nsw i32 %10, 800
  %177 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %173
  %178 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %176
  %179 = add nuw nsw i32 %21, 26
  %180 = icmp ugt i32 %8, 31
  %181 = icmp ugt i32 %10, 191
  %182 = add nuw nsw i32 %10, 832
  %183 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %179
  %184 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %182
  %185 = add nuw nsw i32 %21, 27
  %186 = icmp ugt i32 %8, 31
  %187 = icmp ugt i32 %10, 159
  %188 = add nuw nsw i32 %10, 864
  %189 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %185
  %190 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %188
  %191 = add nuw nsw i32 %21, 28
  %192 = icmp ugt i32 %8, 31
  %193 = icmp ugt i32 %10, 127
  %194 = add nuw nsw i32 %10, 896
  %195 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %191
  %196 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %194
  %197 = add nuw nsw i32 %21, 29
  %198 = icmp ugt i32 %8, 31
  %199 = icmp ugt i32 %10, 95
  %200 = add nuw nsw i32 %10, 928
  %201 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %197
  %202 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %200
  %203 = add nuw nsw i32 %21, 30
  %204 = icmp ugt i32 %8, 31
  %205 = icmp ugt i32 %10, 63
  %206 = add nuw nsw i32 %10, 960
  %207 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %203
  %208 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %206
  %209 = add nuw nsw i32 %21, 31
  %210 = icmp ugt i32 %8, 31
  %211 = icmp ugt i32 %10, 31
  %212 = add nuw nsw i32 %10, 992
  %213 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subAshared, i32 0, i32 %209
  %214 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ15MatrixMulKernelPdS_S_iiiE10subBshared, i32 0, i32 %212
  %215 = select i1 %30, i1 true, i1 %31
  %216 = select i1 %36, i1 true, i1 %37
  %217 = select i1 %42, i1 true, i1 %43
  %218 = select i1 %48, i1 true, i1 %49
  %219 = select i1 %54, i1 true, i1 %55
  %220 = select i1 %60, i1 true, i1 %61
  %221 = select i1 %66, i1 true, i1 %67
  %222 = select i1 %72, i1 true, i1 %73
  %223 = select i1 %78, i1 true, i1 %79
  %224 = select i1 %84, i1 true, i1 %85
  %225 = select i1 %90, i1 true, i1 %91
  %226 = select i1 %96, i1 true, i1 %97
  %227 = select i1 %102, i1 true, i1 %103
  %228 = select i1 %108, i1 true, i1 %109
  %229 = select i1 %114, i1 true, i1 %115
  %230 = select i1 %120, i1 true, i1 %121
  %231 = select i1 %126, i1 true, i1 %127
  %232 = select i1 %132, i1 true, i1 %133
  %233 = select i1 %138, i1 true, i1 %139
  %234 = select i1 %144, i1 true, i1 %145
  %235 = select i1 %150, i1 true, i1 %151
  %236 = select i1 %156, i1 true, i1 %157
  %237 = select i1 %162, i1 true, i1 %163
  %238 = select i1 %168, i1 true, i1 %169
  %239 = select i1 %174, i1 true, i1 %175
  %240 = select i1 %180, i1 true, i1 %181
  %241 = select i1 %186, i1 true, i1 %187
  %242 = select i1 %192, i1 true, i1 %193
  %243 = select i1 %198, i1 true, i1 %199
  %244 = select i1 %204, i1 true, i1 %205
  %245 = select i1 %210, i1 true, i1 %211
  br label %251

246:                                              ; preds = %495, %6
  %247 = phi double [ 0.000000e+00, %6 ], [ %496, %495 ]
  %248 = icmp slt i32 %8, %3
  %249 = icmp slt i32 %10, %5
  %250 = select i1 %248, i1 %249, i1 false
  br i1 %250, label %499, label %508

251:                                              ; preds = %13, %495
  %252 = phi double [ 0.000000e+00, %13 ], [ %496, %495 ]
  %253 = phi i32 [ 0, %13 ], [ %497, %495 ]
  %254 = shl nsw i32 %253, 5
  %255 = add nsw i32 %17, %254
  %256 = add nuw nsw i32 %254, %8
  %257 = mul nsw i32 %256, %5
  %258 = add i32 %19, %257
  %259 = icmp slt i32 %255, %20
  br i1 %259, label %260, label %264

260:                                              ; preds = %251
  %261 = sext i32 %255 to i64
  %262 = getelementptr inbounds double, double addrspace(1)* %1, i64 %261
  %263 = load double, double addrspace(1)* %262, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %264

264:                                              ; preds = %251, %260
  %265 = phi double [ %263, %260 ], [ 0.000000e+00, %251 ]
  store double %265, double addrspace(3)* %23, align 8, !tbaa !5
  %266 = icmp slt i32 %258, %24
  br i1 %266, label %267, label %271

267:                                              ; preds = %264
  %268 = sext i32 %258 to i64
  %269 = getelementptr inbounds double, double addrspace(1)* %2, i64 %268
  %270 = load double, double addrspace(1)* %269, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %271

271:                                              ; preds = %264, %267
  %272 = phi double [ %270, %267 ], [ 0.000000e+00, %264 ]
  store double %272, double addrspace(3)* %25, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %273, label %278

273:                                              ; preds = %271
  %274 = load double, double addrspace(3)* %27, align 16, !tbaa !5
  %275 = load double, double addrspace(3)* %28, align 8, !tbaa !5
  %276 = fmul contract double %274, %275
  %277 = fadd contract double %252, %276
  br label %278

278:                                              ; preds = %271, %273
  %279 = phi double [ %277, %273 ], [ %252, %271 ]
  br i1 %215, label %285, label %280

280:                                              ; preds = %278
  %281 = load double, double addrspace(3)* %33, align 8, !tbaa !5
  %282 = load double, double addrspace(3)* %34, align 8, !tbaa !5
  %283 = fmul contract double %281, %282
  %284 = fadd contract double %279, %283
  br label %285

285:                                              ; preds = %278, %280
  %286 = phi double [ %284, %280 ], [ %279, %278 ]
  br i1 %216, label %292, label %287

287:                                              ; preds = %285
  %288 = load double, double addrspace(3)* %39, align 16, !tbaa !5
  %289 = load double, double addrspace(3)* %40, align 8, !tbaa !5
  %290 = fmul contract double %288, %289
  %291 = fadd contract double %286, %290
  br label %292

292:                                              ; preds = %285, %287
  %293 = phi double [ %291, %287 ], [ %286, %285 ]
  br i1 %217, label %299, label %294

294:                                              ; preds = %292
  %295 = load double, double addrspace(3)* %45, align 8, !tbaa !5
  %296 = load double, double addrspace(3)* %46, align 8, !tbaa !5
  %297 = fmul contract double %295, %296
  %298 = fadd contract double %293, %297
  br label %299

299:                                              ; preds = %292, %294
  %300 = phi double [ %298, %294 ], [ %293, %292 ]
  br i1 %218, label %306, label %301

301:                                              ; preds = %299
  %302 = load double, double addrspace(3)* %51, align 16, !tbaa !5
  %303 = load double, double addrspace(3)* %52, align 8, !tbaa !5
  %304 = fmul contract double %302, %303
  %305 = fadd contract double %300, %304
  br label %306

306:                                              ; preds = %299, %301
  %307 = phi double [ %305, %301 ], [ %300, %299 ]
  br i1 %219, label %313, label %308

308:                                              ; preds = %306
  %309 = load double, double addrspace(3)* %57, align 8, !tbaa !5
  %310 = load double, double addrspace(3)* %58, align 8, !tbaa !5
  %311 = fmul contract double %309, %310
  %312 = fadd contract double %307, %311
  br label %313

313:                                              ; preds = %306, %308
  %314 = phi double [ %312, %308 ], [ %307, %306 ]
  br i1 %220, label %320, label %315

315:                                              ; preds = %313
  %316 = load double, double addrspace(3)* %63, align 16, !tbaa !5
  %317 = load double, double addrspace(3)* %64, align 8, !tbaa !5
  %318 = fmul contract double %316, %317
  %319 = fadd contract double %314, %318
  br label %320

320:                                              ; preds = %313, %315
  %321 = phi double [ %319, %315 ], [ %314, %313 ]
  br i1 %221, label %327, label %322

322:                                              ; preds = %320
  %323 = load double, double addrspace(3)* %69, align 8, !tbaa !5
  %324 = load double, double addrspace(3)* %70, align 8, !tbaa !5
  %325 = fmul contract double %323, %324
  %326 = fadd contract double %321, %325
  br label %327

327:                                              ; preds = %320, %322
  %328 = phi double [ %326, %322 ], [ %321, %320 ]
  br i1 %222, label %334, label %329

329:                                              ; preds = %327
  %330 = load double, double addrspace(3)* %75, align 16, !tbaa !5
  %331 = load double, double addrspace(3)* %76, align 8, !tbaa !5
  %332 = fmul contract double %330, %331
  %333 = fadd contract double %328, %332
  br label %334

334:                                              ; preds = %327, %329
  %335 = phi double [ %333, %329 ], [ %328, %327 ]
  br i1 %223, label %341, label %336

336:                                              ; preds = %334
  %337 = load double, double addrspace(3)* %81, align 8, !tbaa !5
  %338 = load double, double addrspace(3)* %82, align 8, !tbaa !5
  %339 = fmul contract double %337, %338
  %340 = fadd contract double %335, %339
  br label %341

341:                                              ; preds = %334, %336
  %342 = phi double [ %340, %336 ], [ %335, %334 ]
  br i1 %224, label %348, label %343

343:                                              ; preds = %341
  %344 = load double, double addrspace(3)* %87, align 16, !tbaa !5
  %345 = load double, double addrspace(3)* %88, align 8, !tbaa !5
  %346 = fmul contract double %344, %345
  %347 = fadd contract double %342, %346
  br label %348

348:                                              ; preds = %341, %343
  %349 = phi double [ %347, %343 ], [ %342, %341 ]
  br i1 %225, label %355, label %350

350:                                              ; preds = %348
  %351 = load double, double addrspace(3)* %93, align 8, !tbaa !5
  %352 = load double, double addrspace(3)* %94, align 8, !tbaa !5
  %353 = fmul contract double %351, %352
  %354 = fadd contract double %349, %353
  br label %355

355:                                              ; preds = %348, %350
  %356 = phi double [ %354, %350 ], [ %349, %348 ]
  br i1 %226, label %362, label %357

357:                                              ; preds = %355
  %358 = load double, double addrspace(3)* %99, align 16, !tbaa !5
  %359 = load double, double addrspace(3)* %100, align 8, !tbaa !5
  %360 = fmul contract double %358, %359
  %361 = fadd contract double %356, %360
  br label %362

362:                                              ; preds = %355, %357
  %363 = phi double [ %361, %357 ], [ %356, %355 ]
  br i1 %227, label %369, label %364

364:                                              ; preds = %362
  %365 = load double, double addrspace(3)* %105, align 8, !tbaa !5
  %366 = load double, double addrspace(3)* %106, align 8, !tbaa !5
  %367 = fmul contract double %365, %366
  %368 = fadd contract double %363, %367
  br label %369

369:                                              ; preds = %362, %364
  %370 = phi double [ %368, %364 ], [ %363, %362 ]
  br i1 %228, label %376, label %371

371:                                              ; preds = %369
  %372 = load double, double addrspace(3)* %111, align 16, !tbaa !5
  %373 = load double, double addrspace(3)* %112, align 8, !tbaa !5
  %374 = fmul contract double %372, %373
  %375 = fadd contract double %370, %374
  br label %376

376:                                              ; preds = %369, %371
  %377 = phi double [ %375, %371 ], [ %370, %369 ]
  br i1 %229, label %383, label %378

378:                                              ; preds = %376
  %379 = load double, double addrspace(3)* %117, align 8, !tbaa !5
  %380 = load double, double addrspace(3)* %118, align 8, !tbaa !5
  %381 = fmul contract double %379, %380
  %382 = fadd contract double %377, %381
  br label %383

383:                                              ; preds = %376, %378
  %384 = phi double [ %382, %378 ], [ %377, %376 ]
  br i1 %230, label %390, label %385

385:                                              ; preds = %383
  %386 = load double, double addrspace(3)* %123, align 16, !tbaa !5
  %387 = load double, double addrspace(3)* %124, align 8, !tbaa !5
  %388 = fmul contract double %386, %387
  %389 = fadd contract double %384, %388
  br label %390

390:                                              ; preds = %383, %385
  %391 = phi double [ %389, %385 ], [ %384, %383 ]
  br i1 %231, label %397, label %392

392:                                              ; preds = %390
  %393 = load double, double addrspace(3)* %129, align 8, !tbaa !5
  %394 = load double, double addrspace(3)* %130, align 8, !tbaa !5
  %395 = fmul contract double %393, %394
  %396 = fadd contract double %391, %395
  br label %397

397:                                              ; preds = %390, %392
  %398 = phi double [ %396, %392 ], [ %391, %390 ]
  br i1 %232, label %404, label %399

399:                                              ; preds = %397
  %400 = load double, double addrspace(3)* %135, align 16, !tbaa !5
  %401 = load double, double addrspace(3)* %136, align 8, !tbaa !5
  %402 = fmul contract double %400, %401
  %403 = fadd contract double %398, %402
  br label %404

404:                                              ; preds = %397, %399
  %405 = phi double [ %403, %399 ], [ %398, %397 ]
  br i1 %233, label %411, label %406

406:                                              ; preds = %404
  %407 = load double, double addrspace(3)* %141, align 8, !tbaa !5
  %408 = load double, double addrspace(3)* %142, align 8, !tbaa !5
  %409 = fmul contract double %407, %408
  %410 = fadd contract double %405, %409
  br label %411

411:                                              ; preds = %404, %406
  %412 = phi double [ %410, %406 ], [ %405, %404 ]
  br i1 %234, label %418, label %413

413:                                              ; preds = %411
  %414 = load double, double addrspace(3)* %147, align 16, !tbaa !5
  %415 = load double, double addrspace(3)* %148, align 8, !tbaa !5
  %416 = fmul contract double %414, %415
  %417 = fadd contract double %412, %416
  br label %418

418:                                              ; preds = %411, %413
  %419 = phi double [ %417, %413 ], [ %412, %411 ]
  br i1 %235, label %425, label %420

420:                                              ; preds = %418
  %421 = load double, double addrspace(3)* %153, align 8, !tbaa !5
  %422 = load double, double addrspace(3)* %154, align 8, !tbaa !5
  %423 = fmul contract double %421, %422
  %424 = fadd contract double %419, %423
  br label %425

425:                                              ; preds = %418, %420
  %426 = phi double [ %424, %420 ], [ %419, %418 ]
  br i1 %236, label %432, label %427

427:                                              ; preds = %425
  %428 = load double, double addrspace(3)* %159, align 16, !tbaa !5
  %429 = load double, double addrspace(3)* %160, align 8, !tbaa !5
  %430 = fmul contract double %428, %429
  %431 = fadd contract double %426, %430
  br label %432

432:                                              ; preds = %425, %427
  %433 = phi double [ %431, %427 ], [ %426, %425 ]
  br i1 %237, label %439, label %434

434:                                              ; preds = %432
  %435 = load double, double addrspace(3)* %165, align 8, !tbaa !5
  %436 = load double, double addrspace(3)* %166, align 8, !tbaa !5
  %437 = fmul contract double %435, %436
  %438 = fadd contract double %433, %437
  br label %439

439:                                              ; preds = %432, %434
  %440 = phi double [ %438, %434 ], [ %433, %432 ]
  br i1 %238, label %446, label %441

441:                                              ; preds = %439
  %442 = load double, double addrspace(3)* %171, align 16, !tbaa !5
  %443 = load double, double addrspace(3)* %172, align 8, !tbaa !5
  %444 = fmul contract double %442, %443
  %445 = fadd contract double %440, %444
  br label %446

446:                                              ; preds = %439, %441
  %447 = phi double [ %445, %441 ], [ %440, %439 ]
  br i1 %239, label %453, label %448

448:                                              ; preds = %446
  %449 = load double, double addrspace(3)* %177, align 8, !tbaa !5
  %450 = load double, double addrspace(3)* %178, align 8, !tbaa !5
  %451 = fmul contract double %449, %450
  %452 = fadd contract double %447, %451
  br label %453

453:                                              ; preds = %446, %448
  %454 = phi double [ %452, %448 ], [ %447, %446 ]
  br i1 %240, label %460, label %455

455:                                              ; preds = %453
  %456 = load double, double addrspace(3)* %183, align 16, !tbaa !5
  %457 = load double, double addrspace(3)* %184, align 8, !tbaa !5
  %458 = fmul contract double %456, %457
  %459 = fadd contract double %454, %458
  br label %460

460:                                              ; preds = %453, %455
  %461 = phi double [ %459, %455 ], [ %454, %453 ]
  br i1 %241, label %467, label %462

462:                                              ; preds = %460
  %463 = load double, double addrspace(3)* %189, align 8, !tbaa !5
  %464 = load double, double addrspace(3)* %190, align 8, !tbaa !5
  %465 = fmul contract double %463, %464
  %466 = fadd contract double %461, %465
  br label %467

467:                                              ; preds = %460, %462
  %468 = phi double [ %466, %462 ], [ %461, %460 ]
  br i1 %242, label %474, label %469

469:                                              ; preds = %467
  %470 = load double, double addrspace(3)* %195, align 16, !tbaa !5
  %471 = load double, double addrspace(3)* %196, align 8, !tbaa !5
  %472 = fmul contract double %470, %471
  %473 = fadd contract double %468, %472
  br label %474

474:                                              ; preds = %467, %469
  %475 = phi double [ %473, %469 ], [ %468, %467 ]
  br i1 %243, label %481, label %476

476:                                              ; preds = %474
  %477 = load double, double addrspace(3)* %201, align 8, !tbaa !5
  %478 = load double, double addrspace(3)* %202, align 8, !tbaa !5
  %479 = fmul contract double %477, %478
  %480 = fadd contract double %475, %479
  br label %481

481:                                              ; preds = %474, %476
  %482 = phi double [ %480, %476 ], [ %475, %474 ]
  br i1 %244, label %488, label %483

483:                                              ; preds = %481
  %484 = load double, double addrspace(3)* %207, align 16, !tbaa !5
  %485 = load double, double addrspace(3)* %208, align 8, !tbaa !5
  %486 = fmul contract double %484, %485
  %487 = fadd contract double %482, %486
  br label %488

488:                                              ; preds = %481, %483
  %489 = phi double [ %487, %483 ], [ %482, %481 ]
  br i1 %245, label %495, label %490

490:                                              ; preds = %488
  %491 = load double, double addrspace(3)* %213, align 8, !tbaa !5
  %492 = load double, double addrspace(3)* %214, align 8, !tbaa !5
  %493 = fmul contract double %491, %492
  %494 = fadd contract double %489, %493
  br label %495

495:                                              ; preds = %488, %490
  %496 = phi double [ %494, %490 ], [ %489, %488 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %497 = add nuw nsw i32 %253, 1
  %498 = icmp sgt i32 %11, %253
  br i1 %498, label %251, label %246, !llvm.loop !10

499:                                              ; preds = %246
  %500 = shl nsw i32 %7, 5
  %501 = add nsw i32 %500, %8
  %502 = shl nsw i32 %9, 5
  %503 = add nsw i32 %502, %10
  %504 = mul nsw i32 %501, %5
  %505 = add nsw i32 %503, %504
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds double, double addrspace(1)* %0, i64 %506
  store double %247, double addrspace(1)* %507, align 8, !tbaa !5
  br label %508

508:                                              ; preds = %499, %246
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
