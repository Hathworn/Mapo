; ModuleID = '../data/hip_kernels/275/0/main.cu'
source_filename = "../data/hip_kernels/275/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL11matMultCUDAPKfmS0_mPfmi = comdat any

@_ZZL11matMultCUDAPKfmS0_mPfmiE4matA = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZL11matMultCUDAPKfmS0_mPfmiE4matB = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL11matMultCUDAPKfmS0_mPfmi(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, float addrspace(1)* nocapture writeonly %4, i64 %5, i32 %6) local_unnamed_addr #0 comdat {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 4
  %14 = icmp sgt i32 %6, 0
  %15 = add nsw i32 %13, %9
  %16 = sext i32 %15 to i64
  br i1 %14, label %21, label %17

17:                                               ; preds = %7
  %18 = zext i32 %8 to i64
  %19 = sext i32 %11 to i64
  %20 = add nsw i64 %19, %18
  br label %189

21:                                               ; preds = %7
  %22 = mul i64 %16, %1
  %23 = zext i32 %8 to i64
  %24 = add i64 %22, %23
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 %8
  %26 = sext i32 %11 to i64
  %27 = add nsw i64 %26, %23
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 %9, i32 %8
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 0
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 0, i32 %8
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 1
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 1, i32 %8
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 2
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 2, i32 %8
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 3
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 3, i32 %8
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 4
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 4, i32 %8
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 5
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 5, i32 %8
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 6
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 6, i32 %8
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 7
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 7, i32 %8
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 8
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 8, i32 %8
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 9, i32 %8
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 10
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 10, i32 %8
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 11
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 11, i32 %8
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 12
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 12, i32 %8
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 13
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 13, i32 %8
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 14
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 14, i32 %8
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matA, i32 0, i32 %9, i32 15
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZL11matMultCUDAPKfmS0_mPfmiE4matB, i32 0, i32 15, i32 %8
  br label %61

61:                                               ; preds = %21, %61
  %62 = phi float [ 0.000000e+00, %21 ], [ %186, %61 ]
  %63 = phi float [ 0.000000e+00, %21 ], [ %184, %61 ]
  %64 = phi i32 [ 0, %21 ], [ %187, %61 ]
  %65 = zext i32 %64 to i64
  %66 = add i64 %24, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %68, float addrspace(3)* %25, align 4, !tbaa !5
  %69 = add nuw nsw i32 %64, %9
  %70 = zext i32 %69 to i64
  %71 = mul i64 %70, %3
  %72 = add i64 %27, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %74, float addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = load float, float addrspace(3)* %29, align 16, !tbaa !5
  %76 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %77 = fmul contract float %75, %76
  %78 = fsub contract float %62, %77
  %79 = fsub contract float %63, %78
  %80 = fsub contract float %79, %63
  %81 = fadd contract float %78, %80
  %82 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %83 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %84 = fmul contract float %82, %83
  %85 = fsub contract float %81, %84
  %86 = fsub contract float %79, %85
  %87 = fsub contract float %86, %79
  %88 = fadd contract float %85, %87
  %89 = load float, float addrspace(3)* %33, align 8, !tbaa !5
  %90 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fsub contract float %88, %91
  %93 = fsub contract float %86, %92
  %94 = fsub contract float %93, %86
  %95 = fadd contract float %92, %94
  %96 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %97 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %98 = fmul contract float %96, %97
  %99 = fsub contract float %95, %98
  %100 = fsub contract float %93, %99
  %101 = fsub contract float %100, %93
  %102 = fadd contract float %99, %101
  %103 = load float, float addrspace(3)* %37, align 16, !tbaa !5
  %104 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %105 = fmul contract float %103, %104
  %106 = fsub contract float %102, %105
  %107 = fsub contract float %100, %106
  %108 = fsub contract float %107, %100
  %109 = fadd contract float %106, %108
  %110 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %111 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fsub contract float %109, %112
  %114 = fsub contract float %107, %113
  %115 = fsub contract float %114, %107
  %116 = fadd contract float %113, %115
  %117 = load float, float addrspace(3)* %41, align 8, !tbaa !5
  %118 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fsub contract float %116, %119
  %121 = fsub contract float %114, %120
  %122 = fsub contract float %121, %114
  %123 = fadd contract float %120, %122
  %124 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fsub contract float %123, %126
  %128 = fsub contract float %121, %127
  %129 = fsub contract float %128, %121
  %130 = fadd contract float %127, %129
  %131 = load float, float addrspace(3)* %45, align 16, !tbaa !5
  %132 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %133 = fmul contract float %131, %132
  %134 = fsub contract float %130, %133
  %135 = fsub contract float %128, %134
  %136 = fsub contract float %135, %128
  %137 = fadd contract float %134, %136
  %138 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %139 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fsub contract float %137, %140
  %142 = fsub contract float %135, %141
  %143 = fsub contract float %142, %135
  %144 = fadd contract float %141, %143
  %145 = load float, float addrspace(3)* %49, align 8, !tbaa !5
  %146 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %147 = fmul contract float %145, %146
  %148 = fsub contract float %144, %147
  %149 = fsub contract float %142, %148
  %150 = fsub contract float %149, %142
  %151 = fadd contract float %148, %150
  %152 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %153 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %154 = fmul contract float %152, %153
  %155 = fsub contract float %151, %154
  %156 = fsub contract float %149, %155
  %157 = fsub contract float %156, %149
  %158 = fadd contract float %155, %157
  %159 = load float, float addrspace(3)* %53, align 16, !tbaa !5
  %160 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %161 = fmul contract float %159, %160
  %162 = fsub contract float %158, %161
  %163 = fsub contract float %156, %162
  %164 = fsub contract float %163, %156
  %165 = fadd contract float %162, %164
  %166 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %167 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %168 = fmul contract float %166, %167
  %169 = fsub contract float %165, %168
  %170 = fsub contract float %163, %169
  %171 = fsub contract float %170, %163
  %172 = fadd contract float %169, %171
  %173 = load float, float addrspace(3)* %57, align 8, !tbaa !5
  %174 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %175 = fmul contract float %173, %174
  %176 = fsub contract float %172, %175
  %177 = fsub contract float %170, %176
  %178 = fsub contract float %177, %170
  %179 = fadd contract float %176, %178
  %180 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %181 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %182 = fmul contract float %180, %181
  %183 = fsub contract float %179, %182
  %184 = fsub contract float %177, %183
  %185 = fsub contract float %184, %177
  %186 = fadd contract float %183, %185
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %187 = add nuw nsw i32 %64, 16
  %188 = icmp slt i32 %187, %6
  br i1 %188, label %61, label %189, !llvm.loop !10

189:                                              ; preds = %61, %17
  %190 = phi i64 [ %20, %17 ], [ %27, %61 ]
  %191 = phi float [ 0.000000e+00, %17 ], [ %184, %61 ]
  %192 = mul i64 %16, %5
  %193 = add i64 %190, %192
  %194 = getelementptr inbounds float, float addrspace(1)* %4, i64 %193
  store float %191, float addrspace(1)* %194, align 4, !tbaa !5
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
